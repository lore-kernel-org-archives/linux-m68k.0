From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 22/28] m68k/vme: Convert VME to genirq
Date: Sun, 11 Sep 2011 13:59:48 +0200
Message-ID: <1315742394-16036-23-git-send-email-geert__24512.8607763492$1315742567$gmane$org@linux-m68k.org>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Hirst <rhirst@parisc-linux.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Hirst <rhirst@parisc-linux.org>
---
v3: Added this changeset
---
 arch/m68k/Kconfig.mmu |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig.mmu b/arch/m68k/Kconfig.mmu
index 9707db5..258d92b 100644
--- a/arch/m68k/Kconfig.mmu
+++ b/arch/m68k/Kconfig.mmu
@@ -201,9 +201,6 @@ config SUN3
 config USE_GENERIC_HARDIRQS
 	bool "Use genirq"
 	depends on !APOLLO
-	depends on !MVME147
-	depends on !MVME16x
-	depends on !BVME6000
 	depends on !SUN3X
 	depends on !Q40
 	depends on !SUN3
-- 
1.7.0.4
