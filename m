Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8B5EDEC5A
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241507AbjIMOKD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241343AbjIMOJO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:09:14 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9231E1FCA
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:53 -0700 (PDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4Rm2PG4nqrz4wyvF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 16:08:50 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f674:9611:cd05:f25a])
        by albert.telenet-ops.be with bizsmtp
        id lS8p2A00s3fvA4V06S8p5G; Wed, 13 Sep 2023 16:08:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003ctl-GT;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXv-00FV6u-RG;
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
Subject: [PATCH v2 44/52] m68k: sun3: Remove unused vsprintf() return value in prom_printf()
Date:   Wed, 13 Sep 2023 16:08:34 +0200
Message-Id: <94a1e61b1651ff05f4a59655d9b8c1ac5338f60c.1694613528.git.geert@linux-m68k.org>
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
    arch/m68k/sun3/prom/printf.c:28:13: warning: variable ‘i’ set but not used [-Wunused-but-set-variable]
       28 |         int i;
	  |             ^

As the return value of vsprintf() is unused, and serves no practical
purpose here, fix this by removing the variable.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/sun3/prom/printf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/sun3/prom/printf.c b/arch/m68k/sun3/prom/printf.c
index b6724cc6679579bd..db5537ef12504a8b 100644
--- a/arch/m68k/sun3/prom/printf.c
+++ b/arch/m68k/sun3/prom/printf.c
@@ -25,15 +25,14 @@ prom_printf(char *fmt, ...)
 {
 	va_list args;
 	char ch, *bptr;
-	int i;
 
 	va_start(args, fmt);
 
 #ifdef CONFIG_KGDB
 	ppbuf[0] = 'O';
-	i = vsprintf(ppbuf + 1, fmt, args) + 1;
+	vsprintf(ppbuf + 1, fmt, args) + 1;
 #else
-	i = vsprintf(ppbuf, fmt, args);
+	vsprintf(ppbuf, fmt, args);
 #endif
 
 	bptr = ppbuf;
-- 
2.34.1

