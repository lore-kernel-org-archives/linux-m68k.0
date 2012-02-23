From: <gerg@snapgear.com>
Subject: [PATCH 01/23] m68knommu: make 5206 UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:33 +1000
Message-ID: <1329971695-2203-2-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17776 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753138Ab2BWEeV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:21 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 5206 UART addressing so that:

. UARTs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5206sim.h |   10 ++++++----
 arch/m68k/platform/5206/config.c |   12 ++++++------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 9015ead..6972236 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -100,11 +100,11 @@
 #define	MCFDMA_BASE1		(MCF_MBAR + 0x240)	/* Base address DMA 1 */
 
 #if defined(CONFIG_NETtel)
-#define	MCFUART_BASE1		0x180		/* Base address of UART1 */
-#define	MCFUART_BASE2		0x140		/* Base address of UART2 */
+#define	MCFUART_BASE0		(MCF_MBAR + 0x180)	/* Base address UART0 */
+#define	MCFUART_BASE1		(MCF_MBAR + 0x140)	/* Base address UART1 */
 #else
-#define	MCFUART_BASE1		0x140		/* Base address of UART1 */
-#define	MCFUART_BASE2		0x180		/* Base address of UART2 */
+#define	MCFUART_BASE0		(MCF_MBAR + 0x140)	/* Base address UART0 */
+#define	MCFUART_BASE1		(MCF_MBAR + 0x180)	/* Base address UART1 */
 #endif
 
 /*
@@ -112,6 +112,8 @@
  */
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
+#define	MCF_IRQ_UART0		73		/* UART0 */
+#define	MCF_IRQ_UART1		74		/* UART1 */
 
 /*
  *	Generic GPIO
diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 6fa3f80..e21608c 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -22,12 +22,12 @@
 
 static struct mcf_platform_uart m5206_uart_platform[] = {
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
-		.irq		= 73,
+		.mapbase	= MCFUART_BASE0,
+		.irq		= MCF_IRQ_UART0,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE2,
-		.irq		= 74,
+		.mapbase 	= MCFUART_BASE1,
+		.irq		= MCF_IRQ_UART1,
 	},
 	{ },
 };
@@ -48,11 +48,11 @@ static void __init m5206_uart_init_line(int line, int irq)
 {
 	if (line == 0) {
 		writel(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-		writeb(irq, MCFUART_BASE1 + MCFUART_UIVR);
+		writeb(irq, MCFUART_BASE0 + MCFUART_UIVR);
 		mcf_mapirq2imr(irq, MCFINTC_UART0);
 	} else if (line == 1) {
 		writel(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-		writeb(irq, MCFUART_BASE2 + MCFUART_UIVR);
+		writeb(irq, MCFUART_BASE1 + MCFUART_UIVR);
 		mcf_mapirq2imr(irq, MCFINTC_UART1);
 	}
 }
-- 
1.7.0.4
