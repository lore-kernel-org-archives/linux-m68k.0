From: <gerg@snapgear.com>
Subject: [PATCH 16/23] m68knommu: simplify the 527x UART setup code
Date: Thu, 23 Feb 2012 14:34:48 +1000
Message-ID: <1329971695-2203-17-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53745 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754026Ab2BWEgC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:36:02 -0500
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
 arch/m68k/platform/527x/config.c |   21 ++-------------------
 1 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 1f2df30..2a8e6b8 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -295,35 +295,18 @@ static struct platform_device *m527x_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m527x_uart_init_line(int line, int irq)
+static void __init m527x_uarts_init(void)
 {
 	u16 sepmask;
 
-	if ((line < 0) || (line > 2))
-		return;
-
 	/*
 	 * External Pin Mask Setting & Enable External Pin for Interface
 	 */
 	sepmask = readw(MCF_IPSBAR + MCF_GPIO_PAR_UART);
-	if (line == 0)
-		sepmask |= UART0_ENABLE_MASK;
-	else if (line == 1)
-		sepmask |= UART1_ENABLE_MASK;
-	else if (line == 2)
-		sepmask |= UART2_ENABLE_MASK;
+	sepmask |= UART0_ENABLE_MASK | UART1_ENABLE_MASK | UART2_ENABLE_MASK;
 	writew(sepmask, MCF_IPSBAR + MCF_GPIO_PAR_UART);
 }
 
-static void __init m527x_uarts_init(void)
-{
-	const int nrlines = ARRAY_SIZE(m527x_uart_platform);
-	int line;
-
-	for (line = 0; (line < nrlines); line++)
-		m527x_uart_init_line(line, m527x_uart_platform[line].irq);
-}
-
 /***************************************************************************/
 
 static void __init m527x_fec_init(void)
-- 
1.7.0.4
