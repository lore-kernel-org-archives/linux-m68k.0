From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 12/27] m68k/atari: Convert Atari to genirq
Date: Sun, 30 Oct 2011 13:48:20 +0100
Message-ID: <1319978915-10933-13-git-send-email-geert@linux-m68k.org>
References: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
[v1] Acked-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/m68k/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index a7597e1..9d60f40 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -88,7 +88,6 @@ config USE_GENERIC_HARDIRQS
 	bool "Use genirq"
 	depends on MMU
 	depends on !AMIGA
-	depends on !ATARI
 	depends on !MAC
 	depends on !APOLLO
 	depends on !MVME147
-- 
1.7.0.4
