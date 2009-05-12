From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] m68k: cnt reaches -1, not 0
Date: Wed, 13 May 2009 00:26:25 +0200
Message-ID: <4A09F791.1010307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Andrew Morton <akpm@linux-foundation.org>

With the postfix decrement cnt reaches -1 rather than 0.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 6e56275..6c74751 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -574,10 +574,11 @@ static int a2000_hwclk(int op, struct rtc_time *t)
 
 	tod_2000.cntrl1 = TOD2000_CNTRL1_HOLD;
 
-	while ((tod_2000.cntrl1 & TOD2000_CNTRL1_BUSY) && cnt--) {
+	while ((tod_2000.cntrl1 & TOD2000_CNTRL1_BUSY) && cnt) {
 		tod_2000.cntrl1 &= ~TOD2000_CNTRL1_HOLD;
 		udelay(70);
 		tod_2000.cntrl1 |= TOD2000_CNTRL1_HOLD;
+		--cnt;
 	}
 
 	if (!cnt)
@@ -649,10 +650,11 @@ static int amiga_set_clock_mmss(unsigned long nowtime)
 
 		tod_2000.cntrl1 |= TOD2000_CNTRL1_HOLD;
 
-		while ((tod_2000.cntrl1 & TOD2000_CNTRL1_BUSY) && cnt--) {
+		while ((tod_2000.cntrl1 & TOD2000_CNTRL1_BUSY) && cnt) {
 			tod_2000.cntrl1 &= ~TOD2000_CNTRL1_HOLD;
 			udelay(70);
 			tod_2000.cntrl1 |= TOD2000_CNTRL1_HOLD;
+			--cnt;
 		}
 
 		if (!cnt)
