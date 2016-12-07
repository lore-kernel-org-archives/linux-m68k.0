From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 05/22] m68k/bvme6000: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:03 +0100
Message-ID: <1481123360-10978-6-git-send-email-geert@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Convert from printk() to pr_*().

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/bvme6000/config.c | 8 ++++----
 arch/m68k/bvme6000/rtc.c    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/bvme6000/config.c b/arch/m68k/bvme6000/config.c
index 611d4d9ea2bd80ac..2cfff47650407479 100644
--- a/arch/m68k/bvme6000/config.c
+++ b/arch/m68k/bvme6000/config.c
@@ -63,8 +63,8 @@ void bvme6000_reset(void)
 {
 	volatile PitRegsPtr pit = (PitRegsPtr)BVME_PIT_BASE;
 
-	printk ("\r\n\nCalled bvme6000_reset\r\n"
-			"\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r");
+	pr_info("\r\n\nCalled bvme6000_reset\r\n"
+		"\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r");
 	/* The string of returns is to delay the reset until the whole
 	 * message is output. */
 	/* Enable the watchdog, via PIT port C bit 4 */
@@ -117,8 +117,8 @@ void __init config_bvme6000(void)
     mach_reset		 = bvme6000_reset;
     mach_get_model       = bvme6000_get_model;
 
-    printk ("Board is %sconfigured as a System Controller\n",
-		*config_reg_ptr & BVME_CONFIG_SW1 ? "" : "not ");
+    pr_info("Board is %sconfigured as a System Controller\n",
+	    *config_reg_ptr & BVME_CONFIG_SW1 ? "" : "not ");
 
     /* Now do the PIT configuration */
 
diff --git a/arch/m68k/bvme6000/rtc.c b/arch/m68k/bvme6000/rtc.c
index f7984f44ff0f8072..43f483f3149ada31 100644
--- a/arch/m68k/bvme6000/rtc.c
+++ b/arch/m68k/bvme6000/rtc.c
@@ -168,7 +168,7 @@ static int __init rtc_DP8570A_init(void)
 	if (!MACH_IS_BVME6000)
 		return -ENODEV;
 
-	printk(KERN_INFO "DP8570A Real Time Clock Driver v%s\n", RTC_VERSION);
+	pr_info("DP8570A Real Time Clock Driver v%s\n", RTC_VERSION);
 	return misc_register(&rtc_dev);
 }
 module_init(rtc_DP8570A_init);
-- 
1.9.1
