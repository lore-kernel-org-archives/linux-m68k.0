Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A9BC6FA82
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 16:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiIWQmu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 12:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbiIWQmX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 12:42:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DDA7D789
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 09:42:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA495B82E8E;
        Fri, 23 Sep 2022 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8053C433D6;
        Fri, 23 Sep 2022 16:41:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RQzpPKDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663951318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2yUgpm5yrsqs4xGg1DubmtpMZjC6mIbGkERiGED1ouw=;
        b=RQzpPKDqJJy+nM1qAe6dN3QrAtMhQBuE4QdfAT+2uGBFkwxBgRNDI7xVZsgIPhcWhGsNFz
        SxAPfafJACQl4AWghDFzTxN/9YeotIa9gxlDMm6Jm5BcBRg5mADgcxmN87nsDnrVjWFeVc
        /XoR6Hoh6CUPWkjS8msB5RMGg7xMv6Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id edc4341e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 23 Sep 2022 16:41:57 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Vivier <Laurent@vivier.eu>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] m68k: pass rng seed via BI_RNG_SEED
Date:   Fri, 23 Sep 2022 18:41:52 +0200
Message-Id: <20220923164152.4079868-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9ow+ivvQaCnPqRNiYRn4+fuGksKyRAEWtBa-6yhyg9OTA@mail.gmail.com>
References: <CAHmME9ow+ivvQaCnPqRNiYRn4+fuGksKyRAEWtBa-6yhyg9OTA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

In order to pass fresh entropy to kexec'd kernels, use BI_RNG_SEED
for passing a seed, with the same semantics that kexec-tools currently
uses for i386's setup_data.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Geert - this hasn't been compile tested yet and also depends on changes
that haven't yet landed upstream. Posting this preliminarily now. -Jason

 kexec/arch/m68k/bootinfo.c       | 23 +++++++++++++++++++++++
 kexec/arch/m68k/bootinfo.h       |  5 +++++
 kexec/arch/m68k/kexec-elf-m68k.c |  1 +
 3 files changed, 29 insertions(+)

diff --git a/kexec/arch/m68k/bootinfo.c b/kexec/arch/m68k/bootinfo.c
index 18bf226..086a34b 100644
--- a/kexec/arch/m68k/bootinfo.c
+++ b/kexec/arch/m68k/bootinfo.c
@@ -2,6 +2,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/random.h>
 
 #include "../../kexec.h"
 
@@ -152,6 +153,11 @@ void bootinfo_print(void)
 			printf("BI_COMMAND_LINE: %s\n", bi->string);
 			break;
 
+		case BI_RNG_SEED:
+			/* These are secret, so never print them to the console */
+			printf("BI_RNG_SEED: 0x%08x bytes\n", be16_to_cpu(bi->rng_seed.len));
+			break;
+
 		default:
 			printf("BI tag 0x%04x size %u\n", tag, size);
 			break;
@@ -212,6 +218,23 @@ void bootinfo_set_ramdisk(unsigned long ramdisk_addr,
 	bi->mem_info.size = ramdisk_size;
 }
 
+void bootinfo_add_rng_seed(void)
+{
+	enum { RNG_SEED_LEN = 32 };
+	struct bi_rec *bi;
+
+	/* Remove existing rng seed records */
+	bi_remove(BI_RNG_SEED);
+
+	/* Add new rng seed record */
+	bi = bi_add(BI_RNG_SEED, sizeof(bi->rng_seed) + RNG_SEED_LEN);
+	if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
+		bi_remove(BI_RNG_SEED);
+		return;
+	}
+	bi->rng_seed.len = cpu_to_be16(RNG_SEED_LEN);
+}
+
 
     /*
      * Check the bootinfo version in the kernel image
diff --git a/kexec/arch/m68k/bootinfo.h b/kexec/arch/m68k/bootinfo.h
index b6f453d..90f75ad 100644
--- a/kexec/arch/m68k/bootinfo.h
+++ b/kexec/arch/m68k/bootinfo.h
@@ -20,6 +20,10 @@ struct bi_rec {
 			__be32 size;
 		} mem_info;
 		char string[0];
+		struct {
+			__be16 len;
+			u8 data[0];
+		} rng_seed;
 	};
 };
 
@@ -39,5 +43,6 @@ extern int bootinfo_get_memory_ranges(struct memory_range **range);
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
@@ -162,6 +162,7 @@ int elf_m68k_load(int argc, char **argv, const char *buf, off_t len,
 	/* Update and add bootinfo */
 	bootinfo_set_cmdline(cmdline);
 	bootinfo_set_ramdisk(ramdisk_addr, ramdisk_size);
+	bootinfo_add_rng_seed();
 	if (kexec_debug)
 		bootinfo_print();
 	add_bootinfo(info, bootinfo_addr);
-- 
2.37.3

