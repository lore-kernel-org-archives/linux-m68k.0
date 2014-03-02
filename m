From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 4/4] m68k/atari: fix SCC initialization for debug console
Date: Mon, 3 Mar 2014 10:56:45 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403022341590.5357@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

Fix SCC initialization for Atari as was previously fixed for Mac. It's 
probably not practical to share more code but some attempt is made to 
align the Mac and Atari variants.

---
One problem with this patch is that it fixes a problem that doesn't affect 
anyone (as long as Atari SCC debugging remains disabled).

The line rate is changed to 38400 baud to match the Mac code (which 
follows the pmac_zilog serial console default). It would be nice to 
standardize but I don't know whether this is realistic.

The 7.9872 MHz PCLK used in this patch was inferred from the existing code 
as I don't have any hardware data.

This patch is untested on Atari.

---
 arch/m68k/kernel/head.S |   34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-03-03 10:30:01.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-03-03 10:30:32.000000000 +1100
@@ -2722,6 +2722,7 @@ func_return	get_new_page
 #define MAC_USE_SCC_B /* Printer port */
 
 #if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
+/* Initialisation table for SCC with 3.6864 MHz PCLK */
 L(scc_initable_mac):
 	.byte	4,0x44		/* x16, 1 stopbit, no parity */
 	.byte	3,0xc0		/* receiver: 8 bpc */
@@ -2744,17 +2745,14 @@ L(scc_initable_mac):
 #define USE_MFP
 
 #if defined(USE_SCC_A) || defined(USE_SCC_B)
-#define USE_SCC
-/* Initialisation table for SCC */
-L(scc_initable):
-	.byte	9,12		/* Reset */
-	.byte	4,0x44		/* x16, 1 stopbit, no parity */
+/* Initialisation table for SCC with 7.9872 MHz PCLK */
+L(scc_initable_atari):
+	.byte	4,0x04		/* x1, 1 stopbit, no parity */
 	.byte	3,0xc0		/* receiver: 8 bpc */
 	.byte	5,0xe2		/* transmitter: 8 bpc, assert dtr/rts */
-	.byte	9,0		/* no interrupts */
 	.byte	10,0		/* NRZ */
 	.byte	11,0x50		/* use baud rate generator */
-	.byte	12,24,13,0	/* 9600 baud */
+	.byte	12,102,13,0	/* 38400 baud */
 	.byte	14,2,14,3	/* use master clock for BRG, enable */
 	.byte	3,0xc1		/* enable receiver */
 	.byte	5,0xea		/* enable transmitter */
@@ -2800,7 +2798,7 @@ LMFP_UDR     = 0xfffa2f
  */
 
 /*
- * Initialize serial port hardware for 9600/8/1
+ * Initialize serial port hardware
  */
 func_start	serial_init,%d0/%d1/%a0/%a1
 	/*
@@ -2810,7 +2808,7 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	 *		d0 = boot info offset
 	 *	CONFIG_ATARI
 	 *		a0 = address of SCC
-	 *		a1 = Liobase address/address of scc_initable
+	 *		a1 = Liobase address/address of scc_initable_atari
 	 *		d0 = init data for serial port
 	 *	CONFIG_MAC
 	 *		a0 = address of SCC
@@ -2846,9 +2844,21 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	moveb	%a1@(LPSG_READ),%d0
 	bset	#5,%d0
 	moveb	%d0,%a1@(LPSG_WRITE)
-#elif defined(USE_SCC)
+#elif defined(USE_SCC_A) || defined(USE_SCC_B)
 	lea	%a1@(LSCC_CTRL),%a0
-	lea	%pc@(L(scc_initable)),%a1
+	/* Reset SCC register pointer */
+	moveb	%a0@,%d0
+	/* Reset SCC device: write register pointer then register value */
+	moveb	#9,%a0@
+	moveb	#0xc0,%a0@
+	/* Wait for 5 PCLK cycles, which is about 63 CPU cycles */
+	/* 5 / 7.9872 MHz = approx. 0.63 us = 63 / 100 MHz */
+	movel	#32,%d0
+2:
+	subq	#1,%d0
+	jne	2b
+	/* Initialize channel */
+	lea	%pc@(L(scc_initable_atari)),%a1
 2:	moveb	%a1@+,%d0
 	jmi	3f
 	moveb	%d0,%a0@
@@ -3017,7 +3027,7 @@ func_start	serial_putc,%d0/%d1/%a0/%a1
 	nop
 	bset	#5,%d0
 	moveb	%d0,%a1@(LPSG_WRITE)
-#elif defined(USE_SCC)
+#elif defined(USE_SCC_A) || defined(USE_SCC_B)
 3:	btst	#2,%a1@(LSCC_CTRL)
 	jeq	3b
 	moveb	%d0,%a1@(LSCC_DATA)
