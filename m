From: <gerg@snapgear.com>
Subject: [PATCH 04/23] m68knommu: make 5249 UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:36 +1000
Message-ID: <1329971695-2203-5-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53724 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2BWEfw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:35:52 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 5249 UART addressing so that:

. UARTs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5249sim.h |    7 +++++--
 arch/m68k/platform/5249/config.c |   12 ++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 805714c..3e31508 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -76,8 +76,8 @@
 /*
  *	UART module.
  */
-#define MCFUART_BASE1		0x1c0           /* Base address of UART1 */
-#define MCFUART_BASE2		0x200           /* Base address of UART2 */
+#define MCFUART_BASE0		(MCF_MBAR + 0x1c0)	/* Base address UART0 */
+#define MCFUART_BASE1		(MCF_MBAR + 0x200)	/* Base address UART1 */
 
 /*
  *	DMA unit base addresses.
@@ -108,6 +108,9 @@
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
 
+#define	MCF_IRQ_UART0		73		/* UART0 */
+#define	MCF_IRQ_UART1		74		/* UART1 */
+
 /*
  *	General purpose IO registers (in MBAR2).
  */
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index ceb31e5..6d779a9 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -24,12 +24,12 @@
 
 static struct mcf_platform_uart m5249_uart_platform[] = {
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
@@ -238,11 +238,11 @@ static void __init m5249_uart_init_line(int line, int irq)
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
