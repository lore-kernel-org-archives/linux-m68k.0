From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: [PATCH] m68k: remove unused Kconfig parameters
Date: Fri,  6 Sep 2013 13:59:39 +0200
Message-ID: <1378468779-3289-1-git-send-email-michael.opdenacker@free-electrons.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Michael Opdenacker <michael.opdenacker@free-electrons.com>

This patch proposes to remove the UC5282 and UC5272 kernel configuration
parameters defined in arch/m68k/Kconfig.machine,
but used nowhere in the makefiles and source code.

Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
---
 arch/m68k/Kconfig.machine | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index b9ab0a6..a10516b 100644
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
-- 
1.8.1.2
