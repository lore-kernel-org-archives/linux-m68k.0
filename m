From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] m68k: count can reach 51, not 50
Date: Tue, 10 Feb 2009 23:52:47 +0100
Message-ID: <4992053F.9080900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Andrew Morton <akpm@linux-foundation.org>

with while (count++ < 50) { ... } count can reach 51, not 50,
so we shouldn't give an error message on a count of 50.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/macintosh/via-maciisi.c b/drivers/macintosh/via-maciisi.c
index 4d686c0..e964357 100644
--- a/drivers/macintosh/via-maciisi.c
+++ b/drivers/macintosh/via-maciisi.c
@@ -288,7 +288,7 @@ static void maciisi_sync(struct adb_request *req)
 	}
 	/* This could be BAD... when the ADB controller doesn't respond
 	 * for this long, it's probably not coming back :-( */
-	if(count >= 50) /* Hopefully shouldn't happen */
+	if(count > 50) /* Hopefully shouldn't happen */
 		printk(KERN_ERR "maciisi_send_request: poll timed out!\n");
 }
 
