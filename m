From: Daniel Palmer <danieruru@gmail.com>
Subject: [PATCH 2/2] m68k: Only allow for one member of the DragonBall family to be       selected in Kconfig. The support code for these chips       doesn't currently handle support for multiple family       members to be supported in a single kernel image.
Date: Sat,  5 Apr 2014 14:39:58 +0900
Message-ID: <1396676398-31175-2-git-send-email-danieruru@gmail.com>
References: <1396676398-31175-1-git-send-email-danieruru@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1396676398-31175-1-git-send-email-danieruru@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Daniel Palmer <danieruru@gmail.com>

Signed-off-by: Daniel Palmer <danieruru@gmail.com>
---
 arch/m68k/Kconfig.cpu | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 33013df..1ca7cbe 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -93,27 +93,29 @@ config M68060
 	  If you anticipate running this kernel on a computer with a MC68060
 	  processor, say Y. Otherwise, say N.
 
+choice
+	prompt "DragonBall SoC family support"
+	depends on M68000
+	help
+	  Select which member of the DragonBall SoC family to support.
+
 config M68328
 	bool "MC68328"
-	depends on !MMU
-	select M68000
 	help
 	  Motorola 68328 processor support.
 
 config M68EZ328
 	bool "MC68EZ328"
-	depends on !MMU
-	select M68000
 	help
-	  Motorola 68EX328 processor support.
+	  Motorola 68EZ328 processor support.
 
 config M68VZ328
 	bool "MC68VZ328"
-	depends on !MMU
-	select M68000
 	help
 	  Motorola 68VZ328 processor support.
 
+endchoice
+
 config M68360
 	bool "MC68360"
 	depends on !MMU
-- 
1.9.1
