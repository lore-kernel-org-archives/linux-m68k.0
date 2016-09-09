From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: convert printk(KERN_INFO) to pr_info()
Date: Fri,  9 Sep 2016 17:17:47 +1000
Message-ID: <1473405467-14805-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:18512
        "EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751786AbcIIHR5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 03:17:57 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The old style use of printk(KERN_INFO) is depracated. Convert use of it
in setup_no.c to the modern pr_info().

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/setup_no.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 0329e7d..8afe6f6 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -104,36 +104,36 @@ void __init setup_arch(char **cmdline_p)
 
 	process_uboot_commandline(&command_line[0], sizeof(command_line));
 
-	printk(KERN_INFO "uClinux with CPU " CPU_NAME "\n");
+	pr_info("uClinux with CPU " CPU_NAME "\n");
 
 #ifdef CONFIG_UCDIMM
-	printk(KERN_INFO "uCdimm by Lineo, Inc. <www.lineo.com>\n");
+	pr_info("uCdimm by Lineo, Inc. <www.lineo.com>\n");
 #endif
 #ifdef CONFIG_M68VZ328
-	printk(KERN_INFO "M68VZ328 support by Evan Stawnyczy <e@lineo.ca>\n");
+	pr_info("M68VZ328 support by Evan Stawnyczy <e@lineo.ca>\n");
 #endif
 #ifdef CONFIG_COLDFIRE
-	printk(KERN_INFO "COLDFIRE port done by Greg Ungerer, gerg@snapgear.com\n");
+	pr_info("COLDFIRE port done by Greg Ungerer, gerg@snapgear.com\n");
 #ifdef CONFIG_M5307
-	printk(KERN_INFO "Modified for M5307 by Dave Miller, dmiller@intellistor.com\n");
+	pr_info("Modified for M5307 by Dave Miller, dmiller@intellistor.com\n");
 #endif
 #ifdef CONFIG_ELITE
-	printk(KERN_INFO "Modified for M5206eLITE by Rob Scott, rscott@mtrob.fdns.net\n");
+	pr_info("Modified for M5206eLITE by Rob Scott, rscott@mtrob.fdns.net\n");
 #endif
 #endif
-	printk(KERN_INFO "Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne\n");
+	pr_info("Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne\n");
 
 #if defined( CONFIG_PILOT ) && defined( CONFIG_M68328 )
-	printk(KERN_INFO "TRG SuperPilot FLASH card support <info@trgnet.com>\n");
+	pr_info("TRG SuperPilot FLASH card support <info@trgnet.com>\n");
 #endif
 #if defined( CONFIG_PILOT ) && defined( CONFIG_M68EZ328 )
-	printk(KERN_INFO "PalmV support by Lineo Inc. <jeff@uclinux.com>\n");
+	pr_info("PalmV support by Lineo Inc. <jeff@uclinux.com>\n");
 #endif
 #ifdef CONFIG_DRAGEN2
-	printk(KERN_INFO "DragonEngine II board support by Georges Menie\n");
+	pr_info("DragonEngine II board support by Georges Menie\n");
 #endif
 #ifdef CONFIG_M5235EVB
-	printk(KERN_INFO "Motorola M5235EVB support (C)2005 Syn-tech Systems, Inc. (Jate Sujjavanich)\n");
+	pr_info("Motorola M5235EVB support (C)2005 Syn-tech Systems, Inc. (Jate Sujjavanich)\n");
 #endif
 
 	pr_debug("KERNEL -> TEXT=0x%p-0x%p DATA=0x%p-0x%p BSS=0x%p-0x%p\n",
-- 
1.9.1
