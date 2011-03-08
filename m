From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 06/12] m68knommu: remove use of MBAR value for ColdFire 523x peripheral addressing
Date: Tue, 8 Mar 2011 23:04:03 +1000
Message-ID: <1299589449-24974-7-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51451 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754468Ab1CHNHs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:07:48 -0500
In-Reply-To: <1299589449-24974-6-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The ColdFire 523x family of CPUs does not have an MBAR register, so don't
define its peripheral addresses relative to one. Its internal peripherals
are relative to the IPSBAR register, so make sure to use that.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h      |   15 ++++++++++++---
 arch/m68knommu/platform/523x/config.c |   10 +++++-----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 6be94f6..6e5c17a 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -58,10 +58,19 @@
 /*
  *  UART module.
  */
-#define MCFUART_BASE1		0x200           /* Base address of UART1 */
-#define MCFUART_BASE2		0x240           /* Base address of UART2 */
-#define MCFUART_BASE3		0x280           /* Base address of UART3 */
+#define MCFUART_BASE1		(MCF_IPSBAR + 0x200)
+#define MCFUART_BASE2		(MCF_IPSBAR + 0x240)
+#define MCFUART_BASE3		(MCF_IPSBAR + 0x280)
 
+/*
+ *  FEC ethernet module.
+ */
+#define	MCFFEC_BASE		(MCF_IPSBAR + 0x1000)
+#define	MCFFEC_SIZE		0x800
+
+/*
+ *  GPIO module.
+ */
 #define MCFGPIO_PODR_ADDR	(MCF_IPSBAR + 0x100000)
 #define MCFGPIO_PODR_DATAH	(MCF_IPSBAR + 0x100001)
 #define MCFGPIO_PODR_DATAL	(MCF_IPSBAR + 0x100002)
diff --git a/arch/m68knommu/platform/523x/config.c b/arch/m68knommu/platform/523x/config.c
index 8980f6d..418a76f 100644
--- a/arch/m68knommu/platform/523x/config.c
+++ b/arch/m68knommu/platform/523x/config.c
@@ -28,15 +28,15 @@
 
 static struct mcf_platform_uart m523x_uart_platform[] = {
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
@@ -50,8 +50,8 @@ static struct platform_device m523x_uart = {
 
 static struct resource m523x_fec_resources[] = {
 	{
-		.start		= MCF_MBAR + 0x1000,
-		.end		= MCF_MBAR + 0x1000 + 0x7ff,
+		.start		= MCFFEC_BASE,
+		.end		= MCFFEC_BASE + MCFFEC_SIZE - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-- 
1.7.0.4
