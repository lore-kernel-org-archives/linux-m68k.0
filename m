Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DCBC433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jun 2022 15:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbiFYPoR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jun 2022 11:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbiFYPoQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Jun 2022 11:44:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F9612A96
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jun 2022 08:44:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A25EBB8095A;
        Sat, 25 Jun 2022 15:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943A9C3411C;
        Sat, 25 Jun 2022 15:44:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cIUADsCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1656171851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8R4CaV/OEt3lr+fj/h7Drz8mOofV0RCqbg5qshPp2Kw=;
        b=cIUADsCKvtljLtAMAU3Idmd0fKP7YlHD6l64J+mHFf4qnNr/AX6wsdeI/5ZqAeETRmJ8U1
        /djJkcfGR7lqgkkhyNMFp6diFQOoaqmG/duGIFx+044RvYETP4GKK3zTFrwre9Aa4LxmV/
        FHCLy7SRM6TGhSLO51Vo/spOz0VNHYE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae9c7f36 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Sat, 25 Jun 2022 15:44:10 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Laurent Vivier <laurent@vivier.eu>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        qemu-devel@nongnu.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH qemu] m68k: virt: pass RNG seed via bootinfo block
Date:   Sat, 25 Jun 2022 17:44:02 +0200
Message-Id: <20220625154402.146403-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This commit wires up bootinfo's RNG seed attribute so that Linux VMs can
have their RNG seeded from the earliest possible time in boot, just like
the "rng-seed" device tree property on those platforms. The link
contains the corresponding Linux patch.

Link: https://lore.kernel.org/lkml/20220625153841.143928-1-Jason@zx2c4.com/
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
This requires this trivial cleanup commit first:
    https://lore.kernel.org/qemu-devel/20220625152318.120849-1-Jason@zx2c4.com/

 hw/m68k/bootinfo.h                               | 16 ++++++++++++++++
 hw/m68k/virt.c                                   |  7 +++++++
 .../standard-headers/asm-m68k/bootinfo-virt.h    |  1 +
 3 files changed, 24 insertions(+)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index ff4e155a3c..2f31c13b6e 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -56,4 +56,20 @@
         stb_phys(as, base++, 0); \
         base = (base + 1) & ~1; \
     } while (0)
+
+#define BOOTINFODATA(as, base, id, data, len) \
+    do { \
+        int i; \
+        stw_phys(as, base, id); \
+        base += 2; \
+        stw_phys(as, base, \
+                 (sizeof(struct bi_record) + len + 5) & ~1); \
+        base += 2; \
+        stl_phys(as, base, len); \
+        base += 4; \
+        for (i = 0; i < len; ++i) { \
+            stb_phys(as, base++, data[i]); \
+        } \
+        base = (base + 1) & ~1; \
+    } while (0)
 #endif
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e215aa3d42..0aa383fa6b 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/guest-random.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -120,6 +121,7 @@ static void virt_init(MachineState *machine)
     hwaddr io_base;
     int i;
     ResetInfo *reset_info;
+    uint8_t rng_seed[32];
 
     if (ram_size > 3399672 * KiB) {
         /*
@@ -245,6 +247,11 @@ static void virt_init(MachineState *machine)
                         kernel_cmdline);
         }
 
+	/* Pass seed to RNG. */
+	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+	BOOTINFODATA(cs->as, parameters_base, BI_VIRT_RNG_SEED,
+		     rng_seed, sizeof(rng_seed));
+
         /* load initrd */
         if (initrd_filename) {
             initrd_size = get_image_size(initrd_filename);
diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
index 81be1e0924..1b1ffd4705 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,6 +12,7 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
+#define BI_VIRT_RNG_SEED	0x8006
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
-- 
2.35.1

