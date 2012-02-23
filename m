From: <gerg@snapgear.com>
Subject: [PATCH 02/23] m68knommu: make 520x UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:34 +1000
Message-ID: <1329971695-2203-3-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53723 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754012Ab2BWEfv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:35:51 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 520x UART addressing so that:

. UARTs are numbered from 0 up
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h |   10 +++++++---
 arch/m68k/platform/520x/config.c |   12 ++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index eda62de..41ed4dc 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -50,6 +50,10 @@
 #define MCFINT_QSPI         31          /* Interrupt number for QSPI */
 #define MCFINT_PIT1         4           /* Interrupt number for PIT1 (PIT0 in processor) */
 
+#define MCF_IRQ_UART0	    (MCFINT_VECBASE + MCFINT_UART0)
+#define MCF_IRQ_UART1	    (MCFINT_VECBASE + MCFINT_UART1)
+#define MCF_IRQ_UART2	    (MCFINT_VECBASE + MCFINT_UART2)
+
 /*
  *  SDRAM configuration registers.
  */
@@ -144,9 +148,9 @@
 /*
  *  UART module.
  */
-#define MCFUART_BASE1		0xFC060000	/* Base address of UART1 */
-#define MCFUART_BASE2		0xFC064000	/* Base address of UART2 */
-#define MCFUART_BASE3		0xFC068000	/* Base address of UART2 */
+#define MCFUART_BASE0		0xFC060000	/* Base address of UART0 */
+#define MCFUART_BASE1		0xFC064000	/* Base address of UART1 */
+#define MCFUART_BASE2		0xFC068000	/* Base address of UART2 */
 
 /*
  *  FEC module.
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 8a98683..9dc4870 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -27,16 +27,16 @@
 
 static struct mcf_platform_uart m520x_uart_platform[] = {
 	{
-		.mapbase	= MCFUART_BASE1,
-		.irq		= MCFINT_VECBASE + MCFINT_UART0,
+		.mapbase	= MCFUART_BASE0,
+		.irq		= MCF_IRQ_UART0,
 	},
 	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCFINT_VECBASE + MCFINT_UART1,
+		.mapbase 	= MCFUART_BASE1,
+		.irq		= MCF_IRQ_UART1,
 	},
 	{
-		.mapbase 	= MCFUART_BASE3,
-		.irq		= MCFINT_VECBASE + MCFINT_UART2,
+		.mapbase 	= MCFUART_BASE2,
+		.irq		= MCF_IRQ_UART2,
 	},
 	{ },
 };
-- 
1.7.0.4
