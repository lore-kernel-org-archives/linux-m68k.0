From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 05/17] [m68k] Atari: fix EtherNAT interrupt number; conditionalize EtherNAT platform device register
Date: Thu, 31 Jan 2013 13:18:47 +1300 (NZDT)
Message-ID: <20130131001847.C4D70360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f44.google.com ([209.85.210.44]:62303 "EHLO
	mail-da0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751760Ab3AaASx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:18:53 -0500
Received: by mail-da0-f44.google.com with SMTP id z20so1009920dae.3
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:18:53 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 05/17] [m68k] Atari: fix EtherNAT interrupt number; conditionalize EtherNAT platform device register


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 4fc7396..e7aa0f7 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -662,7 +662,7 @@ static void atari_get_hardware_list(struct seq_file *m)
  */
 
 #define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
-#define ATARI_ETHERNAT_IRQ		0xc3
+#define ATARI_ETHERNAT_IRQ		140
 
 static struct resource smc91x_resources[] = {
 	[0] = {
@@ -686,16 +686,27 @@ static struct platform_device smc91x_device = {
 	.resource	= smc91x_resources,
 };
 
-static struct platform_device *atari_platform_devices[] __initdata = {
+static struct platform_device *atari_ethernat_devices[] __initdata = {
 	&smc91x_device
 };
 
 int __init atari_platform_init(void)
 {
+	unsigned char *enatc_virt;
+	int rv = -ENODEV;
+	
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
 
-	return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
+#if IS_ENABLED(CONFIG_ATARI_ETHERNAT)
+	enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
+	if (hwreg_present(enatc_virt)) {
+		rv = platform_add_devices(atari_ethernat_devices, ARRAY_SIZE(atari_ethernat_devices));
+	}
+	iounmap(enatc_virt);
+#endif
+
+	return rv;
 }
 
 arch_initcall(atari_platform_init);
-- 
1.7.0.4
