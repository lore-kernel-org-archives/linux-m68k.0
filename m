From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if kernel not in ST-RAM
Date: Sat, 22 Mar 2014 21:47:07 +1300
Message-ID: <1395478028-17274-2-git-send-email-schmitz@debian.org>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:52559 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795AbaCVIrW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 04:47:22 -0400
Received: by mail-pa0-f45.google.com with SMTP id kl14so3387044pab.32
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 01:47:22 -0700 (PDT)
In-Reply-To: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

With the kernel loaded to FastRAM (TT-RAM), none of the ST-RAM
address range is mapped by init_mem, and ST-RAM is not accessible
through the normal allocation pathways as a result.

Implement ST-RAM pool allocation to be based on physical addresses
always (it already was when the kernel was loaded in ST-RAM).
Return kernel virtual addresses as per normal.

The current test for the kernel residing in ST-RAM always returns
true. Use the bootinfo memory chunk order instead - with the kernel
in FastRAM, ST-RAM (phys. 0x0) is not the first chunk.

Instead of mucking around with ioremap (which appears to
rely on the physical area being mappped by mem_init), use
the initial mapping of the first 16 MB of address space
to 0xFF000000, done in head.S.

Provide helper functions for those users of ST-RAM that need
to be aware of the backing physical addresses.

Kudos to Geert for his hints on getting this started.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/stram.c             |   50 ++++++++++++++++++++++++----------
 arch/m68k/include/asm/atari_stram.h |    2 +
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
index 0810c8d..441330e 100644
--- a/arch/m68k/atari/stram.c
+++ b/arch/m68k/atari/stram.c
@@ -47,6 +47,7 @@ static struct resource stram_pool = {
 
 static unsigned long pool_size = 1024*1024;
 
+static unsigned long stram_virt_offset = 0;
 
 static int __init atari_stram_setup(char *arg)
 {
@@ -67,14 +68,12 @@ early_param("stram_pool", atari_stram_setup);
 void __init atari_stram_init(void)
 {
 	int i;
-	void *stram_start;
 
 	/*
 	 * determine whether kernel code resides in ST-RAM
 	 * (then ST-RAM is the first memory block at virtual 0x0)
 	 */
-	stram_start = phys_to_virt(0);
-	kernel_in_stram = (stram_start == 0);
+	kernel_in_stram = (m68k_memory[0].addr == 0);
 
 	for (i = 0; i < m68k_num_memory; ++i) {
 		if (m68k_memory[i].addr == 0) {
@@ -93,21 +92,42 @@ void __init atari_stram_init(void)
  */
 void __init atari_stram_reserve_pages(void *start_mem)
 {
-	/*
-	 * always reserve first page of ST-RAM, the first 2 KiB are
-	 * supervisor-only!
-	 */
-	if (!kernel_in_stram)
-		reserve_bootmem(0, PAGE_SIZE, BOOTMEM_DEFAULT);
-
-	stram_pool.start = (resource_size_t)alloc_bootmem_low_pages(pool_size);
+	if (kernel_in_stram) {
+		printk("atari_stram pool: kernel in ST-RAM, using alloc_bootmem!\n");
+		stram_pool.start = (resource_size_t)alloc_bootmem_low_pages(pool_size);
+
+	} else {
+		printk("atari_stram pool: kernel not in ST-RAM, using ioremap!\n");
+		/*
+		 * Skip page 0, as the fhe first 2 KiB are supervisor-only!
+		 */
+		stram_pool.start = PAGE_SIZE;
+		/*
+		 * Use the virtual address we mapped the first 16 MB of address
+		 * space at in head.S
+		 * Caution: this is mapped nocache/serialized!
+		 */
+		stram_virt_offset = (unsigned long) 0xFF000000;
+  	}
 	stram_pool.end = stram_pool.start + pool_size - 1;
 	request_resource(&iomem_resource, &stram_pool);
+	printk("atari_stram pool: size = %lu bytes, resource = %pR\n",
+		pool_size, &stram_pool);
+	printk("atari_stram pool: start = %p, end = %p\n",
+		(void *) stram_pool.start, (void *) stram_pool.end);		
+	printk("atari_stram pool: stram_virt_offset = %p\n",
+		(void *) stram_virt_offset);		
+}
 
-	pr_debug("atari_stram pool: size = %lu bytes, resource = %pR\n",
-		 pool_size, &stram_pool);
+void *atari_stram_to_virt(unsigned long phys)
+{
+	return (void *)(phys + stram_virt_offset);
 }
 
+unsigned long atari_stram_to_phys(void *virt)
+{
+	return (unsigned long)(virt - stram_virt_offset);
+}
 
 void *atari_stram_alloc(unsigned long size, const char *owner)
 {
@@ -134,14 +154,14 @@ void *atari_stram_alloc(unsigned long size, const char *owner)
 	}
 
 	pr_debug("atari_stram_alloc: returning %pR\n", res);
-	return (void *)res->start;
+	return atari_stram_to_virt(res->start);
 }
 EXPORT_SYMBOL(atari_stram_alloc);
 
 
 void atari_stram_free(void *addr)
 {
-	unsigned long start = (unsigned long)addr;
+	unsigned long start = atari_stram_to_phys(addr);
 	struct resource *res;
 	unsigned long size;
 
diff --git a/arch/m68k/include/asm/atari_stram.h b/arch/m68k/include/asm/atari_stram.h
index 62e2759..4e771c2 100644
--- a/arch/m68k/include/asm/atari_stram.h
+++ b/arch/m68k/include/asm/atari_stram.h
@@ -8,6 +8,8 @@
 /* public interface */
 void *atari_stram_alloc(unsigned long size, const char *owner);
 void atari_stram_free(void *);
+void *atari_stram_to_virt(unsigned long phys);
+unsigned long atari_stram_to_phys(void *);
 
 /* functions called internally by other parts of the kernel */
 void atari_stram_init(void);
-- 
1.7.0.4
