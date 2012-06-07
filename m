From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/5] m68k: Move CPU_HAS_* config options
Date: Thu,  7 Jun 2012 20:47:04 +0200
Message-ID: <1339094827-12349-2-git-send-email-geert@linux-m68k.org>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

They belong together with the CPU selection

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig     |    9 ---------
 arch/m68k/Kconfig.cpu |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index bc8cc50..87b504c 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -53,15 +53,6 @@ config ZONE_DMA
 	bool
 	default y
 
-config CPU_HAS_NO_BITFIELDS
-	bool
-
-config CPU_HAS_NO_MULDIV64
-	bool
-
-config CPU_HAS_ADDRESS_SPACES
-	bool
-
 config HZ
 	int
 	default 1000 if CLEOPATRA
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 2b53254..6cd8c1a 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -360,6 +360,15 @@ config NODES_SHIFT
 	default "3"
 	depends on !SINGLE_MEMORY_CHUNK
 
+config CPU_HAS_NO_BITFIELDS
+	bool
+
+config CPU_HAS_NO_MULDIV64
+	bool
+
+config CPU_HAS_ADDRESS_SPACES
+	bool
+
 config FPU
 	bool
 
-- 
1.7.0.4
