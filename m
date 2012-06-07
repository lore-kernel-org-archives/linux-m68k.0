From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/5] m68k: Remove duplicate FPU config option
Date: Thu,  7 Jun 2012 20:47:03 +0200
Message-ID: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

It's also defined in arch/m68k/Kconfig.cpu

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 1471201..bc8cc50 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -62,9 +62,6 @@ config CPU_HAS_NO_MULDIV64
 config CPU_HAS_ADDRESS_SPACES
 	bool
 
-config FPU
-	bool
-
 config HZ
 	int
 	default 1000 if CLEOPATRA
-- 
1.7.0.4
