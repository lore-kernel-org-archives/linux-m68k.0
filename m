From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] m68k/atari - update Kconfig.bus help text
Date: Wed, 10 Sep 2014 20:26:21 +1200
Message-ID: <1410337581-9246-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:54365 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbaIJI0f (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Sep 2014 04:26:35 -0400
Received: by mail-pd0-f175.google.com with SMTP id z10so10674253pdj.6
        for <linux-m68k@vger.kernel.org>; Wed, 10 Sep 2014 01:26:35 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitzmic@gmail.com>

Add NetUSBee to users of ATARI_ROM_ISA option (thanks Geert for
spotting this in randconfig builds).

Add note to ATARI_USB option to alert user to enable ATARI_ROM_ISA
if they want support for the NetUSBee USB driver.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/Kconfig.bus |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index b473f40..fea83ca 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -52,8 +52,10 @@ config ATARI_ROM_ISA
 	  This option enables support for the ROM port ISA adapter used to
 	  operate ISA cards on Atari. Only 8  bit cards are supported, and
 	  no interrupt lines are connected.
-	  The only driver currently using this adapter is the EtherNEC
-	  driver for RTL8019AS based NE2000 compatible network cards.
+	  The only drivers currently using this adapter are the NE2000 ISA
+	  driver for EtherNEC (RTL8019AS based NE2000 compatible network
+          cards), and drivers for the NetUSBee (RTL8019AS / ISP1160 ethernet/
+          USB combo card).
 
 config ATARI_USB
 	bool "Atari USB host controller support"
@@ -64,6 +66,8 @@ config ATARI_USB
 	  the EtherNAT and NetUSBee cards for Atari. You will have to select
 	  an appropriate HCD driver in the USB section (the ISP1160 one is
 	  the most commonly used one).
+          Support for the NetUSBee in the ISP116x host controller driver also
+          requires the ATARI_ROM_ISA option to be set. 
 
 config GENERIC_ISA_DMA
 	def_bool ISA
-- 
1.7.0.4
