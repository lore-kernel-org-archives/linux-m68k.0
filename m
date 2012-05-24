From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 5/11] Atari: conditonal platform device support for EtherNEC
Date: Thu, 24 May 2012 02:49:39 +0200
Message-ID: <E1SXMFH-0002Xj-Hf@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:55100 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751409Ab2EXBto (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:49:44 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I000004YS6G00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:49:40 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From 6096935dbf755b6f958694f8659d6a021fe968f5 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Mon, 30 Apr 2012 20:10:22 +1200
Subject: [PATCH 05/11] [m68k] Atari: add platform support for EtherNEC (conditionalized)

---
 arch/m68k/atari/config.c |   69 ++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 9a83537..87c640b 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -690,10 +690,47 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
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
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC) || IS_ENABLED(CONFIG_ATARI_ETHERNEC_OLD) 
+irqreturn_t atari_timerd_interrupt(int irq, void *dev_id)
+{
+	return IRQ_HANDLED;
+}
+#endif
+
 int __init atari_platform_init(void)
 {
-	unsigned char *enatc_virt;
-	int rv = -ENODEV;
+	unsigned char *enatc_virt, *enec_virt;
+	int rv = -ENODEV, rv2 = -ENODEV, need_timer = 0;
 	
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
@@ -706,6 +743,34 @@ int __init atari_platform_init(void)
 	}
 #endif
 
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC) || IS_ENABLED(CONFIG_ATARI_ETHERNEC_OLD)
+	enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
+	if (hwreg_present(enec_virt)) {
+		need_timer = 1;
+		rv2 = platform_add_devices(atari_ethernec_devices, ARRAY_SIZE(atari_ethernec_devices));
+	}
+	iounmap(enec_virt);
+#endif
+
+	if (need_timer) {
+		int ret;
+		const char *name = "Timer D dummy interrupt";
+
+		/* timer routine set up in atari_ethernec_probe() */
+		/* set Timer D data Register */
+		st_mfp.tim_dt_d = 123;	/* 200 Hz */
+		/* start timer D, div = 1:100 */
+		st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
+		/* Must make this shared in case other timer ints are needed */
+		ret = request_irq(IRQ_MFP_TIMD, atari_timerd_interrupt, IRQF_SHARED, name, atari_timerd_interrupt);
+		if (ret) {
+			printk(KERN_ERR "atari_platform_init: failed to register dummy timer interrupt for EtherNEC/EtherNAT!\n");
+		}
+	}
+
+	if (rv2) 
+		return rv2;
+
 	return rv;
 }
 
-- 
1.7.0.4
