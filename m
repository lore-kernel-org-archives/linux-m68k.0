From: <gerg@snapgear.com>
Subject: [PATCH 8/9] m68knommu: make remaining ColdFire 5272 register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:43 +1000
Message-ID: <1348031324-13228-9-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:25418 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107Ab2ISFFL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:05:11 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make the remaining definitions of the 5272 ColdFire registers absolute
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
 arch/m68k/include/asm/m5272sim.h    |   26 +++++++++++++-------------
 arch/m68k/platform/coldfire/m5272.c |    5 +----
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 3a5319e..52d1a33 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -21,11 +21,11 @@
 /*
  *	Define the 5272 SIM register set addresses.
  */
-#define	MCFSIM_SCR		0x04		/* SIM Config reg (r/w) */
-#define	MCFSIM_SPR		0x06		/* System Protection reg (r/w)*/
-#define	MCFSIM_PMR		0x08		/* Power Management reg (r/w) */
-#define	MCFSIM_APMR		0x0e		/* Active Low Power reg (r/w) */
-#define	MCFSIM_DIR		0x10		/* Device Identity reg (r/w) */
+#define	MCFSIM_SCR		(MCF_MBAR + 0x04)	/* SIM Config reg */
+#define	MCFSIM_SPR		(MCF_MBAR + 0x06)	/* System Protection */
+#define	MCFSIM_PMR		(MCF_MBAR + 0x08)	/* Power Management */
+#define	MCFSIM_APMR		(MCF_MBAR + 0x0e)	/* Active Low Power */
+#define	MCFSIM_DIR		(MCF_MBAR + 0x10)	/* Device Identity */
 
 #define	MCFSIM_ICR1		(MCF_MBAR + 0x20)	/* Intr Ctrl reg 1 */
 #define	MCFSIM_ICR2		(MCF_MBAR + 0x24)	/* Intr Ctrl reg 2 */
@@ -59,14 +59,14 @@
 #define	MCFSIM_CSBR7		(MCF_MBAR + 0x78)	/* CS7 Base Address */
 #define	MCFSIM_CSOR7		(MCF_MBAR + 0x7c)	/* CS7 Option */
 
-#define	MCFSIM_SDCR		0x180		/* SDRAM Configuration (r/w) */
-#define	MCFSIM_SDTR		0x184		/* SDRAM Timing (r/w) */
-#define	MCFSIM_DCAR0		0x4c		/* DRAM 0 Address reg(r/w) */
-#define	MCFSIM_DCMR0		0x50		/* DRAM 0 Mask reg (r/w) */
-#define	MCFSIM_DCCR0		0x57		/* DRAM 0 Control reg (r/w) */
-#define	MCFSIM_DCAR1		0x58		/* DRAM 1 Address reg (r/w) */
-#define	MCFSIM_DCMR1		0x5c		/* DRAM 1 Mask reg (r/w) */
-#define	MCFSIM_DCCR1		0x63		/* DRAM 1 Control reg (r/w) */
+#define	MCFSIM_SDCR		(MCF_MBAR + 0x180)	/* SDRAM Config */
+#define	MCFSIM_SDTR		(MCF_MBAR + 0x184)	/* SDRAM Timing */
+#define	MCFSIM_DCAR0		(MCF_MBAR + 0x4c)	/* DRAM 0 Address */
+#define	MCFSIM_DCMR0		(MCF_MBAR + 0x50)	/* DRAM 0 Mask */
+#define	MCFSIM_DCCR0		(MCF_MBAR + 0x57)	/* DRAM 0 Control */
+#define	MCFSIM_DCAR1		(MCF_MBAR + 0x58)	/* DRAM 1 Address */
+#define	MCFSIM_DCMR1		(MCF_MBAR + 0x5c)	/* DRAM 1 Mask reg */
+#define	MCFSIM_DCCR1		(MCF_MBAR + 0x63)	/* DRAM 1 Control */
 
 #define	MCFUART_BASE0		(MCF_MBAR + 0x100) /* Base address UART0 */
 #define	MCFUART_BASE1		(MCF_MBAR + 0x140) /* Base address UART1 */
diff --git a/arch/m68k/platform/coldfire/m5272.c b/arch/m68k/platform/coldfire/m5272.c
index a95680b..eae59f6 100644
--- a/arch/m68k/platform/coldfire/m5272.c
+++ b/arch/m68k/platform/coldfire/m5272.c
@@ -62,11 +62,8 @@ static void m5272_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 #if defined (CONFIG_MOD5272)
-	volatile unsigned char	*pivrp;
-
 	/* Set base of device vectors to be 64 */
-	pivrp = (volatile unsigned char *) (MCF_MBAR + MCFSIM_PIVR);
-	*pivrp = 0x40;
+	writeb(0x40, MCFSIM_PIVR);
 #endif
 
 #if defined(CONFIG_NETtel) || defined(CONFIG_SCALES)
-- 
1.7.0.4
