From: <gerg@snapgear.com>
Subject: [PATCH 4/7] m68knommu: make 527x FEC platform addressing consistent
Date: Fri, 24 Feb 2012 14:24:08 +1000
Message-ID: <1330057451-28481-5-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44623 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755680Ab2BXEXX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:23 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all FEC (ethernet) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and use a single setup for all.

So modify the ColdFire 527x FEC addressing so that:

. FECs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h |   15 +++++++++++++++
 arch/m68k/platform/527x/config.c |   24 ++++++++++++------------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 7399968..59bb776 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -38,12 +38,27 @@
 #define	MCFINT_UART1		14		/* Interrupt number for UART1 */
 #define	MCFINT_UART2		15		/* Interrupt number for UART2 */
 #define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
+#define	MCFINT_FECRX0		23		/* Interrupt number for FEC0 */
+#define	MCFINT_FECTX0		27		/* Interrupt number for FEC0 */
+#define	MCFINT_FECENTC0		29		/* Interrupt number for FEC0 */
 #define	MCFINT_PIT1		36		/* Interrupt number for PIT1 */
 
+#define	MCFINT2_VECBASE		128		/* Vector base number 2 */
+#define	MCFINT2_FECRX1		23		/* Interrupt number for FEC1 */
+#define	MCFINT2_FECTX1		27		/* Interrupt number for FEC1 */
+#define	MCFINT2_FECENTC1	29		/* Interrupt number for FEC1 */
+
 #define	MCF_IRQ_UART0	        (MCFINT_VECBASE + MCFINT_UART0)
 #define	MCF_IRQ_UART1	        (MCFINT_VECBASE + MCFINT_UART1)
 #define	MCF_IRQ_UART2	        (MCFINT_VECBASE + MCFINT_UART2)
 
+#define	MCF_IRQ_FECRX0		(MCFINT_VECBASE + MCFINT_FECRX0)
+#define	MCF_IRQ_FECTX0		(MCFINT_VECBASE + MCFINT_FECTX0)
+#define	MCF_IRQ_FECENTC0	(MCFINT_VECBASE + MCFINT_FECENTC0)
+#define	MCF_IRQ_FECRX1		(MCFINT2_VECBASE + MCFINT2_FECRX1)
+#define	MCF_IRQ_FECTX1		(MCFINT2_VECBASE + MCFINT2_FECTX1)
+#define	MCF_IRQ_FECENTC1	(MCFINT2_VECBASE + MCFINT2_FECENTC1)
+
 /*
  *	SDRAM configuration registers.
  */
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index febff03..f395e8b 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -33,18 +33,18 @@ static struct resource m527x_fec0_resources[] = {
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
@@ -56,18 +56,18 @@ static struct resource m527x_fec1_resources[] = {
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= 128 + 23,
-		.end		= 128 + 23,
+		.start		= MCF_IRQ_FECRX1,
+		.end		= MCF_IRQ_FECRX1,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= 128 + 27,
-		.end		= 128 + 27,
+		.start		= MCF_IRQ_FECTX1,
+		.end		= MCF_IRQ_FECTX1,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= 128 + 29,
-		.end		= 128 + 29,
+		.start		= MCF_IRQ_FECENTC1,
+		.end		= MCF_IRQ_FECENTC1,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
-- 
1.7.0.4
