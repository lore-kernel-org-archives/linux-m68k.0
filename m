From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: [PATCH 1/4] Add linux/io.h to make it compile
Date: Mon, 15 Oct 2012 14:54:37 +0200
Message-ID: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34349 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab2JOMyq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 08:54:46 -0400
Received: by mail-wi0-f178.google.com with SMTP id hr7so2048248wib.1
        for <linux-m68k@vger.kernel.org>; Mon, 15 Oct 2012 05:54:45 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, Stany MARCEL <stany.marcel@novasys-ingenierie.com>

Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
---
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
