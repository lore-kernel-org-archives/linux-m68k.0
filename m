From: Michael Schmitz <schmitzmic@gmail.com>
Subject: (unknown)
Date: Sun,  1 Jul 2012 16:21:18 +1200 (NZST)
Message-ID: <20120701042118.314993600FE@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40175 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab2GAEVX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jul 2012 00:21:23 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so6169091pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 30 Jun 2012 21:21:23 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

>From 48d2284d03e6b254207b03765b9f636d8126c857 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Sat, 30 Jun 2012 15:25:59 +1200
Subject: [PATCH 5/6] [m68k] Atari: add platform support for EtherNEC - ne.c driver


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   68 ++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 2939d03..3e32665 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -690,10 +690,48 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
 	&smc91x_device
 };
 
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
+
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
+	int rv = -ENODEV, rv2 = -ENODEV;
 
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
@@ -709,6 +747,32 @@ int __init atari_platform_init(void)
 	iounmap(enatc_virt);
 #endif
 
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
+	enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
+	if (hwreg_present(enec_virt)) {
+		int ret;
+		const char *name = "Timer D dummy interrupt";
+
+		/* timer routine set up in atari_ethernec_probe() */
+		/* set Timer D data Register */
+		st_mfp.tim_dt_d = 123;	/* 200 Hz */
+		/* start timer D, div = 1:100 */
+		st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
+		/* Must make this shared in case other timer ints are needed */
+		ret = request_irq(IRQ_MFP_TIMD, atari_timerd_interrupt,
+				  IRQF_SHARED, name, atari_timerd_interrupt);
+		if (ret)
+			pr_err("atari_platform_init: failed to register timer for EtherNEC!\n");
+
+		rv2 = platform_add_devices(atari_ethernec_devices,
+					   ARRAY_SIZE(atari_ethernec_devices));
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
