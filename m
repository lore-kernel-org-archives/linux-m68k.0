From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 2/11] Atari: obsolete old EtherNEC driver
Date: Thu, 24 May 2012 02:46:45 +0200
Message-ID: <E1SXMCT-0002XV-Fj@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:54854 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932088Ab2EXBrk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:47:40 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I000024VF1J00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:47:39 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From e5b176bc75f24063f00e42ddf8594c43925bf2c9 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Mon, 30 Apr 2012 19:22:36 +1200
Subject: [PATCH 02/11] [m68k] Atari: declare original EtherNEC driver obsolete

---
 drivers/net/Space.c                        |    2 +-
 drivers/net/ethernet/8390/Kconfig          |    4 ++--
 drivers/net/ethernet/8390/Makefile         |    2 +-
 drivers/net/ethernet/8390/atari_ethernec.c |    6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/Space.c b/drivers/net/Space.c
index 5acb70a..779ba83 100644
--- a/drivers/net/Space.c
+++ b/drivers/net/Space.c
@@ -245,7 +245,7 @@ static struct devprobe2 m68k_probes[] __initdata = {
 #ifdef CONFIG_ATARILANCE	/* Lance-based Atari ethernet boards */
 	{atarilance_probe, 0},
 #endif
-#ifdef CONFIG_ATARI_ETHERNEC	/* NE2000 based ROM port ethernet cards */
+#ifdef CONFIG_ATARI_ETHERNEC_OLD	/* NE2000 based ROM port ethernet cards */
 	{atari_ethernec_probe, 0},
 #endif
 #ifdef CONFIG_SUN3LANCE         /* sun3 onboard Lance chip */
diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index b801056..4501c75 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -223,8 +223,8 @@ config APNE
 	  To compile this driver as a module, choose M here: the module
 	  will be called apne.
 
-config ATARI_ETHERNEC
-	tristate "Atari EtherNEC Ethernet support"
+config ATARI_ETHERNEC_OLD
+	tristate "Atari EtherNEC Ethernet support - obsolete driver"
 	depends on ATARI_ROM_ISA
 	help
 	  Say Y to include support for the EtherNEC network adapter for the
diff --git a/drivers/net/ethernet/8390/Makefile b/drivers/net/ethernet/8390/Makefile
index d896466..8513e8d 100644
--- a/drivers/net/ethernet/8390/Makefile
+++ b/drivers/net/ethernet/8390/Makefile
@@ -6,7 +6,7 @@ obj-$(CONFIG_MAC8390) += mac8390.o
 obj-$(CONFIG_AC3200) += ac3200.o 8390.o
 obj-$(CONFIG_APNE) += apne.o 8390.o
 obj-$(CONFIG_ARM_ETHERH) += etherh.o
-obj-$(CONFIG_ATARI_ETHERNEC) += atari_ethernec.o 8390.o
+obj-$(CONFIG_ATARI_ETHERNEC_OLD) += atari_ethernec.o 8390.o
 obj-$(CONFIG_AX88796) += ax88796.o
 obj-$(CONFIG_E2100) += e2100.o 8390.o
 obj-$(CONFIG_EL2) += 3c503.o 8390p.o
diff --git a/drivers/net/ethernet/8390/atari_ethernec.c b/drivers/net/ethernet/8390/atari_ethernec.c
index 4b1b953..69af404 100644
--- a/drivers/net/ethernet/8390/atari_ethernec.c
+++ b/drivers/net/ethernet/8390/atari_ethernec.c
@@ -184,13 +184,13 @@ bad_clone_list[] __initdata = {
 #  define DCR_VAL 0x4b
 #elif defined(CONFIG_PLAT_OAKS32R)  || \
    defined(CONFIG_TOSHIBA_RBTX4927) || defined(CONFIG_TOSHIBA_RBTX4938) || \
-   defined(CONFIG_ATARI_ETHERNEC) || defined(CONFIG_ATARI_ETHERNEC_MODULE)
+   defined(CONFIG_ATARI_ETHERNEC_OLD) || defined(CONFIG_ATARI_ETHERNEC_OLD_MODULE)
 #  define DCR_VAL 0x48		/* 8-bit mode */
 #else
 #  define DCR_VAL 0x49
 #endif
 
-#if defined(CONFIG_ATARI_ETHERNEC) || defined(CONFIG_ATARI_ETHERNEC_MODULE)
+#if defined(CONFIG_ATARI_ETHERNEC_OLD) || defined(CONFIG_ATARI_ETHERNEC_OLD_MODULE)
 #  define ETHERNEC_RTL_8019_BASE 0x300
 #  define ETHERNEC_RTL_8019_IRQ IRQ_MFP_TIMD
 #endif
@@ -356,7 +356,7 @@ struct net_device * __init atari_ethernec_probe(int unit)
 	sprintf(dev->name, "eth%d", unit);
 	netdev_boot_setup_check(dev);
 
-#if defined(CONFIG_ATARI_ETHERNEC)
+#if defined(CONFIG_ATARI_ETHERNEC_OLD)
 	dev->base_addr = ETHERNEC_RTL_8019_BASE;
 	dev->irq = ETHERNEC_RTL_8019_IRQ;
 #endif
-- 
1.7.0.4
