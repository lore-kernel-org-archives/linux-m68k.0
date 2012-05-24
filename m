From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 8/11] Atari: add ISP16x host controller support
Date: Thu, 24 May 2012 02:52:04 +0200
Message-ID: <E1SXMHc-0002Xx-7A@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:35592 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751000Ab2EXAwG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 20:52:06 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00D0052T6H00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:52:05 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From 3007bf0e7a00300b8b65d63957da4377e4318720 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Wed, 23 May 2012 20:26:46 +1200
Subject: [PATCH 08/11] [m68k] Atari: Add ISP1160 USB host controller support (EtherNAT)
        Kudos to David Galvez for pointing out the correct addresses!

---
 arch/m68k/Kconfig.bus    |   11 ++++++
 arch/m68k/atari/config.c |   80 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index 983e176..ed5a08c 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -55,6 +55,17 @@ config ATARI_ROM_ISA
 	  The only driver currently using this adapter is the EtherNEC
 	  driver for RTL8019AS based NE2000 compatible network cards.
 
+config ATARI_USB
+	bool "Atari USB host controller support"
+	depends on ATARI
+	select USB_SUPPORT
+	select USB_ARCH_HAS_HCD
+	help
+	  This option enables support for USB host controllers contained on 
+	  the EtherNAT and NetUSBee cards for Atari. You will have to select
+	  an appropriate HCD driver in the USB section (the ISP1160 one is 
+	  the most commonly used one).
+
 config GENERIC_ISA_DMA
 	def_bool ISA
 
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index adfc901..52bc0ce 100644
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
@@ -686,10 +695,77 @@ static struct platform_device smc91x_device = {
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
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(isp1160_resources),
+	.resource	= isp1160_resources,
+	.dev			= {
+		.platform_data	= &isp1160_platform_data,
+	},
+
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
 #define ATARI_ETHERNEC_IRQ		IRQ_MFP_TIMD
-- 
1.7.0.4
