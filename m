From: <gerg@snapgear.com>
Subject: [PATCH 4/9] m68knommu: make ColdFire Pin Assignment register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:39 +1000
Message-ID: <1348031324-13228-5-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:25410 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752936Ab2ISFFF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:05:05 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire Pin Assignment registers absolute
addresses. Currently some are relative to the MBAR peripheral region.

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
 arch/m68k/include/asm/m5206sim.h |    4 ++--
 arch/m68k/include/asm/m5249sim.h |    2 +-
 arch/m68k/include/asm/m5307sim.h |    2 +-
 arch/m68k/include/asm/m5407sim.h |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 02a91f4..c78ff10 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -85,9 +85,9 @@
 #define	MCFSIM_DMCR		0xc6		/* Default control */
 
 #ifdef CONFIG_M5206e
-#define	MCFSIM_PAR		0xca		/* Pin Assignment reg (r/w) */
+#define	MCFSIM_PAR		(MCF_MBAR + 0xca)	/* Pin Assignment */
 #else
-#define	MCFSIM_PAR		0xcb		/* Pin Assignment reg (r/w) */
+#define	MCFSIM_PAR		(MCF_MBAR + 0xcb)	/* Pin Assignment */
 #endif
 
 #define	MCFTIMER_BASE1		(MCF_MBAR + 0x100)	/* Base of TIMER1 */
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 7229fd8..6e2bb0c 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -29,7 +29,7 @@
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog srv */
-#define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
+#define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
 #define	MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index a328e18..7d89d86 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -27,7 +27,7 @@
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog service*/
-#define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
+#define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 023f5f6..51111af 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -27,7 +27,7 @@
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
 #define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog service*/
-#define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
+#define	MCFSIM_PAR		(MCF_MBAR + 0x04)	/* Pin Assignment */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
-- 
1.7.0.4
