From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 07/12] m68k/atari: EtherNAT - ethernet support - new driver (smc91x)
Date: Sat, 30 Mar 2013 13:27:47 +1300
Message-ID: <1364603272-8148-8-git-send-email-schmitz@debian.org>
References: <1364603272-8148-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:41207 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757302Ab3C3A3a (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 20:29:30 -0400
Received: by mail-pa0-f52.google.com with SMTP id fb10so541782pad.25
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 17:29:30 -0700 (PDT)
In-Reply-To: <1364603272-8148-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

Add Atari specific code to the smc91x Ethernet driver. This code is used
on the EtherNAT adapter card for the Atari Falcon extension port.

Without the patch to smc91x.h, the first two bytes of every ethernet packet
sent out are swapped, resulting in a wrong MAC address being read by the
packet's target, and failure to establish communication.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.devices          |   10 ++++++
 drivers/net/ethernet/smsc/Kconfig  |    4 +-
 drivers/net/ethernet/smsc/smc91x.h |   63 ++++++++++++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index 4bc945d..d50ecbf 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -55,6 +55,16 @@ config NFETH
 	  which will emulate a regular ethernet device while presenting an
 	  ethertap device to the host system.
 
+config ATARI_ETHERNAT
+	bool "Atari EtherNAT Ethernet support"
+	depends on ATARI
+	---help---
+	  Say Y to include support for the EtherNAT network adapter for the
+	  CT/60 extension port.
+
+	  To compile the actual ethernet driver, choose Y or M for the SMC91X
+	  option in the network device section; the module will be called smc91x.
+
 endmenu
 
 menu "Character devices"
diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index 5a689af..d3485cf 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -6,7 +6,7 @@ config NET_VENDOR_SMSC
 	bool "SMC (SMSC)/Western Digital devices"
 	default y
 	depends on ARM || ISA || MAC || ARM || MIPS || M32R || SUPERH || \
-		BLACKFIN || MN10300 || COLDFIRE || PCI || PCMCIA
+		BLACKFIN || MN10300 || COLDFIRE || PCI || PCMCIA || ATARI
 	---help---
 	  If you have a network (Ethernet) card belonging to this class, say Y
 	  and read the Ethernet-HOWTO, available from
@@ -40,7 +40,7 @@ config SMC91X
 	select NET_CORE
 	select MII
 	depends on (ARM || M32R || SUPERH || MIPS || BLACKFIN || \
-		    MN10300 || COLDFIRE)
+		    MN10300 || COLDFIRE || ATARI_ETHERNAT)
 	---help---
 	  This is a driver for SMC's 91x series of Ethernet chipsets,
 	  including the SMC91C94 and the SMC91C111. Say Y if you want it
diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 370e13d..528f7ba 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -231,6 +231,30 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 
 #include <unit/smc91111.h>
 
+#elif defined(CONFIG_ATARI)
+
+#define SMC_CAN_USE_8BIT        1
+#define SMC_CAN_USE_16BIT       1
+#define SMC_CAN_USE_32BIT       1
+#define SMC_NOWAIT              1
+
+#define writew_be(val, addr) out_be16((addr), (val))
+
+#define SMC_inb(a, r)           readb((a) + (r))
+#define SMC_inw(a, r)           readw((a) + (r))
+#define SMC_inl(a, r)           readl((a) + (r))
+#define SMC_outb(v, a, r)       writeb(v, (a) + (r))
+#define SMC_outw(v, a, r)       writew(v, (a) + (r))
+#define SMC_outw_be(v, a, r)    writew_be(v, (a) + (r))
+#define SMC_outl(v, a, r)       writel(v, (a) + (r))
+#define SMC_insw(a, r, p, l)    readsw((a) + (r), p, l)
+#define SMC_outsw(a, r, p, l)   writesw((a) + (r), p, l)
+#define SMC_insl(a, r, p, l)    readsl((a) + (r), p, l)
+#define SMC_outsl(a, r, p, l)   writesl((a) + (r), p, l)
+
+#define RPC_LSA_DEFAULT         RPC_LED_100_10
+#define RPC_LSB_DEFAULT         RPC_LED_TX_RX
+
 #elif defined(CONFIG_ARCH_MSM)
 
 #define SMC_CAN_USE_8BIT	0
@@ -1116,6 +1140,40 @@ static const char * chip_ids[ 16 ] =  {
 		}							\
 	} while (0)
 
+#if defined(CONFIG_ATARI)
+/*
+ * MSch: EtherNAT is 32 bit, so the misaligned data buffer hack applies.
+ * This appears to hurt quite a lot ... we actually need to byte swap the
+ * misaligned write because the data end up in the packet buffer swapped
+ * otherwise (resulting in the first two bytes of the target MAC address
+ * being swapped)
+ */
+#define SMC_PUSH_DATA(lp, p, l)					\
+	do {								\
+		if (SMC_32BIT(lp)) {				\
+			void *__ptr = (p);				\
+			int __len = (l);				\
+			void __iomem *__ioaddr = ioaddr;		\
+			if (__len >= 2 && (unsigned long)__ptr & 2) {	\
+				__len -= 2;				\
+				SMC_outw_be(*(u16 *)__ptr, ioaddr,	\
+					DATA_REG(lp));		\
+				__ptr += 2;				\
+			}						\
+			if (SMC_CAN_USE_DATACS && lp->datacs)		\
+				__ioaddr = lp->datacs;			\
+			SMC_outsl(__ioaddr, DATA_REG(lp), __ptr, __len>>2); \
+			if (__len & 2) {				\
+				__ptr += (__len & ~3);			\
+				SMC_outw_be(*((u16 *)__ptr), ioaddr,	\
+					 DATA_REG(lp));		\
+			}						\
+		} else if (SMC_16BIT(lp))				\
+			SMC_outsw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1); \
+		else if (SMC_8BIT(lp))				\
+			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
+	} while (0)
+#else
 #define SMC_PUSH_DATA(lp, p, l)					\
 	do {								\
 		if (SMC_32BIT(lp)) {				\
@@ -1137,10 +1195,11 @@ static const char * chip_ids[ 16 ] =  {
 					 DATA_REG(lp));		\
 			}						\
 		} else if (SMC_16BIT(lp))				\
-			SMC_outsw(ioaddr, DATA_REG(lp), p, (l) >> 1);	\
+			SMC_outsw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1);	\
 		else if (SMC_8BIT(lp))				\
 			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
 	} while (0)
+#endif
 
 #define SMC_PULL_DATA(lp, p, l)					\
 	do {								\
@@ -1172,7 +1231,7 @@ static const char * chip_ids[ 16 ] =  {
 			__len += 2;					\
 			SMC_insl(__ioaddr, DATA_REG(lp), __ptr, __len>>2); \
 		} else if (SMC_16BIT(lp))				\
-			SMC_insw(ioaddr, DATA_REG(lp), p, (l) >> 1);	\
+			SMC_insw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1);	\
 		else if (SMC_8BIT(lp))				\
 			SMC_insb(ioaddr, DATA_REG(lp), p, l);		\
 	} while (0)
-- 
1.7.0.4
