Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760ADEDEC5D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241593AbjIMOKV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241406AbjIMOJc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:09:32 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CD51BDC
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:53 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Rm2PF3VcLz4xHC9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 16:08:49 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id lS8o2A0031C8whw01S8oqP; Wed, 13 Sep 2023 16:08:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003ctp-HY;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXv-00FV6y-Sj;
        Wed, 13 Sep 2023 16:08:47 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 45/52] m68k: sun3: Annotate prom_printf() with __printf()
Date:   Wed, 13 Sep 2023 16:08:35 +0200
Message-Id: <61017c012617e6f633ac9f9a3c2659ae38e1f2fb.1694613528.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613528.git.geert@linux-m68k.org>
References: <cover.1694613528.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

    arch/m68k/sun3/prom/printf.c: In function ‘prom_printf’:
    arch/m68k/sun3/prom/printf.c:35:9: warning: function ‘prom_printf’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
       35 |         vsprintf(ppbuf, fmt, args);
	  |         ^~~~~~~~

Fix this by annotating prom_printf() with __printf(1, 2).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/include/asm/oplib.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/oplib.h b/arch/m68k/include/asm/oplib.h
index 48cb4fd09f8d9cce..6d5ea67c65d044c1 100644
--- a/arch/m68k/include/asm/oplib.h
+++ b/arch/m68k/include/asm/oplib.h
@@ -9,6 +9,8 @@
 #ifndef __SPARC_OPLIB_H
 #define __SPARC_OPLIB_H
 
+#include <linux/compiler.h>
+
 #include <asm/openprom.h>
 
 /* The master romvec pointer... */
@@ -149,7 +151,7 @@ extern char prom_getchar(void);
 extern void prom_putchar(char character);
 
 /* Prom's internal printf routine, don't use in kernel/boot code. */
-void prom_printf(char *fmt, ...);
+__printf(1, 2) void prom_printf(char *fmt, ...);
 
 /* Query for input device type */
 
-- 
2.34.1

