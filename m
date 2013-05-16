From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] m68k: remove 15 unused boards in Kconfig.machine
Date: Thu, 16 May 2013 22:11:51 +0200
Message-ID: <1368735111.1350.211.camel@x61.thuisdomein>
References: <1363868258.1390.129.camel@x61.thuisdomein>
	 <514FF226.3050507@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <514FF226.3050507@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
0) A few months ago I reported that 5 board entries in Kconfig.machine
were unused. Looking at this issue again with a, well, more
sophisticated approach showed me that actually 15 board entries are
unused. Are you comfortable with removing these entries? Should we
perhaps also update the related entries in Kconfig.cpu with the names of
these boards?

1) Only tested by (extensive) grepping of the tree.

 arch/m68k/Kconfig.machine | 91 -----------------------------------------------
 1 file changed, 91 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index a1793c5..9e4a9f0 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -150,18 +150,6 @@ config XCOPILOT_BUGS
 	help
 	  Support the bugs of Xcopilot.
 
-config UC5272
-	bool "Arcturus Networks uC5272 dimm board support"
-	depends on M5272
-	help
-	  Support for the Arcturus Networks uC5272 dimm board.
-
-config UC5282
-	bool "Arcturus Networks uC5282 board support"
-	depends on M528x
-	help
-	  Support for the Arcturus Networks uC5282 dimm board.
-
 config UCSIMM
 	bool "uCsimm module support"
 	depends on M68EZ328
@@ -223,12 +211,6 @@ config ELITE
 	help
 	  Support for the Motorola M5206eLITE board.
 
-config M5208EVB
-	bool "Freescale M5208EVB board support"
-	depends on M520x
-	help
-	  Support for the Freescale Coldfire M5208EVB.
-
 config M5235EVB
 	bool "Freescale M5235EVB support"
 	depends on M523x
@@ -241,54 +223,12 @@ config M5249C3
 	help
 	  Support for the Motorola M5249C3 board.
 
-config M5271EVB
-	bool "Freescale (Motorola) M5271EVB board support"
-	depends on M5271
-	help
-	  Support for the Freescale (Motorola) M5271EVB board.
-
-config M5275EVB
-	bool "Freescale (Motorola) M5275EVB board support"
-	depends on M5275
-	help
-	  Support for the Freescale (Motorola) M5275EVB board.
-
 config M5272C3
 	bool "Motorola M5272C3 board support"
 	depends on M5272
 	help
 	  Support for the Motorola M5272C3 board.
 
-config COBRA5272
-	bool "senTec COBRA5272 board support"
-	depends on M5272
-	help
-	  Support for the senTec COBRA5272 board.
-
-config AVNET5282
-	bool "Avnet 5282 board support"
-	depends on M528x
-	help
-	  Support for the Avnet 5282 board.
-
-config M5282EVB
-	bool "Motorola M5282EVB board support"
-	depends on M528x
-	help
-	  Support for the Motorola M5282EVB board.
-
-config COBRA5282
-	bool "senTec COBRA5282 board support"
-	depends on M528x
-	help
-	  Support for the senTec COBRA5282 board.
-
-config SOM5282EM
-	bool "EMAC.Inc SOM5282EM board support"
-	depends on M528x
-	help
-	  Support for the EMAC.Inc SOM5282EM module.
-
 config WILDFIRE
 	bool "Intec Automation Inc. WildFire board support"
 	depends on M528x
@@ -319,18 +259,6 @@ config SECUREEDGEMP3
 	help
 	  Support for the SnapGear SecureEdge/MP3 platform.
 
-config M5329EVB
-	bool "Freescale (Motorola) M5329EVB board support"
-	depends on M532x
-	help
-	  Support for the Freescale (Motorola) M5329EVB board.
-
-config COBRA5329
-	bool "senTec COBRA5329 board support"
-	depends on M532x
-	help
-	  Support for the senTec COBRA5329 board.
-
 config M5373EVB
 	bool "Freescale M5373EVB board support"
 	depends on M537x
@@ -374,31 +302,12 @@ config NETtel
 	help
 	  Support for the SnapGear NETtel/SecureEdge/SnapGear boards.
 
-config SNAPGEAR
-	bool "SnapGear router board support"
-	depends on NETtel
-	help
-	  Special additional support for SnapGear router boards.
-
-config CPU16B
-	bool "Sneha Technologies S.L. Sarasvati board support"
-	depends on M5272
-	help
-	  Support for the SNEHA CPU16B board.
-
 config MOD5272
 	bool "Netburner MOD-5272 board support"
 	depends on M5272
 	help
 	  Support for the Netburner MOD-5272 board.
 
-config SAVANTrosie1
-	bool "Savant Rosie1 board support"
-	depends on M523x
-	help
-	  Support for the Savant Rosie1 board.
-
-
 if !MMU || COLDFIRE
 
 comment "Machine Options"
-- 
1.7.11.7
