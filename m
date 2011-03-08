From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 02/12] m68knommu: remove kludge seting of MCF_IPSBAR for ColdFire 54xx
Date: Tue, 8 Mar 2011 23:03:59 +1000
Message-ID: <1299589449-24974-3-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51444 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754370Ab1CHNHl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:07:41 -0500
In-Reply-To: <1299589449-24974-2-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The ColdFire 54xx family shares the same interrupt controller used
on the 523x, 527x and 528x ColdFire parts, but it isn't offset
relative to the IPSBAR register. The 54xx doesn't have an IPSBAR
register.

By including the base address of the peripheral registers in the register
definitions (MCFICM_INTC0 and MCFICM_INTC1 in this case) we can avoid
having to define a fake IPSBAR for the 54xx. And this makes the register
address definitions of these more consistent, the majority of the other
register address defines include the peripheral base address already.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h          |    4 +---
 arch/m68k/include/asm/m523xsim.h          |    5 +++--
 arch/m68k/include/asm/m527xsim.h          |    5 +++--
 arch/m68k/include/asm/m528xsim.h          |    5 +++--
 arch/m68k/include/asm/m54xxsim.h          |    3 ++-
 arch/m68knommu/platform/coldfire/intc-2.c |   14 ++++++--------
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index d70cf0f..9167645 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -31,9 +31,7 @@
  *	This is generally setup by the boards start up code.
  */
 #define	MCF_MBAR	0x10000000
-#if defined(CONFIG_M54xx)
-#define	MCF_IPSBAR	MCF_MBAR
-#elif defined(CONFIG_M520x)
+#if defined(CONFIG_M520x)
 #define	MCF_IPSBAR	0xFC000000
 #else
 #define	MCF_IPSBAR	0x40000000
diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 4ad7a00..9701ed3 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -19,8 +19,9 @@
 /*
  *	Define the 523x SIM register set addresses.
  */
-#define	MCFICM_INTC0		0x0c00		/* Base for Interrupt Ctrl 0 */
-#define	MCFICM_INTC1		0x0d00		/* Base for Interrupt Ctrl 0 */
+#define	MCFICM_INTC0		(MCF_IPSBAR + 0x0c00)	/* Base for Interrupt Ctrl 0 */
+#define	MCFICM_INTC1		(MCF_IPSBAR + 0x0d00)	/* Base for Interrupt Ctrl 0 */
+
 #define	MCFINTC_IPRH		0x00		/* Interrupt pending 32-63 */
 #define	MCFINTC_IPRL		0x04		/* Interrupt pending 1-31 */
 #define	MCFINTC_IMRH		0x08		/* Interrupt mask 32-63 */
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index e8042e8..3712f61 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -19,8 +19,9 @@
 /*
  *	Define the 5270/5271 SIM register set addresses.
  */
-#define	MCFICM_INTC0		0x0c00		/* Base for Interrupt Ctrl 0 */
-#define	MCFICM_INTC1		0x0d00		/* Base for Interrupt Ctrl 1 */
+#define	MCFICM_INTC0		(MCF_IPSBAR + 0x0c00)	/* Base for Interrupt Ctrl 0 */
+#define	MCFICM_INTC1		(MCF_IPSBAR + 0x0d00)	/* Base for Interrupt Ctrl 1 */
+
 #define	MCFINTC_IPRH		0x00		/* Interrupt pending 32-63 */
 #define	MCFINTC_IPRL		0x04		/* Interrupt pending 1-31 */
 #define	MCFINTC_IMRH		0x08		/* Interrupt mask 32-63 */
diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index a6d2f4d..a918545 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -19,8 +19,9 @@
 /*
  *	Define the 5280/5282 SIM register set addresses.
  */
-#define	MCFICM_INTC0		0x0c00		/* Base for Interrupt Ctrl 0 */
-#define	MCFICM_INTC1		0x0d00		/* Base for Interrupt Ctrl 0 */
+#define	MCFICM_INTC0		(MCF_IPSBAR + 0x0c00)	/* Base for Interrupt Ctrl 0 */
+#define	MCFICM_INTC1		(MCF_IPSBAR + 0x0d00)	/* Base for Interrupt Ctrl 0 */
+
 #define	MCFINTC_IPRH		0x00		/* Interrupt pending 32-63 */
 #define	MCFINTC_IPRL		0x04		/* Interrupt pending 1-31 */
 #define	MCFINTC_IMRH		0x08		/* Interrupt mask 32-63 */
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index 462ae53..cc5d94d 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -15,7 +15,8 @@
 /*
  *      Interrupt Controller Registers
  */
-#define MCFICM_INTC0		0x0700		/* Base for Interrupt Ctrl 0 */
+#define MCFICM_INTC0		(MCF_MBAR + 0x700) 	/* Base for Interrupt Ctrl 0 */
+
 #define MCFINTC_IPRH		0x00		/* Interrupt pending 32-63 */
 #define MCFINTC_IPRL		0x04		/* Interrupt pending 1-31 */
 #define MCFINTC_IMRH		0x08		/* Interrupt mask 32-63 */
diff --git a/arch/m68knommu/platform/coldfire/intc-2.c b/arch/m68knommu/platform/coldfire/intc-2.c
index 71e07fb..ec869c8 100644
--- a/arch/m68knommu/platform/coldfire/intc-2.c
+++ b/arch/m68knommu/platform/coldfire/intc-2.c
@@ -52,11 +52,10 @@ static void intc_irq_mask(struct irq_data *d)
 		u32 val, imrbit;
 
 		irq -= MCFINT_VECBASE;
-		imraddr = MCF_IPSBAR;
 #ifdef MCFICM_INTC1
-		imraddr += (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
+		imraddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
 #else
-		imraddr += MCFICM_INTC0;
+		imraddr = MCFICM_INTC0;
 #endif
 		imraddr += (irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL;
 		imrbit = 0x1 << (irq & 0x1f);
@@ -75,11 +74,10 @@ static void intc_irq_unmask(struct irq_data *d)
 		u32 val, imrbit;
 
 		irq -= MCFINT_VECBASE;
-		intaddr = MCF_IPSBAR;
 #ifdef MCFICM_INTC1
-		intaddr += (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
+		intaddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
 #else
-		intaddr += MCFICM_INTC0;
+		intaddr = MCFICM_INTC0;
 #endif
 		imraddr = intaddr + ((irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL);
 		icraddr = intaddr + MCFINTC_ICR0 + (irq & 0x3f);
@@ -116,9 +114,9 @@ void __init init_IRQ(void)
 	init_vectors();
 
 	/* Mask all interrupt sources */
-	__raw_writel(0x1, MCF_IPSBAR + MCFICM_INTC0 + MCFINTC_IMRL);
+	__raw_writel(0x1, MCFICM_INTC0 + MCFINTC_IMRL);
 #ifdef MCFICM_INTC1
-	__raw_writel(0x1, MCF_IPSBAR + MCFICM_INTC1 + MCFINTC_IMRL);
+	__raw_writel(0x1, MCFICM_INTC1 + MCFINTC_IMRL);
 #endif
 
 	for (irq = 0; (irq < NR_IRQS); irq++) {
-- 
1.7.0.4
