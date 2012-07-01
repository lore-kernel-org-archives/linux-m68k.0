From: Michael Schmitz <schmitzmic@gmail.com>
Subject: (unknown)
Date: Sun,  1 Jul 2012 16:21:01 +1200 (NZST)
Message-ID: <20120701042102.0798E3600FE@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57296 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab2GAEVH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jul 2012 00:21:07 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so6020715dad.19
        for <linux-m68k@vger.kernel.org>; Sat, 30 Jun 2012 21:21:07 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

>From faba34dd8edb81af0b93ca4e9d5fc00f97016281 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Sat, 30 Jun 2012 15:16:40 +1200
Subject: [PATCH 2/6] [m68k] Atari: correct EtherNAT 91C111 interrupt, conditionalize platform device register


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 4fc7396..2939d03 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -662,7 +662,7 @@ static void atari_get_hardware_list(struct seq_file *m)
  */
 
 #define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
-#define ATARI_ETHERNAT_IRQ		0xc3
+#define ATARI_ETHERNAT_IRQ		140
 
 static struct resource smc91x_resources[] = {
 	[0] = {
@@ -686,16 +686,30 @@ static struct platform_device smc91x_device = {
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
+	enatc_virt = (unsigned char *)ioremap(
+                                        (ATARI_ETHERNAT_PHYS_ADDR + 0x23), 2);
+	if (hwreg_present(enatc_virt)) {
+		*enatc_virt |= 0x2;	/* enable SMC91C111 interrupt */
+		rv = platform_add_devices(atari_ethernat_devices,
+					  ARRAY_SIZE(atari_ethernat_devices));
+	}
+	iounmap(enatc_virt);
+#endif
+
+	return rv;
 }
 
 arch_initcall(atari_platform_init);
-- 
1.7.0.4
