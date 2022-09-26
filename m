Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEEDC32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 13:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbiIZNL0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 09:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234374AbiIZNKq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 09:10:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB6F7F098
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 04:40:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A814BB802C5;
        Mon, 26 Sep 2022 11:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA535C433D6;
        Mon, 26 Sep 2022 11:39:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fHlehfB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664192347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=lXzhIDK1RBL2t6Qq2MJruzYDdSGZCUBvejE11s/SNqw=;
        b=fHlehfB28A6cHR2RA/QhrJgaDqai6dgDRSyF8gHF7aq6ii7eY1bnfEvrPe3iNudKipuh9Y
        Pm/M2oZNI7KDUnUuMxVOgqFc47vRpAGGooOg1TCzV/rdrXB3n7sHasE0+VbH+CUW31ZZF4
        VZztWpLa9r16pLUnW0ruPjJ+cTqIKtA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a0590cd (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Mon, 26 Sep 2022 11:39:06 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH qemu v2 1/2] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
Date:   Mon, 26 Sep 2022 13:38:59 +0200
Message-Id: <20220926113900.1256630-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Following a change on the kernel side (see link), pass BI_RNG_SEED
instead of BI_VIRT_RNG_SEED. This should have no impact on
compatibility, as there will simply be no effect if it's an old kernel,
which is how things have always been. We then use this as an opportunity
to add this to q800, since now we can, which is a nice improvement.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Link: https://lore.kernel.org/lkml/20220923170340.4099226-3-Jason@zx2c4.com/
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/q800.c                                    | 7 +++++++
 hw/m68k/virt.c                                    | 2 +-
 include/standard-headers/asm-m68k/bootinfo-virt.h | 4 +++-
 include/standard-headers/asm-m68k/bootinfo.h      | 8 +++++++-
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 101ab0f803..9106382066 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -385,6 +386,7 @@ static void q800_init(MachineState *machine)
     NubusBus *nubus;
     DeviceState *glue;
     DriveInfo *dinfo;
+    uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
 
@@ -634,6 +636,11 @@ static void q800_init(MachineState *machine)
                         kernel_cmdline);
         }
 
+	/* Pass seed to RNG. */
+	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+	BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
+		     rng_seed, sizeof(rng_seed));
+
         /* load initrd */
         if (initrd_filename) {
             initrd_size = get_image_size(initrd_filename);
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 2f3ffc0de6..7180325e54 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -250,7 +250,7 @@ static void virt_init(MachineState *machine)
 
 	/* Pass seed to RNG. */
 	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-	BOOTINFODATA(cs->as, parameters_base, BI_VIRT_RNG_SEED,
+	BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
 		     rng_seed, sizeof(rng_seed));
 
         /* load initrd */
diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
index 1b1ffd4705..75ac6bbd7d 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,7 +12,9 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
-#define BI_VIRT_RNG_SEED	0x8006
+
+/* No longer used -- replaced with BI_RNG_SEED -- but don't reuse this index:
+ * #define BI_VIRT_RNG_SEED	0x8006 */
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
diff --git a/include/standard-headers/asm-m68k/bootinfo.h b/include/standard-headers/asm-m68k/bootinfo.h
index 7b790e8ec8..b7a8dd2514 100644
--- a/include/standard-headers/asm-m68k/bootinfo.h
+++ b/include/standard-headers/asm-m68k/bootinfo.h
@@ -57,7 +57,13 @@ struct mem_info {
 					/* (struct mem_info) */
 #define BI_COMMAND_LINE		0x0007	/* kernel command line parameters */
 					/* (string) */
-
+/*
+ * A random seed used to initialize the RNG. Record format:
+ *
+ *   - length       [ 2 bytes, 16-bit big endian ]
+ *   - seed data    [ `length` bytes, padded to preserve 4-byte struct alignment ]
+ */
+#define BI_RNG_SEED		0x0008
 
     /*
      *  Linux/m68k Architectures (BI_MACHTYPE)
-- 
2.37.3

