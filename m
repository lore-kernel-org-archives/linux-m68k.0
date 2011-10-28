From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Revive lost DIO bus config option
Date: Fri, 28 Oct 2011 22:54:55 +0200
Message-ID: <1319835295-19519-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

commit 0e152d80507b75c00aac60f2ffc586360687cd52 ("m68k: reorganize Kconfig
options to improve mmu/non-mmu selections") accidentally dropped the DIO
bus config option. Re-add it to the "Bus support" section.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig.bus |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index 7703b54..983e176 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -2,6 +2,15 @@ if MMU
 
 comment "Bus Support"
 
+config DIO
+	bool "DIO bus support"
+	depends on HP300
+	default y
+	help
+	  Say Y here to enable support for the "DIO" expansion bus used in
+	  HP300 machines. If you are using such a system you almost certainly
+	  want this.
+
 config NUBUS
 	bool
 	depends on MAC
-- 
1.7.0.4
