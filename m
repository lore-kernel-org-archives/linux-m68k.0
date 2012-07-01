From: Michael Schmitz <schmitzmic@gmail.com>
Subject: (unknown)
Date: Sun,  1 Jul 2012 16:21:12 +1200 (NZST)
Message-ID: <20120701042112.A45533600FE@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40175 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab2GAEVR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jul 2012 00:21:17 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so6169091pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 30 Jun 2012 21:21:17 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

>From 1fe03815ff360ebec29fe6d66b5a1d8659e3a95d Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Sat, 30 Jun 2012 15:22:13 +1200
Subject: [PATCH 4/6] [m68k] Atari: add Kconfig support for EtherNAT - smc91x.c driver


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.devices         |   10 ++++++++++
 drivers/net/ethernet/smsc/Kconfig |    2 +-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index 04a3d9b..eefd271 100644
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
index bb1e8f3..d3485cf 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -40,7 +40,7 @@ config SMC91X
 	select NET_CORE
 	select MII
 	depends on (ARM || M32R || SUPERH || MIPS || BLACKFIN || \
-		    MN10300 || COLDFIRE)
+		    MN10300 || COLDFIRE || ATARI_ETHERNAT)
 	---help---
 	  This is a driver for SMC's 91x series of Ethernet chipsets,
 	  including the SMC91C94 and the SMC91C111. Say Y if you want it
-- 
1.7.0.4
