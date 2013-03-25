From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 07/11] m68k/atari: EtherNEC - ethernet support - new driver (ne.c)
Date: Mon, 25 Mar 2013 19:37:40 +1300
Message-ID: <1364193464-3890-8-git-send-email-schmitz@debian.org>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:39022 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755481Ab3CYGiP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Mar 2013 02:38:15 -0400
Received: by mail-pb0-f45.google.com with SMTP id ro8so3991363pbb.32
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 23:38:15 -0700 (PDT)
In-Reply-To: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, tg@mirbsd.de, Michael Schmitz <schmitz@debian.org>

Support for Atari EtherNEC ROM port adapters in ne.c

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.devices         |   14 ++++++++++++++
 drivers/net/ethernet/8390/Kconfig |    3 ++-
 drivers/net/ethernet/8390/ne.c    |    2 ++
 3 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index d50ecbf..d163991 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -65,6 +65,20 @@ config ATARI_ETHERNAT
 	  To compile the actual ethernet driver, choose Y or M for the SMC91X
 	  option in the network device section; the module will be called smc91x.
 
+config ATARI_ETHERNEC
+	bool "Atari EtherNEC Ethernet support"
+	depends on ATARI_ROM_ISA
+	---help---
+	  Say Y to include support for the EtherNEC network adapter for the
+	  ROM port. The driver works by polling instead of interrupts, so it
+	  is quite slow.
+
+	  This driver also suppports the ethernet part of the NetUSBee ROM
+	  port combined Ethernet/USB adapter.
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
