From: <gerg@snapgear.com>
Subject: [PATCH 07/23] m68knommu: make 5307 UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:39 +1000
Message-ID: <1329971695-2203-8-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17788 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753496Ab2BWEe2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:28 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 5307 UART addressing so that:

. UARTs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5307sim.h |   10 ++++++----
 arch/m68k/platform/5307/config.c |   12 ++++++------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 8f8609f..3bc3ada 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -117,11 +117,11 @@
  *  UART module.
  */
 #if defined(CONFIG_NETtel) || defined(CONFIG_SECUREEDGEMP3)
-#define MCFUART_BASE1		0x200           /* Base address of UART1 */
-#define MCFUART_BASE2		0x1c0           /* Base address of UART2 */
+#define MCFUART_BASE0		(MCF_MBAR + 0x200)	/* Base address UART0 */
+#define MCFUART_BASE1		(MCF_MBAR + 0x1c0)	/* Base address UART1 */
 #else
-#define MCFUART_BASE1		0x1c0           /* Base address of UART1 */
-#define MCFUART_BASE2		0x200           /* Base address of UART2 */
+#define MCFUART_BASE0		(MCF_MBAR + 0x1c0)	/* Base address UART0 */
+#define MCFUART_BASE1		(MCF_MBAR + 0x200)	/* Base address UART1 */
 #endif
 
 /*
@@ -176,6 +176,8 @@
  */
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
+#define	MCF_IRQ_UART0		73		/* UART0 */
+#define	MCF_IRQ_UART1		74		/* UART1 */
 
 /****************************************************************************/
 #endif	/* m5307sim_h */
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index 00900ac..6f89c31 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -31,12 +31,12 @@ unsigned char ledbank = 0xff;
 
 static struct mcf_platform_uart m5307_uart_platform[] = {
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
@@ -57,11 +57,11 @@ static void __init m5307_uart_init_line(int line, int irq)
 {
 	if (line == 0) {
 		writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-		writeb(irq, MCF_MBAR + MCFUART_BASE1 + MCFUART_UIVR);
+		writeb(irq, MCFUART_BASE0 + MCFUART_UIVR);
 		mcf_mapirq2imr(irq, MCFINTC_UART0);
 	} else if (line == 1) {
 		writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-		writeb(irq, MCF_MBAR + MCFUART_BASE2 + MCFUART_UIVR);
+		writeb(irq, MCFUART_BASE1 + MCFUART_UIVR);
 		mcf_mapirq2imr(irq, MCFINTC_UART1);
 	}
 }
-- 
1.7.0.4
