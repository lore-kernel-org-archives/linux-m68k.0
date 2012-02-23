From: <gerg@snapgear.com>
Subject: [PATCH 06/23] m68knommu: make 527x UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:38 +1000
Message-ID: <1329971695-2203-7-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53731 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2BWEfz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:35:55 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 527x UART addressing so that:

. UARTs are numbered from 0 up
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h |   10 +++++++---
 arch/m68k/platform/527x/config.c |   12 ++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 758810e..7399968 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -40,6 +40,10 @@
 #define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
 #define	MCFINT_PIT1		36		/* Interrupt number for PIT1 */
 
+#define	MCF_IRQ_UART0	        (MCFINT_VECBASE + MCFINT_UART0)
+#define	MCF_IRQ_UART1	        (MCFINT_VECBASE + MCFINT_UART1)
+#define	MCF_IRQ_UART2	        (MCFINT_VECBASE + MCFINT_UART2)
+
 /*
  *	SDRAM configuration registers.
  */
@@ -72,9 +76,9 @@
 /*
  *	UART module.
  */
-#define MCFUART_BASE1		(MCF_IPSBAR + 0x200)
-#define MCFUART_BASE2		(MCF_IPSBAR + 0x240)
-#define MCFUART_BASE3		(MCF_IPSBAR + 0x280)
+#define MCFUART_BASE0		(MCF_IPSBAR + 0x200)
+#define MCFUART_BASE1		(MCF_IPSBAR + 0x240)
+#define MCFUART_BASE2		(MCF_IPSBAR + 0x280)
 
 /*
  *	FEC ethernet module.
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 3ebc769..1f2df30 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -28,16 +28,16 @@
 
 static struct mcf_platform_uart m527x_uart_platform[] = {
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
