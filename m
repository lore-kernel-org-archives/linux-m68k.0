From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] mac68k: fix compiler warning
Date: Mon, 18 Jul 2011 00:06:10 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107172341070.191@ibook.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:50186 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755892Ab1GQOd0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 Jul 2011 10:33:26 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>


The algorithm described in the comment compares two reads from the RTC but
the code actually reads once and compares the result to an uninitialized
value. This causes the compiler to warn, "last_result maybe used
uninitialized". Make the code match the comment, fix the warning and
perhaps improve reliability. Tested on a Quadra 700.     

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 arch/m68k/mac/misc.c |   40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

Index: linux-2.6.39/arch/m68k/mac/misc.c
===================================================================
--- linux-2.6.39.orig/arch/m68k/mac/misc.c	2011-05-19 14:06:34.000000000 +1000
+++ linux-2.6.39/arch/m68k/mac/misc.c	2011-07-17 19:29:17.000000000 +1000
@@ -304,35 +304,41 @@ static void via_write_pram(int offset, _
 static long via_read_time(void)
 {
 	union {
-		__u8  cdata[4];
-		long  idata;
+		__u8 cdata[4];
+		long idata;
 	} result, last_result;
-	int	ct;
+	int count = 1;
+
+	via_pram_command(0x81, &last_result.cdata[3]);
+	via_pram_command(0x85, &last_result.cdata[2]);
+	via_pram_command(0x89, &last_result.cdata[1]);
+	via_pram_command(0x8D, &last_result.cdata[0]);
 
 	/*
 	 * The NetBSD guys say to loop until you get the same reading
 	 * twice in a row.
 	 */
 
-	ct = 0;
-	do {
-		if (++ct > 10) {
-			printk("via_read_time: couldn't get valid time, "
-			       "last read = 0x%08lx and 0x%08lx\n",
-			       last_result.idata, result.idata);
-			break;
-		}
-
-		last_result.idata = result.idata;
-		result.idata = 0;
-
+	while (1) {
 		via_pram_command(0x81, &result.cdata[3]);
 		via_pram_command(0x85, &result.cdata[2]);
 		via_pram_command(0x89, &result.cdata[1]);
 		via_pram_command(0x8D, &result.cdata[0]);
-	} while (result.idata != last_result.idata);
 
-	return result.idata - RTC_OFFSET;
+		if (result.idata == last_result.idata)
+			return result.idata - RTC_OFFSET;
+
+		if (++count > 10)
+			break;
+
+		last_result.idata = result.idata;
+	}
+
+	pr_err("via_read_time: failed to read a stable value; "
+	       "got 0x%08lx then 0x%08lx\n",
+	       last_result.idata, result.idata);
+
+	return 0;
 }
 
 /*
