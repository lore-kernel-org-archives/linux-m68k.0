From: <gerg@snapgear.com>
Subject: [PATCH 21/23] m68knommu: simplify the 54xx UART setup code
Date: Thu, 23 Feb 2012 14:34:53 +1000
Message-ID: <1329971695-2203-22-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17827 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799Ab2BWEeu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:50 -0500
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
 arch/m68k/platform/54xx/config.c |   33 +++++++++------------------------
 1 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index 8a63283..026bb75 100644
--- a/arch/m68k/platform/54xx/config.c
+++ b/arch/m68k/platform/54xx/config.c
@@ -59,32 +59,17 @@ static struct platform_device *m54xx_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m54xx_uart_init_line(int line, int irq)
-{
-	int rts_cts;
-
-	/* enable io pins */
-	switch (line) {
-	case 0:
-		rts_cts = 0; break;
-	case 1:
-		rts_cts = MCF_PAR_PSC_RTS_RTS; break;
-	case 2:
-		rts_cts = MCF_PAR_PSC_RTS_RTS | MCF_PAR_PSC_CTS_CTS; break;
-	case 3:
-		rts_cts = 0; break;
-	}
-	__raw_writeb(MCF_PAR_PSC_TXD | rts_cts | MCF_PAR_PSC_RXD,
-						MCF_MBAR + MCF_PAR_PSC(line));
-}
-
 static void __init m54xx_uarts_init(void)
 {
-	const int nrlines = ARRAY_SIZE(m54xx_uart_platform);
-	int line;
-
-	for (line = 0; (line < nrlines); line++)
-		m54xx_uart_init_line(line, m54xx_uart_platform[line].irq);
+	/* enable io pins */
+	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD,
+		MCF_MBAR + MCF_PAR_PSC(0));
+	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS,
+		MCF_MBAR + MCF_PAR_PSC(1));
+	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS |
+		MCF_PAR_PSC_CTS_CTS, MCF_MBAR + MCF_PAR_PSC(2));
+	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD,
+		MCF_MBAR + MCF_PAR_PSC(3));
 }
 
 /***************************************************************************/
-- 
1.7.0.4
