From: <gerg@snapgear.com>
Subject: [PATCH 13/23] m68knommu: simplify the 520x UART setup code
Date: Thu, 23 Feb 2012 14:34:45 +1000
Message-ID: <1329971695-2203-14-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53742 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2BWEgA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:36:00 -0500
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
 arch/m68k/platform/520x/config.c |   42 ++++++++++---------------------------
 1 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 9dc4870..c578f47 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -227,41 +227,23 @@ static struct platform_device *m520x_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m520x_uart_init_line(int line, int irq)
+static void __init m520x_uarts_init(void)
 {
 	u16 par;
 	u8 par2;
 
-	switch (line) {
-	case 0:
-		par = readw(MCF_GPIO_PAR_UART);
-		par |= MCF_GPIO_PAR_UART_PAR_UTXD0 |
-		       MCF_GPIO_PAR_UART_PAR_URXD0;
-		writew(par, MCF_GPIO_PAR_UART);
-		break;
-	case 1:
-		par = readw(MCF_GPIO_PAR_UART);
-		par |= MCF_GPIO_PAR_UART_PAR_UTXD1 |
-		       MCF_GPIO_PAR_UART_PAR_URXD1;
-		writew(par, MCF_GPIO_PAR_UART);
-		break;
-	case 2:
-		par2 = readb(MCF_GPIO_PAR_FECI2C);
-		par2 &= ~0x0F;
-		par2 |= MCF_GPIO_PAR_FECI2C_PAR_SCL_UTXD2 |
-			MCF_GPIO_PAR_FECI2C_PAR_SDA_URXD2;
-		writeb(par2, MCF_GPIO_PAR_FECI2C);
-		break;
-	}
-}
-
-static void __init m520x_uarts_init(void)
-{
-	const int nrlines = ARRAY_SIZE(m520x_uart_platform);
-	int line;
+	/* UART0 and UART1 GPIO pin setup */
+	par = readw(MCF_GPIO_PAR_UART);
+	par |= MCF_GPIO_PAR_UART_PAR_UTXD0 | MCF_GPIO_PAR_UART_PAR_URXD0;
+	par |= MCF_GPIO_PAR_UART_PAR_UTXD1 | MCF_GPIO_PAR_UART_PAR_URXD1;
+	writew(par, MCF_GPIO_PAR_UART);
 
-	for (line = 0; (line < nrlines); line++)
-		m520x_uart_init_line(line, m520x_uart_platform[line].irq);
+	/* UART1 GPIO pin setup */
+	par2 = readb(MCF_GPIO_PAR_FECI2C);
+	par2 &= ~0x0F;
+	par2 |= MCF_GPIO_PAR_FECI2C_PAR_SCL_UTXD2 |
+		MCF_GPIO_PAR_FECI2C_PAR_SDA_URXD2;
+	writeb(par2, MCF_GPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
