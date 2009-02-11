From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] m68k: amiflop: *ptr incremented past 0x4489
Date: Wed, 11 Feb 2009 15:42:54 +0100
Message-ID: <4992E3EE.2020308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Andrew Morton <akpm@linux-foundation.org>

With while (*ptr++ != 0x4489) { ... } *ptr will be incremented past 0x4489 after
the loop.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index 8df436f..3320b00 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -662,8 +662,8 @@ static unsigned long scan_sync(unsigned long raw, unsigned long end)
 {
 	ushort *ptr = (ushort *)raw, *endp = (ushort *)end;
 
-	while (ptr < endp && *ptr++ != 0x4489)
-		;
+	while (ptr < endp && *ptr != 0x4489)
+		++ptr;
 	if (ptr < endp) {
 		while (*ptr == 0x4489 && ptr < endp)
 			ptr++;
