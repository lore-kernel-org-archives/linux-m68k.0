From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 08/10] nubus: Fix pointer validation
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <d3d345030d71b34e4e832a17a0302a56ec93eeff.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Fix bounds checking on slot-space pointer movement.
Remove redundant test for zero byte-lanes value.
Fix broken byte-lanes vs. address validation.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 1acf31c..eac5ec2 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -92,9 +92,6 @@ static void nubus_rewind(unsigned char **ptr, int len, int map)
 {
 	unsigned char *p=*ptr;
 
-	/* Sanity check */
-	if(len > 65536)
-		pr_err("rewind of 0x%08x!\n", len);
 	while(len)
 	{
 		do
@@ -110,8 +107,7 @@ static void nubus_rewind(unsigned char **ptr, int len, int map)
 static void nubus_advance(unsigned char **ptr, int len, int map)
 {
 	unsigned char *p = *ptr;
-	if(len>65536)
-		pr_err("advance of 0x%08x!\n", len);
+
 	while(len)
 	{
 		while(not_useful(p,map))
@@ -124,10 +120,15 @@ static void nubus_advance(unsigned char **ptr, int len, int map)
 
 static void nubus_move(unsigned char **ptr, int len, int map)
 {
+	unsigned long slot_space = (unsigned long)*ptr & 0xFF000000;
+
 	if(len > 0)
 		nubus_advance(ptr, len, map);
 	else if(len < 0)
 		nubus_rewind(ptr, -len, map);
+
+	if (((unsigned long)*ptr & 0xFF000000) != slot_space)
+		pr_err("%s: moved out of slot address space!\n", __func__);
 }
 
 /* Now, functions to read the sResource tree */
@@ -822,8 +823,6 @@ void __init nubus_probe_slot(int slot)
 			continue;
 
 		dp = *rp;
-		if(dp == 0)
-			continue;
 
 		/* The last byte of the format block consists of two
 		   nybbles which are "mirror images" of each other.
@@ -832,7 +831,7 @@ void __init nubus_probe_slot(int slot)
 			continue;
 		/* Check that this value is actually *on* one of the
 		   bytelanes it claims are valid! */
-		if ((dp & 0x0F) >= (1<<i))
+		if (not_useful(rp, dp))
 			continue;
 
 		/* Looks promising.  Let's put it on the list. */
-- 
2.10.2
