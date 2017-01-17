From: Gideon Israel Dsouza <gidisrael@gmail.com>
Subject: [PATCH] m68k: Replaced all gcc specific macros with macros from compiler.h
Date: Tue, 17 Jan 2017 15:09:26 +0530
Message-ID: <1484645966-3592-1-git-send-email-gidisrael__134.917096193199$1484646092$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@linux-m68k.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, gideon@posteo.net
Cc: Gideon Israel Dsouza <gidisrael@gmail.com>

There is <linux/compiler.h> which provides macros for various gcc specific
constructs. Eg: __weak for __attribute__((weak)). I've cleaned all
instances of gcc specific attributes with the right macros for all files
under /arch/m68k

Note: I sent in a patch for a similar cleanup for /crypto this is
in the commit d8c34b949d8c9
(crypto: Replaced gcc specific attributes with macros from compiler.h)
This commit is currently in linux-next and has changes inside
compiler-gcc.h just like this patch does. Just highlighting this incase
there are merge issues.
---
 arch/m68k/68000/bootlogo-vz.h     |   4 +-
 arch/m68k/68000/bootlogo.h        |   5 +-
 arch/m68k/include/asm/MC68328.h   | 110 ++++++++++++++--------------
 arch/m68k/include/asm/MC68EZ328.h | 148 +++++++++++++++++++-------------------
 arch/m68k/include/asm/MC68VZ328.h | 148 +++++++++++++++++++-------------------
 arch/m68k/include/asm/natfeat.h   |   3 +-
 arch/m68k/lib/ashldi3.c           |   8 +--
 arch/m68k/lib/ashrdi3.c           |   8 +--
 arch/m68k/lib/lshrdi3.c           |   8 +--
 arch/m68k/lib/muldi3.c            |  10 +--
 include/linux/compiler-gcc.h      |   1 +
 11 files changed, 232 insertions(+), 221 deletions(-)

diff --git a/arch/m68k/68000/bootlogo-vz.h b/arch/m68k/68000/bootlogo-vz.h
index b38e2b2..6ff09be 100644
--- a/arch/m68k/68000/bootlogo-vz.h
+++ b/arch/m68k/68000/bootlogo-vz.h
@@ -1,6 +1,8 @@
+#include <linux/compiler.h>
+
 #define splash_width 640
 #define splash_height 480
-unsigned char __attribute__ ((aligned(16))) bootlogo_bits[] = {
+unsigned char __aligned(16) bootlogo_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/arch/m68k/68000/bootlogo.h b/arch/m68k/68000/bootlogo.h
index b896c93..5a202c4 100644
--- a/arch/m68k/68000/bootlogo.h
+++ b/arch/m68k/68000/bootlogo.h
@@ -1,6 +1,9 @@
+#include <linux/compiler.h>
+
 #define bootlogo_width 160
 #define bootlogo_height 160
-unsigned char __attribute__ ((aligned(16))) bootlogo_bits[] = {
+
+unsigned char __aligned(16) bootlogo_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x40, 0x55, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/arch/m68k/include/asm/MC68328.h b/arch/m68k/include/asm/MC68328.h
index 1a8080c..5219b38 100644
--- a/arch/m68k/include/asm/MC68328.h
+++ b/arch/m68k/include/asm/MC68328.h
@@ -9,6 +9,8 @@
  *
  */
 
+#include <linux/compiler.h>
+
 #ifndef _MC68328_H_
 #define _MC68328_H_
 
@@ -19,12 +21,12 @@
 #define PUT_FIELD(field, val) (((val) << field##_SHIFT) & field##_MASK)
 #define GET_FIELD(reg, field) (((reg) & field##_MASK) >> field##_SHIFT)
 
-/********** 
+/**********
  *
  * 0xFFFFF0xx -- System Control
  *
  **********/
- 
+
 /*
  * System Control Register (SCR)
  */
@@ -44,14 +46,14 @@
  */
 #define MRR_ADDR 0xfffff004
 #define MRR      LONG_REF(MRR_ADDR)
- 
-/********** 
+
+/**********
  *
  * 0xFFFFF1xx -- Chip-Select logic
  *
  **********/
 
-/********** 
+/**********
  *
  * 0xFFFFF2xx -- Phase Locked Loop (PLL) & Power Control
  *
@@ -74,7 +76,7 @@
 #define GRPBASE_GBA_MASK  0xfff0	/* Group Base Address (bits 31-20) */
 
 /*
- * Group Base Address Mask Registers 
+ * Group Base Address Mask Registers
  */
 #define GRPMASKA_ADDR	0xfffff108
 #define GRPMASKB_ADDR	0xfffff10a
@@ -181,9 +183,9 @@
  * 0xFFFFF2xx -- Phase Locked Loop (PLL) & Power Control
  *
  **********/
- 
+
 /*
- * PLL Control Register 
+ * PLL Control Register
  */
 #define PLLCR_ADDR	0xfffff200
 #define PLLCR		WORD_REF(PLLCR_ADDR)
@@ -220,7 +222,7 @@
 
 #define PCTRL_WIDTH_MASK	0x1f	/* CPU Clock bursts width */
 #define PCTRL_WIDTH_SHIFT	0
-#define PCTRL_STOP		0x40	/* Enter power-save mode immediately */ 
+#define PCTRL_STOP		0x40	/* Enter power-save mode immediately */
 #define PCTRL_PCEN		0x80	/* Power Control Enable */
 
 /**********
@@ -229,7 +231,7 @@
  *
  **********/
 
-/* 
+/*
  * Interrupt Vector Register
  */
 #define IVR_ADDR	0xfffff300
@@ -257,14 +259,14 @@
  */
 #define IMR_ADDR	0xfffff304
 #define IMR		LONG_REF(IMR_ADDR)
- 
+
 /*
  * Define the names for bit positions first. This is useful for
  * request_irq
  */
 #define SPIM_IRQ_NUM	0	/* SPI Master interrupt */
 #define	TMR2_IRQ_NUM	1	/* Timer 2 interrupt */
-#define UART_IRQ_NUM	2	/* UART interrupt */	
+#define UART_IRQ_NUM	2	/* UART interrupt */
 #define	WDT_IRQ_NUM	3	/* Watchdog Timer interrupt */
 #define RTC_IRQ_NUM	4	/* RTC interrupt */
 #define	KB_IRQ_NUM	6	/* Keyboard Interrupt */
@@ -289,13 +291,13 @@
 /* '328-compatible definitions */
 #define SPI_IRQ_NUM	SPIM_IRQ_NUM
 #define TMR_IRQ_NUM	TMR1_IRQ_NUM
- 
+
 /*
  * Here go the bitmasks themselves
  */
 #define IMR_MSPIM 	(1 << SPIM_IRQ_NUM)	/* Mask SPI Master interrupt */
 #define	IMR_MTMR2	(1 << TMR2_IRQ_NUM)	/* Mask Timer 2 interrupt */
-#define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */	
+#define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */
 #define	IMR_MWDT	(1 << WDT_IRQ_NUM)	/* Mask Watchdog Timer interrupt */
 #define IMR_MRTC	(1 << RTC_IRQ_NUM)	/* Mask RTC interrupt */
 #define	IMR_MKB		(1 << KB_IRQ_NUM)	/* Mask Keyboard Interrupt */
@@ -321,7 +323,7 @@
 #define IMR_MSPI	IMR_MSPIM
 #define IMR_MTMR	IMR_MTMR1
 
-/* 
+/*
  * Interrupt Wake-Up Enable Register
  */
 #define IWR_ADDR	0xfffff308
@@ -329,7 +331,7 @@
 
 #define IWR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	IWR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
-#define IWR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define IWR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	IWR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define IWR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	IWR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -351,15 +353,15 @@
 #define IWR_TMR1	(1 << TMR1_IRQ_NUM)	/* Timer 1 interrupt */
 #define IWR_IRQ7	(1 << IRQ7_IRQ_NUM)	/* IRQ7 */
 
-/* 
- * Interrupt Status Register 
+/*
+ * Interrupt Status Register
  */
 #define ISR_ADDR	0xfffff30c
 #define ISR		LONG_REF(ISR_ADDR)
 
 #define ISR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	ISR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
-#define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	ISR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define ISR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	ISR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -385,15 +387,15 @@
 #define ISR_SPI	ISR_SPIM
 #define ISR_TMR	ISR_TMR1
 
-/* 
- * Interrupt Pending Register 
+/*
+ * Interrupt Pending Register
  */
 #define IPR_ADDR	0xfffff310
 #define IPR		LONG_REF(IPR_ADDR)
 
 #define IPR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	IPR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
-#define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	IPR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define IPR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	IPR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -448,7 +450,7 @@
 #define PA_A22		PA(6)		/* Use A22 as PA(6) */
 #define PA_A23		PA(7)		/* Use A23 as PA(7) */
 
-/* 
+/*
  * Port B
  */
 #define PBDIR_ADDR	0xfffff408		/* Port B direction reg */
@@ -471,7 +473,7 @@
 #define PB_D6		PB(6)		/* Use D6 as PB(6) */
 #define PB_D7		PB(7)		/* Use D7 as PB(7) */
 
-/* 
+/*
  * Port C
  */
 #define PCDIR_ADDR	0xfffff410		/* Port C direction reg */
@@ -491,7 +493,7 @@
 #define PC_UDS		PC(1)		/* Use UDS   as PC(1) */
 #define PC_MOCLK	PC(0)		/* Use MOCLK as PC(0) */
 
-/* 
+/*
  * Port D
  */
 #define PDDIR_ADDR	0xfffff418		/* Port D direction reg */
@@ -520,7 +522,7 @@
 #define PD_KB6		PD(6)	/* Use KB6 as PD(6) */
 #define PD_KB7		PD(7)	/* Use KB7 as PD(7) */
 
-/* 
+/*
  * Port E
  */
 #define PEDIR_ADDR	0xfffff420		/* Port E direction reg */
@@ -543,7 +545,7 @@
 #define PE_CSB2		PE(6)	/* Use CSB2 as PE(6) */
 #define PE_CSB3		PE(7)	/* Use CSB3 as PE(7) */
 
-/* 
+/*
  * Port F
  */
 #define PFDIR_ADDR	0xfffff428		/* Port F direction reg */
@@ -568,7 +570,7 @@
 #define PF_A30		PF(6)	/* Use A30 as PF(6) */
 #define PF_A31		PF(7)	/* Use A31 as PF(7) */
 
-/* 
+/*
  * Port G
  */
 #define PGDIR_ADDR	0xfffff430		/* Port G direction reg */
@@ -592,7 +594,7 @@
 #define PG_TIN1		PG(6)	/* Use TIN1     as PG(6) */
 #define PG_RTCOUT	PG(7)	/* Use RTCOUT   as PG(7) */
 
-/* 
+/*
  * Port J
  */
 #define PJDIR_ADDR	0xfffff438		/* Port J direction reg */
@@ -603,11 +605,11 @@
 #define PJDATA		BYTE_REF(PJDATA_ADDR)
 #define PJSEL		BYTE_REF(PJSEL_ADDR)
 
-#define PJ(x)           (1 << (x)) 
+#define PJ(x)           (1 << (x))
 
 #define PJ_CSD3		PJ(7)	/* Use CSD3 as PJ(7) */
 
-/* 
+/*
  * Port K
  */
 #define PKDIR_ADDR	0xfffff440		/* Port K direction reg */
@@ -622,7 +624,7 @@
 
 #define PK(x)           (1 << (x))
 
-/* 
+/*
  * Port M
  */
 #define PMDIR_ADDR	0xfffff438		/* Port M direction reg */
@@ -644,7 +646,7 @@
  **********/
 
 /*
- * PWM Control Register 
+ * PWM Control Register
  */
 #define PWMC_ADDR	0xfffff500
 #define PWMC		WORD_REF(PWMC_ADDR)
@@ -667,8 +669,8 @@
 #define PWMP_ADDR	0xfffff502
 #define PWMP		WORD_REF(PWMP_ADDR)
 
-/* 
- * PWM Width Register 
+/*
+ * PWM Width Register
  */
 #define PWMW_ADDR	0xfffff504
 #define PWMW		WORD_REF(PWMW_ADDR)
@@ -685,7 +687,7 @@
  *
  **********/
 
-/* 
+/*
  * Timer Unit 1 and 2 Control Registers
  */
 #define TCTL1_ADDR	0xfffff600
@@ -775,13 +777,13 @@
 #define TSTAT		TSTAT1
 
 /*
- * Watchdog Compare Register 
+ * Watchdog Compare Register
  */
 #define WRR_ADDR	0xfffff61a
 #define WRR		WORD_REF(WRR_ADDR)
 
 /*
- * Watchdog Counter Register 
+ * Watchdog Counter Register
  */
 #define WCN_ADDR	0xfffff61c
 #define WCN		WORD_REF(WCN_ADDR)
@@ -884,7 +886,7 @@
 #define USTCNT_UARTEN		0x8000	/* UART Enable */
 
 /* 'EZ328-compatible definitions */
-#define USTCNT_TXAE	USTCNT_TXAVAILEN 
+#define USTCNT_TXAE	USTCNT_TXAVAILEN
 #define USTCNT_TXHE	USTCNT_TXHALFEN
 #define USTCNT_TXEE	USTCNT_TXEMPTYEN
 #define USTCNT_RXRE	USTCNT_RXREADYEN
@@ -913,7 +915,7 @@
 #define UBAUD_GPIODELTA		0x8000	/* GPIO pin value changed */
 
 /*
- * UART Receiver Register 
+ * UART Receiver Register
  */
 #define URX_ADDR	0xfffff904
 #define URX		WORD_REF(URX_ADDR)
@@ -932,7 +934,7 @@
 #define URX_FIFO_FULL	 0x8000	/* FIFO is Full */
 
 /*
- * UART Transmitter Register 
+ * UART Transmitter Register
  */
 #define UTX_ADDR	0xfffff906
 #define UTX		WORD_REF(UTX_ADDR)
@@ -955,7 +957,7 @@
 #define UTX_NOCTS	UTX_IGNORE_CTS
 
 /*
- * UART Miscellaneous Register 
+ * UART Miscellaneous Register
  */
 #define UMISC_ADDR	0xfffff908
 #define UMISC		WORD_REF(UMISC_ADDR)
@@ -993,7 +995,7 @@ typedef volatile struct {
   volatile unsigned short int pad1;
   volatile unsigned short int pad2;
   volatile unsigned short int pad3;
-} __attribute__((packed)) m68328_uart;
+} __packed m68328_uart;
 
 
 /**********
@@ -1003,7 +1005,7 @@ typedef volatile struct {
  **********/
 
 /*
- * LCD Screen Starting Address Register 
+ * LCD Screen Starting Address Register
  */
 #define LSSA_ADDR	0xfffffa00
 #define LSSA		LONG_REF(LSSA_ADDR)
@@ -1011,7 +1013,7 @@ typedef volatile struct {
 #define LSSA_SSA_MASK	0xfffffffe	/* Bit 0 is reserved */
 
 /*
- * LCD Virtual Page Width Register 
+ * LCD Virtual Page Width Register
  */
 #define LVPW_ADDR	0xfffffa05
 #define LVPW		BYTE_REF(LVPW_ADDR)
@@ -1075,7 +1077,7 @@ typedef volatile struct {
 #define LBLKC_BKEN	0x80	/* Blink Enabled */
 
 /*
- * LCD Panel Interface Configuration Register 
+ * LCD Panel Interface Configuration Register
  */
 #define LPICF_ADDR	0xfffffa20
 #define LPICF		BYTE_REF(LPICF_ADDR)
@@ -1089,7 +1091,7 @@ typedef volatile struct {
 #define   LPICF_PBSIZ_4    0x04
 
 /*
- * LCD Polarity Configuration Register 
+ * LCD Polarity Configuration Register
  */
 #define LPOLCF_ADDR	0xfffffa21
 #define LPOLCF		BYTE_REF(LPOLCF_ADDR)
@@ -1144,7 +1146,7 @@ typedef volatile struct {
 #define LLBAR_LBAR_SHIFT 0
 
 /*
- * LCD Octet Terminal Count Register 
+ * LCD Octet Terminal Count Register
  */
 #define LOTCR_ADDR	0xfffffa2b
 #define LOTCR		BYTE_REF(LOTCR_ADDR)
@@ -1177,11 +1179,11 @@ typedef volatile struct {
 #define LGPMR		WORD_REF(LGPMR_ADDR)
 
 #define LGPMR_GLEVEL3_MASK	0x000f
-#define LGPMR_GLEVEL3_SHIFT	0 
+#define LGPMR_GLEVEL3_SHIFT	0
 #define LGPMR_GLEVEL2_MASK	0x00f0
-#define LGPMR_GLEVEL2_SHIFT	4 
+#define LGPMR_GLEVEL2_SHIFT	4
 #define LGPMR_GLEVEL0_MASK	0x0f00
-#define LGPMR_GLEVEL0_SHIFT	8 
+#define LGPMR_GLEVEL0_SHIFT	8
 #define LGPMR_GLEVEL1_MASK	0xf000
 #define LGPMR_GLEVEL1_SHIFT	12
 
@@ -1205,7 +1207,7 @@ typedef volatile struct {
 #define RTCTIME_HOURS_SHIFT	24
 
 /*
- *  RTC Alarm Register 
+ *  RTC Alarm Register
  */
 #define RTCALRM_ADDR    0xfffffb04
 #define RTCALRM         LONG_REF(RTCALRM_ADDR)
@@ -1231,7 +1233,7 @@ typedef volatile struct {
 #define RTCCTL_EN	RTCCTL_ENABLE
 
 /*
- * RTC Interrupt Status Register 
+ * RTC Interrupt Status Register
  */
 #define RTCISR_ADDR	0xfffffb0e
 #define RTCISR		WORD_REF(RTCISR_ADDR)
@@ -1254,7 +1256,7 @@ typedef volatile struct {
 #define RTCIENR_DAY	0x0008	/* 24-hour rollover interrupt enable */
 #define RTCIENR_1HZ	0x0010	/* 1Hz interrupt enable */
 
-/* 
+/*
  * Stopwatch Minutes Register
  */
 #define STPWCH_ADDR	0xfffffb12
diff --git a/arch/m68k/include/asm/MC68EZ328.h b/arch/m68k/include/asm/MC68EZ328.h
index fedac87..402818d 100644
--- a/arch/m68k/include/asm/MC68EZ328.h
+++ b/arch/m68k/include/asm/MC68EZ328.h
@@ -10,6 +10,8 @@
  *
  */
 
+#include <linux/compiler.h>
+
 #ifndef _MC68EZ328_H_
 #define _MC68EZ328_H_
 
@@ -20,12 +22,12 @@
 #define PUT_FIELD(field, val) (((val) << field##_SHIFT) & field##_MASK)
 #define GET_FIELD(reg, field) (((reg) & field##_MASK) >> field##_SHIFT)
 
-/********** 
+/**********
  *
  * 0xFFFFF0xx -- System Control
  *
  **********/
- 
+
 /*
  * System Control Register (SCR)
  */
@@ -46,14 +48,14 @@
 #define MRR_ADDR 0xfffff004
 #define MRR	 LONG_REF(MRR_ADDR)
 
-/********** 
+/**********
  *
  * 0xFFFFF1xx -- Chip-Select logic
  *
  **********/
- 
+
 /*
- * Chip Select Group Base Registers 
+ * Chip Select Group Base Registers
  */
 #define CSGBA_ADDR	0xfffff100
 #define CSGBB_ADDR	0xfffff102
@@ -67,7 +69,7 @@
 #define CSGBD		WORD_REF(CSGBD_ADDR)
 
 /*
- * Chip Select Registers 
+ * Chip Select Registers
  */
 #define CSA_ADDR	0xfffff110
 #define CSB_ADDR	0xfffff112
@@ -130,7 +132,7 @@
 #define CSD_RO		0x8000		/* Read-Only */
 
 /*
- * Emulation Chip-Select Register 
+ * Emulation Chip-Select Register
  */
 #define EMUCS_ADDR	0xfffff118
 #define EMUCS		WORD_REF(EMUCS_ADDR)
@@ -138,14 +140,14 @@
 #define EMUCS_WS_MASK	0x0070
 #define EMUCS_WS_SHIFT	4
 
-/********** 
+/**********
  *
  * 0xFFFFF2xx -- Phase Locked Loop (PLL) & Power Control
  *
  **********/
 
 /*
- * PLL Control Register 
+ * PLL Control Register
  */
 #define PLLCR_ADDR	0xfffff200
 #define PLLCR		WORD_REF(PLLCR_ADDR)
@@ -191,7 +193,7 @@
  *
  **********/
 
-/* 
+/*
  * Interrupt Vector Register
  */
 #define IVR_ADDR	0xfffff300
@@ -222,12 +224,12 @@
 #define IMR		LONG_REF(IMR_ADDR)
 
 /*
- * Define the names for bit positions first. This is useful for 
+ * Define the names for bit positions first. This is useful for
  * request_irq
  */
 #define SPI_IRQ_NUM	0	/* SPI interrupt */
 #define TMR_IRQ_NUM	1	/* Timer interrupt */
-#define UART_IRQ_NUM	2	/* UART interrupt */	
+#define UART_IRQ_NUM	2	/* UART interrupt */
 #define	WDT_IRQ_NUM	3	/* Watchdog Timer interrupt */
 #define RTC_IRQ_NUM	4	/* RTC interrupt */
 #define	KB_IRQ_NUM	6	/* Keyboard Interrupt */
@@ -248,12 +250,12 @@
 #define SPIM_IRQ_NUM	SPI_IRQ_NUM
 #define TMR1_IRQ_NUM	TMR_IRQ_NUM
 
-/* 
+/*
  * Here go the bitmasks themselves
  */
 #define IMR_MSPI 	(1 << SPI_IRQ_NUM)	/* Mask SPI interrupt */
 #define	IMR_MTMR	(1 << TMR_IRQ_NUM)	/* Mask Timer interrupt */
-#define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */	
+#define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */
 #define	IMR_MWDT	(1 << WDT_IRQ_NUM)	/* Mask Watchdog Timer interrupt */
 #define IMR_MRTC	(1 << RTC_IRQ_NUM)	/* Mask RTC interrupt */
 #define	IMR_MKB		(1 << KB_IRQ_NUM)	/* Mask Keyboard Interrupt */
@@ -274,15 +276,15 @@
 #define IMR_MSPIM	IMR_MSPI
 #define IMR_MTMR1	IMR_MTMR
 
-/* 
- * Interrupt Status Register 
+/*
+ * Interrupt Status Register
  */
 #define ISR_ADDR	0xfffff30c
 #define ISR		LONG_REF(ISR_ADDR)
 
 #define ISR_SPI 	(1 << SPI_IRQ_NUM)	/* SPI interrupt */
 #define	ISR_TMR		(1 << TMR_IRQ_NUM)	/* Timer interrupt */
-#define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	ISR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define ISR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	ISR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -303,15 +305,15 @@
 #define ISR_SPIM	ISR_SPI
 #define ISR_TMR1	ISR_TMR
 
-/* 
- * Interrupt Pending Register 
+/*
+ * Interrupt Pending Register
  */
 #define IPR_ADDR	0xfffff30c
 #define IPR		LONG_REF(IPR_ADDR)
 
 #define IPR_SPI 	(1 << SPI_IRQ_NUM)	/* SPI interrupt */
 #define	IPR_TMR		(1 << TMR_IRQ_NUM)	/* Timer interrupt */
-#define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	IPR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define IPR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	IPR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -351,7 +353,7 @@
 
 #define PA(x)		(1 << (x))
 
-/* 
+/*
  * Port B
  */
 #define PBDIR_ADDR	0xfffff408		/* Port B direction reg */
@@ -368,14 +370,14 @@
 
 #define PB_CSB0		0x01	/* Use CSB0      as PB[0] */
 #define PB_CSB1		0x02	/* Use CSB1      as PB[1] */
-#define PB_CSC0_RAS0	0x04    /* Use CSC0/RAS0 as PB[2] */	
-#define PB_CSC1_RAS1	0x08    /* Use CSC1/RAS1 as PB[3] */	
-#define PB_CSD0_CAS0	0x10    /* Use CSD0/CAS0 as PB[4] */	
+#define PB_CSC0_RAS0	0x04    /* Use CSC0/RAS0 as PB[2] */
+#define PB_CSC1_RAS1	0x08    /* Use CSC1/RAS1 as PB[3] */
+#define PB_CSD0_CAS0	0x10    /* Use CSD0/CAS0 as PB[4] */
 #define PB_CSD1_CAS1	0x20    /* Use CSD1/CAS1 as PB[5] */
 #define PB_TIN_TOUT	0x40	/* Use TIN/TOUT  as PB[6] */
 #define PB_PWMO		0x80	/* Use PWMO      as PB[7] */
 
-/* 
+/*
  * Port C
  */
 #define PCDIR_ADDR	0xfffff410		/* Port C direction reg */
@@ -399,7 +401,7 @@
 #define PC_LCLK		0x40	/* Use LCLK as PC[6] */
 #define PC_LACD		0x80	/* Use LACD as PC[7] */
 
-/* 
+/*
  * Port D
  */
 #define PDDIR_ADDR	0xfffff418		/* Port D direction reg */
@@ -431,7 +433,7 @@
 #define PD_IRQ3		0x40	/* Use IRQ3 as PD[6] */
 #define PD_IRQ6		0x80	/* Use IRQ6 as PD[7] */
 
-/* 
+/*
  * Port E
  */
 #define PEDIR_ADDR	0xfffff420		/* Port E direction reg */
@@ -455,7 +457,7 @@
 #define PE_RTS		0x40	/* Use RTS    as PE[6] */
 #define PE_CTS		0x80	/* Use CTS    as PE[7] */
 
-/* 
+/*
  * Port F
  */
 #define PFDIR_ADDR	0xfffff428		/* Port F direction reg */
@@ -479,7 +481,7 @@
 #define PF_A23          0x40    /* Use A23       as PF[6] */
 #define PF_CSA1		0x80    /* Use CSA1      as PF[7] */
 
-/* 
+/*
  * Port G
  */
 #define PGDIR_ADDR	0xfffff430		/* Port G direction reg */
@@ -508,7 +510,7 @@
  **********/
 
 /*
- * PWM Control Register 
+ * PWM Control Register
  */
 #define PWMC_ADDR	0xfffff500
 #define PWMC		WORD_REF(PWMC_ADDR)
@@ -529,7 +531,7 @@
 #define PWMC_PWMEN	PWMC_EN
 
 /*
- * PWM Sample Register 
+ * PWM Sample Register
  */
 #define PWMS_ADDR	0xfffff502
 #define PWMS		WORD_REF(PWMS_ADDR)
@@ -552,7 +554,7 @@
  *
  **********/
 
-/* 
+/*
  * Timer Control register
  */
 #define TCTL_ADDR	0xfffff600
@@ -718,7 +720,7 @@
 #define UBAUD_UCLKDIR		0x2000	/* UCLK Direction */
 
 /*
- * UART Receiver Register 
+ * UART Receiver Register
  */
 #define URX_ADDR	0xfffff904
 #define URX		WORD_REF(URX_ADDR)
@@ -738,7 +740,7 @@
 #define URX_FIFO_FULL	 0x8000	/* FIFO is Full */
 
 /*
- * UART Transmitter Register 
+ * UART Transmitter Register
  */
 #define UTX_ADDR	0xfffff906
 #define UTX		WORD_REF(UTX_ADDR)
@@ -762,7 +764,7 @@
 #define UTX_IGNORE_CTS	UTX_NOCTS
 
 /*
- * UART Miscellaneous Register 
+ * UART Miscellaneous Register
  */
 #define UMISC_ADDR	0xfffff908
 #define UMISC		WORD_REF(UMISC_ADDR)
@@ -780,7 +782,7 @@
 #define UMISC_CLKSRC	 0x4000	/* Clock Source */
 #define UMISC_BAUD_TEST	 0x8000	/* Enable Baud Test Mode */
 
-/* 
+/*
  * UART Non-integer Prescaler Register
  */
 #define NIPR_ADDR	0xfffff90a
@@ -815,7 +817,7 @@ typedef volatile struct {
   volatile unsigned short int nipr;
   volatile unsigned short int pad1;
   volatile unsigned short int pad2;
-} __attribute__((packed)) m68328_uart;
+} __packed m68328_uart;
 
 
 /**********
@@ -825,7 +827,7 @@ typedef volatile struct {
  **********/
 
 /*
- * LCD Screen Starting Address Register 
+ * LCD Screen Starting Address Register
  */
 #define LSSA_ADDR	0xfffffa00
 #define LSSA		LONG_REF(LSSA_ADDR)
@@ -833,13 +835,13 @@ typedef volatile struct {
 #define LSSA_SSA_MASK	0x1ffffffe	/* Bits 0 and 29-31 are reserved */
 
 /*
- * LCD Virtual Page Width Register 
+ * LCD Virtual Page Width Register
  */
 #define LVPW_ADDR	0xfffffa05
 #define LVPW		BYTE_REF(LVPW_ADDR)
 
 /*
- * LCD Screen Width Register (not compatible with '328 !!!) 
+ * LCD Screen Width Register (not compatible with '328 !!!)
  */
 #define LXMAX_ADDR	0xfffffa08
 #define LXMAX		WORD_REF(LXMAX_ADDR)
@@ -897,7 +899,7 @@ typedef volatile struct {
 #define LBLKC_BKEN	0x80	/* Blink Enabled */
 
 /*
- * LCD Panel Interface Configuration Register 
+ * LCD Panel Interface Configuration Register
  */
 #define LPICF_ADDR	0xfffffa20
 #define LPICF		BYTE_REF(LPICF_ADDR)
@@ -912,7 +914,7 @@ typedef volatile struct {
 #define   LPICF_PBSIZ_4    0x08
 
 /*
- * LCD Polarity Configuration Register 
+ * LCD Polarity Configuration Register
  */
 #define LPOLCF_ADDR	0xfffffa21
 #define LPOLCF		BYTE_REF(LPOLCF_ADDR)
@@ -955,9 +957,9 @@ typedef volatile struct {
 /* '328-compatible definitions */
 #define LCKCON_DW_MASK  LCKCON_DWS_MASK
 #define LCKCON_DW_SHIFT LCKCON_DWS_SHIFT
- 
+
 /*
- * LCD Refresh Rate Adjustment Register 
+ * LCD Refresh Rate Adjustment Register
  */
 #define LRRA_ADDR	0xfffffa29
 #define LRRA		BYTE_REF(LRRA_ADDR)
@@ -993,7 +995,7 @@ typedef volatile struct {
 #define LGPMR_G2_MASK	0xf0
 #define LGPMR_G2_SHIFT	4
 
-/* 
+/*
  * PWM Contrast Control Register
  */
 #define PWMR_ADDR	0xfffffa36
@@ -1027,7 +1029,7 @@ typedef volatile struct {
 #define RTCTIME_HOURS_SHIFT	24
 
 /*
- *  RTC Alarm Register 
+ *  RTC Alarm Register
  */
 #define RTCALRM_ADDR    0xfffffb04
 #define RTCALRM         LONG_REF(RTCALRM_ADDR)
@@ -1040,7 +1042,7 @@ typedef volatile struct {
 #define RTCALRM_HOURS_SHIFT     24
 
 /*
- * Watchdog Timer Register 
+ * Watchdog Timer Register
  */
 #define WATCHDOG_ADDR	0xfffffb0a
 #define WATCHDOG	WORD_REF(WATCHDOG_ADDR)
@@ -1065,7 +1067,7 @@ typedef volatile struct {
 #define RTCCTL_ENABLE	RTCCTL_EN
 
 /*
- * RTC Interrupt Status Register 
+ * RTC Interrupt Status Register
  */
 #define RTCISR_ADDR	0xfffffb0e
 #define RTCISR		WORD_REF(RTCISR_ADDR)
@@ -1076,14 +1078,14 @@ typedef volatile struct {
 #define RTCISR_DAY	0x0008	/* 24-hour rollover interrupt has occurred */
 #define RTCISR_1HZ	0x0010	/* 1Hz interrupt has occurred */
 #define RTCISR_HR	0x0020	/* 1-hour interrupt has occurred */
-#define RTCISR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt has occurred */ 
-#define RTCISR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt has occurred */ 
-#define RTCISR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt has occurred */ 
-#define RTCISR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt has occurred */ 
-#define RTCISR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt has occurred */ 
-#define RTCISR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt has occurred */ 
-#define RTCISR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt has occurred */ 
-#define RTCISR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt has occurred */ 
+#define RTCISR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt has occurred */
+#define RTCISR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt has occurred */
+#define RTCISR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt has occurred */
+#define RTCISR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt has occurred */
+#define RTCISR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt has occurred */
+#define RTCISR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt has occurred */
+#define RTCISR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt has occurred */
+#define RTCISR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt has occurred */
 
 /*
  * RTC Interrupt Enable Register
@@ -1097,16 +1099,16 @@ typedef volatile struct {
 #define RTCIENR_DAY	0x0008	/* 24-hour rollover interrupt enable */
 #define RTCIENR_1HZ	0x0010	/* 1Hz interrupt enable */
 #define RTCIENR_HR	0x0020	/* 1-hour interrupt enable */
-#define RTCIENR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt enable */ 
-#define RTCIENR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt enable */ 
-#define RTCIENR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt enable */ 
-#define RTCIENR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt enable */ 
-#define RTCIENR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt enable */ 
-#define RTCIENR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt enable */ 
-#define RTCIENR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt enable */ 
-#define RTCIENR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt enable */ 
-
-/* 
+#define RTCIENR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt enable */
+#define RTCIENR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt enable */
+#define RTCIENR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt enable */
+#define RTCIENR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt enable */
+#define RTCIENR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt enable */
+#define RTCIENR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt enable */
+#define RTCIENR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt enable */
+#define RTCIENR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt enable */
+
+/*
  * Stopwatch Minutes Register
  */
 #define STPWCH_ADDR	0xfffffb12
@@ -1116,7 +1118,7 @@ typedef volatile struct {
 #define SPTWCH_CNT_SHIFT 0
 
 /*
- * RTC Day Count Register 
+ * RTC Day Count Register
  */
 #define DAYR_ADDR	0xfffffb1a
 #define DAYR		WORD_REF(DAYR_ADDR)
@@ -1125,7 +1127,7 @@ typedef volatile struct {
 #define DAYR_DAYS_SHIFT 0
 
 /*
- * RTC Day Alarm Register 
+ * RTC Day Alarm Register
  */
 #define DAYALARM_ADDR	0xfffffb1c
 #define DAYALARM	WORD_REF(DAYALARM_ADDR)
@@ -1140,14 +1142,14 @@ typedef volatile struct {
  **********/
 
 /*
- * DRAM Memory Configuration Register 
+ * DRAM Memory Configuration Register
  */
 #define DRAMMC_ADDR	0xfffffc00
 #define DRAMMC		WORD_REF(DRAMMC_ADDR)
 
 #define DRAMMC_ROW12_MASK	0xc000	/* Row address bit for MD12 */
 #define   DRAMMC_ROW12_PA10	0x0000
-#define   DRAMMC_ROW12_PA21	0x4000	
+#define   DRAMMC_ROW12_PA21	0x4000
 #define   DRAMMC_ROW12_PA23	0x8000
 #define	DRAMMC_ROW0_MASK	0x3000	/* Row address bit for MD0 */
 #define	  DRAMMC_ROW0_PA11	0x0000
@@ -1179,7 +1181,7 @@ typedef volatile struct {
 #define DRAMC_WS_SHIFT	   6
 #define DRAMC_PGSZ_MASK    0x0300	/* Page Size for fast page mode */
 #define DRAMC_PGSZ_SHIFT   8
-#define   DRAMC_PGSZ_256K  0x0000	
+#define   DRAMC_PGSZ_256K  0x0000
 #define   DRAMC_PGSZ_512K  0x0100
 #define   DRAMC_PGSZ_1024K 0x0200
 #define	  DRAMC_PGSZ_2048K 0x0300
@@ -1228,7 +1230,7 @@ typedef volatile struct {
 #define ICEMCMR_RWM	0x0002	/* Read/Write Cycle Mask */
 
 /*
- * ICE Module Control Register 
+ * ICE Module Control Register
  */
 #define ICEMCR_ADDR	0xfffffd0c
 #define ICEMCR		WORD_REF(ICEMCR_ADDR)
@@ -1240,7 +1242,7 @@ typedef volatile struct {
 #define ICEMCR_BBIEN	0x0010	/* Bus Break Interrupt Enable */
 
 /*
- * ICE Module Status Register 
+ * ICE Module Status Register
  */
 #define ICEMSR_ADDR	0xfffffd0e
 #define ICEMSR		WORD_REF(ICEMSR_ADDR)
diff --git a/arch/m68k/include/asm/MC68VZ328.h b/arch/m68k/include/asm/MC68VZ328.h
index 34a51b2..79cb262 100644
--- a/arch/m68k/include/asm/MC68VZ328.h
+++ b/arch/m68k/include/asm/MC68VZ328.h
@@ -23,12 +23,12 @@
 #define PUT_FIELD(field, val) (((val) << field##_SHIFT) & field##_MASK)
 #define GET_FIELD(reg, field) (((reg) & field##_MASK) >> field##_SHIFT)
 
-/********** 
+/**********
  *
  * 0xFFFFF0xx -- System Control
  *
  **********/
- 
+
 /*
  * System Control Register (SCR)
  */
@@ -49,14 +49,14 @@
 #define MRR_ADDR 0xfffff004
 #define MRR	 LONG_REF(MRR_ADDR)
 
-/********** 
+/**********
  *
  * 0xFFFFF1xx -- Chip-Select logic
  *
  **********/
- 
+
 /*
- * Chip Select Group Base Registers 
+ * Chip Select Group Base Registers
  */
 #define CSGBA_ADDR	0xfffff100
 #define CSGBB_ADDR	0xfffff102
@@ -70,7 +70,7 @@
 #define CSGBD		WORD_REF(CSGBD_ADDR)
 
 /*
- * Chip Select Registers 
+ * Chip Select Registers
  */
 #define CSA_ADDR	0xfffff110
 #define CSB_ADDR	0xfffff112
@@ -133,7 +133,7 @@
 #define CSD_RO		0x8000		/* Read-Only */
 
 /*
- * Emulation Chip-Select Register 
+ * Emulation Chip-Select Register
  */
 #define EMUCS_ADDR	0xfffff118
 #define EMUCS		WORD_REF(EMUCS_ADDR)
@@ -141,14 +141,14 @@
 #define EMUCS_WS_MASK	0x0070
 #define EMUCS_WS_SHIFT	4
 
-/********** 
+/**********
  *
  * 0xFFFFF2xx -- Phase Locked Loop (PLL) & Power Control
  *
  **********/
 
 /*
- * PLL Control Register 
+ * PLL Control Register
  */
 #define PLLCR_ADDR	0xfffff200
 #define PLLCR		WORD_REF(PLLCR_ADDR)
@@ -194,7 +194,7 @@
  *
  **********/
 
-/* 
+/*
  * Interrupt Vector Register
  */
 #define IVR_ADDR	0xfffff300
@@ -225,12 +225,12 @@
 #define IMR		LONG_REF(IMR_ADDR)
 
 /*
- * Define the names for bit positions first. This is useful for 
+ * Define the names for bit positions first. This is useful for
  * request_irq
  */
 #define SPI2_IRQ_NUM	0	/* SPI 2 interrupt */
 #define TMR_IRQ_NUM	1	/* Timer 1 interrupt */
-#define UART1_IRQ_NUM	2	/* UART 1 interrupt */	
+#define UART1_IRQ_NUM	2	/* UART 1 interrupt */
 #define	WDT_IRQ_NUM	3	/* Watchdog Timer interrupt */
 #define RTC_IRQ_NUM	4	/* RTC interrupt */
 #define TMR2_IRQ_NUM	5	/* Timer 2 interrupt */
@@ -240,7 +240,7 @@
 #define	INT1_IRQ_NUM	9	/* External INT1 */
 #define	INT2_IRQ_NUM	10	/* External INT2 */
 #define	INT3_IRQ_NUM	11	/* External INT3 */
-#define UART2_IRQ_NUM	12	/* UART 2 interrupt */	
+#define UART2_IRQ_NUM	12	/* UART 2 interrupt */
 #define PWM2_IRQ_NUM	13	/* Pulse-Width Modulator 1 int. */
 #define IRQ1_IRQ_NUM	16	/* IRQ1 */
 #define IRQ2_IRQ_NUM	17	/* IRQ2 */
@@ -258,12 +258,12 @@
 #define TMR1_IRQ_NUM	TMR_IRQ_NUM
 #define UART_IRQ_NUM	UART1_IRQ_NUM
 
-/* 
+/*
  * Here go the bitmasks themselves
  */
 #define IMR_MSPI 	(1 << SPI_IRQ_NUM)	/* Mask SPI interrupt */
 #define	IMR_MTMR	(1 << TMR_IRQ_NUM)	/* Mask Timer interrupt */
-#define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */	
+#define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */
 #define	IMR_MWDT	(1 << WDT_IRQ_NUM)	/* Mask Watchdog Timer interrupt */
 #define IMR_MRTC	(1 << RTC_IRQ_NUM)	/* Mask RTC interrupt */
 #define	IMR_MKB		(1 << KB_IRQ_NUM)	/* Mask Keyboard Interrupt */
@@ -284,15 +284,15 @@
 #define IMR_MSPIM	IMR_MSPI
 #define IMR_MTMR1	IMR_MTMR
 
-/* 
- * Interrupt Status Register 
+/*
+ * Interrupt Status Register
  */
 #define ISR_ADDR	0xfffff30c
 #define ISR		LONG_REF(ISR_ADDR)
 
 #define ISR_SPI 	(1 << SPI_IRQ_NUM)	/* SPI interrupt */
 #define	ISR_TMR		(1 << TMR_IRQ_NUM)	/* Timer interrupt */
-#define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	ISR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define ISR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	ISR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -313,15 +313,15 @@
 #define ISR_SPIM	ISR_SPI
 #define ISR_TMR1	ISR_TMR
 
-/* 
- * Interrupt Pending Register 
+/*
+ * Interrupt Pending Register
  */
 #define IPR_ADDR	0xfffff30c
 #define IPR		LONG_REF(IPR_ADDR)
 
 #define IPR_SPI 	(1 << SPI_IRQ_NUM)	/* SPI interrupt */
 #define	IPR_TMR		(1 << TMR_IRQ_NUM)	/* Timer interrupt */
-#define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
+#define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */
 #define	IPR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
 #define IPR_RTC		(1 << RTC_IRQ_NUM)	/* RTC interrupt */
 #define	IPR_KB		(1 << KB_IRQ_NUM)	/* Keyboard Interrupt */
@@ -361,7 +361,7 @@
 
 #define PA(x)		(1 << (x))
 
-/* 
+/*
  * Port B
  */
 #define PBDIR_ADDR	0xfffff408		/* Port B direction reg */
@@ -378,14 +378,14 @@
 
 #define PB_CSB0		0x01	/* Use CSB0      as PB[0] */
 #define PB_CSB1		0x02	/* Use CSB1      as PB[1] */
-#define PB_CSC0_RAS0	0x04    /* Use CSC0/RAS0 as PB[2] */	
-#define PB_CSC1_RAS1	0x08    /* Use CSC1/RAS1 as PB[3] */	
-#define PB_CSD0_CAS0	0x10    /* Use CSD0/CAS0 as PB[4] */	
+#define PB_CSC0_RAS0	0x04    /* Use CSC0/RAS0 as PB[2] */
+#define PB_CSC1_RAS1	0x08    /* Use CSC1/RAS1 as PB[3] */
+#define PB_CSD0_CAS0	0x10    /* Use CSD0/CAS0 as PB[4] */
 #define PB_CSD1_CAS1	0x20    /* Use CSD1/CAS1 as PB[5] */
 #define PB_TIN_TOUT	0x40	/* Use TIN/TOUT  as PB[6] */
 #define PB_PWMO		0x80	/* Use PWMO      as PB[7] */
 
-/* 
+/*
  * Port C
  */
 #define PCDIR_ADDR	0xfffff410		/* Port C direction reg */
@@ -409,7 +409,7 @@
 #define PC_LCLK		0x40	/* Use LCLK as PC[6] */
 #define PC_LACD		0x80	/* Use LACD as PC[7] */
 
-/* 
+/*
  * Port D
  */
 #define PDDIR_ADDR	0xfffff418		/* Port D direction reg */
@@ -441,7 +441,7 @@
 #define PD_IRQ3		0x40	/* Use IRQ3 as PD[6] */
 #define PD_IRQ6		0x80	/* Use IRQ6 as PD[7] */
 
-/* 
+/*
  * Port E
  */
 #define PEDIR_ADDR	0xfffff420		/* Port E direction reg */
@@ -465,7 +465,7 @@
 #define PE_RTS		0x40	/* Use RTS    as PE[6] */
 #define PE_CTS		0x80	/* Use CTS    as PE[7] */
 
-/* 
+/*
  * Port F
  */
 #define PFDIR_ADDR	0xfffff428		/* Port F direction reg */
@@ -489,7 +489,7 @@
 #define PF_A23          0x40    /* Use A23       as PF[6] */
 #define PF_CSA1		0x80    /* Use CSA1      as PF[7] */
 
-/* 
+/*
  * Port G
  */
 #define PGDIR_ADDR	0xfffff430		/* Port G direction reg */
@@ -511,7 +511,7 @@
 #define PG_EMUCS        0x10	/* Use EMUCS      as PG[4] */
 #define PG_EMUBRK	0x20	/* Use EMUBRK     as PG[5] */
 
-/* 
+/*
  * Port J
  */
 #define PJDIR_ADDR	0xfffff438		/* Port J direction reg */
@@ -622,7 +622,7 @@
 #define PWMC_PWMEN	PWMC_EN
 
 /*
- * PWM Sample Register 
+ * PWM Sample Register
  */
 #define PWMS_ADDR	0xfffff502
 #define PWMS		WORD_REF(PWMS_ADDR)
@@ -645,7 +645,7 @@
  *
  **********/
 
-/* 
+/*
  * Timer Control register
  */
 #define TCTL_ADDR	0xfffff600
@@ -812,7 +812,7 @@
 #define UBAUD_UCLKDIR		0x2000	/* UCLK Direction */
 
 /*
- * UART Receiver Register 
+ * UART Receiver Register
  */
 #define URX_ADDR	0xfffff904
 #define URX		WORD_REF(URX_ADDR)
@@ -832,7 +832,7 @@
 #define URX_FIFO_FULL	 0x8000	/* FIFO is Full */
 
 /*
- * UART Transmitter Register 
+ * UART Transmitter Register
  */
 #define UTX_ADDR	0xfffff906
 #define UTX		WORD_REF(UTX_ADDR)
@@ -856,7 +856,7 @@
 #define UTX_IGNORE_CTS	UTX_NOCTS
 
 /*
- * UART Miscellaneous Register 
+ * UART Miscellaneous Register
  */
 #define UMISC_ADDR	0xfffff908
 #define UMISC		WORD_REF(UMISC_ADDR)
@@ -874,7 +874,7 @@
 #define UMISC_CLKSRC	 0x4000	/* Clock Source */
 #define UMISC_BAUD_TEST	 0x8000	/* Enable Baud Test Mode */
 
-/* 
+/*
  * UART Non-integer Prescaler Register
  */
 #define NIPR_ADDR	0xfffff90a
@@ -909,7 +909,7 @@ typedef struct {
   volatile unsigned short int nipr;
   volatile unsigned short int hmark;
   volatile unsigned short int unused;
-} __attribute__((packed)) m68328_uart;
+} __packed m68328_uart;
 
 
 
@@ -921,7 +921,7 @@ typedef struct {
  **********/
 
 /*
- * LCD Screen Starting Address Register 
+ * LCD Screen Starting Address Register
  */
 #define LSSA_ADDR	0xfffffa00
 #define LSSA		LONG_REF(LSSA_ADDR)
@@ -929,13 +929,13 @@ typedef struct {
 #define LSSA_SSA_MASK	0x1ffffffe	/* Bits 0 and 29-31 are reserved */
 
 /*
- * LCD Virtual Page Width Register 
+ * LCD Virtual Page Width Register
  */
 #define LVPW_ADDR	0xfffffa05
 #define LVPW		BYTE_REF(LVPW_ADDR)
 
 /*
- * LCD Screen Width Register (not compatible with '328 !!!) 
+ * LCD Screen Width Register (not compatible with '328 !!!)
  */
 #define LXMAX_ADDR	0xfffffa08
 #define LXMAX		WORD_REF(LXMAX_ADDR)
@@ -993,7 +993,7 @@ typedef struct {
 #define LBLKC_BKEN	0x80	/* Blink Enabled */
 
 /*
- * LCD Panel Interface Configuration Register 
+ * LCD Panel Interface Configuration Register
  */
 #define LPICF_ADDR	0xfffffa20
 #define LPICF		BYTE_REF(LPICF_ADDR)
@@ -1008,7 +1008,7 @@ typedef struct {
 #define   LPICF_PBSIZ_4    0x08
 
 /*
- * LCD Polarity Configuration Register 
+ * LCD Polarity Configuration Register
  */
 #define LPOLCF_ADDR	0xfffffa21
 #define LPOLCF		BYTE_REF(LPOLCF_ADDR)
@@ -1051,9 +1051,9 @@ typedef struct {
 /* '328-compatible definitions */
 #define LCKCON_DW_MASK  LCKCON_DWS_MASK
 #define LCKCON_DW_SHIFT LCKCON_DWS_SHIFT
- 
+
 /*
- * LCD Refresh Rate Adjustment Register 
+ * LCD Refresh Rate Adjustment Register
  */
 #define LRRA_ADDR	0xfffffa29
 #define LRRA		BYTE_REF(LRRA_ADDR)
@@ -1089,7 +1089,7 @@ typedef struct {
 #define LGPMR_G2_MASK	0xf0
 #define LGPMR_G2_SHIFT	4
 
-/* 
+/*
  * PWM Contrast Control Register
  */
 #define PWMR_ADDR	0xfffffa36
@@ -1123,7 +1123,7 @@ typedef struct {
 #define RTCTIME_HOURS_SHIFT	24
 
 /*
- *  RTC Alarm Register 
+ *  RTC Alarm Register
  */
 #define RTCALRM_ADDR    0xfffffb04
 #define RTCALRM         LONG_REF(RTCALRM_ADDR)
@@ -1136,7 +1136,7 @@ typedef struct {
 #define RTCALRM_HOURS_SHIFT     24
 
 /*
- * Watchdog Timer Register 
+ * Watchdog Timer Register
  */
 #define WATCHDOG_ADDR	0xfffffb0a
 #define WATCHDOG	WORD_REF(WATCHDOG_ADDR)
@@ -1161,7 +1161,7 @@ typedef struct {
 #define RTCCTL_ENABLE	RTCCTL_EN
 
 /*
- * RTC Interrupt Status Register 
+ * RTC Interrupt Status Register
  */
 #define RTCISR_ADDR	0xfffffb0e
 #define RTCISR		WORD_REF(RTCISR_ADDR)
@@ -1172,14 +1172,14 @@ typedef struct {
 #define RTCISR_DAY	0x0008	/* 24-hour rollover interrupt has occurred */
 #define RTCISR_1HZ	0x0010	/* 1Hz interrupt has occurred */
 #define RTCISR_HR	0x0020	/* 1-hour interrupt has occurred */
-#define RTCISR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt has occurred */ 
-#define RTCISR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt has occurred */ 
-#define RTCISR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt has occurred */ 
-#define RTCISR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt has occurred */ 
-#define RTCISR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt has occurred */ 
-#define RTCISR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt has occurred */ 
-#define RTCISR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt has occurred */ 
-#define RTCISR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt has occurred */ 
+#define RTCISR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt has occurred */
+#define RTCISR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt has occurred */
+#define RTCISR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt has occurred */
+#define RTCISR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt has occurred */
+#define RTCISR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt has occurred */
+#define RTCISR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt has occurred */
+#define RTCISR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt has occurred */
+#define RTCISR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt has occurred */
 
 /*
  * RTC Interrupt Enable Register
@@ -1193,16 +1193,16 @@ typedef struct {
 #define RTCIENR_DAY	0x0008	/* 24-hour rollover interrupt enable */
 #define RTCIENR_1HZ	0x0010	/* 1Hz interrupt enable */
 #define RTCIENR_HR	0x0020	/* 1-hour interrupt enable */
-#define RTCIENR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt enable */ 
-#define RTCIENR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt enable */ 
-#define RTCIENR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt enable */ 
-#define RTCIENR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt enable */ 
-#define RTCIENR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt enable */ 
-#define RTCIENR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt enable */ 
-#define RTCIENR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt enable */ 
-#define RTCIENR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt enable */ 
-
-/* 
+#define RTCIENR_SAM0	0x0100	/*   4Hz /   4.6875Hz interrupt enable */
+#define RTCIENR_SAM1	0x0200	/*   8Hz /   9.3750Hz interrupt enable */
+#define RTCIENR_SAM2	0x0400	/*  16Hz /  18.7500Hz interrupt enable */
+#define RTCIENR_SAM3	0x0800	/*  32Hz /  37.5000Hz interrupt enable */
+#define RTCIENR_SAM4	0x1000	/*  64Hz /  75.0000Hz interrupt enable */
+#define RTCIENR_SAM5	0x2000	/* 128Hz / 150.0000Hz interrupt enable */
+#define RTCIENR_SAM6	0x4000	/* 256Hz / 300.0000Hz interrupt enable */
+#define RTCIENR_SAM7	0x8000	/* 512Hz / 600.0000Hz interrupt enable */
+
+/*
  * Stopwatch Minutes Register
  */
 #define STPWCH_ADDR	0xfffffb12
@@ -1212,7 +1212,7 @@ typedef struct {
 #define SPTWCH_CNT_SHIFT 0
 
 /*
- * RTC Day Count Register 
+ * RTC Day Count Register
  */
 #define DAYR_ADDR	0xfffffb1a
 #define DAYR		WORD_REF(DAYR_ADDR)
@@ -1221,7 +1221,7 @@ typedef struct {
 #define DAYR_DAYS_SHIFT 0
 
 /*
- * RTC Day Alarm Register 
+ * RTC Day Alarm Register
  */
 #define DAYALARM_ADDR	0xfffffb1c
 #define DAYALARM	WORD_REF(DAYALARM_ADDR)
@@ -1236,14 +1236,14 @@ typedef struct {
  **********/
 
 /*
- * DRAM Memory Configuration Register 
+ * DRAM Memory Configuration Register
  */
 #define DRAMMC_ADDR	0xfffffc00
 #define DRAMMC		WORD_REF(DRAMMC_ADDR)
 
 #define DRAMMC_ROW12_MASK	0xc000	/* Row address bit for MD12 */
 #define   DRAMMC_ROW12_PA10	0x0000
-#define   DRAMMC_ROW12_PA21	0x4000	
+#define   DRAMMC_ROW12_PA21	0x4000
 #define   DRAMMC_ROW12_PA23	0x8000
 #define	DRAMMC_ROW0_MASK	0x3000	/* Row address bit for MD0 */
 #define	  DRAMMC_ROW0_PA11	0x0000
@@ -1275,7 +1275,7 @@ typedef struct {
 #define DRAMC_WS_SHIFT	   6
 #define DRAMC_PGSZ_MASK    0x0300	/* Page Size for fast page mode */
 #define DRAMC_PGSZ_SHIFT   8
-#define   DRAMC_PGSZ_256K  0x0000	
+#define   DRAMC_PGSZ_256K  0x0000
 #define   DRAMC_PGSZ_512K  0x0100
 #define   DRAMC_PGSZ_1024K 0x0200
 #define	  DRAMC_PGSZ_2048K 0x0300
@@ -1324,7 +1324,7 @@ typedef struct {
 #define ICEMCMR_RWM	0x0002	/* Read/Write Cycle Mask */
 
 /*
- * ICE Module Control Register 
+ * ICE Module Control Register
  */
 #define ICEMCR_ADDR	0xfffffd0c
 #define ICEMCR		WORD_REF(ICEMCR_ADDR)
@@ -1336,7 +1336,7 @@ typedef struct {
 #define ICEMCR_BBIEN	0x0010	/* Bus Break Interrupt Enable */
 
 /*
- * ICE Module Status Register 
+ * ICE Module Status Register
  */
 #define ICEMSR_ADDR	0xfffffd0e
 #define ICEMSR		WORD_REF(ICEMSR_ADDR)
diff --git a/arch/m68k/include/asm/natfeat.h b/arch/m68k/include/asm/natfeat.h
index a3521b8..1feceb3 100644
--- a/arch/m68k/include/asm/natfeat.h
+++ b/arch/m68k/include/asm/natfeat.h
@@ -6,6 +6,7 @@
  * This software may be used and distributed according to the terms of
  * the GNU General Public License (GPL), incorporated herein by reference.
  */
+#include <linux/compiler.h>
 
 #ifndef _NATFEAT_H
 #define _NATFEAT_H
@@ -17,6 +18,6 @@ void nf_init(void);
 void nf_shutdown(void);
 
 void nfprint(const char *fmt, ...)
-	__attribute__ ((format (printf, 1, 2)));
+	__print(1, 2);
 
 # endif /* _NATFEAT_H */
diff --git a/arch/m68k/lib/ashldi3.c b/arch/m68k/lib/ashldi3.c
index 8dffd36..ac08f81 100644
--- a/arch/m68k/lib/ashldi3.c
+++ b/arch/m68k/lib/ashldi3.c
@@ -18,10 +18,10 @@ GNU General Public License for more details. */
 
 #define BITS_PER_UNIT 8
 
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef		 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type           __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
diff --git a/arch/m68k/lib/ashrdi3.c b/arch/m68k/lib/ashrdi3.c
index e6565a3..5b4890e 100644
--- a/arch/m68k/lib/ashrdi3.c
+++ b/arch/m68k/lib/ashrdi3.c
@@ -18,10 +18,10 @@ GNU General Public License for more details. */
 
 #define BITS_PER_UNIT 8
 
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef		 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type __mode(__word__);;
 
 struct DIstruct {SItype high, low;};
 
diff --git a/arch/m68k/lib/lshrdi3.c b/arch/m68k/lib/lshrdi3.c
index 0397797..7f40566 100644
--- a/arch/m68k/lib/lshrdi3.c
+++ b/arch/m68k/lib/lshrdi3.c
@@ -18,10 +18,10 @@ GNU General Public License for more details. */
 
 #define BITS_PER_UNIT 8
 
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef		 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type           __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
index 6459af5..700203b 100644
--- a/arch/m68k/lib/muldi3.c
+++ b/arch/m68k/lib/muldi3.c
@@ -1,4 +1,4 @@
-/* muldi3.c extracted from gcc-2.7.2.3/libgcc2.c and 
+/* muldi3.c extracted from gcc-2.7.2.3/libgcc2.c and
 			   gcc-2.7.2.3/longlong.h which is: */
 /* Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.
 
@@ -65,10 +65,10 @@ GNU General Public License for more details. */
     umul_ppmm (__w.s.high, __w.s.low, u, v);				\
     __w.ll; })
 
-typedef 	 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
+typedef 	 int SItype	__mode(SI);
+typedef unsigned int USItype	__mode(SI);
+typedef		 int DItype	__mode(DI);
+typedef int word_type __mode(__word__);
 
 struct DIstruct {SItype high, low;};
 
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 0444b13..980fb35 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -121,6 +121,7 @@
 #define __attribute_const__	__attribute__((__const__))
 #define __maybe_unused		__attribute__((unused))
 #define __always_unused		__attribute__((unused))
+#define __mode(x)               __attribute__((mode(x)))
 
 /* gcc version specific checks */
 
-- 
2.7.4
