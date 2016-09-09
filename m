From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: clean up uClinux boot log output
Date: Fri,  9 Sep 2016 11:10:46 +1000
Message-ID: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153]:16587
        "EHLO icp-osb-irony-out3.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750997AbcIIBKs (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Sep 2016 21:10:48 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

During the arch setup phase of kernel boot we print out in the boot banner
that we are uClinux configured. The printk currently contains a bunch of
useless newlines and carriage returns - producing wastefull empty lines.
Remove these.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/setup_no.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 72d272e..a160695 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -106,7 +106,7 @@ void __init setup_arch(char **cmdline_p)
 	process_uboot_commandline(&command_line[0], sizeof(command_line));
 #endif /* CONFIG_UBOOT */
 
-	printk(KERN_INFO "\x0F\r\n\nuClinux/" CPU_NAME "\n");
+	printk(KERN_INFO "uClinux with CPU " CPU_NAME "\n");
 
 #ifdef CONFIG_UCDIMM
 	printk(KERN_INFO "uCdimm by Lineo, Inc. <www.lineo.com>\n");
-- 
1.9.1
