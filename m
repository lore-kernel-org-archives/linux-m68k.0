From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: [PATCH 1/4 V2] Add linux/io.h to make m54xx_wdt.c compile with MMU enabled.
Date: Mon, 15 Oct 2012 16:08:21 +0200
Message-ID: <1350310101-17784-1-git-send-email-stany.marcel@novasys-ingenierie.com>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:39980 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753614Ab2JOOIl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 10:08:41 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so4524275wgb.1
        for <linux-m68k@vger.kernel.org>; Mon, 15 Oct 2012 07:08:40 -0700 (PDT)
In-Reply-To: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, Stany MARCEL <stany.marcel@novasys-ingenierie.com>

Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
---

Changes:
 - V2: reword commit message.

 drivers/watchdog/m54xx_wdt.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/m54xx_wdt.c b/drivers/watchdog/m54xx_wdt.c
index 173494a..7466b4b 100644
--- a/drivers/watchdog/m54xx_wdt.c
+++ b/drivers/watchdog/m54xx_wdt.c
@@ -29,6 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/ioport.h>
 #include <linux/uaccess.h>
+#include <linux/io.h>

 #include <asm/coldfire.h>
 #include <asm/m54xxsim.h>
--
1.7.9.5
