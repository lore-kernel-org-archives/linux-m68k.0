From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 10/12] m68knommu: clean up use of MBAR for DRAM registers on ColdFire start
Date: Tue, 8 Mar 2011 23:04:07 +1000
Message-ID: <1299589449-24974-11-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
 <1299589449-24974-7-git-send-email-gerg@uclinux.org>
 <1299589449-24974-8-git-send-email-gerg@uclinux.org>
 <1299589449-24974-9-git-send-email-gerg@uclinux.org>
 <1299589449-24974-10-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51502 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab1CHNIz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:55 -0500
In-Reply-To: <1299589449-24974-10-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

In some of the RAM size autodetection code on ColdFire CPU startup
we reference DRAM registers relative to the MBAR register. Not all of
the supported ColdFire CPUs have an MBAR, and currently this works
because we fake an MBAR address on those registers. In an effort to
clean this up, and eventually remove the fake MBAR setting make the
DRAM register address definitions actually contain the MBAR (or IPSBAR
as appropriate) value as required.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5206sim.h        |   16 ++++++++--------
 arch/m68k/include/asm/m523xsim.h        |   10 +++++-----
 arch/m68k/include/asm/m5249sim.h        |   10 +++++-----
 arch/m68k/include/asm/m527xsim.h        |   26 +++++++++++++-------------
 arch/m68k/include/asm/m528xsim.h        |   10 +++++-----
 arch/m68k/include/asm/m5307sim.h        |   10 +++++-----
 arch/m68k/include/asm/m5407sim.h        |   10 +++++-----
 arch/m68knommu/platform/coldfire/head.S |    6 +++---
 8 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 6fb656f..b9cba58 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -48,14 +48,14 @@
 #define	MCFSIM_SWIVR		0x42		/* SW Watchdog intr reg (r/w) */
 #define	MCFSIM_SWSR		0x43		/* SW Watchdog service (r/w) */
 
-#define	MCFSIM_DCRR		0x46		/* DRAM Refresh reg (r/w) */
-#define	MCFSIM_DCTR		0x4a		/* DRAM Timing reg (r/w) */
-#define	MCFSIM_DAR0		0x4c		/* DRAM 0 Address reg(r/w) */
-#define	MCFSIM_DMR0		0x50		/* DRAM 0 Mask reg (r/w) */
-#define	MCFSIM_DCR0		0x57		/* DRAM 0 Control reg (r/w) */
-#define	MCFSIM_DAR1		0x58		/* DRAM 1 Address reg (r/w) */
-#define	MCFSIM_DMR1		0x5c		/* DRAM 1 Mask reg (r/w) */
-#define	MCFSIM_DCR1		0x63		/* DRAM 1 Control reg (r/w) */
+#define	MCFSIM_DCRR		(MCF_MBAR + 0x46) /* DRAM Refresh reg (r/w) */
+#define	MCFSIM_DCTR		(MCF_MBAR + 0x4a) /* DRAM Timing reg (r/w) */
+#define	MCFSIM_DAR0		(MCF_MBAR + 0x4c) /* DRAM 0 Address reg(r/w) */
+#define	MCFSIM_DMR0		(MCF_MBAR + 0x50) /* DRAM 0 Mask reg (r/w) */
+#define	MCFSIM_DCR0		(MCF_MBAR + 0x57) /* DRAM 0 Control reg (r/w) */
+#define	MCFSIM_DAR1		(MCF_MBAR + 0x58) /* DRAM 1 Address reg (r/w) */
+#define	MCFSIM_DMR1		(MCF_MBAR + 0x5c) /* DRAM 1 Mask reg (r/w) */
+#define	MCFSIM_DCR1		(MCF_MBAR + 0x63) /* DRAM 1 Control reg (r/w) */
 
 #define	MCFSIM_CSAR0		0x64		/* CS 0 Address 0 reg (r/w) */
 #define	MCFSIM_CSMR0		0x68		/* CS 0 Mask 0 reg (r/w) */
diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 89067bd..3f3dbf0 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -40,11 +40,11 @@
 /*
  *	SDRAM configuration registers.
  */
-#define	MCFSIM_DCR		0x44		/* SDRAM control */
-#define	MCFSIM_DACR0		0x48		/* SDRAM base address 0 */
-#define	MCFSIM_DMR0		0x4c		/* SDRAM address mask 0 */
-#define	MCFSIM_DACR1		0x50		/* SDRAM base address 1 */
-#define	MCFSIM_DMR1		0x54		/* SDRAM address mask 1 */
+#define	MCFSIM_DCR		(MCF_IPSBAR + 0x44)	/* Control */
+#define	MCFSIM_DACR0		(MCF_IPSBAR + 0x48)	/* Base address 0 */
+#define	MCFSIM_DMR0		(MCF_IPSBAR + 0x4c)	/* Address mask 0 */
+#define	MCFSIM_DACR1		(MCF_IPSBAR + 0x50)	/* Base address 1 */
+#define	MCFSIM_DMR1		(MCF_IPSBAR + 0x54)	/* Address mask 1 */
 
 /*
  *  Reset Controll Unit (relative to IPSBAR).
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index aefb83e..e84ac2a 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -60,11 +60,11 @@
 #define MCFSIM_CSMR3		0xa8		/* CS 3 Mask reg (r/w) */
 #define MCFSIM_CSCR3		0xae		/* CS 3 Control reg (r/w) */
 
-#define MCFSIM_DCR		0x100		/* DRAM Control reg (r/w) */
-#define MCFSIM_DACR0		0x108		/* DRAM 0 Addr and Ctrl (r/w) */
-#define MCFSIM_DMR0		0x10c		/* DRAM 0 Mask reg (r/w) */
-#define MCFSIM_DACR1		0x110		/* DRAM 1 Addr and Ctrl (r/w) */
-#define MCFSIM_DMR1		0x114		/* DRAM 1 Mask reg (r/w) */
+#define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
+#define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
+#define MCFSIM_DMR0		(MCF_MBAR + 0x10c)	/* DRAM 0 Mask */
+#define MCFSIM_DACR1		(MCF_MBAR + 0x110)	/* DRAM 1 Addr/Ctrl */
+#define MCFSIM_DMR1		(MCF_MBAR + 0x114)	/* DRAM 1 Mask */
 
 /*
  *	UART module.
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 04b8c10..838fb2b 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -43,21 +43,21 @@
  *	SDRAM configuration registers.
  */
 #ifdef CONFIG_M5271
-#define	MCFSIM_DCR		0x40		/* SDRAM control */
-#define	MCFSIM_DACR0		0x48		/* SDRAM base address 0 */
-#define	MCFSIM_DMR0		0x4c		/* SDRAM address mask 0 */
-#define	MCFSIM_DACR1		0x50		/* SDRAM base address 1 */
-#define	MCFSIM_DMR1		0x54		/* SDRAM address mask 1 */
+#define	MCFSIM_DCR		(MCF_IPSBAR + 0x40)	/* Control */
+#define	MCFSIM_DACR0		(MCF_IPSBAR + 0x48)	/* Base address 0 */
+#define	MCFSIM_DMR0		(MCF_IPSBAR + 0x4c)	/* Address mask 0 */
+#define	MCFSIM_DACR1		(MCF_IPSBAR + 0x50)	/* Base address 1 */
+#define	MCFSIM_DMR1		(MCF_IPSBAR + 0x54)	/* Address mask 1 */
 #endif
 #ifdef CONFIG_M5275
-#define	MCFSIM_DMR		0x40		/* SDRAM mode */
-#define	MCFSIM_DCR		0x44		/* SDRAM control */
-#define	MCFSIM_DCFG1		0x48		/* SDRAM configuration 1 */
-#define	MCFSIM_DCFG2		0x4c		/* SDRAM configuration 2 */
-#define	MCFSIM_DBAR0		0x50		/* SDRAM base address 0 */
-#define	MCFSIM_DMR0		0x54		/* SDRAM address mask 0 */
-#define	MCFSIM_DBAR1		0x58		/* SDRAM base address 1 */
-#define	MCFSIM_DMR1		0x5c		/* SDRAM address mask 1 */
+#define	MCFSIM_DMR		(MCF_IPSBAR + 0x40)	/* Mode */
+#define	MCFSIM_DCR		(MCF_IPSBAR + 0x44)	/* Control */
+#define	MCFSIM_DCFG1		(MCF_IPSBAR + 0x48)	/* Configuration 1 */
+#define	MCFSIM_DCFG2		(MCF_IPSBAR + 0x4c)	/* Configuration 2 */
+#define	MCFSIM_DBAR0		(MCF_IPSBAR + 0x50)	/* Base address 0 */
+#define	MCFSIM_DMR0		(MCF_IPSBAR + 0x54)	/* Address mask 0 */
+#define	MCFSIM_DBAR1		(MCF_IPSBAR + 0x58)	/* Base address 1 */
+#define	MCFSIM_DMR1		(MCF_IPSBAR + 0x5c)	/* Address mask 1 */
 #endif
 
 /*
diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index 87c0cce..47324f2 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -40,11 +40,11 @@
 /*
  *	SDRAM configuration registers.
  */
-#define	MCFSIM_DCR		0x44		/* SDRAM control */
-#define	MCFSIM_DACR0		0x48		/* SDRAM base address 0 */
-#define	MCFSIM_DMR0		0x4c		/* SDRAM address mask 0 */
-#define	MCFSIM_DACR1		0x50		/* SDRAM base address 1 */
-#define	MCFSIM_DMR1		0x54		/* SDRAM address mask 1 */
+#define	MCFSIM_DCR		(MCF_IPSBAR + 0x00000044) /* Control */
+#define	MCFSIM_DACR0		(MCF_IPSBAR + 0x00000048) /* Base address 0 */
+#define	MCFSIM_DMR0		(MCF_IPSBAR + 0x0000004c) /* Address mask 0 */
+#define	MCFSIM_DACR1		(MCF_IPSBAR + 0x00000050) /* Base address 1 */
+#define	MCFSIM_DMR1		(MCF_IPSBAR + 0x00000054) /* Address mask 1 */
 
 /*
  *	DMA unit base addresses.
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 3928576..a0e87cb 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -89,11 +89,11 @@
 #define MCFSIM_CSCR7		0xde		/* CS 7 Control reg (r/w) */
 #endif /* CONFIG_OLDMASK */
 
-#define MCFSIM_DCR		0x100		/* DRAM Control reg (r/w) */
-#define MCFSIM_DACR0		0x108		/* DRAM 0 Addr and Ctrl (r/w) */
-#define MCFSIM_DMR0		0x10c		/* DRAM 0 Mask reg (r/w) */
-#define MCFSIM_DACR1		0x110		/* DRAM 1 Addr and Ctrl (r/w) */
-#define MCFSIM_DMR1		0x114		/* DRAM 1 Mask reg (r/w) */
+#define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
+#define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM Addr/Ctrl 0 */
+#define MCFSIM_DMR0		(MCF_MBAR + 0x10c)	/* DRAM Mask 0 */
+#define MCFSIM_DACR1		(MCF_MBAR + 0x110)	/* DRAM Addr/Ctrl 1 */
+#define MCFSIM_DMR1		(MCF_MBAR + 0x114)	/* DRAM Mask 1 */
 
 #define	MCFSIM_PADDR		(MCF_MBAR + 0x244)
 #define	MCFSIM_PADAT		(MCF_MBAR + 0x248)
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 7018172..ca9f55b 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -72,11 +72,11 @@
 #define MCFSIM_CSMR7		0xd8		/* CS 7 Mask reg (r/w) */
 #define MCFSIM_CSCR7		0xde		/* CS 7 Control reg (r/w) */
 
-#define MCFSIM_DCR		0x100		/* DRAM Control reg (r/w) */
-#define MCFSIM_DACR0		0x108		/* DRAM 0 Addr and Ctrl (r/w) */
-#define MCFSIM_DMR0		0x10c		/* DRAM 0 Mask reg (r/w) */
-#define MCFSIM_DACR1		0x110		/* DRAM 1 Addr and Ctrl (r/w) */
-#define MCFSIM_DMR1		0x114		/* DRAM 1 Mask reg (r/w) */
+#define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
+#define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
+#define MCFSIM_DMR0		(MCF_MBAR + 0x10c)	/* DRAM 0 Mask */
+#define MCFSIM_DACR1		(MCF_MBAR + 0x110)	/* DRAM 1 Addr/Ctrl */
+#define MCFSIM_DMR1		(MCF_MBAR + 0x114)	/* DRAM 1 Mask */
 
 #define MCFUART_BASE1		0x1c0           /* Base address of UART1 */
 #define MCFUART_BASE2		0x200           /* Base address of UART2 */
diff --git a/arch/m68knommu/platform/coldfire/head.S b/arch/m68knommu/platform/coldfire/head.S
index 7967e8a..129bff4 100644
--- a/arch/m68knommu/platform/coldfire/head.S
+++ b/arch/m68knommu/platform/coldfire/head.S
@@ -41,17 +41,17 @@
  *	DRAM controller is quite different.
  */
 .macro GET_MEM_SIZE
-	movel	MCF_MBAR+MCFSIM_DMR0,%d0 /* get mask for 1st bank */
+	movel	MCFSIM_DMR0,%d0		/* get mask for 1st bank */
 	btst	#0,%d0			/* check if region enabled */
 	beq	1f
 	andl	#0xfffc0000,%d0
 	beq	1f
 	addl	#0x00040000,%d0		/* convert mask to size */
 1:
-	movel	MCF_MBAR+MCFSIM_DMR1,%d1 /* get mask for 2nd bank */
+	movel	MCFSIM_DMR1,%d1		/* get mask for 2nd bank */
 	btst	#0,%d1			/* check if region enabled */
 	beq	2f
-	andl	#0xfffc0000, %d1
+	andl	#0xfffc0000,%d1
 	beq	2f
 	addl	#0x00040000,%d1
 	addl	%d1,%d0			/* total mem size in d0 */
-- 
1.7.0.4
