From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 7/11] Atari: new EtherNAT driver (smc91x.c)
Date: Thu, 24 May 2012 02:51:03 +0200
Message-ID: <E1SXMGd-0002Xs-JU@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:38478 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750859Ab2EXAvF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 20:51:05 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00N005142I00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:51:04 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From cb27724dc688df289e4a2b0dc3de92f6660ef941 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Wed, 23 May 2012 20:23:30 +1200
Subject: [PATCH 07/11] [m68k] Atari: EtherNAT ethernet support - new driver (smc91x)

---
 arch/m68k/atari/config.c           |    2 +-
 drivers/net/ethernet/smsc/Kconfig  |   15 +++++++++++++++
 drivers/net/ethernet/smsc/Makefile |    1 +
 drivers/net/ethernet/smsc/smc91x.h |    2 ++
 4 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 87c640b..adfc901 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -735,7 +735,7 @@ int __init atari_platform_init(void)
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
 
-#if IS_ENABLED(CONFIG_ATARI_ETHERNAT_OLD)
+#if IS_ENABLED(CONFIG_ATARI_ETHERNAT) || IS_ENABLED(CONFIG_ATARI_ETHERNAT_OLD)
 	enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
 	if (hwreg_present(enatc_virt)) {
 		*enatc_virt |= 0x2;	/* enable SMC91C111 interrupt */
diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index c273eac..debd588 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -19,6 +19,21 @@ config NET_VENDOR_SMSC
 
 if NET_VENDOR_SMSC
 
+config ATARI_ETHERNAT
+	tristate "Atari EtherNAT Ethernet support"
+	select CRC32
+	select NET_CORE
+	select MII
+	depends on ATARI
+	---help---
+	  Say Y to include support for the EtherNAT network adapter for the
+	  CT/60 extension port. The driver works by polling instead of
+	  interrupts, so it is quite slow.
+
+	  This driver is also available as a module ( = code which can be
+	  inserted in and removed from the running kernel whenever you want).
+	  The module will be called smc91x.
+
 config ATARI_ETHERNAT_OLD
 	tristate "Atari EtherNAT Ethernet support - obsolete driver"
 	select CRC32
diff --git a/drivers/net/ethernet/smsc/Makefile b/drivers/net/ethernet/smsc/Makefile
index a1992fa..ac30abb 100644
--- a/drivers/net/ethernet/smsc/Makefile
+++ b/drivers/net/ethernet/smsc/Makefile
@@ -2,6 +2,7 @@
 # Makefile for the SMSC network device drivers.
 #
 
+obj-$(CONFIG_ATARI_ETHERNAT) += smc91x.o
 obj-$(CONFIG_ATARI_ETHERNAT_OLD) += atari_91C111.o
 obj-$(CONFIG_SMC9194) += smc9194.o
 obj-$(CONFIG_SMC91X) += smc91x.o
diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 7a536ff..6100b4f 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -255,6 +255,8 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define RPC_LSA_DEFAULT         RPC_LED_100_10
 #define RPC_LSB_DEFAULT         RPC_LED_TX_RX
 
+#define SMC_IRQ_FLAGS		(IRQF_SHARED)
+
 #elif defined(CONFIG_ARCH_MSM)
 
 #define SMC_CAN_USE_8BIT	0
-- 
1.7.0.4
