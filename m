From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 14/28] m68k/atari: Convert Atari to genirq
Date: Sun, 11 Sep 2011 13:59:40 +0200
Message-ID: <1315742394-16036-15-git-send-email-geert@linux-m68k.org>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
[v1] Acked-by: Thomas Gleixner <tglx@linutronix.de>
---
v3: With handle_simple_irq(), we don't need the .irq_{,un}mask methods anymore,
    hence the conversion to genirq becomes trivial.
---
 arch/m68k/Kconfig.mmu |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.mmu b/arch/m68k/Kconfig.mmu
index 557b4b7..2df049f 100644
--- a/arch/m68k/Kconfig.mmu
+++ b/arch/m68k/Kconfig.mmu
@@ -201,7 +201,6 @@ config SUN3
 config USE_GENERIC_HARDIRQS
 	bool "Use genirq"
 	depends on !AMIGA
-	depends on !ATARI
 	depends on !MAC
 	depends on !APOLLO
 	depends on !MVME147
-- 
1.7.0.4
