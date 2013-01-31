From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 01/17] [m68k] Atari: declare original EtherNEC driver obsolete
Date: Thu, 31 Jan 2013 13:14:53 +1300 (NZDT)
Message-ID: <20130131001454.07088360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f42.google.com ([209.85.210.42]:61989 "EHLO
	mail-da0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553Ab3AaAPB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:15:01 -0500
Received: by mail-da0-f42.google.com with SMTP id z17so1012181dal.29
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:15:01 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Hello Geert.

This rather lengthy list of patches updates Atari EtherNAT and EtherNEC 
network support, plus adds USB driver support for the ISP1160 chip found on 
EtherNAT and NetUSBee adapters. 

Network stuff: 
 1  declare original EtherNEC driver obsolete
 2  declare original EtherNAT driver obsolete
 3  use CONFIG_ATARI in smc91x.h
 4  change number of interrupt sources to include EtherNAT interrupts
 5  fix EtherNAT interrupt number, conditionalize platform device register 
 6  add platform support for EtherNEC
 7  EtherNAT ethernet support using new driver - smc91x.c
 8  EtherNEC ethernet support using new driver - ne.c
 9  IRQ: add handle_polled_irq for timer based software interrupts
10  use dedicated irq_chip for timer D interrupts
11  add interrupt chip definition for EtherNAT
12  remove unnecessary cruft from Atari interrupt setup

USB related: 
13  implement 16 bit access macros for ROM port ISA adapters
14  Implement ndelay based on the existing udelay code
15  add platform device definitions for ISP1160 drivers
16  Add ISP1160 USB host controller support for EtherNAT/NetUSBee
17  NetUSBee tweaks for ISP1160 USB HCD driver

You may well decide to leave out #9 - use of EtherNEC and NetUSBee is then possible 
only with the 'noirqdebug' kernel option. 

Many thanks to David Galvez for setting me straight on register locations, ways to deal 
with the USB fifo transfers and testing/fixing the code for the NetUSBee case. I have 
departed from the code David used to switch between NetUSBee and EtherNAT access, but 
only slighlty. Please test this version and yell if it's not doing the right thing, David. 

With the present code, the timer D interrupt frequency is approximately 100 Hz. On fast 
hardware, it should probably be doubled (change the timer D counter value fron 254 to 123
to achieve that. I had the timer rate adjustable via kernel options in an earlier 
incarnation pf the ethernet drivers - whoever feels like it can revive that bit please).

Cheers,

	Michael


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/net/Space.c                        |    2 +-
 drivers/net/ethernet/8390/Kconfig          |    4 ++--
 drivers/net/ethernet/8390/Makefile         |    2 +-
 drivers/net/ethernet/8390/atari_ethernec.c |    6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/Space.c b/drivers/net/Space.c
index 77a43b1..fd183d2 100644
--- a/drivers/net/Space.c
+++ b/drivers/net/Space.c
@@ -231,7 +231,7 @@ static struct devprobe2 m68k_probes[] __initdata = {
 #ifdef CONFIG_ATARILANCE	/* Lance-based Atari ethernet boards */
 	{atarilance_probe, 0},
 #endif
-#ifdef CONFIG_ATARI_ETHERNEC	/* NE2000 based ROM port ethernet cards */
+#ifdef CONFIG_ATARI_ETHERNEC_OLD	/* NE2000 based ROM port ethernet cards */
 	{atari_ethernec_probe, 0},
 #endif
 #ifdef CONFIG_SUN3LANCE         /* sun3 onboard Lance chip */
diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index f3efe71..30acd4f 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -226,8 +226,8 @@ config APNE
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
index 73692bd..383f2be 100644
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
