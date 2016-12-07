From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 13/22] m68k/mvme16x: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:11 +0100
Message-ID: <1481123360-10978-14-git-send-email-geert__5599.94392465359$1481123857$gmane$org@linux-m68k.org>
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
 arch/m68k/mvme16x/config.c | 32 ++++++++++++++++----------------
 arch/m68k/mvme16x/rtc.c    |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index 58e240939d265f69..6fa06d4d16bf08d4 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -72,8 +72,8 @@ int __init mvme16x_parse_bootinfo(const struct bi_record *bi)
 
 void mvme16x_reset(void)
 {
-	printk ("\r\n\nCalled mvme16x_reset\r\n"
-			"\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r");
+	pr_info("\r\n\nCalled mvme16x_reset\r\n"
+		"\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r");
 	/* The string of returns is to delay the reset until the whole
 	 * message is output.  Assert reset bit in GCSR */
 	*(volatile char *)0xfff40107 = 0x80;
@@ -289,7 +289,7 @@ void __init config_mvme16x(void)
 
     if (strncmp("BDID", p->bdid, 4))
     {
-	printk ("\n\nBug call .BRD_ID returned garbage - giving up\n\n");
+	pr_crit("Bug call .BRD_ID returned garbage - giving up\n");
 	while (1)
 		;
     }
@@ -298,25 +298,25 @@ void __init config_mvme16x(void)
 	vme_brdtype = brdno;
 
     mvme16x_get_model(id);
-    printk ("\nBRD_ID: %s   BUG %x.%x %02x/%02x/%02x\n", id, p->rev>>4,
-					p->rev&0xf, p->yr, p->mth, p->day);
+    pr_info("BRD_ID: %s   BUG %x.%x %02x/%02x/%02x\n", id, p->rev >> 4,
+	    p->rev & 0xf, p->yr, p->mth, p->day);
     if (brdno == 0x0162 || brdno == 0x172)
     {
 	unsigned char rev = *(unsigned char *)MVME162_VERSION_REG;
 
 	mvme16x_config = rev | MVME16x_CONFIG_GOT_SCCA;
 
-	printk ("MVME%x Hardware status:\n", brdno);
-	printk ("    CPU Type           68%s040\n",
-			rev & MVME16x_CONFIG_GOT_FPU ? "" : "LC");
-	printk ("    CPU clock          %dMHz\n",
-			rev & MVME16x_CONFIG_SPEED_32 ? 32 : 25);
-	printk ("    VMEchip2           %spresent\n",
-			rev & MVME16x_CONFIG_NO_VMECHIP2 ? "NOT " : "");
-	printk ("    SCSI interface     %spresent\n",
-			rev & MVME16x_CONFIG_NO_SCSICHIP ? "NOT " : "");
-	printk ("    Ethernet interface %spresent\n",
-			rev & MVME16x_CONFIG_NO_ETHERNET ? "NOT " : "");
+	pr_info("MVME%x Hardware status:\n", brdno);
+	pr_info("    CPU Type           68%s040\n",
+		rev & MVME16x_CONFIG_GOT_FPU ? "" : "LC");
+	pr_info("    CPU clock          %dMHz\n",
+		rev & MVME16x_CONFIG_SPEED_32 ? 32 : 25);
+	pr_info("    VMEchip2           %spresent\n",
+		rev & MVME16x_CONFIG_NO_VMECHIP2 ? "NOT " : "");
+	pr_info("    SCSI interface     %spresent\n",
+		rev & MVME16x_CONFIG_NO_SCSICHIP ? "NOT " : "");
+	pr_info("    Ethernet interface %spresent\n",
+		rev & MVME16x_CONFIG_NO_ETHERNET ? "NOT " : "");
     }
     else
     {
diff --git a/arch/m68k/mvme16x/rtc.c b/arch/m68k/mvme16x/rtc.c
index 1cdc732681885e9a..e37ecb7e69284a83 100644
--- a/arch/m68k/mvme16x/rtc.c
+++ b/arch/m68k/mvme16x/rtc.c
@@ -158,7 +158,7 @@ static int __init rtc_MK48T08_init(void)
 	if (!MACH_IS_MVME16x)
 		return -ENODEV;
 
-	printk(KERN_INFO "MK48T08 Real Time Clock Driver v%s\n", RTC_VERSION);
+	pr_info("MK48T08 Real Time Clock Driver v%s\n", RTC_VERSION);
 	return misc_register(&rtc_dev);
 }
 device_initcall(rtc_MK48T08_init);
-- 
1.9.1
