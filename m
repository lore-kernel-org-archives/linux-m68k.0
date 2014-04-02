From: Daniel Palmer <danieruru@gmail.com>
Subject: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Wed,  2 Apr 2014 23:43:11 +0900
Message-ID: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Daniel Palmer <danieruru@gmail.com>

Signed-off-by: Daniel Palmer <danieruru@gmail.com>
---
 arch/m68k/platform/68000/head.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/platform/68000/head.S b/arch/m68k/platform/68000/head.S
index 536ef96..0d00489 100644
--- a/arch/m68k/platform/68000/head.S
+++ b/arch/m68k/platform/68000/head.S
@@ -91,12 +91,18 @@ _start:
 	movew	#0xe100, 0xfffff900		/* enable */
 #endif /* DEBUG_HEAD */
 
-#ifdef CONFIG_PILOT
+#if defined(CONFIG_PILOT)
 	movew	#0x2410, 0xfffff200		/* PLLCR */
+#elif defined(CONFIG_M68VZ328)
+	movew	#0x2493, 0xfffff200		/* PLLCR */
 #else
 	movew	#0x2400, 0xfffff200		/* PLLCR */
 #endif
+#if defined(CONFIG_M68VZ328)
+	movew	#0x0347, 0xfffff202		/* PLLFSR */
+#else
 	movew	#0x0123, 0xfffff202		/* PLLFSR */
+#endif
 	moveq	#0, %d0
 	movew	#16384, %d0			/* PLL settle wait loop */
 _pll_settle:
-- 
1.9.1
