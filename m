From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 2/2] nubus: Fix pointer validation
Date: Sat, 22 Apr 2017 21:24:16 -0400 (EDT)
Message-ID: <0fbc5e985afe65b9dc06ca1f96b6f7e8a3739184.1492910474.git.fthain@telegraphics.com.au>
References: <cover.1492910474.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45228 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757112AbdDWBYR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Apr 2017 21:24:17 -0400
In-Reply-To: <cover.1492910474.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Fix bounds checking on slot-space pointer movement.
Remove redundant test for zero byte-lanes value.
Fix broken byte-lanes vs. address validation.

This patch changes the circumstances under which an error is printed to
the console and fixes the address validation.

The validation code should work correctly now: the broken test for a
valid bytelanes value is replaced with a working test (which eliminates
false negatives) and the 24-bit directory offset bounds check is fixed
(which eliminates false positives).

Please see "Designing Cards and Drivers for the Macintosh Family"
ch. 8, "NuBus Card Firmware" for an explanation of the bytelanes check
and directory offset value.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
To fully test this would require a card with a flawed ROM, which is
difficult to find. The valid case has been tested however.
---
 drivers/nubus/nubus.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index bb628de..bb81347 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -92,9 +92,6 @@ static void nubus_rewind(unsigned char **ptr, int len, int map)
 {
 	unsigned char *p = *ptr;
 
-	/* Sanity check */
-	if (len > 65536)
-		pr_err("rewind of 0x%08x!\n", len);
 	while (len) {
 		do {
 			p--;
@@ -108,8 +105,6 @@ static void nubus_advance(unsigned char **ptr, int len, int map)
 {
 	unsigned char *p = *ptr;
 
-	if (len > 65536)
-		pr_err("advance of 0x%08x!\n", len);
 	while (len) {
 		while (not_useful(p, map))
 			p++;
@@ -121,10 +116,15 @@ static void nubus_advance(unsigned char **ptr, int len, int map)
 
 static void nubus_move(unsigned char **ptr, int len, int map)
 {
+	unsigned long slot_space = (unsigned long)*ptr & 0xFF000000;
+
 	if (len > 0)
 		nubus_advance(ptr, len, map);
 	else if (len < 0)
 		nubus_rewind(ptr, -len, map);
+
+	if (((unsigned long)*ptr & 0xFF000000) != slot_space)
+		pr_err("%s: moved out of slot address space!\n", __func__);
 }
 
 /* Now, functions to read the sResource tree */
@@ -808,8 +808,6 @@ void __init nubus_probe_slot(int slot)
 			continue;
 
 		dp = *rp;
-		if(dp == 0)
-			continue;
 
 		/* The last byte of the format block consists of two
 		   nybbles which are "mirror images" of each other.
@@ -818,7 +816,7 @@ void __init nubus_probe_slot(int slot)
 			continue;
 		/* Check that this value is actually *on* one of the
 		   bytelanes it claims are valid! */
-		if ((dp & 0x0F) >= (1 << i))
+		if (not_useful(rp, dp))
 			continue;
 
 		/* Looks promising.  Let's put it on the list. */
-- 
2.10.2
