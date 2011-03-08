From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 08/12] m68knommu: remove use of MBAR value for ColdFire 528x peripheral addressing
Date: Tue, 8 Mar 2011 23:04:05 +1000
Message-ID: <1299589449-24974-9-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
 <1299589449-24974-7-git-send-email-gerg@uclinux.org>
 <1299589449-24974-8-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51456 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754734Ab1CHNHw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:07:52 -0500
In-Reply-To: <1299589449-24974-8-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The ColdFire 528x family of CPUs does not have an MBAR register, so don't
define its peripheral addresses relative to one. Its internal peripherals
are relative to the IPSBAR register, so make sure to use that.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m528xsim.h      |   12 +++++++++---
 arch/m68knommu/platform/528x/config.c |   14 +++++++-------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index 014098a..d7c9241 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -49,9 +49,15 @@
 /*
  *	UART module.
  */
-#define MCFUART_BASE1		0x200           /* Base address of UART1 */
-#define MCFUART_BASE2		0x240           /* Base address of UART2 */
-#define MCFUART_BASE3		0x280           /* Base address of UART3 */
+#define	MCFUART_BASE1		(MCF_IPSBAR + 0x00000200)
+#define	MCFUART_BASE2		(MCF_IPSBAR + 0x00000240)
+#define	MCFUART_BASE3		(MCF_IPSBAR + 0x00000280)
+
+/*
+ *	FEC ethernet module.
+ */
+#define	MCFFEC_BASE		(MCF_IPSBAR + 0x00001000)
+#define	MCFFEC_SIZE		0x800
 
 /*
  * 	GPIO registers
diff --git a/arch/m68knommu/platform/528x/config.c b/arch/m68knommu/platform/528x/config.c
index 76b7433..ac39fc6 100644
--- a/arch/m68knommu/platform/528x/config.c
+++ b/arch/m68knommu/platform/528x/config.c
@@ -29,15 +29,15 @@
 
 static struct mcf_platform_uart m528x_uart_platform[] = {
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
+		.mapbase	= MCFUART_BASE1,
 		.irq		= MCFINT_VECBASE + MCFINT_UART0,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE2,
+		.mapbase 	= MCFUART_BASE2,
 		.irq		= MCFINT_VECBASE + MCFINT_UART0 + 1,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE3,
+		.mapbase 	= MCFUART_BASE3,
 		.irq		= MCFINT_VECBASE + MCFINT_UART0 + 2,
 	},
 	{ },
@@ -51,8 +51,8 @@ static struct platform_device m528x_uart = {
 
 static struct resource m528x_fec_resources[] = {
 	{
-		.start		= MCF_MBAR + 0x1000,
-		.end		= MCF_MBAR + 0x1000 + 0x7ff,
+		.start		= MCFFEC_BASE,
+		.end		= MCFFEC_BASE + MCFFEC_SIZE - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
@@ -227,9 +227,9 @@ static void __init m528x_uart_init_line(int line, int irq)
 
 	/* make sure PUAPAR is set for UART0 and UART1 */
 	if (line < 2) {
-		port = readb(MCF_MBAR + MCF5282_GPIO_PUAPAR);
+		port = readb(MCF5282_GPIO_PUAPAR);
 		port |= (0x03 << (line * 2));
-		writeb(port, MCF_MBAR + MCF5282_GPIO_PUAPAR);
+		writeb(port, MCF5282_GPIO_PUAPAR);
 	}
 }
 
-- 
1.7.0.4
