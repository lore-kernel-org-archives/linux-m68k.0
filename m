From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 20/27] m68k/vme: Convert VME to genirq
Date: Sun, 30 Oct 2011 13:48:28 +0100
Message-ID: <1319978915-10933-21-git-send-email-geert@linux-m68k.org>
References: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Hirst <rhirst@parisc-linux.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Hirst <rhirst@parisc-linux.org>
---
 arch/m68k/Kconfig |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index e4bd0c9..8ae37a8 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -88,9 +88,6 @@ config USE_GENERIC_HARDIRQS
 	bool "Use genirq"
 	depends on MMU
 	depends on !APOLLO
-	depends on !MVME147
-	depends on !MVME16x
-	depends on !BVME6000
 	depends on !SUN3X
 	depends on !Q40
 	depends on !SUN3
-- 
1.7.0.4
