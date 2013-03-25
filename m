From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 09/14] m68k/atari: EtherNEC - ethernet support - new driver (ne.c)
Date: Mon, 25 Mar 2013 14:16:27 +1300
Message-ID: <1364174192-25406-10-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:38929 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756524Ab3CYBQ7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:16:59 -0400
Received: by mail-pa0-f42.google.com with SMTP id kq13so109433pab.15
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:16:59 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Use ne.c driver for Atari EtherNEC and NetUSBee network adapters.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.devices         |   11 +++++++++++
 drivers/net/ethernet/8390/Kconfig |    3 ++-
 drivers/net/ethernet/8390/ne.c    |    2 ++
 3 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index d50ecbf..1c38a91 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -65,6 +65,17 @@ config ATARI_ETHERNAT
 	  To compile the actual ethernet driver, choose Y or M for the SMC91X
 	  option in the network device section; the module will be called smc91x.
 
+config ATARI_ETHERNEC
+	bool "Atari EtherNEC Ethernet support"
+	depends on ATARI_ROM_ISA
+	---help---
+	  Say Y to include support for the EtherNEC and NetUSBee network adapters
+	  for the ROM port. The driver works by polling instead of interrupts, so
+	  it is quite slow.
+
+	  To compile the actual ethernet driver, choose Y or M in for the NE2000
+	  option in the network device section; the module will be called ne.
+
 endmenu
 
 menu "Character devices"
diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index a5f91e1..53abc78 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -91,7 +91,8 @@ config MCF8390
 
 config NE2000
 	tristate "NE2000/NE1000 support"
-	depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX)
+	depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX || \
+		    ATARI_ETHERNEC)
 	select CRC32
 	---help---
 	  If you have a network (Ethernet) card of this type, say Y and read
diff --git a/drivers/net/ethernet/8390/ne.c b/drivers/net/ethernet/8390/ne.c
index 47618e5..49948f6 100644
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
-- 
1.7.0.4
