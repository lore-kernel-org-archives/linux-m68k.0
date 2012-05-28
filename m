From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 2/2] [m68k] Atari: add NetUSBee support for ISP1160 USB chipset
Date: Mon, 28 May 2012 20:59:23 +1200
Message-ID: <CAOmrzkKHqJa5Fs6SHJ8ELTDtajqjwSs-h-tNtofrMUkXy9_tQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:58533 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab2E1I7X (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 May 2012 04:59:23 -0400
Received: by dady13 with SMTP id y13so3898214dad.19
        for <linux-m68k@vger.kernel.org>; Mon, 28 May 2012 01:59:23 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org

Hi Geert,

part two of the NetUSBee support: add platform support for the
isp116x-hcd driver at the NetUSBee address - will be registered only
if the EtherNAT wasn't found. Not sure how the isp116x-hcd driver
would handle two platform devices registered under it's name.

Still missing: changes to isp116x-hcd.c to make use of it all.

  Michael


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   53 +++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 52bc0ce..7588ea5 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -754,7 +754,6 @@ static struct platform_device isp1160_device = {
 	.dev			= {
 		.platform_data	= &isp1160_platform_data,
 	},
-
 };

 static struct platform_device *atari_ethernat_devices[] __initdata = {
@@ -792,10 +791,54 @@ static struct platform_device rtl8019_device = {
 	.resource	= rtl8019_resources,
 };

+/*
+ * NetUSBee: ISP1160 USB host adapter via ROM-port adapter
+ */
+
+#define ATARI_NETUSBEE_PHYS_ADDR	0xfffa8000
+#define ATARI_NETUSBEE_BASE		0x340
+#define ATARI_NETUSBEE_IRQ		IRQ_MFP_TIMD
+
+static struct resource netusbee_resources[] = {
+	[0] = {
+		.name	= "isp1160-data",
+		.start	= ATARI_NETUSBEE_BASE,
+		.end	= ATARI_NETUSBEE_BASE + 0x1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "isp1160-regs",
+		.start	= ATARI_NETUSBEE_BASE + 0x20,
+		.end	= ATARI_NETUSBEE_BASE + 0x21,
+		.flags	= IORESOURCE_MEM,
+	},
+	[2] = {
+		.name	= "isp1160-irq",
+		.start	= ATARI_NETUSBEE_IRQ,
+		.end	= ATARI_NETUSBEE_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device netusbee_device = {
+	.name		= "isp116x-hcd",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(netusbee_resources),
+	.resource	= netusbee_resources,
+	.dev			= {
+		.platform_data	= &isp1160_platform_data,
+	},
+};
+
 static struct platform_device *atari_ethernec_devices[] __initdata = {
 	&rtl8019_device
 };

+static struct platform_device *atari_netusbee_devices[] __initdata = {
+	&rtl8019_device,
+	&netusbee_device
+};
+
 #if IS_ENABLED(CONFIG_ATARI_ETHERNEC) || IS_ENABLED(CONFIG_ATARI_ETHERNEC_OLD)
 irqreturn_t atari_timerd_interrupt(int irq, void *dev_id)
 {
@@ -806,7 +849,7 @@ irqreturn_t atari_timerd_interrupt(int irq, void *dev_id)
 int __init atari_platform_init(void)
 {
 	unsigned char *enatc_virt, *enec_virt;
-	int rv = -ENODEV, rv2 = -ENODEV, need_timer = 0;
+	int rv = -ENODEV, rv2 = -ENODEV, need_timer = 0, usb_done = 0;
 	
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
@@ -816,6 +859,7 @@ int __init atari_platform_init(void)
 	if (hwreg_present(enatc_virt)) {
 		*enatc_virt |= 0x2;	/* enable SMC91C111 interrupt */
 		rv = platform_add_devices(atari_ethernat_devices,
ARRAY_SIZE(atari_ethernat_devices));
+		usb_done = 1;
 	}
 #endif

@@ -823,7 +867,10 @@ int __init atari_platform_init(void)
 	enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
 	if (hwreg_present(enec_virt)) {
 		need_timer = 1;
-		rv2 = platform_add_devices(atari_ethernec_devices,
ARRAY_SIZE(atari_ethernec_devices));
+		if (usb_done)
+			rv2 = platform_add_devices(atari_ethernec_devices,
ARRAY_SIZE(atari_ethernec_devices));
+		else
+			rv2 = platform_add_devices(atari_netusbee_devices,
ARRAY_SIZE(atari_netusbee_devices));
 	}
 	iounmap(enec_virt);
 #endif
-- 
1.7.0.4
