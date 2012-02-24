From: <gerg@snapgear.com>
Subject: [PATCH 5/7] m68knommu: make 528x FEC platform addressing consistent
Date: Fri, 24 Feb 2012 14:24:09 +1000
Message-ID: <1330057451-28481-6-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44632 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755680Ab2BXEXY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:24 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all FEC (ethernet) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and use a single setup for all.

So modify the ColdFire 528x FEC addressing so that:

. FECs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m528xsim.h |   11 +++++++++--
 arch/m68k/platform/528x/config.c |   16 ++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index a5f0c14..a363c64 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -38,12 +38,19 @@
 #define	MCFINT_UART1		14		/* Interrupt number for UART1 */
 #define	MCFINT_UART2		15		/* Interrupt number for UART2 */
 #define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
+#define	MCFINT_FECRX0		23		/* Interrupt number for FEC */
+#define	MCFINT_FECTX0		27		/* Interrupt number for FEC */
+#define	MCFINT_FECENTC0		29		/* Interrupt number for FEC */
 #define	MCFINT_PIT1		55		/* Interrupt number for PIT1 */
 
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
@@ -71,8 +78,8 @@
 /*
  *	FEC ethernet module.
  */
-#define	MCFFEC_BASE		(MCF_IPSBAR + 0x00001000)
-#define	MCFFEC_SIZE		0x800
+#define	MCFFEC_BASE0		(MCF_IPSBAR + 0x00001000)
+#define	MCFFEC_SIZE0		0x800
 
 /*
  * 	GPIO registers
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 8ed0f69..a391978 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -29,23 +29,23 @@
 
 static struct resource m528x_fec_resources[] = {
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
