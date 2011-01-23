From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/4] m68k/atari: ARAnyM - Remove bogus line from Kconfig help
Date: Sun, 23 Jan 2011 17:31:31 +0100
Message-ID: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Stehlik <pstehlik@sophics.cz>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Stehlik <pstehlik@sophics.cz>
---
 arch/m68k/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 18b7465..3880154 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -255,7 +255,7 @@ config NATFEAT
 	depends on ATARI
 	help
 	  This option enables support for ARAnyM native features, such as
-	  access to a disk image as /dev/hda. Useful with the ARANYM option.
+	  access to a disk image as /dev/hda.
 
 config NFETH
 	tristate "NatFeat Ethernet support"
-- 
1.7.0.4
