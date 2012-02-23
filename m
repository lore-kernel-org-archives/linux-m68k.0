From: <gerg@snapgear.com>
Subject: [PATCH 11/23] m68knommu: make 54xx UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:43 +1000
Message-ID: <1329971695-2203-12-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17797 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753496Ab2BWEeg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:36 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 54xx UART addressing so that:

. UARTs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m54xxsim.h |   16 ++++++++++------
 arch/m68k/platform/54xx/config.c |   16 ++++++++--------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index 1ed8bfb..ae56b88 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -31,16 +31,20 @@
 /*
  *	UART module.
  */
-#define MCFUART_BASE1		0x8600		/* Base address of UART1 */
-#define MCFUART_BASE2		0x8700		/* Base address of UART2 */
-#define MCFUART_BASE3		0x8800		/* Base address of UART3 */
-#define MCFUART_BASE4		0x8900		/* Base address of UART4 */
+#define MCFUART_BASE0		(MCF_MBAR + 0x8600)	/* Base address UART0 */
+#define MCFUART_BASE1		(MCF_MBAR + 0x8700)	/* Base address UART1 */
+#define MCFUART_BASE2		(MCF_MBAR + 0x8800)	/* Base address UART2 */
+#define MCFUART_BASE3		(MCF_MBAR + 0x8900)	/* Base address UART3 */
 
 /*
  *	Define system peripheral IRQ usage.
  */
-#define MCF_IRQ_TIMER		(64 + 54)	/* Slice Timer 0 */
-#define MCF_IRQ_PROFILER	(64 + 53)	/* Slice Timer 1 */
+#define MCF_IRQ_TIMER		(MCFINT_VECBASE + 54)	/* Slice Timer 0 */
+#define MCF_IRQ_PROFILER	(MCFINT_VECBASE + 53)	/* Slice Timer 1 */
+#define MCF_IRQ_UART0		(MCFINT_VECBASE + 35)
+#define MCF_IRQ_UART1		(MCFINT_VECBASE + 34)
+#define MCF_IRQ_UART2		(MCFINT_VECBASE + 33)
+#define MCF_IRQ_UART3		(MCFINT_VECBASE + 32)
 
 /*
  *	Generic GPIO support
diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index ee04354..8a63283 100644
--- a/arch/m68k/platform/54xx/config.c
+++ b/arch/m68k/platform/54xx/config.c
@@ -29,20 +29,20 @@
 
 static struct mcf_platform_uart m54xx_uart_platform[] = {
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
-		.irq		= 64 + 35,
+		.mapbase	= MCFUART_BASE0,
+		.irq		= MCF_IRQ_UART0,
 	},
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE2,
-		.irq		= 64 + 34,
+		.mapbase	= MCFUART_BASE1,
+		.irq		= MCF_IRQ_UART1,
 	},
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE3,
-		.irq		= 64 + 33,
+		.mapbase	= MCFUART_BASE2,
+		.irq		= MCF_IRQ_UART2,
 	},
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE4,
-		.irq		= 64 + 32,
+		.mapbase	= MCFUART_BASE3,
+		.irq		= MCF_IRQ_UART3,
 	},
 };
 
-- 
1.7.0.4
