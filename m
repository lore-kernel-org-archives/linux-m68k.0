From: <gerg@snapgear.com>
Subject: [PATCH 09/23] m68knommu: make 532x UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:41 +1000
Message-ID: <1329971695-2203-10-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17795 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753400Ab2BWEef (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:35 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 532x UART addressing so that:

. UARTs are numbered from 0 up
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m532xsim.h |   10 +++++++---
 arch/m68k/platform/532x/config.c |   12 ++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m532xsim.h
index ba4cc78..f963d64 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m532xsim.h
@@ -25,6 +25,10 @@
 #define MCFINT_UART2        28          /* Interrupt number for UART2 */
 #define MCFINT_QSPI         31          /* Interrupt number for QSPI */
 
+#define MCF_IRQ_UART0       (MCFINT_VECBASE + MCFINT_UART0)
+#define MCF_IRQ_UART1       (MCFINT_VECBASE + MCFINT_UART1)
+#define MCF_IRQ_UART2       (MCFINT_VECBASE + MCFINT_UART2)
+
 #define MCF_WTM_WCR	MCF_REG16(0xFC098000)
 
 /*
@@ -82,9 +86,9 @@
 /*
  *  UART module.
  */
-#define MCFUART_BASE1		0xFC060000	/* Base address of UART1 */
-#define MCFUART_BASE2		0xFC064000	/* Base address of UART2 */
-#define MCFUART_BASE3		0xFC068000	/* Base address of UART3 */
+#define MCFUART_BASE0		0xFC060000	/* Base address of UART1 */
+#define MCFUART_BASE1		0xFC064000	/* Base address of UART2 */
+#define MCFUART_BASE2		0xFC068000	/* Base address of UART3 */
 
 /*
  *  Timer module.
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index ca51323..4aba0fa 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -35,16 +35,16 @@
 
 static struct mcf_platform_uart m532x_uart_platform[] = {
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
