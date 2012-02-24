From: <gerg@snapgear.com>
Subject: [PATCH 6/7] m68knommu: make 532x FEC platform addressing consistent
Date: Fri, 24 Feb 2012 14:24:10 +1000
Message-ID: <1330057451-28481-7-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44635 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755905Ab2BXEXZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:25 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all FEC (ethernet) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and use a single setup for all.

So modify the ColdFire 532x FEC addressing so that:

. FECs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m532xsim.h |   13 +++++++++++++
 arch/m68k/platform/532x/config.c |   16 ++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m532xsim.h
index f963d64..f1c4fa8 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m532xsim.h
@@ -24,11 +24,18 @@
 #define MCFINT_UART1        27          /* Interrupt number for UART1 */
 #define MCFINT_UART2        28          /* Interrupt number for UART2 */
 #define MCFINT_QSPI         31          /* Interrupt number for QSPI */
+#define MCFINT_FECRX0	    36		/* Interrupt number for FEC */
+#define MCFINT_FECTX0	    40		/* Interrupt number for FEC */
+#define MCFINT_FECENTC0	    42		/* Interrupt number for FEC */
 
 #define MCF_IRQ_UART0       (MCFINT_VECBASE + MCFINT_UART0)
 #define MCF_IRQ_UART1       (MCFINT_VECBASE + MCFINT_UART1)
 #define MCF_IRQ_UART2       (MCFINT_VECBASE + MCFINT_UART2)
 
+#define MCF_IRQ_FECRX0	    (MCFINT_VECBASE + MCFINT_FECRX0)
+#define MCF_IRQ_FECTX0	    (MCFINT_VECBASE + MCFINT_FECTX0)
+#define MCF_IRQ_FECENTC0    (MCFINT_VECBASE + MCFINT_FECENTC0)
+
 #define MCF_WTM_WCR	MCF_REG16(0xFC098000)
 
 /*
@@ -91,6 +98,12 @@
 #define MCFUART_BASE2		0xFC068000	/* Base address of UART3 */
 
 /*
+ *  FEC module.
+ */
+#define	MCFFEC_BASE0		0xFC030000	/* Base address of FEC0 */
+#define	MCFFEC_SIZE0		0x800		/* Size of FEC0 region */
+
+/*
  *  Timer module.
  */
 #define MCFTIMER_BASE1		0xFC070000	/* Base address of TIMER1 */
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 32f8b82..69e2bc0 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -35,23 +35,23 @@
 
 static struct resource m532x_fec_resources[] = {
 	{
-		.start		= 0xfc030000,
-		.end		= 0xfc0307ff,
+		.start		= MCFFEC_BASE0,
+		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= 64 + 36,
-		.end		= 64 + 36,
+		.start		= MCF_IRQ_FECRX0,
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
