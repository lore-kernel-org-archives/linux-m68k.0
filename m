From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 15/17] [m68k] Atari: add platform device definitions for ISP1160 USB HCD
Date: Thu, 31 Jan 2013 13:31:35 +1300 (NZDT)
Message-ID: <20130131003135.8B985360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:45829 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756323Ab3AaAbl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:31:41 -0500
Received: by mail-pb0-f53.google.com with SMTP id un1so1272055pbc.26
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:31:41 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 15/17] [m68k] Atari: add platform device definitions for ISP1160 USB HCD
        driver used by EtherNAT and NetUSBee.
        Register definitions thanks to David Galvez <dgalvez75@gmail.com>


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |  143 ++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 138 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 2722c79..dc4b46d 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
+#include <linux/usb/isp116x.h>
 #include <linux/vt_kern.h>
 #include <linux/module.h>
 
@@ -658,12 +659,20 @@ static void atari_get_hardware_list(struct seq_file *m)
 }
 
 /*
- * MSch: initial platform device support for Atari, required for EtherNAT
+ * MSch: platform device support for Atari, required for EtherNAT and EtherNEC
+ */
+
+/*
+ * EtherNAT: Ethernet (SMC 91C111) and USB (Phillips ISP1160) adapter
  */
 
 #define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
 #define ATARI_ETHERNAT_IRQ		140
 
+/*
+ * SMC 91C111 - using the smc91x module
+ */
+
 static struct resource smc91x_resources[] = {
 	[0] = {
 		.name	= "smc91x-regs",
@@ -686,10 +695,76 @@ static struct platform_device smc91x_device = {
 	.resource	= smc91x_resources,
 };
 
+/*
+ * ISP 1160 - using the isp116x-hcd module
+ */
+
+#define ATARI_USB_PHYS_ADDR	0x80000012
+#define ATARI_USB_IRQ		139
+
+static struct resource isp1160_resources[] = {
+	[0] = {
+		.name	= "isp1160-data",
+		.start	= ATARI_USB_PHYS_ADDR,
+		.end	= ATARI_USB_PHYS_ADDR + 0x1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "isp1160-regs",
+		.start	= ATARI_USB_PHYS_ADDR + 0x4,
+		.end	= ATARI_USB_PHYS_ADDR + 0x5,
+		.flags	= IORESOURCE_MEM,
+	},
+	[2] = {
+		.name	= "isp1160-irq",
+		.start	= ATARI_USB_IRQ,
+		.end	= ATARI_USB_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static void isp1160_delay(struct device *dev, int delay)
+{
+	ndelay(delay);
+}
+
+/* (DataBusWidth16|AnalogOCEnable|DREQOutputPolarity|DownstreamPort15KRSel ) */
+static struct isp116x_platform_data isp1160_platform_data = {
+	/* Enable internal resistors on downstream ports */
+	.sel15Kres		= 1,
+	/* On-chip overcurrent protection */
+	.oc_enable		= 1,
+	/* INT output polarity */
+	.int_act_high		= 1,
+	/* INT edge or level triggered */
+	.int_edge_triggered	= 0,
+
+	/* WAKEUP pin connected - NOT SUPPORTED  */
+	/* .remote_wakeup_connected = 0, */
+	/* Wakeup by devices on usb bus enabled */
+	.remote_wakeup_enable	= 0,
+	.delay			= isp1160_delay,
+};
+
+static struct platform_device isp1160_device = {
+	.name		= "isp116x-hcd",
+	.id		= 0,
+	.num_resources	= ARRAY_SIZE(isp1160_resources),
+	.resource	= isp1160_resources,
+	.dev			= {
+		.platform_data	= &isp1160_platform_data,
+	},
+};
+
 static struct platform_device *atari_ethernat_devices[] __initdata = {
-	&smc91x_device
+	&smc91x_device,
+	&isp1160_device
 };
 
+/*
+ * EtherNEC: ISA NE2000 compatible card (i.e. Realtek 8019) via ROM-port adapter
+ */
+
 #define ATARI_ETHERNEC_PHYS_ADDR	0xfffa0000
 #define ATARI_ETHERNEC_BASE		0x300
 #define ATARI_ETHERNEC_IRQ		IRQ_MFP_TIMER1
@@ -716,8 +791,66 @@ static struct platform_device rtl8019_device = {
 	.resource	= rtl8019_resources,
 };
 
-static struct platform_device *atari_ethernec_devices[] __initdata = {
-	&rtl8019_device
+/*
+ * NetUSBee: ISP1160 USB host adapter via ROM-port adapter
+ */
+
+#define ATARI_NETUSBEE_PHYS_ADDR	0xfffa8000
+#define ATARI_NETUSBEE_BASE		0x340
+#define ATARI_NETUSBEE_IRQ		IRQ_MFP_TIMER2
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
+/* (DataBusWidth16|AnalogOCEnable|DREQOutputPolarity|DownstreamPort15KRSel ) */
+static struct isp116x_platform_data netusbee_platform_data = {
+	/* Enable internal resistors on downstream ports */
+	.sel15Kres		= 1,
+	/* On-chip overcurrent protection */
+	.oc_enable		= 1,
+	/* INT output polarity */
+	.int_act_high		= 1,
+	/* INT edge or level triggered */
+	.int_edge_triggered	= 0,
+
+	/* WAKEUP pin connected - NOT SUPPORTED  */
+	/* .remote_wakeup_connected = 0, */
+	/* Wakeup by devices on usb bus enabled */
+	.remote_wakeup_enable	= 0,
+	.delay			= isp1160_delay,
+};
+
+static struct platform_device netusbee_device = {
+	.name		= "isp116x-hcd",
+	.id		= 1,
+	.num_resources	= ARRAY_SIZE(netusbee_resources),
+	.resource	= netusbee_resources,
+	.dev			= {
+		.platform_data	= &netusbee_platform_data,
+	},
+};
+
+static struct platform_device *atari_netusbee_devices[] __initdata = {
+	&rtl8019_device,
+	&netusbee_device
 };
 
 int __init atari_platform_init(void)
@@ -739,7 +872,7 @@ int __init atari_platform_init(void)
 #if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
 	enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
 	if (hwreg_present(enec_virt)) {
-		rv2 = platform_add_devices(atari_ethernec_devices, ARRAY_SIZE(atari_ethernec_devices));
+		rv2 = platform_add_devices(atari_netusbee_devices, ARRAY_SIZE(atari_netusbee_devices));
 	}
 	iounmap(enec_virt);
 #endif
-- 
1.7.0.4
