From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 11/22] m68k/mac: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:09 +0100
Message-ID: <1481123360-10978-12-git-send-email-geert__43895.5321362757$1481123903$gmane$org@linux-m68k.org>
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
 arch/m68k/mac/config.c | 34 ++++++++++++++++------------------
 arch/m68k/mac/misc.c   |  8 ++++----
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index e46895316eb0ef4d..1d7bc6ab3e7fe1b4 100644
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
@@ -880,24 +879,23 @@ static void __init mac_identify(void)
 	 */
 	iop_preinit();
 
-	printk(KERN_INFO "Detected Macintosh model: %d\n", model);
+	pr_info("Detected Macintosh model: %d\n", model);
 
 	/*
 	 * Report booter data:
 	 */
-	printk(KERN_DEBUG " Penguin bootinfo data:\n");
-	printk(KERN_DEBUG " Video: addr 0x%lx "
-		"row 0x%lx depth %lx dimensions %ld x %ld\n",
-		mac_bi_data.videoaddr, mac_bi_data.videorow,
-		mac_bi_data.videodepth, mac_bi_data.dimensions & 0xFFFF,
-		mac_bi_data.dimensions >> 16);
-	printk(KERN_DEBUG " Videological 0x%lx phys. 0x%lx, SCC at 0x%lx\n",
-		mac_bi_data.videological, mac_orig_videoaddr,
-		mac_bi_data.sccbase);
-	printk(KERN_DEBUG " Boottime: 0x%lx GMTBias: 0x%lx\n",
-		mac_bi_data.boottime, mac_bi_data.gmtbias);
-	printk(KERN_DEBUG " Machine ID: %ld CPUid: 0x%lx memory size: 0x%lx\n",
-		mac_bi_data.id, mac_bi_data.cpuid, mac_bi_data.memsize);
+	pr_debug(" Penguin bootinfo data:\n");
+	pr_debug(" Video: addr 0x%lx row 0x%lx depth %lx dimensions %ld x %ld\n",
+		 mac_bi_data.videoaddr, mac_bi_data.videorow,
+		 mac_bi_data.videodepth, mac_bi_data.dimensions & 0xFFFF,
+		 mac_bi_data.dimensions >> 16);
+	pr_debug(" Videological 0x%lx phys. 0x%lx, SCC at 0x%lx\n",
+		 mac_bi_data.videological, mac_orig_videoaddr,
+		 mac_bi_data.sccbase);
+	pr_debug(" Boottime: 0x%lx GMTBias: 0x%lx\n", mac_bi_data.boottime,
+		 mac_bi_data.gmtbias);
+	pr_debug(" Machine ID: %ld CPUid: 0x%lx memory size: 0x%lx\n",
+		 mac_bi_data.id, mac_bi_data.cpuid, mac_bi_data.memsize);
 
 	iop_init();
 	via_init();
@@ -912,7 +910,7 @@ static void __init mac_identify(void)
 
 static void __init mac_report_hardware(void)
 {
-	printk(KERN_INFO "Apple Macintosh %s\n", macintosh_config->name);
+	pr_info("Apple Macintosh %s\n", macintosh_config->name);
 }
 
 static void mac_get_model(char *str)
diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 0fb54a90eac27305..676e0caaeaa670a0 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -520,7 +520,7 @@ void mac_poweroff(void)
 #endif
 	}
 	local_irq_enable();
-	printk("It is now safe to turn off your Macintosh.\n");
+	pr_info("It is now safe to turn off your Macintosh.\n");
 	while(1);
 }
 
@@ -610,7 +610,7 @@ void mac_reset(void)
 
 	/* should never get here */
 	local_irq_enable();
-	printk ("Restart failed.  Please restart manually.\n");
+	pr_err("Restart failed.  Please restart manually.\n");
 	while(1);
 }
 
@@ -718,13 +718,13 @@ int mac_hwclk(int op, struct rtc_time *t)
 			 &t->tm_year, &t->tm_mon, &t->tm_mday,
 			 &t->tm_hour, &t->tm_min, &t->tm_sec);
 #if 0
-		printk("mac_hwclk: read %04d-%02d-%-2d %02d:%02d:%02d\n",
+		pr_info("mac_hwclk: read %04d-%02d-%-2d %02d:%02d:%02d\n",
 			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
 			t->tm_hour, t->tm_min, t->tm_sec);
 #endif
 	} else { /* write */
 #if 0
-		printk("mac_hwclk: tried to write %04d-%02d-%-2d %02d:%02d:%02d\n",
+		pr_info("mac_hwclk: tried to write %04d-%02d-%-2d %02d:%02d:%02d\n",
 			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
 			t->tm_hour, t->tm_min, t->tm_sec);
 #endif
-- 
1.9.1
