From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH] m68k atari: reserve some ST-RAM early on for device buffer
 use (was: Re: Aranym, more than 244MB FastRAM, garbled display)
Date: Fri, 22 Oct 2010 20:42:31 +1300
Message-ID: <4CC14067.8090903@gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>	<m2tyl5u9hu.fsf@igel.home>	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>	<AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com> <AANLkTikumgbPW12gcsUML-JqyCUUaws2=r1gY7NT4fgJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060703080506030301020405"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:63543 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753607Ab0JVHmr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Oct 2010 03:42:47 -0400
Received: by gxk23 with SMTP id 23so154814gxk.19
        for <linux-m68k@vger.kernel.org>; Fri, 22 Oct 2010 00:42:46 -0700 (PDT)
In-Reply-To: <AANLkTikumgbPW12gcsUML-JqyCUUaws2=r1gY7NT4fgJ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------060703080506030301020405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
>>> git. I'll clean that up and resubmit unless Geert has objections.
>>>       
>> I'm blocked on this follow-up you sent me afterwards (without CC to the list):
>>
>> | Plus there's still a bug in stram_free_block, let's see if you can spot it :-)
>>     
>
> Does not ring any bells ... I'll check my old mbox as soon as I have
> access again. I'll add a kernel parameter as well.
>   

See attached - hope the patch format is left intact by Thunderbird.

Tested on ARAnyM only so far ...

Cheers,

  Michael


--------------060703080506030301020405
Content-Type: text/x-patch;
 name="2.6.36-stram-pool.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="2.6.36-stram-pool.diff"

 arch/m68k/atari/stram.c |  110 +++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 101 insertions(+), 9 deletions(-)

 Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
index 6ec3b7f..58891ab 100644
--- a/arch/m68k/atari/stram.c
+++ b/arch/m68k/atari/stram.c
@@ -30,7 +30,7 @@
 #include <asm/atari_stram.h>
 #include <asm/io.h>
 
-#undef DEBUG
+#define DEBUG
 
 #ifdef DEBUG
 #define	DPRINTK(fmt,args...) printk( fmt, ##args )
@@ -68,6 +68,23 @@
  * no provision now for freeing ST-Ram buffers. It seems that isn't
  * really needed.
  *
+ * MSch 22/10/10: Because mem_init is now called before device init, 
+ * devices that rely on ST-RAM may find all ST-RAM already allocated to 
+ * other users by the time device init happens. In particular, a large 
+ * initrd RAM disk may use up enough of ST-RAM to cause stram_alloc to
+ * resort to get_dma_pages allocation.
+ * In the current state of Atari memory management, all of RAM is marked 
+ * DMA capable, so get_dma_pages may well return RAM that is not in actual
+ * fact DMA capable. Using this for frame buffer or SCSI DMA buffer causes 
+ * subtle failure. 
+ *
+ * The ST-RAM allocator has been changed to allocate memory from a pool of 
+ * reserved ST-RAM of configurable size, set aside on ST-RAM init (i.e. 
+ * before mem_init). As long as this pool is not exhausted, allocation of
+ * real ST-RAM can be guaranteed. 
+ * Currently, pool ST-RAM freed is not returned to the pool free list so 
+ * it will be lost. Code to move such freed ST-RAM from alloc_list to 
+ * stram_free_list may be added if needed.
  */
 
 /* Start and end (virtual) of ST-RAM */
@@ -91,11 +108,15 @@ typedef struct stram_block {
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
@@ -116,6 +137,27 @@ static int remove_region( BLOCK *block );
 /*							   Public Interface								*/
 /* ------------------------------------------------------------------------ */
 
+static int pool_size = 1024*1024;
+
+static int __init atari_stram_setup(char *arg)
+{
+        int rc=0;
+
+        if (!MACH_IS_ATARI)
+                return 0;
+
+        if (!(rc = sscanf(arg, "%d", &pool_size))) {
+                DPRINTK("atari_stram: pool size parse error(%d)\n", rc);
+                return 0;
+        }
+
+        pool_size *= 1024;
+
+        return 0;
+}
+
+early_param("stram_pool", atari_stram_setup);
+
 /*
  * This init function is called very early by atari/config.c
  * It initializes some internal variables needed for stram_alloc()
@@ -156,6 +198,10 @@ void __init atari_stram_reserve_pages(void *start_mem)
 	if (!kernel_in_stram)
 		reserve_bootmem(0, PAGE_SIZE, BOOTMEM_DEFAULT);
 
+        stram_pool       = (unsigned long) alloc_bootmem_low(pool_size);
+        stram_pool_start = stram_pool;
+        stram_pool_end   = stram_pool + pool_size - 1;
+	DPRINTK("atari_stram pool: size=%d bytes, start=%08lx, end=%08lx\n", pool_size, stram_pool, stram_pool_end);
 }
 
 void atari_stram_mem_init_hook (void)
@@ -163,6 +209,38 @@ void atari_stram_mem_init_hook (void)
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
+		        q=p;
+			break;
+                }
+                r=p;
+	}
+
+	/* remove from free list */
+        if (q) {
+          item = (unsigned long) q->start;
+          r->next = q->next;
+          return (void *) item;
+        }	
+	/* nothing found on free list? take from pool */
+	if ( (stram_pool_end - stram_pool) > size) {
+	  item = stram_pool;
+	  stram_pool += size;
+	  return (void *) item;
+	}
+
+	return( NULL );
+}
+
 
 /*
  * This is main public interface: somehow allocate a ST-RAM block
@@ -184,16 +262,25 @@ void *atari_stram_alloc(long size, const char *owner)
 	BLOCK *block;
 	int flags;
 
-	DPRINTK("atari_stram_alloc(size=%08lx,owner=%s)\n", size, owner);
+	DPRINTK("atari_stram_alloc(size=%08lx,owner=%s) ... ", size, owner);
 
 	if (!mem_init_done)
+	        /* this will trigger a section mismatch warning which is actually harmless: 
+	          once mem_init has run (before free_initdata), we will not call this code path anymore */ 
 		return alloc_bootmem_low(size);
 	else {
-		/* After mem_init(): can only resort to __get_dma_pages() */
-		addr = (void *)__get_dma_pages(GFP_KERNEL, get_order(size));
-		flags = BLOCK_GFP;
-		DPRINTK( "atari_stram_alloc: after mem_init, "
-				 "get_pages=%p\n", addr );
+		/* After mem_init(): can only resort to allocating from reserved pool ... */
+	        if ((addr = find_free_stram(size)) != NULL) {
+		  flags = BLOCK_POOL;
+		  DPRINTK( "after mem_init, allocating from pool, "
+                           "find_free_stram=%p\n", addr );
+	        } else {
+		/* or resort to __get_dma_pages() !! */
+		  addr = (void *)__get_dma_pages(GFP_KERNEL, get_order(size));
+		  flags = BLOCK_GFP;
+		  DPRINTK( "after mem_init, allocating dma pages, "
+                           "get_dma_pages=%p\n", addr );
+                }
 	}
 
 	if (addr) {
@@ -226,12 +313,15 @@ void atari_stram_free( void *addr )
 	DPRINTK( "atari_stram_free: found block (%p): size=%08lx, owner=%s, "
 			 "flags=%02x\n", block, block->size, block->owner, block->flags );
 
-	if (!(block->flags & BLOCK_GFP))
+	if (!(block->flags & BLOCK_GFP || block->flags & BLOCK_POOL))
 		goto fail;
 
 	DPRINTK("atari_stram_free: is kmalloced, order_size=%d\n",
 		get_order(block->size));
-	free_pages((unsigned long)addr, get_order(block->size));
+
+        /* pages allocated from stram pool cannot be freed - only pages allocated by get_free_pages can */
+	if ((block->flags & BLOCK_GFP))
+	  free_pages((unsigned long)addr, get_order(block->size));
 	remove_region( block );
 	return;
 
@@ -340,6 +430,8 @@ static int stram_proc_show(struct seq_file *m, void *v)
 			   p->owner);
 		if (p->flags & BLOCK_GFP)
 			PRINT_PROC( "page-alloced)\n" );
+		else if (p->flags & BLOCK_POOL)
+			PRINT_PROC( "pool-alloced)\n" );
 		else
 			PRINT_PROC( "??)\n" );
 	}

--------------060703080506030301020405--
