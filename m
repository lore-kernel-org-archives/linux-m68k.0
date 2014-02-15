From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 2/4] m68k: Remove dead code
Date: Sat, 15 Feb 2014 15:46:24 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402151533120.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>



Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-02-15 15:06:30.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-02-15 15:08:07.000000000 +1100
@@ -657,27 +657,6 @@ ENTRY(__start)
 	movel	%a0@,%a1@
 #endif
 
-#if 0
-	/*
-	 * Clear the screen
-	 */
-	lea	%pc@(L(mac_videobase)),%a0
-	movel	%a0@,%a1
-	lea	%pc@(L(mac_dimensions)),%a0
-	movel	%a0@,%d1
-	swap	%d1		/* #rows is high bytes */
-	andl	#0xFFFF,%d1	/* rows */
-	subl	#10,%d1
-	lea	%pc@(L(mac_rowbytes)),%a0
-loopy2:
-	movel	%a0@,%d0
-	subql	#1,%d0
-loopx2:
-	moveb	#0x55, %a1@+
-	dbra	%d0,loopx2
-	dbra	%d1,loopy2
-#endif
-
 L(test_notmac):
 #endif /* CONFIG_MAC */
 
@@ -3323,7 +3302,6 @@ func_return	set_leds
 #define Lconsole_struct_num_columns	8
 #define Lconsole_struct_num_rows	12
 #define Lconsole_struct_left_edge	16
-#define Lconsole_struct_penguin_putc	20
 
 func_start	console_init,%a0-%a4/%d0-%d7
 	/*
@@ -3798,38 +3776,6 @@ L(console_plot_pixel_exit):
 func_return	console_plot_pixel
 #endif /* CONSOLE */
 
-#if 0
-/*
- * This is some old code lying around.  I don't believe
- * it's used or important anymore.  My guess is it contributed
- * to getting to this point, but it's done for now.
- * It was still in the 2.1.77 head.S, so it's still here.
- * (And still not used!)
- */
-L(showtest):
-	moveml	%a0/%d7,%sp@-
-	puts	"A="
-	putn	%a1
-
-	.long	0xf0119f15		| ptestr	#5,%a1@,#7,%a0
-
-	puts	"DA="
-	putn	%a0
-
-	puts	"D="
-	putn	%a0@
-
-	puts	"S="
-	lea	%pc@(L(mmu)),%a0
-	.long	0xf0106200		| pmove		%psr,%a0@
-	clrl	%d7
-	movew	%a0@,%d7
-	putn	%d7
-
-	putc	'\n'
-	moveml	%sp@+,%a0/%d7
-	rts
-#endif	/* 0 */
 
 __INITDATA
 	.align	4
@@ -3848,7 +3794,6 @@ L(console_globals):
 	.long	0		/* max num columns */
 	.long	0		/* max num rows */
 	.long	0		/* left edge */
-	.long	0		/* mac putc */
 L(console_font):
 	.long	0		/* pointer to console font (struct font_desc) */
 L(console_font_data):
