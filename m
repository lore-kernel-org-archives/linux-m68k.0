From: <gerg@snapgear.com>
Subject: [PATCH 15/23] m68knommu: simplify the 5272 UART setup code
Date: Thu, 23 Feb 2012 14:34:47 +1000
Message-ID: <1329971695-2203-16-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17802 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799Ab2BWEei (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:38 -0500
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
 arch/m68k/platform/5272/config.c |   27 ++++++++-------------------
 1 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index 99b499e..9074411 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -85,29 +85,18 @@ static struct platform_device *m5272_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m5272_uart_init_line(int line, int irq)
+static void __init m5272_uarts_init(void)
 {
 	u32 v;
 
-	if ((line >= 0) && (line < 2)) {
-		/* Enable the output lines for the serial ports */
-		v = readl(MCF_MBAR + MCFSIM_PBCNT);
-		v = (v & ~0x000000ff) | 0x00000055;
-		writel(v, MCF_MBAR + MCFSIM_PBCNT);
-
-		v = readl(MCF_MBAR + MCFSIM_PDCNT);
-		v = (v & ~0x000003fc) | 0x000002a8;
-		writel(v, MCF_MBAR + MCFSIM_PDCNT);
-	}
-}
-
-static void __init m5272_uarts_init(void)
-{
-	const int nrlines = ARRAY_SIZE(m5272_uart_platform);
-	int line;
+	/* Enable the output lines for the serial ports */
+	v = readl(MCF_MBAR + MCFSIM_PBCNT);
+	v = (v & ~0x000000ff) | 0x00000055;
+	writel(v, MCF_MBAR + MCFSIM_PBCNT);
 
-	for (line = 0; (line < nrlines); line++)
-		m5272_uart_init_line(line, m5272_uart_platform[line].irq);
+	v = readl(MCF_MBAR + MCFSIM_PDCNT);
+	v = (v & ~0x000003fc) | 0x000002a8;
+	writel(v, MCF_MBAR + MCFSIM_PDCNT);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
