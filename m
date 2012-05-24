From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 3/11] Atari: obsolete old EtherNAT driver
Date: Thu, 24 May 2012 02:47:14 +0200
Message-ID: <E1SXMCw-0002XZ-2q@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:46725 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755052Ab2EXBrR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:47:17 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00M004UQXC00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:47:14 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From b0eccc1abb2909824d7206ce0bea296b98548271 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Mon, 30 Apr 2012 19:40:47 +1200
Subject: [PATCH 03/11] [m68k] Atari: declare original EtherNAT driver obsolete; fix smc91x.h defines

---
 drivers/net/ethernet/smsc/Kconfig  |    4 ++--
 drivers/net/ethernet/smsc/Makefile |    2 +-
 drivers/net/ethernet/smsc/smc91x.h |    6 ++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index 01893aa..c273eac 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -19,8 +19,8 @@ config NET_VENDOR_SMSC
 
 if NET_VENDOR_SMSC
 
-config ATARI_ETHERNAT
-	tristate "Atari EtherNAT Ethernet support"
+config ATARI_ETHERNAT_OLD
+	tristate "Atari EtherNAT Ethernet support - obsolete driver"
 	select CRC32
 	select MII
 	depends on ATARI
diff --git a/drivers/net/ethernet/smsc/Makefile b/drivers/net/ethernet/smsc/Makefile
index ef228db..a1992fa 100644
--- a/drivers/net/ethernet/smsc/Makefile
+++ b/drivers/net/ethernet/smsc/Makefile
@@ -2,7 +2,7 @@
 # Makefile for the SMSC network device drivers.
 #
 
-obj-$(CONFIG_ATARI_ETHERNAT) += atari_91C111.o
+obj-$(CONFIG_ATARI_ETHERNAT_OLD) += atari_91C111.o
 obj-$(CONFIG_SMC9194) += smc9194.o
 obj-$(CONFIG_SMC91X) += smc91x.o
 obj-$(CONFIG_PCMCIA_SMC91C92) += smc91c92_cs.o
diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 799d494..7a536ff 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -231,7 +231,7 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 
 #include <unit/smc91111.h>
 
-#elif defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_MODULE)
+#elif defined(CONFIG_ATARI)
 
 #define SMC_CAN_USE_8BIT        1
 #define SMC_CAN_USE_16BIT       1
@@ -255,8 +255,6 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define RPC_LSA_DEFAULT         RPC_LED_100_10
 #define RPC_LSB_DEFAULT         RPC_LED_TX_RX
 
-#define SMC_DYNAMIC_BUS_CONFIG
-
 #elif defined(CONFIG_ARCH_MSM)
 
 #define SMC_CAN_USE_8BIT	0
@@ -1142,7 +1140,7 @@ static const char * chip_ids[ 16 ] =  {
 		}							\
 	} while (0)
 
-#if defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_MODULE)
+#if defined(CONFIG_ATARI)
 /*
  * MSch: EtherNAT is 32 bit, so the misaligned data buffer hack applies.
  * This appears to hurt quite a lot ... we actually need to byte swap the
-- 
1.7.0.4
