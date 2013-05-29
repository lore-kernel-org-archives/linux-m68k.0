From: Finn Thain <fthain@telegraphics.com.au>
Subject: mac68k: fix unexpected interrupt with CONFIG_EARLY_PRINTK
Date: Wed, 29 May 2013 12:37:17 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305291227560.6962@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>


The present code does not wait for the SCC to finish resetting itself 
before trying to initialise the device. The result is that the SCC 
interrupt sources become enabled (if they weren't already). This leads to 
an early boot crash (unexpected interrupt) given CONFIG_EARLY_PRINTK. Fix 
this by adding a delay. A successful reset disables the interrupt sources.

Also, after the reset for channel A setup, the SCC then gets a second 
reset for channel B setup which leaves channel A uninitialised again. Fix 
this by performing the reset only once.

---

This patch can be applied to -stable trees >= 3.3.y.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>


Index: linux-3.3/arch/m68k/kernel/head.S
===================================================================
--- linux-3.3.orig/arch/m68k/kernel/head.S	2013-05-28 21:28:52.000000000 +1000
+++ linux-3.3/arch/m68k/kernel/head.S	2013-05-28 21:37:33.000000000 +1000
@@ -2752,11 +2752,9 @@ func_return	get_new_page
 #ifdef CONFIG_MAC
 
 L(scc_initable_mac):
-	.byte	9,12		/* Reset */
 	.byte	4,0x44		/* x16, 1 stopbit, no parity */
 	.byte	3,0xc0		/* receiver: 8 bpc */
 	.byte	5,0xe2		/* transmitter: 8 bpc, assert dtr/rts */
-	.byte	9,0		/* no interrupts */
 	.byte	10,0		/* NRZ */
 	.byte	11,0x50		/* use baud rate generator */
 	.byte	12,1,13,0	/* 38400 baud */
@@ -2899,6 +2897,7 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	is_not_mac(L(serial_init_not_mac))
 
 #ifdef SERIAL_DEBUG
+
 /* You may define either or both of these. */
 #define MAC_USE_SCC_A /* Modem port */
 #define MAC_USE_SCC_B /* Printer port */
@@ -2908,9 +2907,21 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 #define mac_scc_cha_b_data_offset	0x4
 #define mac_scc_cha_a_data_offset	0x6
 
+#if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
+	movel	%pc@(L(mac_sccbase)),%a0
+	/* Reset SCC device */
+	moveb	#9,%a0@(mac_scc_cha_a_ctrl_offset)
+	moveb	#0xc0,%a0@(mac_scc_cha_a_ctrl_offset)
+	/* Wait for 5 PCLK cycles, which is about 68 CPU cycles */
+	/* 5 / 3.6864 MHz = approx. 1.36 us = 68 / 50 MHz */
+	movel	#35,%d0
+5:
+	subq	#1,%d0
+	jne	5b
+#endif
+
 #ifdef MAC_USE_SCC_A
 	/* Initialize channel A */
-	movel	%pc@(L(mac_sccbase)),%a0
 	lea	%pc@(L(scc_initable_mac)),%a1
 5:	moveb	%a1@+,%d0
 	jmi	6f
@@ -2922,9 +2933,6 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 
 #ifdef MAC_USE_SCC_B
 	/* Initialize channel B */
-#ifndef MAC_USE_SCC_A	/* Load mac_sccbase only if needed */
-	movel	%pc@(L(mac_sccbase)),%a0
-#endif	/* MAC_USE_SCC_A */
 	lea	%pc@(L(scc_initable_mac)),%a1
 7:	moveb	%a1@+,%d0
 	jmi	8f
@@ -2933,6 +2941,7 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	jra	7b
 8:
 #endif	/* MAC_USE_SCC_B */
+
 #endif	/* SERIAL_DEBUG */
 
 	jra	L(serial_init_done)
@@ -3006,17 +3015,17 @@ func_start	serial_putc,%d0/%d1/%a0/%a1
 
 #ifdef SERIAL_DEBUG
 
-#ifdef MAC_USE_SCC_A
+#if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
 	movel	%pc@(L(mac_sccbase)),%a1
+#endif
+
+#ifdef MAC_USE_SCC_A
 3:	btst	#2,%a1@(mac_scc_cha_a_ctrl_offset)
 	jeq	3b
 	moveb	%d0,%a1@(mac_scc_cha_a_data_offset)
 #endif	/* MAC_USE_SCC_A */
 
 #ifdef MAC_USE_SCC_B
-#ifndef MAC_USE_SCC_A	/* Load mac_sccbase only if needed */
-	movel	%pc@(L(mac_sccbase)),%a1
-#endif	/* MAC_USE_SCC_A */
 4:	btst	#2,%a1@(mac_scc_cha_b_ctrl_offset)
 	jeq	4b
 	moveb	%d0,%a1@(mac_scc_cha_b_data_offset)
