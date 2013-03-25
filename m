From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 13/14] m68k/atari: USB - add platform device definitions for ISP1160 HCD
Date: Mon, 25 Mar 2013 14:16:31 +1300
Message-ID: <1364174192-25406-14-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:35155 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756531Ab3CYBRC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:17:02 -0400
Received: by mail-pa0-f44.google.com with SMTP id bi5so750007pad.3
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:17:01 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Add platform devices for use by isp116x-hcd driver for EtherNAT and NetUSBee
USB functions.
Register definitions thanks to David Galvez <dgalvez75@gmail.com>

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |  131 ++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 126 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 19114f5..0137fa5 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
+#include <linux/usb/isp116x.h>
 #include <linux/vt_kern.h>
 #include <linux/module.h>
 
@@ -685,8 +686,70 @@ static struct platform_device smc91x_device = {
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
 
 #define ATARI_ETHERNEC_PHYS_ADDR	0xfffa0000
@@ -715,8 +778,66 @@ static struct platform_device rtl8019_device = {
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
@@ -744,8 +865,8 @@ int __init atari_platform_init(void)
 		unsigned char *enec_virt;
 		enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
 		if (hwreg_present(enec_virt)) {
-			error = platform_add_devices(atari_ethernec_devices,
-						ARRAY_SIZE(atari_ethernec_devices));
+			error = platform_add_devices(atari_netusbee_devices,
+						ARRAY_SIZE(atari_netusbee_devices));
 			if (error && !rv)
 				rv = error;
 		}
-- 
1.7.0.4
