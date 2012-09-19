From: <gerg@snapgear.com>
Subject: [PATCH 7/9] m68knommu: make ColdFire Park and Assignment register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:42 +1000
Message-ID: <1348031324-13228-8-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:46988 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754906Ab2ISFHT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:07:19 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire MPARK and IRQ Assignment registers
absolute addresses. Currently some are relative to the MBAR peripheral
region.

The various ColdFire parts use different methods to address the internal
registers, some are absolute, some are relative to peripheral regions
which can be mapped at different address ranges (such as the MBAR and IPSBAR
registers). We don't want to deal with this in the code when we are
accessing these registers, so make all register definitions the absolute
address - factoring out whether it is an offset into a peripheral region.

This makes them all consistently defined, and reduces the occasional bugs
caused by inconsistent definition of the register addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5249sim.h |    4 ++--
 arch/m68k/include/asm/m525xsim.h |    2 +-
 arch/m68k/include/asm/m5307sim.h |    6 +++---
 arch/m68k/include/asm/m5407sim.h |    6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 02ada05..3d9c7d7 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -30,8 +30,8 @@
 #define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog srv */
 #define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
-#define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
-#define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
+#define	MCFSIM_IRQPAR		(MCF_MBAR + 0x06)	/* Intr Assignment */
+#define	MCFSIM_MPARK		(MCF_MBAR + 0x0C)	/* BUS Master Ctrl */
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index 158fdd4..acab61c 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -30,7 +30,7 @@
 #define MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog srv */
-#define MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
+#define MCFSIM_MPARK		(MCF_MBAR + 0x0C)	/* BUS Master Ctrl */
 #define MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define MCFSIM_ICR0		(MCF_MBAR + 0x4c)	/* Intr Ctrl reg 0 */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index a020718..a8e7519 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -28,9 +28,9 @@
 #define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog service*/
 #define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
-#define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
-#define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
-#define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
+#define	MCFSIM_IRQPAR		(MCF_MBAR + 0x06)	/* Itr Assignment */
+#define	MCFSIM_PLLCR		(MCF_MBAR + 0x08)	/* PLL Ctrl Reg */
+#define	MCFSIM_MPARK		(MCF_MBAR + 0x0C)	/* BUS Master Ctrl */
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pend */
 #define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index e6e48c1..cc485ba 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -28,9 +28,9 @@
 #define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog service*/
 #define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
-#define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
-#define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
-#define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
+#define	MCFSIM_IRQPAR		(MCF_MBAR + 0x06)	/* Intr Assignment */
+#define	MCFSIM_PLLCR		(MCF_MBAR + 0x08)	/* PLL Ctrl */
+#define	MCFSIM_MPARK		(MCF_MBAR + 0x0C)	/* BUS Master Ctrl */
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define	MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
 #define	MCFSIM_AVR		(MCF_MBAR + 0x4b)	/* Autovector Ctrl */
-- 
1.7.0.4
