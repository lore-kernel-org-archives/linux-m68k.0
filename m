From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH] m68k: Atari ST-RAM: reserve some ST-RAM for late allocations
Date: Sun, 26 Apr 2009 07:59:12 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904260751590.30061__47721.9138214879$1240736335$gmane$org@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
 <1239774966.20245.4.camel@petr>
 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
 <1239862075.12777.14.camel@petr>
 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
 <1239868903.12777.25.camel@petr>
 <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi Geert,

this patch adds the ST-RAM reserve for late allocation as had been previously 
added to the 2.6.28 Debian kernel patches. Without this patch, loading a large 
ramdisk at boot will eat up ST-RAM suitable for atafb, leaving atafb drawing to 
memory that cannot be used by the VIDEL. 
Also, without this patch the Atari SCSI driver will allocate memory unsuitable 
for DMA as DMA dribble buffer. 

  Michael

---
 arch/m68k/atari/stram.c |   61 +++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
index 6ec3b7f..f242947 100644
--- a/arch/m68k/atari/stram.c
+++ b/arch/m68k/atari/stram.c
@@ -30,7 +30,7 @@
 #include <asm/atari_stram.h>
 #include <asm/io.h>
 
-#undef DEBUG
+#define DEBUG
 
 #ifdef DEBUG
 #define	DPRINTK(fmt,args...) printk( fmt, ##args )
@@ -91,11 +91,15 @@ typedef struct stram_block {
 /* values for flags field */
 #define BLOCK_FREE	0x01	/* free structure in the BLOCKs pool */
 #define BLOCK_KMALLOCED	0x02	/* structure allocated by kmalloc() */
+#define BLOCK_POOL	0x04	/* block allocated from static pool */
 #define BLOCK_GFP	0x08	/* block allocated with __get_dma_pages() */
 
 /* list of allocated blocks */
 static BLOCK *alloc_list;
 
+static BLOCK *stram_free_list;
+static unsigned long stram_pool, stram_pool_start, stram_pool_end;
+
 /* We can't always use kmalloc() to allocate BLOCK structures, since
  * stram_alloc() can be called rather early. So we need some pool of
  * statically allocated structures. 20 of them is more than enough, so in most
@@ -156,6 +160,10 @@ void __init atari_stram_reserve_pages(void *start_mem)
 	if (!kernel_in_stram)
 		reserve_bootmem(0, PAGE_SIZE, BOOTMEM_DEFAULT);
 
+	stram_pool       = (unsigned long) alloc_bootmem_low(1024*1024);
+	stram_pool_start = stram_pool;
+	stram_pool_end   = stram_pool + 1024*1024 - 1;
+	DPRINTK("atari_stram pool, start=%08lx, end=%08lx\n", stram_pool, stram_pool_end);
 }
 
 void atari_stram_mem_init_hook (void)
@@ -163,6 +171,39 @@ void atari_stram_mem_init_hook (void)
 	mem_init_done = 1;
 }
 
+/* find a region (by size) in the free list */
+static void *find_free_stram( long size )
+{
+	BLOCK *p,*q,*r;
+	unsigned long item;
+
+	q=NULL;
+	r=stram_free_list;
+	for( p = stram_free_list; p; p = p->next ) {
+		if (p->size >= size) {
+			q=p;
+			break;
+		}
+		r=p;
+	}
+
+	/* remove from free list - FIXME, untested! */
+	if (q) {
+		item = (unsigned long) q->start;
+		r->next = q->next;
+		return (void *) item;
+	}
+
+	/* not taken from free list? take from pool */
+	if ( (stram_pool_end - stram_pool) > size) {
+		item = stram_pool;
+		stram_pool += size;
+		return (void *) item;
+	}
+
+	return( NULL );
+}
+
 
 /*
  * This is main public interface: somehow allocate a ST-RAM block
@@ -189,11 +230,17 @@ void *atari_stram_alloc(long size, const char *owner)
 	if (!mem_init_done)
 		return alloc_bootmem_low(size);
 	else {
+	        if ((addr = find_free_stram(size)) != NULL) {
+		  flags = BLOCK_POOL;
+		  DPRINTK( "atari_stram_alloc: after mem_init, "
+				 "find_free_Stram=%p\n", addr );
+	        } else {
 		/* After mem_init(): can only resort to __get_dma_pages() */
-		addr = (void *)__get_dma_pages(GFP_KERNEL, get_order(size));
-		flags = BLOCK_GFP;
-		DPRINTK( "atari_stram_alloc: after mem_init, "
+		  addr = (void *)__get_dma_pages(GFP_KERNEL, get_order(size));
+		  flags = BLOCK_GFP;
+		  DPRINTK( "atari_stram_alloc: after mem_init, "
 				 "get_pages=%p\n", addr );
+		}
 	}
 
 	if (addr) {
@@ -226,6 +273,12 @@ void atari_stram_free( void *addr )
 	DPRINTK( "atari_stram_free: found block (%p): size=%08lx, owner=%s, "
 			 "flags=%02x\n", block, block->size, block->owner, block->flags );
 
+        if (block->flags & BLOCK_POOL) {
+                block->next=stram_free_list->next;
+        	stram_free_list=block;
+        	return;
+        }
+
 	if (!(block->flags & BLOCK_GFP))
 		goto fail;
 
-- 
1.5.6.5

