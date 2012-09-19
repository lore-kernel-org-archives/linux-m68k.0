From: <gerg@snapgear.com>
Subject: [PATCH 3/9] m68knommu: make ColdFire watchdog register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:38 +1000
Message-ID: <1348031324-13228-4-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:46983 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754713Ab2ISFHO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:07:14 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire Software watchdog registers absolute
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
 arch/m68k/include/asm/m5206sim.h    |    4 ++--
 arch/m68k/include/asm/m5249sim.h    |    4 ++--
 arch/m68k/include/asm/m525xsim.h    |    4 ++--
 arch/m68k/include/asm/m5272sim.h    |    8 ++++----
 arch/m68k/include/asm/m5307sim.h    |    4 ++--
 arch/m68k/include/asm/m5407sim.h    |    4 ++--
 arch/m68k/platform/coldfire/m5272.c |    6 +++---
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index d67ce08..02a91f4 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -46,8 +46,8 @@
 #define	MCFSIM_RSR		(MCF_MBAR + 0x40)	/* Reset Status */
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x41)	/* System Protection */
 
-#define	MCFSIM_SWIVR		0x42		/* SW Watchdog intr reg (r/w) */
-#define	MCFSIM_SWSR		0x43		/* SW Watchdog service (r/w) */
+#define	MCFSIM_SWIVR		(MCF_MBAR + 0x42)	/* SW Watchdog intr */
+#define	MCFSIM_SWSR		(MCF_MBAR + 0x43)	/* SW Watchdog srv */
 
 #define	MCFSIM_DCRR		(MCF_MBAR + 0x46) /* DRAM Refresh reg (r/w) */
 #define	MCFSIM_DCTR		(MCF_MBAR + 0x4a) /* DRAM Timing reg (r/w) */
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index e57785d..7229fd8 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -27,8 +27,8 @@
  */
 #define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
-#define	MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
-#define	MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
+#define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
+#define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog srv */
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index 05876cc..b0fccd9 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -28,8 +28,8 @@
  */
 #define MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
 #define MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
-#define MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
-#define MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
+#define MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
+#define MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog srv */
 #define MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
 #define MCFSIM_IPR		(MCF_MBAR + 0x40)	/* Interrupt Pending */
 #define MCFSIM_IMR		(MCF_MBAR + 0x44)	/* Interrupt Mask */
diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 378a6d9..3983404 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -37,10 +37,10 @@
 #define	MCFSIM_PIWR		(MCF_MBAR + 0x38)	/* Intr Wakeup */
 #define	MCFSIM_PIVR		(MCF_MBAR + 0x3f)	/* Intr Vector */
 
-#define	MCFSIM_WRRR		0x280		/* Watchdog reference (r/w) */
-#define	MCFSIM_WIRR		0x284		/* Watchdog interrupt (r/w) */
-#define	MCFSIM_WCR		0x288		/* Watchdog counter (r/w) */
-#define	MCFSIM_WER		0x28c		/* Watchdog event (r/w) */
+#define	MCFSIM_WRRR		(MCF_MBAR + 0x280)	/* Watchdog reference */
+#define	MCFSIM_WIRR		(MCF_MBAR + 0x284)	/* Watchdog interrupt */
+#define	MCFSIM_WCR		(MCF_MBAR + 0x288)	/* Watchdog counter */
+#define	MCFSIM_WER		(MCF_MBAR + 0x28c)	/* Watchdog event */
 
 #define	MCFSIM_CSBR0		0x40		/* CS0 Base Address (r/w) */
 #define	MCFSIM_CSOR0		0x44		/* CS0 Option (r/w) */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 5709de5..a328e18 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -25,8 +25,8 @@
  */
 #define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status reg */
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
-#define	MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
-#define	MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
+#define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
+#define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog service*/
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 622ebfa..023f5f6 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -25,8 +25,8 @@
  */
 #define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
 #define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
-#define	MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
-#define	MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
+#define	MCFSIM_SWIVR		(MCF_MBAR + 0x02)	/* SW Watchdog intr */
+#define	MCFSIM_SWSR		(MCF_MBAR + 0x03)	/* SW Watchdog service*/
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
 #define	MCFSIM_IRQPAR		0x06		/* Interrupt Assignment reg (r/w) */
 #define	MCFSIM_PLLCR		0x08		/* PLL Control Reg*/
diff --git a/arch/m68k/platform/coldfire/m5272.c b/arch/m68k/platform/coldfire/m5272.c
index e68bc7a..a95680b 100644
--- a/arch/m68k/platform/coldfire/m5272.c
+++ b/arch/m68k/platform/coldfire/m5272.c
@@ -50,9 +50,9 @@ static void m5272_cpu_reset(void)
 {
 	local_irq_disable();
 	/* Set watchdog to reset, and enabled */
-	__raw_writew(0, MCF_MBAR + MCFSIM_WIRR);
-	__raw_writew(1, MCF_MBAR + MCFSIM_WRRR);
-	__raw_writew(0, MCF_MBAR + MCFSIM_WCR);
+	__raw_writew(0, MCFSIM_WIRR);
+	__raw_writew(1, MCFSIM_WRRR);
+	__raw_writew(0, MCFSIM_WCR);
 	for (;;)
 		/* wait for watchdog to timeout */;
 }
-- 
1.7.0.4
