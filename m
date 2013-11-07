From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari: Drop "select USB_ARCH_HAS_HCD" from ATARI_USB
Date: Thu,  7 Nov 2013 10:32:10 +0100
Message-ID: <1383816730-11882-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit d9ea21a779278da06d0cbe989594bf542ed213d7 ("usb: host: make
USB_ARCH_HAS_?HCI obsolete").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be folded into "m68k/atari: USB - add ISP1160 USB host controller
support"

 arch/m68k/Kconfig.bus |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index efb6aab99402..b473f40bdeed 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -59,7 +59,6 @@ config ATARI_USB
 	bool "Atari USB host controller support"
 	depends on ATARI
 	select USB_SUPPORT
-	select USB_ARCH_HAS_HCD
 	help
 	  This option enables support for USB host controllers contained on
 	  the EtherNAT and NetUSBee cards for Atari. You will have to select
-- 
1.7.9.5
