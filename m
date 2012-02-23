From: <gerg@snapgear.com>
Subject: [PATCH 08/23] m68knommu: make 528x UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:40 +1000
Message-ID: <1329971695-2203-9-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53738 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2BWEf7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:35:59 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 528x UART addressing so that:

. UARTs are numbered from 0 up
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m528xsim.h |   12 +++++++++---
 arch/m68k/platform/528x/config.c |   12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index d798bd5..a5f0c14 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -35,9 +35,15 @@
 
 #define	MCFINT_VECBASE		64		/* Vector base number */
 #define	MCFINT_UART0		13		/* Interrupt number for UART0 */
+#define	MCFINT_UART1		14		/* Interrupt number for UART1 */
+#define	MCFINT_UART2		15		/* Interrupt number for UART2 */
 #define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
 #define	MCFINT_PIT1		55		/* Interrupt number for PIT1 */
 
+#define	MCF_IRQ_UART0	        (MCFINT_VECBASE + MCFINT_UART0)
+#define	MCF_IRQ_UART1	        (MCFINT_VECBASE + MCFINT_UART1)
+#define	MCF_IRQ_UART2	        (MCFINT_VECBASE + MCFINT_UART2)
+
 /*
  *	SDRAM configuration registers.
  */
@@ -58,9 +64,9 @@
 /*
  *	UART module.
  */
-#define	MCFUART_BASE1		(MCF_IPSBAR + 0x00000200)
-#define	MCFUART_BASE2		(MCF_IPSBAR + 0x00000240)
-#define	MCFUART_BASE3		(MCF_IPSBAR + 0x00000280)
+#define	MCFUART_BASE0		(MCF_IPSBAR + 0x00000200)
+#define	MCFUART_BASE1		(MCF_IPSBAR + 0x00000240)
+#define	MCFUART_BASE2		(MCF_IPSBAR + 0x00000280)
 
 /*
  *	FEC ethernet module.
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 7abe77a..8746fb3 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -29,16 +29,16 @@
 
 static struct mcf_platform_uart m528x_uart_platform[] = {
 	{
-		.mapbase	= MCFUART_BASE1,
-		.irq		= MCFINT_VECBASE + MCFINT_UART0,
+		.mapbase	= MCFUART_BASE0,
+		.irq		= MCF_IRQ_UART0,
 	},
 	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCFINT_VECBASE + MCFINT_UART0 + 1,
+		.mapbase 	= MCFUART_BASE1,
+		.irq		= MCF_IRQ_UART1,
 	},
 	{
-		.mapbase 	= MCFUART_BASE3,
-		.irq		= MCFINT_VECBASE + MCFINT_UART0 + 2,
+		.mapbase 	= MCFUART_BASE2,
+		.irq		= MCF_IRQ_UART2,
 	},
 	{ },
 };
-- 
1.7.0.4
