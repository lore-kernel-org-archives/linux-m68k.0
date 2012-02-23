From: <gerg@snapgear.com>
Subject: [PATCH 18/23] m68knommu: simplify the 5307 UART setup code
Date: Thu, 23 Feb 2012 14:34:50 +1000
Message-ID: <1329971695-2203-19-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17811 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799Ab2BWEem (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:42 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Simplify the UART setup code so that it no longer loops for each UART
present. Just make it do all the work it needs in a single function.
This will make the code easier to share when we move to a single set
of platform data for ColdFire UARTs.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/5307/config.c |   25 ++++++++-----------------
 1 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index 6f89c31..542b76a 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -53,26 +53,17 @@ static struct platform_device *m5307_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m5307_uart_init_line(int line, int irq)
-{
-	if (line == 0) {
-		writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-		writeb(irq, MCFUART_BASE0 + MCFUART_UIVR);
-		mcf_mapirq2imr(irq, MCFINTC_UART0);
-	} else if (line == 1) {
-		writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-		writeb(irq, MCFUART_BASE1 + MCFUART_UIVR);
-		mcf_mapirq2imr(irq, MCFINTC_UART1);
-	}
-}
-
 static void __init m5307_uarts_init(void)
 {
-	const int nrlines = ARRAY_SIZE(m5307_uart_platform);
-	int line;
-
-	for (line = 0; (line < nrlines); line++)
-		m5307_uart_init_line(line, m5307_uart_platform[line].irq);
+	/* UART0 interrupt setup */
+	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
+	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
+	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
+
+	/* UART1 interrupt setup */
+	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
+	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
+	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
