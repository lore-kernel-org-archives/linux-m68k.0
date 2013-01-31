From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 06/17] [m68k] Atari: add platform support for EtherNEC (conditionalized)
Date: Thu, 31 Jan 2013 13:19:44 +1300 (NZDT)
Message-ID: <20130131001944.C85C0360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:44447 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab3AaATu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:19:50 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so1009579dak.33
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:19:50 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 06/17] [m68k] Atari: add platform support for EtherNEC (conditionalized)


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   45 +++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index e7aa0f7..c384454 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -690,10 +690,40 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
 	&smc91x_device
 };
 
+#define ATARI_ETHERNEC_PHYS_ADDR	0xfffa0000
+#define ATARI_ETHERNEC_BASE		0x300
+#define ATARI_ETHERNEC_IRQ		IRQ_MFP_TIMD
+
+static struct resource rtl8019_resources[] = {
+	[0] = {
+		.name	= "rtl9019-regs",
+		.start	= ATARI_ETHERNEC_BASE,
+		.end	= ATARI_ETHERNEC_BASE + 0x20 - 1,
+		.flags	= IORESOURCE_IO,
+	},
+	[1] = {
+		.name	= "rtl9019-irq",
+		.start	= ATARI_ETHERNEC_IRQ,
+		.end	= ATARI_ETHERNEC_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device rtl8019_device = {
+	.name		= "ne",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(rtl8019_resources),
+	.resource	= rtl8019_resources,
+};
+
+static struct platform_device *atari_ethernec_devices[] __initdata = {
+	&rtl8019_device
+};
+
 int __init atari_platform_init(void)
 {
-	unsigned char *enatc_virt;
-	int rv = -ENODEV;
+	unsigned char *enatc_virt, *enec_virt;
+	int rv = -ENODEV, rv2 = -ENODEV;
 	
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
@@ -706,6 +736,17 @@ int __init atari_platform_init(void)
 	iounmap(enatc_virt);
 #endif
 
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
+	enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
+	if (hwreg_present(enec_virt)) {
+		rv2 = platform_add_devices(atari_ethernec_devices, ARRAY_SIZE(atari_ethernec_devices));
+	}
+	iounmap(enec_virt);
+#endif
+
+	if (rv2)
+		return rv2;
+
 	return rv;
 }
 
-- 
1.7.0.4
