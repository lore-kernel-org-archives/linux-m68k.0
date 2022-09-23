Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C61C6FA8B
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 12:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiIWMrV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiIWMrU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 08:47:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9985B135070
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:47:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B45C60F95;
        Fri, 23 Sep 2022 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D80C433D6;
        Fri, 23 Sep 2022 12:47:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mVadCDwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663937235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0XZD8LDMJASSC7UauO6KTgoZrlLkiFhayn6tNIWF9Wg=;
        b=mVadCDwOb9H1+p2R8xTl1afqX/2BDScs4q/yO2HhbKHM5UebgOrSYbrzAEGK2EhRN6FwEd
        NgguTL2imGsrQVQT1tU57f9os1s6k6sAP2o07Juzp5Otk2fcDN5VkaWafH92m8R22TnRuL
        h2+j/eReoxecHZUvT1UljHdOJfvpWaw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a5c274d4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 23 Sep 2022 12:47:15 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        Simon Horman <horms@verge.net.au>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH kexec-tools] m68k: pass rng seed via BI_VIRT_RNG_SEED
Date:   Fri, 23 Sep 2022 14:46:43 +0200
Message-Id: <20220923124642.3942806-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

In order to pass fresh entropy to kexec'd kernels, use BI_VIRT_RNG_SEED
for passing a seed, with the same semantics that kexec-tools currently
uses for i386's setup_data.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Geert - I don't have a toolchain for testing this. Could you verify it
works, if you have a chance? -Jason

 kexec/arch/m68k/bootinfo.c       | 22 ++++++++++++++++++++++
 kexec/arch/m68k/bootinfo.h       |  6 ++++++
 kexec/arch/m68k/kexec-elf-m68k.c |  1 +
 3 files changed, 29 insertions(+)

diff --git a/kexec/arch/m68k/bootinfo.c b/kexec/arch/m68k/bootinfo.c
index 18bf226..74e65a0 100644
--- a/kexec/arch/m68k/bootinfo.c
+++ b/kexec/arch/m68k/bootinfo.c
@@ -135,40 +135,45 @@ void bootinfo_print(void)
 		size = bi->size;
 		switch (tag) {
 		case BI_MACHTYPE:
 			printf("BI_MACHTYPE: 0x%08x\n", bi->machtype);
 			break;
 
 		case BI_MEMCHUNK:
 			printf("BI_MEMCHUNK: 0x%08x bytes at 0x%08x\n",
 			       bi->mem_info.size, bi->mem_info.addr);
 			break;
 
 		case BI_RAMDISK:
 			printf("BI_RAMDISK: 0x%08x bytes at 0x%08x\n",
 			       bi->mem_info.size, bi->mem_info.addr);
 			break;
 
 		case BI_COMMAND_LINE:
 			printf("BI_COMMAND_LINE: %s\n", bi->string);
 			break;
 
+		case BI_VIRT_RNG_SEED:
+			/* These are secret, so never print them to the console */
+			printf("BI_VIRT_RNG_SEED: 0x%08x bytes\n", be16_to_cpu(bi->bytes.len));
+			break;
+
 		default:
 			printf("BI tag 0x%04x size %u\n", tag, size);
 			break;
 		}
 		bi = bi_next(bi, size);
 	}
 }
 
 int bootinfo_get_memory_ranges(struct memory_range **range)
 {
 	struct memory_range *ranges;
 	unsigned int i;
 	struct bi_rec *bi;
 
 	ranges = xmalloc(num_memchunks * sizeof(struct memory_range));
 	for (i = 0, bi = NULL;
 	     i < num_memchunks && (bi = bi_find(bi, BI_MEMCHUNK)); i++) {
 		ranges[i].start = bi->mem_info.addr;
 		ranges[i].end = bi->mem_info.addr + bi->mem_info.size - 1;
 		ranges[i].type = RANGE_RAM;
@@ -195,40 +200,57 @@ void bootinfo_set_cmdline(const char *cmdline)
 	memcpy(bi->string, cmdline, size);
 }
 
 void bootinfo_set_ramdisk(unsigned long ramdisk_addr,
 			  unsigned long ramdisk_size)
 {
 	struct bi_rec *bi;
 
 	/* Remove existing ramdisk records */
 	bi_remove(BI_RAMDISK);
 
 	if (!ramdisk_size)
 		return;
 
 	/* Add new ramdisk record */
 	bi = bi_add(BI_RAMDISK, sizeof(bi->mem_info));
 	bi->mem_info.addr = ramdisk_addr;
 	bi->mem_info.size = ramdisk_size;
 }
 
+void bootinfo_add_rng_seed(void)
+{
+	struct bi_rec *bi;
+	enum { RNG_SEED_LEN = 32 };
+
+	/* Remove existing rng seed records */
+	bi_remove(BI_VIRT_RNG_SEED);
+
+	/* Add new rng seed record */
+	bi = bi_add(BI_VIRT_RNG_SEED, sizeof(bi->bytes) + RNG_SEED_LEN);
+	if (getrandom(bi->bytes.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
+		bi_remove(BI_VIRT_RNG_SEED);
+		return;
+	}
+	bi->bytes.len = cpu_to_be16(RNG_SEED_LEN);
+}
+
 
     /*
      * Check the bootinfo version in the kernel image
      * All failures are non-fatal, as kexec may be used to load
      * non-Linux images
      */
 
 void bootinfo_check_bootversion(const struct kexec_info *info)
 {
 	struct bi_rec *bi;
 	const struct bootversion *bv;
 	uint16_t major, minor;
 	unsigned int i;
 
 	bv = info->segment[0].buf;
 	if (bv->magic != BOOTINFOV_MAGIC) {
 		printf("WARNING: No bootversion in kernel image\n");
 		return;
 	}
 
diff --git a/kexec/arch/m68k/bootinfo.h b/kexec/arch/m68k/bootinfo.h
index b6f453d..6dff2ad 100644
--- a/kexec/arch/m68k/bootinfo.h
+++ b/kexec/arch/m68k/bootinfo.h
@@ -1,43 +1,49 @@
 #include <asm/bootinfo.h>
+#include <asm/bootinfo-virt.h>
 
 #define DEFAULT_BOOTINFO_FILE	"/proc/bootinfo"
 #define MAX_BOOTINFO_SIZE	1536
 
 
     /*
      *  Convenience overlay of several struct bi_record variants
      */
 
 struct bi_rec {
 	__be16 tag;
 	__be16 size;
 	union {
 		__be32 data[0];
 		/* shorthands for the types we use */
 		__be32 machtype;
 		struct {
 			__be32 addr;
 			__be32 size;
 		} mem_info;
 		char string[0];
+		struct {
+			__be16 len;
+			u8 data[0];
+		} bytes;
 	};
 };
 
 
     /*
      *  We only support the "new" tagged bootinfo (v2)
      */
 
 #define SUPPORTED_BOOTINFO_VERSION	2
 
 
 extern const char *bootinfo_file;
 
 extern void bootinfo_load(void);
 extern void bootinfo_print(void);
 extern int bootinfo_get_memory_ranges(struct memory_range **range);
 extern void bootinfo_set_cmdline(const char *cmdline);
 extern void bootinfo_set_ramdisk(unsigned long ramdisk_addr,
 				 unsigned long ramdisk_size);
+extern void bootinfo_add_rng_seed(void);
 extern void bootinfo_check_bootversion(const struct kexec_info *info);
 extern void add_bootinfo(struct kexec_info *info, unsigned long addr);
diff --git a/kexec/arch/m68k/kexec-elf-m68k.c b/kexec/arch/m68k/kexec-elf-m68k.c
index 8d00eb9..a2bf7ee 100644
--- a/kexec/arch/m68k/kexec-elf-m68k.c
+++ b/kexec/arch/m68k/kexec-elf-m68k.c
@@ -145,38 +145,39 @@ int elf_m68k_load(int argc, char **argv, const char *buf, off_t len,
 	bootinfo_addr = segment_end(info, info->nr_segments - 1) + 1;
 
 	/* Load ramdisk */
 	if (ramdisk_file) {
 		void *ramdisk = slurp_decompress_file(ramdisk_file,
 						      &ramdisk_size);
 		/* Store ramdisk at top of first memory chunk */
 		ramdisk_addr = _ALIGN_DOWN(info->memory_range[0].end -
 					   ramdisk_size + 1,
 					   PAGE_SIZE);
 		if (!buf)
 			die("Ramdisk load failed\n");
 		add_buffer(info, ramdisk, ramdisk_size, ramdisk_size,
 			   PAGE_SIZE, ramdisk_addr, info->memory_range[0].end,
 			   1);
 	}
 
 	/* Update and add bootinfo */
 	bootinfo_set_cmdline(cmdline);
 	bootinfo_set_ramdisk(ramdisk_addr, ramdisk_size);
+	bootinfo_add_rng_seed();
 	if (kexec_debug)
 		bootinfo_print();
 	add_bootinfo(info, bootinfo_addr);
 
 	/*
 	 * Check if the kernel (and bootinfo) exceed 4 MiB, as current kernels
 	 * don't support that.
 	 * As the segments are still unsorted, the bootinfo is located in the
 	 * last segment.
 	 */
 	if (segment_end(info, info->nr_segments - 1) >= virt_to_phys(4 MiB - 1))
 		printf("WARNING: Kernel is larger than 4 MiB\n");
 
 	/* Check struct bootversion at start of kernel */
 	bootinfo_check_bootversion(info);
 
 	return 0;
 }
-- 
2.37.3

