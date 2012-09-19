From: <gerg@snapgear.com>
Subject: [PATCH 2/9] m68knommu: make ColdFire SYPCR and RSR register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:37 +1000
Message-ID: <1348031324-13228-3-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:46978 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754713Ab2ISFHL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:07:11 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire Reset and System registers absolute
addresses. Currently some are relative to the MBAR peripheral region.

The various ColdFire parts use different methods to address the internal
registers, some are absolute, some are relative to peripheral regions
which can be mapped at different address ranges (such as the MBAR and IPSBAR
registers). We don't want to deal with this in the code when we are
accessing these registers, so make all register definitions the abolsute
address - factoring out whether it is an offset into a peripheral region.

This makes them all consistently defined, and reduces the occasional bugs
caused by inconsistent definition of the register addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5206sim.h    |    4 ++--
 arch/m68k/include/asm/m5249sim.h    |    4 ++--
 arch/m68k/include/asm/m525xsim.h    |    4 ++--
 arch/m68k/include/asm/m5307sim.h    |    4 ++--
 arch/m68k/include/asm/m5407sim.h    |    4 ++--
 arch/m68k/platform/coldfire/reset.c |    2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index e8bae33..d67ce08 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -43,8 +43,8 @@
 #define	MCFSIM_IMR		(MCF_MBAR + 0x36)	/* Interrupt Mask */
 #define	MCFSIM_IPR		(MCF_MBAR + 0x3a)	/* Interrupt Pending */
 
-#define	MCFSIM_RSR		0x40		/* Reset Status reg (r/w) */
-#define	MCFSIM_SYPCR		0x41		/* System Protection reg (r/w)*/
+#define	MCFSIM_RSR		(MCF_MBAR + 0x40)	/* Reset Status */
+#define	MCFSIM_SYPCR		(MCF_MBAR + 0x41)	/* System Protection */
 
 #define	MCFSIM_SWIVR		0x42		/* SW Watchdog intr reg (r/w) */
 #define	MCFSIM_SWSR		0x43		/* SW Watchdog service (r/w) */
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index d0aa7f2..e57785d 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -25,8 +25,8 @@
 /*
  *	Define the 5249 SIM register set addresses.
  */
-#define	MCFSIM_RSR		0x00		/* Reset Status reg (r/w) */
-#define	MCFSIM_SYPCR		0x01		/* System Protection reg (r/w)*/
+#define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
+#define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define	MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
 #define	MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index 0d6d192..05876cc 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -26,8 +26,8 @@
 /*
  *	Define the 525x SIM register set addresses.
  */
-#define MCFSIM_RSR		0x00		/* Reset Status reg (r/w) */
-#define MCFSIM_SYPCR		0x01		/* System Protection reg (r/w)*/
+#define MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
+#define MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
 #define MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
 #define MCFSIM_MPARK		0x0C		/* BUS Master Control Reg*/
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 255f7f3..5709de5 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -23,8 +23,8 @@
 /*
  *	Define the 5307 SIM register set addresses.
  */
-#define	MCFSIM_RSR		0x00		/* Reset Status reg (r/w) */
-#define	MCFSIM_SYPCR		0x01		/* System Protection reg (r/w)*/
+#define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status reg */
+#define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define	MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
 #define	MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index afdd563..622ebfa 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -23,8 +23,8 @@
 /*
  *	Define the 5407 SIM register set addresses.
  */
-#define	MCFSIM_RSR		0x00		/* Reset Status reg (r/w) */
-#define	MCFSIM_SYPCR		0x01		/* System Protection reg (r/w)*/
+#define	MCFSIM_RSR		(MCF_MBAR + 0x00)	/* Reset Status */
+#define	MCFSIM_SYPCR		(MCF_MBAR + 0x01)	/* System Protection */
 #define	MCFSIM_SWIVR		0x02		/* SW Watchdog intr reg (r/w) */
 #define	MCFSIM_SWSR		0x03		/* SW Watchdog service (r/w) */
 #define	MCFSIM_PAR		0x04		/* Pin Assignment reg (r/w) */
diff --git a/arch/m68k/platform/coldfire/reset.c b/arch/m68k/platform/coldfire/reset.c
index 933e54e..f30952f 100644
--- a/arch/m68k/platform/coldfire/reset.c
+++ b/arch/m68k/platform/coldfire/reset.c
@@ -27,7 +27,7 @@ static void mcf_cpu_reset(void)
 {
 	local_irq_disable();
 	/* Set watchdog to soft reset, and enabled */
-	__raw_writeb(0xc0, MCF_MBAR + MCFSIM_SYPCR);
+	__raw_writeb(0xc0, MCFSIM_SYPCR);
 	for (;;)
 		/* wait for watchdog to timeout */;
 }
-- 
1.7.0.4
