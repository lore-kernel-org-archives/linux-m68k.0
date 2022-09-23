Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9861DC04A95
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 17:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbiIWRGt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiIWRGs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 13:06:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DAB14C04E
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 10:06:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9115F61255;
        Fri, 23 Sep 2022 17:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70768C433D6;
        Fri, 23 Sep 2022 17:06:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kaVVDv6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663952804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HZ8Xuism+ZD9RfR4qK53DXRIZW6DQs7QWF1+hirJEOQ=;
        b=kaVVDv6C/FMWfhDOnPYoj+2es8iB9Rut0l4ljq0B+L+YpYyz+lWybmGge7Hyd3kuV4rPAm
        V0FpGdPFo1spwp5CpXSj+0GPnERiZIkek6I3AwBe8o+9uvekSzVnTrfwgE1adOnsyI1nJx
        4Blsti3PjZ92wFWhwz2iGVVn7ZN8kbI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bbc662ab (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 23 Sep 2022 17:06:44 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH qemu] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
Date:   Fri, 23 Sep 2022 19:06:37 +0200
Message-Id: <20220923170637.4099736-1-Jason@zx2c4.com>
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
index 1b1ffd4705..36697a52b8 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,7 +12,9 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
-#define BI_VIRT_RNG_SEED	0x8006
+
+/* No longer used -- replaced with BI_RNG_SEED -- but don't reuse this index:
+ * 	#define BI_VIRT_RNG_SEED	0x8006 */
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
diff --git a/include/standard-headers/asm-m68k/bootinfo.h b/include/standard-headers/asm-m68k/bootinfo.h
index 7b790e8ec8..68a91cdfc5 100644
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
+ *   - seed data    [ `length` bytes, padded to preserve 2-byte alignment ]
+ */
+#define BI_RNG_SEED		0x0008
 
     /*
      *  Linux/m68k Architectures (BI_MACHTYPE)
-- 
2.37.3

