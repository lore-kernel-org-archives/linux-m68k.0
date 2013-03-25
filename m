From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 04/14] m68k/atari: EtherNAT - change number of Atari interrupt sources
Date: Mon, 25 Mar 2013 14:16:22 +1300
Message-ID: <1364174192-25406-5-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:41995 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756518Ab3CYBQ4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:16:56 -0400
Received: by mail-pb0-f48.google.com with SMTP id wy12so3849760pbc.7
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:16:54 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Increase the number of Atari interrupt sources to include EtherNAT
interrupts (interrupt nunbers 139/140, vectors 0xc3/0xc4).

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c          |   20 +++++++++++++++++---
 arch/m68k/include/asm/atariints.h |    2 +-
 arch/m68k/include/asm/irq.h       |    6 +++++-
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index ee9bb70..6c3e885 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -661,7 +661,7 @@ static void atari_get_hardware_list(struct seq_file *m)
  * MSch: initial platform device support for Atari, required for EtherNAT
  */
 
-#define ATARI_ETHERNAT_IRQ		0xc3
+#define ATARI_ETHERNAT_IRQ		140
 
 static struct resource smc91x_resources[] = {
 	[0] = {
@@ -685,16 +685,30 @@ static struct platform_device smc91x_device = {
 	.resource	= smc91x_resources,
 };
 
-static struct platform_device *atari_platform_devices[] __initdata = {
+static struct platform_device *atari_ethernat_devices[] __initdata = {
 	&smc91x_device
 };
 
 int __init atari_platform_init(void)
 {
+	int rv = 0;
+
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
 
-	return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
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
 }
 
 arch_initcall(atari_platform_init);
diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 5fc13bd..12c759a 100644
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
