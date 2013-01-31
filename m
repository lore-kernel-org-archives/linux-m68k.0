From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 07/17] [m68k] Atari: EtherNAT ethernet support - new driver (smc91x)
Date: Thu, 31 Jan 2013 13:21:50 +1300 (NZDT)
Message-ID: <20130131002150.4AE33360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:33998 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751515Ab3AaAV4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:21:56 -0500
Received: by mail-pa0-f42.google.com with SMTP id rl6so1393859pac.1
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:21:56 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 07/17] [m68k] Atari: EtherNAT ethernet support - new driver (smc91x)


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.devices          |   21 +++++++++++++++++++++
 drivers/net/ethernet/smsc/Kconfig  |    2 +-
 drivers/net/ethernet/smsc/smc91x.h |    2 ++
 3 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index c4cdfe4..6d8abf0 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -55,6 +55,27 @@ config NFETH
 	  which will emulate a regular ethernet device while presenting an
 	  ethertap device to the host system.
 
+config ATARI_ETHERNEC
+	bool "Atari EtherNEC Ethernet support"
+	depends on ATARI_ROM_ISA
+	---help---
+	  Say Y to include support for the EtherNEC network adapter for the
+	  ROM port. The driver works by polling instead of interrupts, so it
+	  is quite slow.
+
+	  To compile the actual ethernet driver, choose Y or M in for the NE2000 
+	  option in the network device section; the module will be called ne.
+
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
index c273eac..3d66b0e 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -50,7 +50,7 @@ config SMC91X
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
