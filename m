From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 08/14] m68k/atari: EtherNAT - ethernet support - new driver (smc91x)
Date: Mon, 25 Mar 2013 14:16:26 +1300
Message-ID: <1364174192-25406-9-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:64896 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756211Ab3CYBYL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:24:11 -0400
Received: by mail-pb0-f48.google.com with SMTP id wy12so3862094pbc.35
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:24:11 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Use smc91x driver for Atari EtherNAT SMC91C111 ethernet chip.
Change to smc91x.h is necessary to avoid corruption of outgoing
ethernet packet headers (first two bytes end up swapped otherwise).

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.devices         |   10 ++++++++++
 drivers/net/ethernet/smsc/Kconfig |    2 +-
 2 files changed, 11 insertions(+), 1 deletions(-)

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
