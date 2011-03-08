From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 09/12] m68knommu: move ColdFire DMA register addresses to per-cpu headers
Date: Tue, 8 Mar 2011 23:04:06 +1000
Message-ID: <1299589449-24974-10-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
 <1299589449-24974-7-git-send-email-gerg@uclinux.org>
 <1299589449-24974-8-git-send-email-gerg@uclinux.org>
 <1299589449-24974-9-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51500 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab1CHNIx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:53 -0500
In-Reply-To: <1299589449-24974-9-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The base addresses of the ColdFire DMA unit registers belong with
all the other address definitions in the per-cpu headers. The current
definitions assume they are relative to an MBAR register. Not all
ColdFire CPUs have an MBAR register. A clean address define can only
be acheived in the per-cpu headers along with all the other chips
peripheral base addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5206sim.h       |    3 +++
 arch/m68k/include/asm/m523xsim.h       |    9 +++++++++
 arch/m68k/include/asm/m5249sim.h       |    8 ++++++++
 arch/m68k/include/asm/m5272sim.h       |    2 ++
 arch/m68k/include/asm/m527xsim.h       |    8 ++++++++
 arch/m68k/include/asm/m528xsim.h       |    8 ++++++++
 arch/m68k/include/asm/m5307sim.h       |    8 ++++++++
 arch/m68k/include/asm/m5407sim.h       |    8 ++++++++
 arch/m68k/include/asm/mcfdma.h         |   23 -----------------------
 arch/m68knommu/platform/coldfire/dma.c |    8 ++++----
 10 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 561b03b..6fb656f 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -92,6 +92,9 @@
 #define	MCFSIM_PADDR		(MCF_MBAR + 0x1c5)	/* Parallel Direction (r/w) */
 #define	MCFSIM_PADAT		(MCF_MBAR + 0x1c9)	/* Parallel Port Value (r/w) */
 
+#define	MCFDMA_BASE0		(MCF_MBAR + 0x200)	/* Base address DMA 0 */
+#define	MCFDMA_BASE1		(MCF_MBAR + 0x240)	/* Base address DMA 1 */
+
 #if defined(CONFIG_NETtel)
 #define	MCFUART_BASE1		0x180		/* Base address of UART1 */
 #define	MCFUART_BASE2		0x140		/* Base address of UART2 */
diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 6e5c17a..89067bd 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -160,5 +160,14 @@
 */
 #define	MCFGPIO_PAR_QSPI	(MCF_IPSBAR + 0x10004A)
 #define	MCFGPIO_PAR_TIMER	(MCF_IPSBAR + 0x10004C)
+
+/*
+ * DMA unit base addresses.
+ */
+#define	MCFDMA_BASE0		(MCF_IPSBAR + 0x100)
+#define	MCFDMA_BASE1		(MCF_IPSBAR + 0x140)
+#define	MCFDMA_BASE2		(MCF_IPSBAR + 0x180)
+#define	MCFDMA_BASE3		(MCF_IPSBAR + 0x1C0)
+
 /****************************************************************************/
 #endif	/* m523xsim_h */
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 6698b05..aefb83e 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -73,6 +73,14 @@
 #define MCFUART_BASE2		0x200           /* Base address of UART2 */
 
 /*
+ *	DMA unit base addresses.
+ */
+#define MCFDMA_BASE0		(MCF_MBAR + 0x300)	/* Base address DMA 0 */
+#define MCFDMA_BASE1		(MCF_MBAR + 0x340)	/* Base address DMA 1 */
+#define MCFDMA_BASE2		(MCF_MBAR + 0x380)	/* Base address DMA 2 */
+#define MCFDMA_BASE3		(MCF_MBAR + 0x3C0)	/* Base address DMA 3 */
+
+/*
  *	Some symbol defines for the above...
  */
 #define	MCFSIM_SWDICR		MCFSIM_ICR0	/* Watchdog timer ICR */
diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index b7cc50a..3b43fee 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -80,6 +80,8 @@
 #define	MCFSIM_PCDAT		(MCF_MBAR + 0x96) /* Port C Data (r/w) */
 #define	MCFSIM_PDCNT		(MCF_MBAR + 0x98) /* Port D Control (r/w) */
 
+#define	MCFDMA_BASE0		(MCF_MBAR + 0xe0) /* Base address DMA 0 */
+
 /*
  *	Define system peripheral IRQ usage.
  */
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index d299552..04b8c10 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -61,6 +61,14 @@
 #endif
 
 /*
+ *	DMA unit base addresses.
+ */
+#define	MCFDMA_BASE0		(MCF_IPSBAR + 0x100)
+#define	MCFDMA_BASE1		(MCF_IPSBAR + 0x140)
+#define	MCFDMA_BASE2		(MCF_IPSBAR + 0x180)
+#define	MCFDMA_BASE3		(MCF_IPSBAR + 0x1C0)
+
+/*
  *	UART module.
  */
 #define MCFUART_BASE1		(MCF_IPSBAR + 0x200)
diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index d7c9241..87c0cce 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -47,6 +47,14 @@
 #define	MCFSIM_DMR1		0x54		/* SDRAM address mask 1 */
 
 /*
+ *	DMA unit base addresses.
+ */
+#define	MCFDMA_BASE0		(MCF_IPSBAR + 0x00000100)
+#define	MCFDMA_BASE1		(MCF_IPSBAR + 0x00000140)
+#define	MCFDMA_BASE2		(MCF_IPSBAR + 0x00000180)
+#define	MCFDMA_BASE3		(MCF_IPSBAR + 0x000001C0)
+
+/*
  *	UART module.
  */
 #define	MCFUART_BASE1		(MCF_IPSBAR + 0x00000200)
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 0bf5739..3928576 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -99,6 +99,14 @@
 #define	MCFSIM_PADAT		(MCF_MBAR + 0x248)
 
 /*
+ *  DMA unit base addresses.
+ */
+#define MCFDMA_BASE0		(MCF_MBAR + 0x300)	/* Base address DMA 0 */
+#define MCFDMA_BASE1		(MCF_MBAR + 0x340)	/* Base address DMA 1 */
+#define MCFDMA_BASE2		(MCF_MBAR + 0x380)	/* Base address DMA 2 */
+#define MCFDMA_BASE3		(MCF_MBAR + 0x3C0)	/* Base address DMA 3 */
+
+/*
  *  UART module.
  */
 #if defined(CONFIG_NETtel) || defined(CONFIG_SECUREEDGEMP3)
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 75f5c28..7018172 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -85,6 +85,14 @@
 #define	MCFSIM_PADAT		(MCF_MBAR + 0x248)
 
 /*
+ *	DMA unit base addresses.
+ */
+#define MCFDMA_BASE0		(MCF_MBAR + 0x300)	/* Base address DMA 0 */
+#define MCFDMA_BASE1		(MCF_MBAR + 0x340)	/* Base address DMA 1 */
+#define MCFDMA_BASE2		(MCF_MBAR + 0x380)	/* Base address DMA 2 */
+#define MCFDMA_BASE3		(MCF_MBAR + 0x3C0)	/* Base address DMA 3 */
+
+/*
  * Generic GPIO support
  */
 #define MCFGPIO_PIN_MAX			16
diff --git a/arch/m68k/include/asm/mcfdma.h b/arch/m68k/include/asm/mcfdma.h
index 705c52c..10bc7e3 100644
--- a/arch/m68k/include/asm/mcfdma.h
+++ b/arch/m68k/include/asm/mcfdma.h
@@ -11,29 +11,6 @@
 #define	mcfdma_h
 /****************************************************************************/
 
-
-/*
- *	Get address specific defines for this Coldfire member.
- */
-#if defined(CONFIG_M5206) || defined(CONFIG_M5206e)
-#define	MCFDMA_BASE0		0x200		/* Base address of DMA 0 */
-#define	MCFDMA_BASE1		0x240		/* Base address of DMA 1 */
-#elif defined(CONFIG_M5272)
-#define	MCFDMA_BASE0		0x0e0		/* Base address of DMA 0 */
-#elif defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x)
-/* These are relative to the IPSBAR, not MBAR */
-#define	MCFDMA_BASE0		0x100		/* Base address of DMA 0 */
-#define	MCFDMA_BASE1		0x140		/* Base address of DMA 1 */
-#define	MCFDMA_BASE2		0x180		/* Base address of DMA 2 */
-#define	MCFDMA_BASE3		0x1C0		/* Base address of DMA 3 */
-#elif defined(CONFIG_M5249) || defined(CONFIG_M5307) || defined(CONFIG_M5407)
-#define	MCFDMA_BASE0		0x300		/* Base address of DMA 0 */
-#define	MCFDMA_BASE1		0x340		/* Base address of DMA 1 */
-#define	MCFDMA_BASE2		0x380		/* Base address of DMA 2 */
-#define	MCFDMA_BASE3		0x3C0		/* Base address of DMA 3 */
-#endif
-
-
 #if !defined(CONFIG_M5272)
 
 /*
diff --git a/arch/m68knommu/platform/coldfire/dma.c b/arch/m68knommu/platform/coldfire/dma.c
index 2b30cf1..e88b95e 100644
--- a/arch/m68knommu/platform/coldfire/dma.c
+++ b/arch/m68knommu/platform/coldfire/dma.c
@@ -21,16 +21,16 @@
  */
 unsigned int dma_base_addr[MAX_M68K_DMA_CHANNELS] = {
 #ifdef MCFDMA_BASE0
-	MCF_MBAR + MCFDMA_BASE0,
+	MCFDMA_BASE0,
 #endif
 #ifdef MCFDMA_BASE1
-	MCF_MBAR + MCFDMA_BASE1,
+	MCFDMA_BASE1,
 #endif
 #ifdef MCFDMA_BASE2
-	MCF_MBAR + MCFDMA_BASE2,
+	MCFDMA_BASE2,
 #endif
 #ifdef MCFDMA_BASE3
-	MCF_MBAR + MCFDMA_BASE3,
+	MCFDMA_BASE3,
 #endif
 };
 
-- 
1.7.0.4
