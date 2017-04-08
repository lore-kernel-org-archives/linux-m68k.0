From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 02/10] m68k/mac: Modernize printing of kernel messages
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <076318a0ecd0393f5783a659db4132451c415057.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

Convert from printk() to pr_*().

[Adjusted log message severity levels and retained bootinfo log. -- FT]

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/config.c | 12 +++++-------
 arch/m68k/mac/misc.c   | 23 +++++++++--------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 9dc65a4..661892d 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -150,7 +150,7 @@ static void mac_cache_card_flush(int writeback)
 void __init config_mac(void)
 {
 	if (!MACH_IS_MAC)
-		printk(KERN_ERR "ERROR: no Mac, but config_mac() called!!\n");
+		pr_err("ERROR: no Mac, but config_mac() called!!\n");
 
 	mach_sched_init = mac_sched_init;
 	mach_init_IRQ = mac_init_IRQ;
@@ -837,8 +837,7 @@ static void __init mac_identify(void)
 		/* no bootinfo model id -> NetBSD booter was used! */
 		/* XXX FIXME: breaks for model > 31 */
 		model = (mac_bi_data.cpuid >> 2) & 63;
-		printk(KERN_WARNING "No bootinfo model ID, using cpuid instead "
-		       "(obsolete bootloader?)\n");
+		pr_warn("No bootinfo model ID, using cpuid instead (obsolete bootloader?)\n");
 	}
 
 	macintosh_config = mac_data_table;
@@ -880,14 +879,13 @@ static void __init mac_identify(void)
 	 */
 	iop_preinit();
 
-	printk(KERN_INFO "Detected Macintosh model: %d\n", model);
+	pr_info("Detected Macintosh model: %d\n", model);
 
 	/*
 	 * Report booter data:
 	 */
 	printk(KERN_DEBUG " Penguin bootinfo data:\n");
-	printk(KERN_DEBUG " Video: addr 0x%lx "
-		"row 0x%lx depth %lx dimensions %ld x %ld\n",
+	printk(KERN_DEBUG " Video: addr 0x%lx row 0x%lx depth %lx dimensions %ld x %ld\n",
 		mac_bi_data.videoaddr, mac_bi_data.videorow,
 		mac_bi_data.videodepth, mac_bi_data.dimensions & 0xFFFF,
 		mac_bi_data.dimensions >> 16);
@@ -912,7 +910,7 @@ static void __init mac_identify(void)
 
 static void __init mac_report_hardware(void)
 {
-	printk(KERN_INFO "Apple Macintosh %s\n", macintosh_config->name);
+	pr_info("Apple Macintosh %s\n", macintosh_config->name);
 }
 
 static void mac_get_model(char *str)
diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 5b01704..8aa8792 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -281,8 +281,7 @@ static long via_read_time(void)
 		last_result.idata = result.idata;
 	}
 
-	pr_err("via_read_time: failed to read a stable value; "
-	       "got 0x%08lx then 0x%08lx\n",
+	pr_err("via_read_time: failed to read a stable value; got 0x%08lx then 0x%08lx\n",
 	       last_result.idata, result.idata);
 
 	return 0;
@@ -465,7 +464,7 @@ void mac_poweroff(void)
 #endif
 	}
 	local_irq_enable();
-	printk("It is now safe to turn off your Macintosh.\n");
+	pr_crit("It is now safe to turn off your Macintosh.\n");
 	while(1);
 }
 
@@ -556,7 +555,7 @@ void mac_reset(void)
 
 	/* should never get here */
 	local_irq_enable();
-	printk ("Restart failed.  Please restart manually.\n");
+	pr_crit("Restart failed. Please restart manually.\n");
 	while(1);
 }
 
@@ -661,17 +660,13 @@ int mac_hwclk(int op, struct rtc_time *t)
 		unmktime(now, 0,
 			 &t->tm_year, &t->tm_mon, &t->tm_mday,
 			 &t->tm_hour, &t->tm_min, &t->tm_sec);
-#if 0
-		printk("mac_hwclk: read %04d-%02d-%-2d %02d:%02d:%02d\n",
-			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
-			t->tm_hour, t->tm_min, t->tm_sec);
-#endif
+		pr_debug("%s: read %04d-%02d-%-2d %02d:%02d:%02d\n",
+		         __func__, t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+		         t->tm_hour, t->tm_min, t->tm_sec);
 	} else { /* write */
-#if 0
-		printk("mac_hwclk: tried to write %04d-%02d-%-2d %02d:%02d:%02d\n",
-			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
-			t->tm_hour, t->tm_min, t->tm_sec);
-#endif
+		pr_debug("%s: tried to write %04d-%02d-%-2d %02d:%02d:%02d\n",
+		         __func__, t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+		         t->tm_hour, t->tm_min, t->tm_sec);
 
 		now = mktime(t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
 			     t->tm_hour, t->tm_min, t->tm_sec);
-- 
2.10.2
