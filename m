From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 06/12] m68k/atari: EtherNEC - add platform device support
Date: Sat,  6 Apr 2013 13:26:40 +1300
Message-ID: <1365208006-16227-7-git-send-email-schmitz@debian.org>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:62717 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163102Ab3DFA1T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Apr 2013 20:27:19 -0400
Received: by mail-pd0-f180.google.com with SMTP id q11so2254080pdj.25
        for <linux-m68k@vger.kernel.org>; Fri, 05 Apr 2013 17:27:19 -0700 (PDT)
In-Reply-To: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

Add platform device for the Atari ROM port ethernet adapter, EtherNEC.
This platform device will be used by the ne.c driver.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   50 ++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index d35e89d..fdcd875 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -694,6 +694,41 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
 	&smc91x_device
 };
 
+/*
+ * EtherNEC: RTL8019 (NE2000 compatible) Ethernet chipset,
+ * handled by ne.c driver
+ */
+
+#define ATARI_ETHERNEC_PHYS_ADDR	0xfffa0000
+#define ATARI_ETHERNEC_BASE		0x300
+#define ATARI_ETHERNEC_IRQ		IRQ_MFP_TIMER1
+
+static struct resource rtl8019_resources[] = {
+	[0] = {
+		.name	= "rtl8019-regs",
+		.start	= ATARI_ETHERNEC_BASE,
+		.end	= ATARI_ETHERNEC_BASE + 0x20 - 1,
+		.flags	= IORESOURCE_IO,
+	},
+	[1] = {
+		.name	= "rtl8019-irq",
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
 	int rv = 0;
@@ -713,6 +748,21 @@ int __init atari_platform_init(void)
 	}
 #endif
 
+#ifdef CONFIG_ATARI_ETHERNEC
+	{
+		int error;
+		unsigned char *enec_virt;
+		enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
+		if (hwreg_present(enec_virt)) {
+			error = platform_add_devices(atari_ethernec_devices,
+						ARRAY_SIZE(atari_ethernec_devices));
+			if (error && !rv)
+				rv = error;
+		}
+		iounmap(enec_virt);
+	}
+#endif
+
 	return rv;
 }
 
-- 
1.7.0.4
