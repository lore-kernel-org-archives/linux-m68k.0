From: <gerg@snapgear.com>
Subject: [PATCH 2/7] m68knommu: make 523x FEC platform addressing consistent
Date: Fri, 24 Feb 2012 14:24:06 +1000
Message-ID: <1330057451-28481-3-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44619 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755674Ab2BXEXU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:20 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all FEC (ethernet) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and use a single setup for all.

So modify the ColdFire 523x FEC addressing so that:

. FECs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h |   13 ++++++++++---
 arch/m68k/platform/523x/config.c |   16 ++++++++--------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 919d115..e1988dd 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -37,13 +37,20 @@
 #define	MCFINT_UART0		13		/* Interrupt number for UART0 */
 #define	MCFINT_UART1		14		/* Interrupt number for UART1 */
 #define	MCFINT_UART2		15		/* Interrupt number for UART2 */
-#define	MCFINT_PIT1		36		/* Interrupt number for PIT1 */
 #define MCFINT_QSPI		18		/* Interrupt number for QSPI */
+#define	MCFINT_FECRX0		23		/* Interrupt number for FEC */
+#define	MCFINT_FECTX0		27		/* Interrupt number for FEC */
+#define	MCFINT_FECENTC0		29		/* Interrupt number for FEC */
+#define	MCFINT_PIT1		36		/* Interrupt number for PIT1 */
 
 #define	MCF_IRQ_UART0	        (MCFINT_VECBASE + MCFINT_UART0)
 #define	MCF_IRQ_UART1	        (MCFINT_VECBASE + MCFINT_UART1)
 #define	MCF_IRQ_UART2	        (MCFINT_VECBASE + MCFINT_UART2)
 
+#define	MCF_IRQ_FECRX0		(MCFINT_VECBASE + MCFINT_FECRX0)
+#define	MCF_IRQ_FECTX0		(MCFINT_VECBASE + MCFINT_FECTX0)
+#define	MCF_IRQ_FECENTC0	(MCFINT_VECBASE + MCFINT_FECENTC0)
+
 /*
  *	SDRAM configuration registers.
  */
@@ -72,8 +79,8 @@
 /*
  *  FEC ethernet module.
  */
-#define	MCFFEC_BASE		(MCF_IPSBAR + 0x1000)
-#define	MCFFEC_SIZE		0x800
+#define	MCFFEC_BASE0		(MCF_IPSBAR + 0x1000)
+#define	MCFFEC_SIZE0		0x800
 
 /*
  *  GPIO module.
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index 308aed1..5433c76 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -28,23 +28,23 @@
 
 static struct resource m523x_fec_resources[] = {
 	{
-		.start		= MCFFEC_BASE,
-		.end		= MCFFEC_BASE + MCFFEC_SIZE - 1,
+		.start		= MCFFEC_BASE0,
+		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= 64 + 23,
-		.end		= 64 + 23,
+		.start		= MCF_IRQ_FECRX0,
+		.end		= MCF_IRQ_FECRX0,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= 64 + 27,
-		.end		= 64 + 27,
+		.start		= MCF_IRQ_FECTX0,
+		.end		= MCF_IRQ_FECTX0,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= 64 + 29,
-		.end		= 64 + 29,
+		.start		= MCF_IRQ_FECENTC0,
+		.end		= MCF_IRQ_FECENTC0,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
-- 
1.7.0.4
