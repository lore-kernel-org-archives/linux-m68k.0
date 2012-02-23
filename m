From: <gerg@snapgear.com>
Subject: [PATCH 05/23] m68knommu: make 5272 UART platform addressing consistent
Date: Thu, 23 Feb 2012 14:34:37 +1000
Message-ID: <1329971695-2203-6-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17786 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753400Ab2BWEe0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:26 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all UART addressing consistent across all ColdFire family members
then we will be able to remove the duplicated plaform data and use a single
setup for all.

So modify the ColdFire 5272 UART addressing so that:

. UARTs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5272sim.h |    8 ++++----
 arch/m68k/platform/5272/config.c |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 759c2b0..5c71bd4 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -68,8 +68,8 @@
 #define	MCFSIM_DCMR1		0x5c		/* DRAM 1 Mask reg (r/w) */
 #define	MCFSIM_DCCR1		0x63		/* DRAM 1 Control reg (r/w) */
 
-#define	MCFUART_BASE1		0x100		/* Base address of UART1 */
-#define	MCFUART_BASE2		0x140		/* Base address of UART2 */
+#define	MCFUART_BASE0		(MCF_MBAR + 0x100) /* Base address UART0 */
+#define	MCFUART_BASE1		(MCF_MBAR + 0x140) /* Base address UART1 */
 
 #define	MCFSIM_PACNT		(MCF_MBAR + 0x80) /* Port A Control (r/w) */
 #define	MCFSIM_PADDR		(MCF_MBAR + 0x84) /* Port A Direction (r/w) */
@@ -101,8 +101,8 @@
 #define	MCF_IRQ_TIMER2		70		/* Timer 2 */
 #define	MCF_IRQ_TIMER3		71		/* Timer 3 */
 #define	MCF_IRQ_TIMER4		72		/* Timer 4 */
-#define	MCF_IRQ_UART1		73		/* UART 1 */
-#define	MCF_IRQ_UART2		74		/* UART 2 */
+#define	MCF_IRQ_UART0		73		/* UART 0 */
+#define	MCF_IRQ_UART1		74		/* UART 1 */
 #define	MCF_IRQ_PLIP		75		/* PLIC 2Khz Periodic */
 #define	MCF_IRQ_PLIA		76		/* PLIC Asynchronous */
 #define	MCF_IRQ_USB0		77		/* USB Endpoint 0 */
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index 65bb582..99b499e 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -32,12 +32,12 @@ unsigned char ledbank = 0xff;
 
 static struct mcf_platform_uart m5272_uart_platform[] = {
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
+		.mapbase	= MCFUART_BASE0,
+		.irq		= MCF_IRQ_UART0,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
+		.mapbase 	= MCFUART_BASE1,
+		.irq		= MCF_IRQ_UART1,
 	},
 	{ },
 };
-- 
1.7.0.4
