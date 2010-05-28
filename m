From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] mac68k: fix RTC on PMU machines
Date: Sat, 29 May 2010 03:26:01 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1005290100430.4779@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:47908 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758916Ab0E1R0E (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 28 May 2010 13:26:04 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Diego Cousinet <diego@pvco.net>


Copy RTC response bytes correctly on powerbooks and duos. Thanks to Diego 
Cousinet who debugged this and provided me with the fix. Tested on 
PowerBook 190 and Duo 280c.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reported-by: Diego Cousinet <diego@pvco.net>

Index: linux-2.6.34/arch/m68k/mac/misc.c
===================================================================
--- linux-2.6.34.orig/arch/m68k/mac/misc.c	2010-05-28 18:06:41.000000000 +1000
+++ linux-2.6.34/arch/m68k/mac/misc.c	2010-05-28 18:06:41.000000000 +1000
@@ -91,7 +91,7 @@ static void cuda_write_pram(int offset, 
 #define cuda_write_pram NULL
 #endif
 
-#if 0 /* def CONFIG_ADB_PMU68K */
+#ifdef CONFIG_ADB_PMU68K
 static long pmu_read_time(void)
 {
 	struct adb_request req;
@@ -102,8 +102,8 @@ static long pmu_read_time(void)
 	while (!req.complete)
 		pmu_poll();
 
-	time = (req.reply[0] << 24) | (req.reply[1] << 16)
-		| (req.reply[2] << 8) | req.reply[3];
+	time = (req.reply[1] << 24) | (req.reply[2] << 16)
+		| (req.reply[3] << 8) | req.reply[4];
 	return time - RTC_OFFSET;
 }
 
