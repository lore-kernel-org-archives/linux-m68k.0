Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56642EDEC53
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241153AbjIMNpQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbjIMNpN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9DE19B1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 79CA3B82413;
        Wed, 13 Sep 2023 13:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D755C43395;
        Wed, 13 Sep 2023 13:45:06 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 4/7] m68knommu: coldfire: fix warnings in uboot argument processing
Date:   Wed, 13 Sep 2023 23:44:22 +1000
Message-Id: <20230913134425.2610927-5-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913134425.2610927-1-gerg@linux-m68k.org>
References: <20230913134425.2610927-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

      CC      arch/m68k/kernel/uboot.o
    arch/m68k/kernel/uboot.c: In function ‘parse_uboot_commandline’:
    arch/m68k/kernel/uboot.c:68:36: warning: variable ‘uboot_initrd_end’ set but not used [-Wunused-but-set-variable]
      unsigned long uboot_initrd_start, uboot_initrd_end;
                                        ^~~~~~~~~~~~~~~~
    arch/m68k/kernel/uboot.c:68:16: warning: variable ‘uboot_initrd_start’ set but not used [-Wunused-but-set-variable]
      unsigned long uboot_initrd_start, uboot_initrd_end;
                    ^~~~~~~~~~~~~~~~~~
    arch/m68k/kernel/uboot.c:66:16: warning: variable ‘uboot_kbd’ set but not used [-Wunused-but-set-variable]
      unsigned long uboot_kbd;
                    ^~~~~~~~~
    arch/m68k/kernel/uboot.c: At top level:
    arch/m68k/kernel/uboot.c:90:13: warning: no previous prototype for ‘process_uboot_commandline’ [-Wmissing-prototypes]
     __init void process_uboot_commandline(char *commandp, int size)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~

A couple of issues here. Firstly we already have a bootinfo.h that has a
prototype for process_uboot_commandline(), we should include that.
Secondly uboot_kbd is not used at all and can be removed. Thirdly the
conditional code based on CONFIG_BLK_DEV_INITRD means that sometimes
uboot_initrd_start and uboot_initrd_end are not needed. Make their
declaration and assignment conditional on CONFIG_BLK_DEV_INITRD same as
the code that uses them.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/uboot.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 928dbd33fc4a..8bb1cb3a7490 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -27,6 +27,7 @@
 #include <asm/irq.h>
 #include <asm/machdep.h>
 #include <asm/sections.h>
+#include <asm/bootinfo.h>
 
 /*
  * parse_uboot_commandline
@@ -63,20 +64,22 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 {
 	extern unsigned long _init_sp;
 	unsigned long *sp;
-	unsigned long uboot_kbd;
-	unsigned long uboot_initrd_start, uboot_initrd_end;
 	unsigned long uboot_cmd_start, uboot_cmd_end;
+#if defined(CONFIG_BLK_DEV_INITRD)
+	unsigned long uboot_initrd_start, uboot_initrd_end;
+#endif /* if defined(CONFIG_BLK_DEV_INITRD) */
 
 	sp = (unsigned long *)_init_sp;
-	uboot_kbd = sp[1];
-	uboot_initrd_start = sp[2];
-	uboot_initrd_end = sp[3];
 	uboot_cmd_start = sp[4];
 	uboot_cmd_end = sp[5];
 
 	if (uboot_cmd_start && uboot_cmd_end)
 		strncpy(commandp, (const char *)uboot_cmd_start, size);
+
 #if defined(CONFIG_BLK_DEV_INITRD)
+	uboot_initrd_start = sp[2];
+	uboot_initrd_end = sp[3];
+
 	if (uboot_initrd_start && uboot_initrd_end &&
 	    (uboot_initrd_end > uboot_initrd_start)) {
 		initrd_start = uboot_initrd_start;
-- 
2.25.1

