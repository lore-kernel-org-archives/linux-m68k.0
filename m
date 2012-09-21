From: <gerg@snapgear.com>
Subject: [PATCH 07/11] m68knommu: use read/write IO access functions in ColdFire m532x setup code
Date: Fri, 21 Sep 2012 16:51:09 +1000
Message-ID: <1348210273-31246-8-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28554 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754302Ab2IUGvl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:41 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Get rid of the use of local IO access macros and switch to using the standard
read*/write* family of access functions for the ColdFire m532x setup code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m532xsim.h    |  104 +++++++++-----------
 arch/m68k/platform/coldfire/m532x.c |  183 +++++++++++++++++------------------
 2 files changed, 139 insertions(+), 148 deletions(-)

diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m532xsim.h
index d4092fa..8668e47 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m532xsim.h
@@ -15,10 +15,6 @@
 
 #include <asm/m53xxacr.h>
 
-#define MCF_REG32(x) (*(volatile unsigned long  *)(x))
-#define MCF_REG16(x) (*(volatile unsigned short *)(x))
-#define MCF_REG08(x) (*(volatile unsigned char  *)(x))
-
 #define MCFINT_VECBASE      64
 #define MCFINT_UART0        26          /* Interrupt number for UART0 */
 #define MCFINT_UART1        27          /* Interrupt number for UART1 */
@@ -38,7 +34,7 @@
 
 #define	MCF_IRQ_QSPI	    (MCFINT_VECBASE + MCFINT_QSPI)
 
-#define MCF_WTM_WCR	MCF_REG16(0xFC098000)
+#define MCF_WTM_WCR		0xFC098000
 
 /*
  *	Define the 532x SIM register set addresses.
@@ -181,13 +177,13 @@
  *********************************************************************/
 
 /* Register read/write macros */
-#define MCF_CCM_CCR               MCF_REG16(0xFC0A0004)
-#define MCF_CCM_RCON              MCF_REG16(0xFC0A0008)
-#define MCF_CCM_CIR               MCF_REG16(0xFC0A000A)
-#define MCF_CCM_MISCCR            MCF_REG16(0xFC0A0010)
-#define MCF_CCM_CDR               MCF_REG16(0xFC0A0012)
-#define MCF_CCM_UHCSR             MCF_REG16(0xFC0A0014)
-#define MCF_CCM_UOCSR             MCF_REG16(0xFC0A0016)
+#define MCF_CCM_CCR               0xFC0A0004
+#define MCF_CCM_RCON              0xFC0A0008
+#define MCF_CCM_CIR               0xFC0A000A
+#define MCF_CCM_MISCCR            0xFC0A0010
+#define MCF_CCM_CDR               0xFC0A0012
+#define MCF_CCM_UHCSR             0xFC0A0014
+#define MCF_CCM_UOCSR             0xFC0A0016
 
 /* Bit definitions and macros for MCF_CCM_CCR */
 #define MCF_CCM_CCR_RESERVED      (0x0001)
@@ -256,27 +252,24 @@
  *********************************************************************/
 
 /* Register read/write macros */
-#define MCF_FBCS0_CSAR		MCF_REG32(0xFC008000)
-#define MCF_FBCS0_CSMR		MCF_REG32(0xFC008004)
-#define MCF_FBCS0_CSCR		MCF_REG32(0xFC008008)
-#define MCF_FBCS1_CSAR		MCF_REG32(0xFC00800C)
-#define MCF_FBCS1_CSMR		MCF_REG32(0xFC008010)
-#define MCF_FBCS1_CSCR		MCF_REG32(0xFC008014)
-#define MCF_FBCS2_CSAR		MCF_REG32(0xFC008018)
-#define MCF_FBCS2_CSMR		MCF_REG32(0xFC00801C)
-#define MCF_FBCS2_CSCR		MCF_REG32(0xFC008020)
-#define MCF_FBCS3_CSAR		MCF_REG32(0xFC008024)
-#define MCF_FBCS3_CSMR		MCF_REG32(0xFC008028)
-#define MCF_FBCS3_CSCR		MCF_REG32(0xFC00802C)
-#define MCF_FBCS4_CSAR		MCF_REG32(0xFC008030)
-#define MCF_FBCS4_CSMR		MCF_REG32(0xFC008034)
-#define MCF_FBCS4_CSCR		MCF_REG32(0xFC008038)
-#define MCF_FBCS5_CSAR		MCF_REG32(0xFC00803C)
-#define MCF_FBCS5_CSMR		MCF_REG32(0xFC008040)
-#define MCF_FBCS5_CSCR		MCF_REG32(0xFC008044)
-#define MCF_FBCS_CSAR(x)	MCF_REG32(0xFC008000+((x)*0x00C))
-#define MCF_FBCS_CSMR(x)	MCF_REG32(0xFC008004+((x)*0x00C))
-#define MCF_FBCS_CSCR(x)	MCF_REG32(0xFC008008+((x)*0x00C))
+#define MCF_FBCS0_CSAR		0xFC008000
+#define MCF_FBCS0_CSMR		0xFC008004
+#define MCF_FBCS0_CSCR		0xFC008008
+#define MCF_FBCS1_CSAR		0xFC00800C
+#define MCF_FBCS1_CSMR		0xFC008010
+#define MCF_FBCS1_CSCR		0xFC008014
+#define MCF_FBCS2_CSAR		0xFC008018
+#define MCF_FBCS2_CSMR		0xFC00801C
+#define MCF_FBCS2_CSCR		0xFC008020
+#define MCF_FBCS3_CSAR		0xFC008024
+#define MCF_FBCS3_CSMR		0xFC008028
+#define MCF_FBCS3_CSCR		0xFC00802C
+#define MCF_FBCS4_CSAR		0xFC008030
+#define MCF_FBCS4_CSMR		0xFC008034
+#define MCF_FBCS4_CSCR		0xFC008038
+#define MCF_FBCS5_CSAR		0xFC00803C
+#define MCF_FBCS5_CSMR		0xFC008040
+#define MCF_FBCS5_CSCR		0xFC008044
 
 /* Bit definitions and macros for MCF_FBCS_CSAR */
 #define MCF_FBCS_CSAR_BA(x)	((x)&0xFFFF0000)
@@ -1114,10 +1107,10 @@
  *********************************************************************/
 
 /* Register read/write macros */
-#define MCF_PLL_PODR              MCF_REG08(0xFC0C0000)
-#define MCF_PLL_PLLCR             MCF_REG08(0xFC0C0004)
-#define MCF_PLL_PMDR              MCF_REG08(0xFC0C0008)
-#define MCF_PLL_PFDR              MCF_REG08(0xFC0C000C)
+#define MCF_PLL_PODR              0xFC0C0000
+#define MCF_PLL_PLLCR             0xFC0C0004
+#define MCF_PLL_PMDR              0xFC0C0008
+#define MCF_PLL_PFDR              0xFC0C000C
 
 /* Bit definitions and macros for MCF_PLL_PODR */
 #define MCF_PLL_PODR_BUSDIV(x)    (((x)&0x0F)<<0)
@@ -1140,15 +1133,15 @@
  *********************************************************************/
 
 /* Register read/write macros */
-#define MCF_SCM_MPR			MCF_REG32(0xFC000000)
-#define MCF_SCM_PACRA			MCF_REG32(0xFC000020)
-#define MCF_SCM_PACRB			MCF_REG32(0xFC000024)
-#define MCF_SCM_PACRC			MCF_REG32(0xFC000028)
-#define MCF_SCM_PACRD			MCF_REG32(0xFC00002C)
-#define MCF_SCM_PACRE			MCF_REG32(0xFC000040)
-#define MCF_SCM_PACRF			MCF_REG32(0xFC000044)
+#define MCF_SCM_MPR			0xFC000000
+#define MCF_SCM_PACRA			0xFC000020
+#define MCF_SCM_PACRB			0xFC000024
+#define MCF_SCM_PACRC			0xFC000028
+#define MCF_SCM_PACRD			0xFC00002C
+#define MCF_SCM_PACRE			0xFC000040
+#define MCF_SCM_PACRF			0xFC000044
 
-#define MCF_SCM_BCR			MCF_REG32(0xFC040024)
+#define MCF_SCM_BCR			0xFC040024
 
 /*********************************************************************
  *
@@ -1157,17 +1150,16 @@
  *********************************************************************/
 
 /* Register read/write macros */
-#define MCF_SDRAMC_SDMR			MCF_REG32(0xFC0B8000)
-#define MCF_SDRAMC_SDCR			MCF_REG32(0xFC0B8004)
-#define MCF_SDRAMC_SDCFG1		MCF_REG32(0xFC0B8008)
-#define MCF_SDRAMC_SDCFG2		MCF_REG32(0xFC0B800C)
-#define MCF_SDRAMC_LIMP_FIX		MCF_REG32(0xFC0B8080)
-#define MCF_SDRAMC_SDDS			MCF_REG32(0xFC0B8100)
-#define MCF_SDRAMC_SDCS0		MCF_REG32(0xFC0B8110)
-#define MCF_SDRAMC_SDCS1		MCF_REG32(0xFC0B8114)
-#define MCF_SDRAMC_SDCS2		MCF_REG32(0xFC0B8118)
-#define MCF_SDRAMC_SDCS3		MCF_REG32(0xFC0B811C)
-#define MCF_SDRAMC_SDCS(x)		MCF_REG32(0xFC0B8110+((x)*0x004))
+#define MCF_SDRAMC_SDMR			0xFC0B8000
+#define MCF_SDRAMC_SDCR			0xFC0B8004
+#define MCF_SDRAMC_SDCFG1		0xFC0B8008
+#define MCF_SDRAMC_SDCFG2		0xFC0B800C
+#define MCF_SDRAMC_LIMP_FIX		0xFC0B8080
+#define MCF_SDRAMC_SDDS			0xFC0B8100
+#define MCF_SDRAMC_SDCS0		0xFC0B8110
+#define MCF_SDRAMC_SDCS1		0xFC0B8114
+#define MCF_SDRAMC_SDCS2		0xFC0B8118
+#define MCF_SDRAMC_SDCS3		0xFC0B811C
 
 /* Bit definitions and macros for MCF_SDRAMC_SDMR */
 #define MCF_SDRAMC_SDMR_CMD		(0x00010000)
diff --git a/arch/m68k/platform/coldfire/m532x.c b/arch/m68k/platform/coldfire/m532x.c
index 0adeef1..7951d1d 100644
--- a/arch/m68k/platform/coldfire/m532x.c
+++ b/arch/m68k/platform/coldfire/m532x.c
@@ -304,7 +304,7 @@ asmlinkage void __init sysinit(void)
 void wtm_init(void)
 {
 	/* Disable watchdog timer */
-	MCF_WTM_WCR = 0;
+	writew(0, MCF_WTM_WCR);
 }
 
 #define MCF_SCM_BCR_GBW		(0x00000100)
@@ -313,19 +313,19 @@ void wtm_init(void)
 void scm_init(void)
 {
 	/* All masters are trusted */
-	MCF_SCM_MPR = 0x77777777;
+	writel(0x77777777, MCF_SCM_MPR);
     
 	/* Allow supervisor/user, read/write, and trusted/untrusted
 	   access to all slaves */
-	MCF_SCM_PACRA = 0;
-	MCF_SCM_PACRB = 0;
-	MCF_SCM_PACRC = 0;
-	MCF_SCM_PACRD = 0;
-	MCF_SCM_PACRE = 0;
-	MCF_SCM_PACRF = 0;
+	writel(0, MCF_SCM_PACRA);
+	writel(0, MCF_SCM_PACRB);
+	writel(0, MCF_SCM_PACRC);
+	writel(0, MCF_SCM_PACRD);
+	writel(0, MCF_SCM_PACRE);
+	writel(0, MCF_SCM_PACRF);
 
 	/* Enable bursts */
-	MCF_SCM_BCR = (MCF_SCM_BCR_GBR | MCF_SCM_BCR_GBW);
+	writel(MCF_SCM_BCR_GBR | MCF_SCM_BCR_GBW, MCF_SCM_BCR);
 }
 
 
@@ -334,32 +334,32 @@ void fbcs_init(void)
 	writeb(0x3E, MCFGPIO_PAR_CS);
 
 	/* Latch chip select */
-	MCF_FBCS1_CSAR = 0x10080000;
+	writel(0x10080000, MCF_FBCS1_CSAR);
 
-	MCF_FBCS1_CSCR = 0x002A3780;
-	MCF_FBCS1_CSMR = (MCF_FBCS_CSMR_BAM_2M | MCF_FBCS_CSMR_V);
+	writel(0x002A3780, MCF_FBCS1_CSCR);
+	writel(MCF_FBCS_CSMR_BAM_2M | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
 
 	/* Initialize latch to drive signals to inactive states */
-	*((u16 *)(0x10080000)) = 0xFFFF;
+	writew(0xffff, 0x10080000);
 
 	/* External SRAM */
-	MCF_FBCS1_CSAR = EXT_SRAM_ADDRESS;
-	MCF_FBCS1_CSCR = (MCF_FBCS_CSCR_PS_16
-			| MCF_FBCS_CSCR_AA
-			| MCF_FBCS_CSCR_SBM
-			| MCF_FBCS_CSCR_WS(1));
-	MCF_FBCS1_CSMR = (MCF_FBCS_CSMR_BAM_512K
-			| MCF_FBCS_CSMR_V);
+	writel(EXT_SRAM_ADDRESS, MCF_FBCS1_CSAR);
+	writel(MCF_FBCS_CSCR_PS_16 |
+		MCF_FBCS_CSCR_AA |
+		MCF_FBCS_CSCR_SBM |
+		MCF_FBCS_CSCR_WS(1),
+		MCF_FBCS1_CSCR);
+	writel(MCF_FBCS_CSMR_BAM_512K | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
 
 	/* Boot Flash connected to FBCS0 */
-	MCF_FBCS0_CSAR = FLASH_ADDRESS;
-	MCF_FBCS0_CSCR = (MCF_FBCS_CSCR_PS_16
-			| MCF_FBCS_CSCR_BEM
-			| MCF_FBCS_CSCR_AA
-			| MCF_FBCS_CSCR_SBM
-			| MCF_FBCS_CSCR_WS(7));
-	MCF_FBCS0_CSMR = (MCF_FBCS_CSMR_BAM_32M
-			| MCF_FBCS_CSMR_V);
+	writel(FLASH_ADDRESS, MCF_FBCS0_CSAR);
+	writel(MCF_FBCS_CSCR_PS_16 |
+		MCF_FBCS_CSCR_BEM |
+		MCF_FBCS_CSCR_AA |
+		MCF_FBCS_CSCR_SBM |
+		MCF_FBCS_CSCR_WS(7),
+		MCF_FBCS0_CSCR);
+	writel(MCF_FBCS_CSMR_BAM_32M | MCF_FBCS_CSMR_V, MCF_FBCS0_CSMR);
 }
 
 void sdramc_init(void)
@@ -368,86 +368,86 @@ void sdramc_init(void)
 	 * Check to see if the SDRAM has already been initialized
 	 * by a run control tool
 	 */
-	if (!(MCF_SDRAMC_SDCR & MCF_SDRAMC_SDCR_REF)) {
+	if (!(readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)) {
 		/* SDRAM chip select initialization */
 		
 		/* Initialize SDRAM chip select */
-		MCF_SDRAMC_SDCS0 = (0
-			| MCF_SDRAMC_SDCS_BA(SDRAM_ADDRESS)
-			| MCF_SDRAMC_SDCS_CSSZ(MCF_SDRAMC_SDCS_CSSZ_32MBYTE));
+		writel(MCF_SDRAMC_SDCS_BA(SDRAM_ADDRESS) |
+			MCF_SDRAMC_SDCS_CSSZ(MCF_SDRAMC_SDCS_CSSZ_32MBYTE),
+			MCF_SDRAMC_SDCS0);
 
 	/*
 	 * Basic configuration and initialization
 	 */
-	MCF_SDRAMC_SDCFG1 = (0
-		| MCF_SDRAMC_SDCFG1_SRD2RW((int)((SDRAM_CASL + 2) + 0.5 ))
-		| MCF_SDRAMC_SDCFG1_SWT2RD(SDRAM_TWR + 1)
-		| MCF_SDRAMC_SDCFG1_RDLAT((int)((SDRAM_CASL*2) + 2))
-		| MCF_SDRAMC_SDCFG1_ACT2RW((int)((SDRAM_TRCD ) + 0.5))
-		| MCF_SDRAMC_SDCFG1_PRE2ACT((int)((SDRAM_TRP ) + 0.5))
-		| MCF_SDRAMC_SDCFG1_REF2ACT((int)(((SDRAM_TRFC) ) + 0.5))
-		| MCF_SDRAMC_SDCFG1_WTLAT(3));
-	MCF_SDRAMC_SDCFG2 = (0
-		| MCF_SDRAMC_SDCFG2_BRD2PRE(SDRAM_BL/2 + 1)
-		| MCF_SDRAMC_SDCFG2_BWT2RW(SDRAM_BL/2 + SDRAM_TWR)
-		| MCF_SDRAMC_SDCFG2_BRD2WT((int)((SDRAM_CASL+SDRAM_BL/2-1.0)+0.5))
-		| MCF_SDRAMC_SDCFG2_BL(SDRAM_BL-1));
+	writel(MCF_SDRAMC_SDCFG1_SRD2RW((int)((SDRAM_CASL + 2) + 0.5)) |
+		MCF_SDRAMC_SDCFG1_SWT2RD(SDRAM_TWR + 1) |
+		MCF_SDRAMC_SDCFG1_RDLAT((int)((SDRAM_CASL * 2) + 2)) |
+		MCF_SDRAMC_SDCFG1_ACT2RW((int)(SDRAM_TRCD + 0.5)) |
+		MCF_SDRAMC_SDCFG1_PRE2ACT((int)(SDRAM_TRP + 0.5)) |
+		MCF_SDRAMC_SDCFG1_REF2ACT((int)(SDRAM_TRFC + 0.5)) |
+		MCF_SDRAMC_SDCFG1_WTLAT(3),
+		MCF_SDRAMC_SDCFG1);
+	writel(MCF_SDRAMC_SDCFG2_BRD2PRE(SDRAM_BL / 2 + 1) |
+		MCF_SDRAMC_SDCFG2_BWT2RW(SDRAM_BL / 2 + SDRAM_TWR) |
+		MCF_SDRAMC_SDCFG2_BRD2WT((int)((SDRAM_CASL + SDRAM_BL / 2 - 1.0) + 0.5)) |
+		MCF_SDRAMC_SDCFG2_BL(SDRAM_BL - 1),
+		MCF_SDRAMC_SDCFG2);
 
             
 	/*
 	 * Precharge and enable write to SDMR
 	 */
-        MCF_SDRAMC_SDCR = (0
-		| MCF_SDRAMC_SDCR_MODE_EN
-		| MCF_SDRAMC_SDCR_CKE
-		| MCF_SDRAMC_SDCR_DDR
-		| MCF_SDRAMC_SDCR_MUX(1)
-		| MCF_SDRAMC_SDCR_RCNT((int)(((SDRAM_TREFI/(SYSTEM_PERIOD*64)) - 1) + 0.5))
-		| MCF_SDRAMC_SDCR_PS_16
-		| MCF_SDRAMC_SDCR_IPALL);            
+	writel(MCF_SDRAMC_SDCR_MODE_EN |
+		MCF_SDRAMC_SDCR_CKE |
+		MCF_SDRAMC_SDCR_DDR |
+		MCF_SDRAMC_SDCR_MUX(1) |
+		MCF_SDRAMC_SDCR_RCNT((int)(((SDRAM_TREFI / (SYSTEM_PERIOD * 64)) - 1) + 0.5)) |
+		MCF_SDRAMC_SDCR_PS_16 |
+		MCF_SDRAMC_SDCR_IPALL,
+		MCF_SDRAMC_SDCR);
 
 	/*
 	 * Write extended mode register
 	 */
-	MCF_SDRAMC_SDMR = (0
-		| MCF_SDRAMC_SDMR_BNKAD_LEMR
-		| MCF_SDRAMC_SDMR_AD(0x0)
-		| MCF_SDRAMC_SDMR_CMD);
+	writel(MCF_SDRAMC_SDMR_BNKAD_LEMR |
+		MCF_SDRAMC_SDMR_AD(0x0) |
+		MCF_SDRAMC_SDMR_CMD,
+		MCF_SDRAMC_SDMR);
 
 	/*
 	 * Write mode register and reset DLL
 	 */
-	MCF_SDRAMC_SDMR = (0
-		| MCF_SDRAMC_SDMR_BNKAD_LMR
-		| MCF_SDRAMC_SDMR_AD(0x163)
-		| MCF_SDRAMC_SDMR_CMD);
+	writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
+		MCF_SDRAMC_SDMR_AD(0x163) |
+		MCF_SDRAMC_SDMR_CMD,
+		MCF_SDRAMC_SDMR);
 
 	/*
 	 * Execute a PALL command
 	 */
-	MCF_SDRAMC_SDCR |= MCF_SDRAMC_SDCR_IPALL;
+	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IPALL, MCF_SDRAMC_SDCR);
 
 	/*
 	 * Perform two REF cycles
 	 */
-	MCF_SDRAMC_SDCR |= MCF_SDRAMC_SDCR_IREF;
-	MCF_SDRAMC_SDCR |= MCF_SDRAMC_SDCR_IREF;
+	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
+	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
 
 	/*
 	 * Write mode register and clear reset DLL
 	 */
-	MCF_SDRAMC_SDMR = (0
-		| MCF_SDRAMC_SDMR_BNKAD_LMR
-		| MCF_SDRAMC_SDMR_AD(0x063)
-		| MCF_SDRAMC_SDMR_CMD);
+	writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
+		MCF_SDRAMC_SDMR_AD(0x063) |
+		MCF_SDRAMC_SDMR_CMD,
+		MCF_SDRAMC_SDMR);
 				
 	/*
 	 * Enable auto refresh and lock SDMR
 	 */
-	MCF_SDRAMC_SDCR &= ~MCF_SDRAMC_SDCR_MODE_EN;
-	MCF_SDRAMC_SDCR |= (0
-		| MCF_SDRAMC_SDCR_REF
-		| MCF_SDRAMC_SDCR_DQS_OE(0xC));
+	writel(readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_MODE_EN,
+		MCF_SDRAMC_SDCR);
+	writel(MCF_SDRAMC_SDCR_REF | MCF_SDRAMC_SDCR_DQS_OE(0xC),
+		MCF_SDRAMC_SDCR);
 	}
 }
 
@@ -475,7 +475,7 @@ int clock_pll(int fsys, int flags)
         
 	if (fsys == 0) {
 		/* Return current PLL output */
-		mfd = MCF_PLL_PFDR;
+		mfd = readb(MCF_PLL_PFDR);
 
 		return (fref * mfd / (BUSDIV * 4));
 	}
@@ -501,9 +501,10 @@ int clock_pll(int fsys, int flags)
 	 * If it has then the SDRAM needs to be put into self refresh
 	 * mode before reprogramming the PLL.
 	 */
-	if (MCF_SDRAMC_SDCR & MCF_SDRAMC_SDCR_REF)
+	if (readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
 		/* Put SDRAM into self refresh mode */
-		MCF_SDRAMC_SDCR &= ~MCF_SDRAMC_SDCR_CKE;
+		writel(readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_CKE,
+			MCF_SDRAMC_SDCR);
 
 	/*
 	 * Initialize the PLL to generate the new system clock frequency.
@@ -514,11 +515,10 @@ int clock_pll(int fsys, int flags)
 	clock_limp(DEFAULT_LPD);
      					
 	/* Reprogram PLL for desired fsys */
-	MCF_PLL_PODR = (0
-		| MCF_PLL_PODR_CPUDIV(BUSDIV/3)
-		| MCF_PLL_PODR_BUSDIV(BUSDIV));
+	writeb(MCF_PLL_PODR_CPUDIV(BUSDIV/3) | MCF_PLL_PODR_BUSDIV(BUSDIV),
+		MCF_PLL_PODR);
 						
-	MCF_PLL_PFDR = mfd;
+	writeb(mfd, MCF_PLL_PFDR);
 		
 	/* Exit LIMP mode */
 	clock_exit_limp();
@@ -526,12 +526,13 @@ int clock_pll(int fsys, int flags)
 	/*
 	 * Return the SDRAM to normal operation if it is in use.
 	 */
-	if (MCF_SDRAMC_SDCR & MCF_SDRAMC_SDCR_REF)
+	if (readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
 		/* Exit self refresh mode */
-		MCF_SDRAMC_SDCR |= MCF_SDRAMC_SDCR_CKE;
+		writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_CKE,
+			MCF_SDRAMC_SDCR);
 
 	/* Errata - workaround for SDRAM opeartion after exiting LIMP mode */
-	MCF_SDRAMC_LIMP_FIX = MCF_SDRAMC_REFRESH;
+	writel(MCF_SDRAMC_REFRESH, MCF_SDRAMC_LIMP_FIX);
 
 	/* wait for DQS logic to relock */
 	for (i = 0; i < 0x200; i++)
@@ -552,14 +553,12 @@ int clock_limp(int div)
     
 	/* Save of the current value of the SSIDIV so we don't
 	   overwrite the value*/
-	temp = (MCF_CCM_CDR & MCF_CCM_CDR_SSIDIV(0xF));
+	temp = readw(MCF_CCM_CDR) & MCF_CCM_CDR_SSIDIV(0xF);
       
 	/* Apply the divider to the system clock */
-	MCF_CCM_CDR = ( 0
-		| MCF_CCM_CDR_LPDIV(div)
-		| MCF_CCM_CDR_SSIDIV(temp));
+	writew(MCF_CCM_CDR_LPDIV(div) | MCF_CCM_CDR_SSIDIV(temp), MCF_CCM_CDR);
     
-	MCF_CCM_MISCCR |= MCF_CCM_MISCCR_LIMP;
+	writew(readw(MCF_CCM_MISCCR) | MCF_CCM_MISCCR_LIMP, MCF_CCM_MISCCR);
     
 	return (FREF/(3*(1 << div)));
 }
@@ -569,10 +568,10 @@ int clock_exit_limp(void)
 	int fout;
 	
 	/* Exit LIMP mode */
-	MCF_CCM_MISCCR = (MCF_CCM_MISCCR & ~ MCF_CCM_MISCCR_LIMP);
+	writew(readw(MCF_CCM_MISCCR) & ~MCF_CCM_MISCCR_LIMP, MCF_CCM_MISCCR);
 
 	/* Wait for PLL to lock */
-	while (!(MCF_CCM_MISCCR & MCF_CCM_MISCCR_PLL_LOCK))
+	while (!(readw(MCF_CCM_MISCCR) & MCF_CCM_MISCCR_PLL_LOCK))
 		;
 	
 	fout = get_sys_clock();
@@ -585,10 +584,10 @@ int get_sys_clock(void)
 	int divider;
 	
 	/* Test to see if device is in LIMP mode */
-	if (MCF_CCM_MISCCR & MCF_CCM_MISCCR_LIMP) {
-		divider = MCF_CCM_CDR & MCF_CCM_CDR_LPDIV(0xF);
+	if (readw(MCF_CCM_MISCCR) & MCF_CCM_MISCCR_LIMP) {
+		divider = readw(MCF_CCM_CDR) & MCF_CCM_CDR_LPDIV(0xF);
 		return (FREF/(2 << divider));
 	}
 	else
-		return ((FREF * MCF_PLL_PFDR) / (BUSDIV * 4));
+		return (FREF * readb(MCF_PLL_PFDR)) / (BUSDIV * 4);
 }
-- 
1.7.0.4
