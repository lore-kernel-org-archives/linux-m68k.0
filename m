From: <gerg@snapgear.com>
Subject: [PATCH 1/7] m68knommu: make 520x FEC platform addressing consistent
Date: Fri, 24 Feb 2012 14:24:05 +1000
Message-ID: <1330057451-28481-2-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44617 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755611Ab2BXEXT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:19 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all FEC (ethernet) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and use a single setup for all.

So modify the ColdFire 520x FEC addressing so that:

. FECs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h |   11 +++++++++--
 arch/m68k/platform/520x/config.c |   16 ++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index 41ed4dc..b83cee2 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -48,12 +48,19 @@
 #define MCFINT_UART1        27          /* Interrupt number for UART1 */
 #define MCFINT_UART2        28          /* Interrupt number for UART2 */
 #define MCFINT_QSPI         31          /* Interrupt number for QSPI */
+#define MCFINT_FECRX0	    36		/* Interrupt number for FEC RX */
+#define MCFINT_FECTX0	    40		/* Interrupt number for FEC RX */
+#define MCFINT_FECENTC0	    42		/* Interrupt number for FEC RX */
 #define MCFINT_PIT1         4           /* Interrupt number for PIT1 (PIT0 in processor) */
 
 #define MCF_IRQ_UART0	    (MCFINT_VECBASE + MCFINT_UART0)
 #define MCF_IRQ_UART1	    (MCFINT_VECBASE + MCFINT_UART1)
 #define MCF_IRQ_UART2	    (MCFINT_VECBASE + MCFINT_UART2)
 
+#define MCF_IRQ_FECRX0	    (MCFINT_VECBASE + MCFINT_FECRX0)
+#define MCF_IRQ_FECTX0	    (MCFINT_VECBASE + MCFINT_FECTX0)
+#define MCF_IRQ_FECENTC0    (MCFINT_VECBASE + MCFINT_FECENTC0)
+
 /*
  *  SDRAM configuration registers.
  */
@@ -155,8 +162,8 @@
 /*
  *  FEC module.
  */
-#define	MCFFEC_BASE		0xFC030000	/* Base of FEC ethernet */
-#define	MCFFEC_SIZE		0x800		/* Register set size */
+#define	MCFFEC_BASE0		0xFC030000	/* Base of FEC ethernet */
+#define	MCFFEC_SIZE0		0x800		/* Register set size */
 
 /*
  *  Reset Control Unit.
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index e2bd2e9..b756315 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -27,23 +27,23 @@
 
 static struct resource m520x_fec_resources[] = {
 	{
-		.start		= MCFFEC_BASE,
-		.end		= MCFFEC_BASE + MCFFEC_SIZE - 1,
+		.start		= MCFFEC_BASE0,
+		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= 64 + 36,
-		.end		= 64 + 36,
+		.start		= MCF_IRQ_FEXRX0,
+		.end		= MCF_IRQ_FECRX0,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= 64 + 40,
-		.end		= 64 + 40,
+		.start		= MCF_IRQ_FECTX0,
+		.end		= MCF_IRQ_FECTX0,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= 64 + 42,
-		.end		= 64 + 42,
+		.start		= MCF_IRQ_FECENTC0,
+		.end		= MCF_IRQ_FECENTC0,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
-- 
1.7.0.4
