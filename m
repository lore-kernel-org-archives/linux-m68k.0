From: <gerg@snapgear.com>
Subject: [PATCH 19/23] m68knommu: simplify the 532x UART setup code
Date: Thu, 23 Feb 2012 14:34:51 +1000
Message-ID: <1329971695-2203-20-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17818 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799Ab2BWEeo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:44 -0500
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
 arch/m68k/platform/532x/config.c |   19 +++----------------
 1 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 4aba0fa..2203ac9 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -210,25 +210,12 @@ static struct platform_device *m532x_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m532x_uart_init_line(int line, int irq)
-{
-	if (line == 0) {
-		/* GPIO initialization */
-		MCF_GPIO_PAR_UART |= 0x000F;
-	} else if (line == 1) {
-		/* GPIO initialization */
-		MCF_GPIO_PAR_UART |= 0x0FF0;
-	}
-}
-
 static void __init m532x_uarts_init(void)
 {
-	const int nrlines = ARRAY_SIZE(m532x_uart_platform);
-	int line;
-
-	for (line = 0; (line < nrlines); line++)
-		m532x_uart_init_line(line, m532x_uart_platform[line].irq);
+	/* UART GPIO initialization */
+	MCF_GPIO_PAR_UART |= 0x0FFF;
 }
+
 /***************************************************************************/
 
 static void __init m532x_fec_init(void)
-- 
1.7.0.4
