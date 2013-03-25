From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 04/11] m68k/atari: EtherNAT - platform device and IRQ support code
Date: Mon, 25 Mar 2013 19:37:37 +1300
Message-ID: <1364193464-3890-5-git-send-email-schmitz@debian.org>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:36027 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755426Ab3CYGiL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Mar 2013 02:38:11 -0400
Received: by mail-da0-f46.google.com with SMTP id y19so3069668dan.33
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 23:38:11 -0700 (PDT)
In-Reply-To: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, tg@mirbsd.de, Michael Schmitz <schmitz@debian.org>

Add platform device and interrupt definitions necessary for the EtherNAT
Ethernet/USB adapter for the Falcon extension port. EtherNAT interrupt
numbers are 139/140 so the max. interrupt number for Atari has to be
increased.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c          |   62 +++++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/atarihw.h   |    6 +++
 arch/m68k/include/asm/atariints.h |    2 +-
 arch/m68k/include/asm/irq.h       |    6 +++-
 4 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 037c11c..d35e89d 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -31,6 +31,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/ioport.h>
+#include <linux/platform_device.h>
 #include <linux/vt_kern.h>
 #include <linux/module.h>
 
@@ -655,3 +656,64 @@ static void atari_get_hardware_list(struct seq_file *m)
 	ATARIHW_ANNOUNCE(VME, "VME Bus");
 	ATARIHW_ANNOUNCE(DSP56K, "DSP56001 processor");
 }
+
+/*
+ * MSch: initial platform device support for Atari,
+ * required for EtherNAT/EtherNEC/NetUSBee drivers
+ */
+
+/*
+ * EtherNAT: SMC91C111 Ethernet chipset, handled by smc91x driver
+ */
+
+#define ATARI_ETHERNAT_IRQ		140
+
+static struct resource smc91x_resources[] = {
+	[0] = {
+		.name	= "smc91x-regs",
+		.start	= ATARI_ETHERNAT_PHYS_ADDR,
+		.end	= ATARI_ETHERNAT_PHYS_ADDR + 0xfffff,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "smc91x-irq",
+		.start	= ATARI_ETHERNAT_IRQ,
+		.end	= ATARI_ETHERNAT_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device smc91x_device = {
+	.name		= "smc91x",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(smc91x_resources),
+	.resource	= smc91x_resources,
+};
+
+static struct platform_device *atari_ethernat_devices[] __initdata = {
+	&smc91x_device
+};
+
+int __init atari_platform_init(void)
+{
+	int rv = 0;
+
+	if (!MACH_IS_ATARI)
+		return -ENODEV;
+
+#ifdef CONFIG_ATARI_ETHERNAT
+	{
+		unsigned char *enatc_virt;
+		enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
+		if (hwreg_present(enatc_virt)) {
+			rv = platform_add_devices(atari_ethernat_devices,
+						ARRAY_SIZE(atari_ethernat_devices));
+		}
+		iounmap(enatc_virt);
+	}
+#endif
+
+	return rv;
+}
+
+arch_initcall(atari_platform_init);
diff --git a/arch/m68k/include/asm/atarihw.h b/arch/m68k/include/asm/atarihw.h
index c0cb363..d887050 100644
--- a/arch/m68k/include/asm/atarihw.h
+++ b/arch/m68k/include/asm/atarihw.h
@@ -805,5 +805,11 @@ struct MSTE_RTC {
 
 #define mste_rtc ((*(volatile struct MSTE_RTC *)MSTE_RTC_BAS))
 
+/*
+** EtherNAT add-on card for Falcon - combined ethernet and USB adapter
+*/
+
+#define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
+
 #endif /* linux/atarihw.h */
 
diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 8f71504..953e0ac 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -32,7 +32,7 @@
 #define VME_SOURCE_BASE    56
 #define VME_MAX_SOURCES    16
 
-#define NUM_ATARI_SOURCES   (VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
+#define NUM_ATARI_SOURCES  141
 
 /* convert vector number to int source number */
 #define IRQ_VECTOR_TO_SOURCE(v)	((v) - ((v) < 0x20 ? 0x18 : (0x40-8)))
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index c1155f0..81ca118 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -6,12 +6,16 @@
  * different m68k hosts compiled into the kernel.
  * Currently the Atari has 72 and the Amiga 24, but if both are
  * supported in the kernel it is better to make room for 72.
+ * With EtherNAT add-on card on Atari, the highest interrupt
+ * number is 140 so NR_IRQS needs to be 141.
  */
 #if defined(CONFIG_COLDFIRE)
 #define NR_IRQS 256
 #elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
 #define NR_IRQS 200
-#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
+#elif defined(CONFIG_ATARI)
+#define NR_IRQS 141
+#elif defined(CONFIG_MAC)
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)
 #define NR_IRQS	43
-- 
1.7.0.4
