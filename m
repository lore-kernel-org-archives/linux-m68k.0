From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 04/12] m68knommu: move ColdFire PIT timer base addresses
Date: Tue, 8 Mar 2011 23:04:01 +1000
Message-ID: <1299589449-24974-5-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51491 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab1CHNIp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:45 -0500
In-Reply-To: <1299589449-24974-4-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The PIT hardware timer module used in some ColdFire CPU's is not always
addressed relative to an IPSBAR register. Parts like the ColdFire 5207 and
5208 have fixed peripheral addresses. So lets not define the register
addresses of the PIT relative to an IPSBAR definition. Move the base
address definitions into the per-part headers. This is a lot more consistent
since all the other peripheral base addresses are defined in the per-part
header files already.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h       |    6 ++++++
 arch/m68k/include/asm/m523xsim.h       |    9 ++++++++-
 arch/m68k/include/asm/m527xsim.h       |   11 ++++++++---
 arch/m68k/include/asm/m528xsim.h       |    8 ++++++++
 arch/m68k/include/asm/mcfpit.h         |   16 +---------------
 arch/m68knommu/platform/coldfire/pit.c |    2 +-
 6 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index 88ed823..afc21ad 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -134,6 +134,12 @@
 #define MCF_GPIO_PAR_FECI2C_PAR_SCL_UTXD2   (0x04)
 
 /*
+ *  PIT timer module.
+ */
+#define	MCFPIT_BASE1		0xFC080000	/* Base address of TIMER1 */
+#define	MCFPIT_BASE2		0xFC084000	/* Base address of TIMER2 */
+
+/*
  *  UART module.
  */
 #define MCFUART_BASE1		0x60000		/* Base address of UART1 */
diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 9701ed3..6be94f6 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -119,9 +119,16 @@
 #define MCFGPIO_PCLRR_ETPU	(MCF_IPSBAR + 0x10003C)
 
 /*
- * EPort
+ * PIT timer base addresses.
  */
+#define	MCFPIT_BASE1		(MCF_IPSBAR + 0x150000)
+#define	MCFPIT_BASE2		(MCF_IPSBAR + 0x160000)
+#define	MCFPIT_BASE3		(MCF_IPSBAR + 0x170000)
+#define	MCFPIT_BASE4		(MCF_IPSBAR + 0x180000)
 
+/*
+ * EPort
+ */
 #define MCFEPORT_EPDDR		(MCF_IPSBAR + 0x130002)
 #define MCFEPORT_EPDR		(MCF_IPSBAR + 0x130004)
 #define MCFEPORT_EPPDR		(MCF_IPSBAR + 0x130005)
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 3712f61..cb7df04 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -232,15 +232,20 @@
 #endif
 
 /*
- * EPort
+ * PIT timer base addresses.
  */
+#define	MCFPIT_BASE1		(MCF_IPSBAR + 0x150000)
+#define	MCFPIT_BASE2		(MCF_IPSBAR + 0x160000)
+#define	MCFPIT_BASE3		(MCF_IPSBAR + 0x170000)
+#define	MCFPIT_BASE4		(MCF_IPSBAR + 0x180000)
 
+/*
+ * EPort
+ */
 #define MCFEPORT_EPDDR		(MCF_IPSBAR + 0x130002)
 #define MCFEPORT_EPDR		(MCF_IPSBAR + 0x130004)
 #define MCFEPORT_EPPDR		(MCF_IPSBAR + 0x130005)
 
-
-
 /*
  *	GPIO pins setups to enable the UARTs.
  */
diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index a918545..014098a 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -164,6 +164,14 @@
 #define MCFGPIO_PUAPAR		(MCF_IPSBAR + 0x0010005C)
 
 /*
+ * PIT timer base addresses.
+ */
+#define	MCFPIT_BASE1		(MCF_IPSBAR + 0x00150000)
+#define	MCFPIT_BASE2		(MCF_IPSBAR + 0x00160000)
+#define	MCFPIT_BASE3		(MCF_IPSBAR + 0x00170000)
+#define	MCFPIT_BASE4		(MCF_IPSBAR + 0x00180000)
+
+/*
  * 	Edge Port registers
  */
 #define MCFEPORT_EPPAR		(MCF_IPSBAR + 0x00130000)
diff --git a/arch/m68k/include/asm/mcfpit.h b/arch/m68k/include/asm/mcfpit.h
index f570cf6..9fd321c 100644
--- a/arch/m68k/include/asm/mcfpit.h
+++ b/arch/m68k/include/asm/mcfpit.h
@@ -11,22 +11,8 @@
 #define	mcfpit_h
 /****************************************************************************/
 
-
-/*
- *	Get address specific defines for the 5270/5271, 5280/5282, and 5208.
- */
-#if defined(CONFIG_M520x)
-#define	MCFPIT_BASE1		0x00080000	/* Base address of TIMER1 */
-#define	MCFPIT_BASE2		0x00084000	/* Base address of TIMER2 */
-#else
-#define	MCFPIT_BASE1		0x00150000	/* Base address of TIMER1 */
-#define	MCFPIT_BASE2		0x00160000	/* Base address of TIMER2 */
-#define	MCFPIT_BASE3		0x00170000	/* Base address of TIMER3 */
-#define	MCFPIT_BASE4		0x00180000	/* Base address of TIMER4 */
-#endif
-
 /*
- *	Define the PIT timer register set addresses.
+ *	Define the PIT timer register address offsets.
  */
 #define	MCFPIT_PCSR		0x0		/* PIT control register */
 #define	MCFPIT_PMR		0x2		/* PIT modulus register */
diff --git a/arch/m68knommu/platform/coldfire/pit.c b/arch/m68knommu/platform/coldfire/pit.c
index aebea19..c2b9809 100644
--- a/arch/m68knommu/platform/coldfire/pit.c
+++ b/arch/m68knommu/platform/coldfire/pit.c
@@ -31,7 +31,7 @@
  *	By default use timer1 as the system clock timer.
  */
 #define	FREQ	((MCF_CLK / 2) / 64)
-#define	TA(a)	(MCF_IPSBAR + MCFPIT_BASE1 + (a))
+#define	TA(a)	(MCFPIT_BASE1 + (a))
 #define PIT_CYCLES_PER_JIFFY (FREQ / HZ)
 
 static u32 pit_cnt;
-- 
1.7.0.4
