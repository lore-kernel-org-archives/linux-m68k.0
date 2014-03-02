From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: head.S - Remove bogus L prefix in comment
Date: Sun,  2 Mar 2014 11:05:19 +0100
Message-ID: <1393754720-28267-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/head.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 4c99bab7e664..b83e09a8c956 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -3331,7 +3331,7 @@ func_start	console_init,%a0-%a4/%d0-%d7
 	 *	Some of the register usage that follows
 	 *		a0 = pointer to boot_info
 	 *		a1 = pointer to screen
-	 *		a2 = pointer to Lconsole_globals
+	 *		a2 = pointer to console_globals
 	 *		d3 = pixel width of screen
 	 *		d4 = pixel height of screen
 	 *		(d3,d4) ~= (x,y) of a point just below
-- 
1.7.9.5
