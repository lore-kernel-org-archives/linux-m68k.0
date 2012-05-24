From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 6/11] Atari: new EtherNEC driver (ne.c)
Date: Thu, 24 May 2012 02:50:28 +0200
Message-ID: <E1SXMG4-0002Xo-BD@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:55206 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751409Ab2EXBu3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:50:29 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I000005058Z00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:50:29 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From 075f3f1e95d544953c37b5c989d9fcc33e35c9ec Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Mon, 30 Apr 2012 20:25:09 +1200
Subject: [PATCH 06/11] [m68k] Atari: EtherNEC ethernet support - new platform driver

---
 drivers/net/ethernet/8390/8390.h   |    6 ++++++
 drivers/net/ethernet/8390/Kconfig  |   11 +++++++++++
 drivers/net/ethernet/8390/Makefile |    1 +
 drivers/net/ethernet/8390/ne.c     |    4 +++-
 4 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/8390/8390.h b/drivers/net/ethernet/8390/8390.h
index ef325ff..434753e 100644
--- a/drivers/net/ethernet/8390/8390.h
+++ b/drivers/net/ethernet/8390/8390.h
@@ -32,6 +32,12 @@ extern void ei_poll(struct net_device *dev);
 extern void eip_poll(struct net_device *dev);
 #endif
 
+/* Some platforms may need special IRQ flags */
+#ifdef CONFIG_ATARI
+#  define EI_IRQ_FLAGS	(MACH_IS_ATARI ? IRQF_SHARED : 0)
+#else
+#  define EI_IRQ_FLAGS	0
+#endif
 
 /* Without I/O delay - non ISA or later chips */
 extern void NS8390_init(struct net_device *dev, int startp);
diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index 4501c75..3a03d50 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -223,6 +223,17 @@ config APNE
 	  To compile this driver as a module, choose M here: the module
 	  will be called apne.
 
+config ATARI_ETHERNEC
+	tristate "Atari EtherNEC Ethernet support"
+	depends on ATARI_ROM_ISA
+	---help---
+	  Say Y to include support for the EtherNEC network adapter for the
+	  ROM port. The driver works by polling instead of interrupts, so it
+	  is quite slow.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ne.
+
 config ATARI_ETHERNEC_OLD
 	tristate "Atari EtherNEC Ethernet support - obsolete driver"
 	depends on ATARI_ROM_ISA
diff --git a/drivers/net/ethernet/8390/Makefile b/drivers/net/ethernet/8390/Makefile
index 8513e8d..f1ef3b8 100644
--- a/drivers/net/ethernet/8390/Makefile
+++ b/drivers/net/ethernet/8390/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_MAC8390) += mac8390.o
 obj-$(CONFIG_AC3200) += ac3200.o 8390.o
 obj-$(CONFIG_APNE) += apne.o 8390.o
 obj-$(CONFIG_ARM_ETHERH) += etherh.o
+obj-$(CONFIG_ATARI_ETHERNEC) += ne.o 8390p.o
 obj-$(CONFIG_ATARI_ETHERNEC_OLD) += atari_ethernec.o 8390.o
 obj-$(CONFIG_AX88796) += ax88796.o
 obj-$(CONFIG_E2100) += e2100.o 8390.o
diff --git a/drivers/net/ethernet/8390/ne.c b/drivers/net/ethernet/8390/ne.c
index d04911d..43ca76f 100644
--- a/drivers/net/ethernet/8390/ne.c
+++ b/drivers/net/ethernet/8390/ne.c
@@ -166,6 +166,8 @@ bad_clone_list[] __initdata = {
 #elif defined(CONFIG_PLAT_OAKS32R)  || \
    defined(CONFIG_MACH_TX49XX)
 #  define DCR_VAL 0x48		/* 8-bit mode */
+#elif defined(CONFIG_ATARI)	/* 8-bit mode on Atari, normal on Q40 */
+#  define DCR_VAL (MACH_IS_ATARI ? 0x48 : 0x49)
 #else
 #  define DCR_VAL 0x49
 #endif
@@ -491,7 +493,7 @@ static int __init ne_probe1(struct net_device *dev, unsigned long ioaddr)
 
 	/* Snarf the interrupt now.  There's no point in waiting since we cannot
 	   share and the board will usually be enabled. */
-	ret = request_irq(dev->irq, eip_interrupt, 0, name, dev);
+	ret = request_irq(dev->irq, eip_interrupt, EI_IRQ_FLAGS, name, dev);
 	if (ret) {
 		printk (" unable to get IRQ %d (errno=%d).\n", dev->irq, ret);
 		goto err_out;
-- 
1.7.0.4
