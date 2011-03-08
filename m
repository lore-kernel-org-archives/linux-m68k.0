From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 07/12] m68knommu: remove use of MBAR value for ColdFire 527x peripheral addressing
Date: Tue, 8 Mar 2011 23:04:04 +1000
Message-ID: <1299589449-24974-8-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
 <1299589449-24974-7-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51453 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754468Ab1CHNHv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:07:51 -0500
In-Reply-To: <1299589449-24974-7-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The ColdFire 527x family of CPUs does not have an MBAR register, so don't
define its peripheral addresses relative to one. Its internal peripherals
are relative to the IPSBAR register, so make sure to use that.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h      |   14 +++++++++++---
 arch/m68knommu/platform/527x/config.c |   14 +++++++-------
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index cb7df04..d299552 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -63,9 +63,17 @@
 /*
  *	UART module.
  */
-#define MCFUART_BASE1		0x200           /* Base address of UART1 */
-#define MCFUART_BASE2		0x240           /* Base address of UART2 */
-#define MCFUART_BASE3		0x280           /* Base address of UART3 */
+#define MCFUART_BASE1		(MCF_IPSBAR + 0x200)
+#define MCFUART_BASE2		(MCF_IPSBAR + 0x240)
+#define MCFUART_BASE3		(MCF_IPSBAR + 0x280)
+
+/*
+ *	FEC ethernet module.
+ */
+#define	MCFFEC_BASE0		(MCF_IPSBAR + 0x1000)
+#define	MCFFEC_SIZE0		0x800
+#define	MCFFEC_BASE1		(MCF_IPSBAR + 0x1800)
+#define	MCFFEC_SIZE1		0x800
 
 #ifdef CONFIG_M5271
 #define MCFGPIO_PODR_ADDR	(MCF_IPSBAR + 0x100000)
diff --git a/arch/m68knommu/platform/527x/config.c b/arch/m68knommu/platform/527x/config.c
index 3d9c35c..fa35959 100644
--- a/arch/m68knommu/platform/527x/config.c
+++ b/arch/m68knommu/platform/527x/config.c
@@ -28,15 +28,15 @@
 
 static struct mcf_platform_uart m527x_uart_platform[] = {
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
+		.mapbase	= MCFUART_BASE1,
 		.irq		= MCFINT_VECBASE + MCFINT_UART0,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE2,
+		.mapbase 	= MCFUART_BASE2,
 		.irq		= MCFINT_VECBASE + MCFINT_UART1,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE3,
+		.mapbase 	= MCFUART_BASE3,
 		.irq		= MCFINT_VECBASE + MCFINT_UART2,
 	},
 	{ },
@@ -50,8 +50,8 @@ static struct platform_device m527x_uart = {
 
 static struct resource m527x_fec0_resources[] = {
 	{
-		.start		= MCF_MBAR + 0x1000,
-		.end		= MCF_MBAR + 0x1000 + 0x7ff,
+		.start		= MCFFEC_BASE0,
+		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
@@ -73,8 +73,8 @@ static struct resource m527x_fec0_resources[] = {
 
 static struct resource m527x_fec1_resources[] = {
 	{
-		.start		= MCF_MBAR + 0x1800,
-		.end		= MCF_MBAR + 0x1800 + 0x7ff,
+		.start		= MCFFEC_BASE1,
+		.end		= MCFFEC_BASE1 + MCFFEC_SIZE1 - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-- 
1.7.0.4
