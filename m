From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 1/4 v2] m68k: toward platform agnostic framebuffer debug
 logging
Date: Mon, 3 Mar 2014 10:53:47 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403022340520.5357@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

Code subject to #ifdef CONSOLE is made more generic, as was apparently 
intended by the original author.

Remove console_put_stats() routine. If it should be somehow useful, it 
should also be useful on platforms without framebuffer debug logging. The 
present implementation is only built #if defined CONFIG_MAC && defined 
CONSOLE even though puts() works everywhere.

---
The CONSOLE_DEBUG and SERIAL_DEBUG macros can be used independently. I 
think renaming CONSOLE as CONSOLE_DEBUG makes this apparent. (It is not 
clear how to actually enable them independently. That might need to be 
controlled from the bootloader.)

This version (v2) makes macro use more consistent: CONSOLE_DEBUG and 
SERIAL_DEBUG act on the platform independent code whilst MAC_USE_SCC_{A,B} 
act on the platform specific code, like USE_SCC_{A,B}.

---
 arch/m68k/kernel/head.S |  112 +++++++++++-------------------------------------
 1 file changed, 26 insertions(+), 86 deletions(-)

Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-03-03 10:29:46.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-03-03 10:29:47.000000000 +1100
@@ -153,7 +153,7 @@
  * ------------
  *	The console is also able to be turned off.  The console in head.S
  * is specifically for debugging and can be very useful.  It is surrounded by
- * #ifdef CONSOLE/#endif clauses so it doesn't have to ship in known-good
+ * #ifdef / #endif clauses so it doesn't have to ship in known-good
  * kernels.  It's basic algorithm is to determine the size of the screen
  * (in height/width and bit depth) and then use that information for
  * displaying an 8x8 font or an 8x16 (widthxheight).  I prefer the 8x8 for
@@ -198,9 +198,8 @@
  * CONFIG_xxx:	These are the obvious machine configuration defines created
  * during configuration.  These are defined in autoconf.h.
  *
- * CONSOLE:	There is support for head.S console in this file.  This
- * console can talk to a Mac frame buffer, but could easily be extrapolated
- * to extend it to support other platforms.
+ * CONSOLE_DEBUG:  Only supports a Mac frame buffer but could easily be
+ * extended to support other platforms.
  *
  * TEST_MMU:	This is a test harness for running on any given machine but
  * getting an MMU dump for another class of machine.  The classes of machines
@@ -274,7 +273,7 @@
 #include <asm/machw.h>
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE
-#define CONSOLE
+#define CONSOLE_DEBUG
 #endif
 
 #ifdef CONFIG_EARLY_PRINTK
@@ -480,22 +479,21 @@ func_define	serial_putc,1
 func_define	console_putc,1
 
 func_define	console_init
-func_define	console_put_stats
 func_define	console_put_penguin
 func_define	console_plot_pixel,3
 func_define	console_scroll
 
 .macro	putc	ch
-#if defined(CONSOLE) || defined(SERIAL_DEBUG)
+#if defined(CONSOLE_DEBUG) || defined(SERIAL_DEBUG)
 	pea	\ch
 #endif
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	func_call	console_putc
 #endif
 #ifdef SERIAL_DEBUG
 	func_call	serial_putc
 #endif
-#if defined(CONSOLE) || defined(SERIAL_DEBUG)
+#if defined(CONSOLE_DEBUG) || defined(SERIAL_DEBUG)
 	addql	#4,%sp
 #endif
 .endm
@@ -515,7 +513,7 @@ func_define	putn,1
 .endm
 
 .macro	puts		string
-#if defined(CONSOLE) || defined(SERIAL_DEBUG)
+#if defined(CONSOLE_DEBUG) || defined(SERIAL_DEBUG)
 	__INITDATA
 .Lstr\@:
 	.string	"\string"
@@ -651,11 +649,9 @@ ENTRY(__start)
 	lea	%pc@(L(mac_rowbytes)),%a1
 	movel	%a0@,%a1@
 
-#ifdef SERIAL_DEBUG
 	get_bi_record	BI_MAC_SCCBASE
 	lea	%pc@(L(mac_sccbase)),%a1
 	movel	%a0@,%a1@
-#endif
 
 L(test_notmac):
 #endif /* CONFIG_MAC */
@@ -885,13 +881,12 @@ L(nothp):
  */
 #ifdef CONFIG_MAC
 	is_not_mac(L(nocon))
-#  ifdef CONSOLE
+#  ifdef CONSOLE_DEBUG
 	console_init
 #    ifdef CONFIG_LOGO
 	console_put_penguin
 #    endif /* CONFIG_LOGO */
-	console_put_stats
-#  endif /* CONSOLE */
+#  endif /* CONSOLE_DEBUG */
 L(nocon):
 #endif /* CONFIG_MAC */
 
@@ -1396,15 +1391,13 @@ L(mmu_fixup_done):
 	andl	L(mac_videobase),%d0
 	addl	#VIDEOMEMBASE,%d0
 	movel	%d0,L(mac_videobase)
-#if defined(CONSOLE)
+#ifdef CONSOLE_DEBUG
 	movel	%pc@(L(phys_kernel_start)),%d0
 	subl	#PAGE_OFFSET,%d0
 	subl	%d0,L(console_font)
 	subl	%d0,L(console_font_data)
 #endif
-#ifdef SERIAL_DEBUG
 	orl	#0x50000000,L(mac_sccbase)
-#endif
 1:
 #endif
 
@@ -2734,7 +2727,11 @@ func_return	get_new_page
  */
 
 #ifdef CONFIG_MAC
+/* You may define either or both of these. */
+#define MAC_USE_SCC_A /* Modem port */
+#define MAC_USE_SCC_B /* Printer port */
 
+#if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
 L(scc_initable_mac):
 	.byte	4,0x44		/* x16, 1 stopbit, no parity */
 	.byte	3,0xc0		/* receiver: 8 bpc */
@@ -2748,6 +2745,7 @@ L(scc_initable_mac):
 	.byte	-1
 	.even
 #endif
+#endif /* CONFIG_MAC */
 
 #ifdef CONFIG_ATARI
 /* #define USE_PRINTER */
@@ -2843,6 +2841,7 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 |	movew	#61,CUSTOMBASE+C_SERPER-ZTWOBASE
 1:
 #endif
+
 #ifdef CONFIG_ATARI
 	is_not_atari(4f)
 	movel	%pc@(L(iobase)),%a1
@@ -2877,21 +2876,14 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	jra	L(serial_init_done)
 4:
 #endif
+
 #ifdef CONFIG_MAC
 	is_not_mac(L(serial_init_not_mac))
-
-#ifdef SERIAL_DEBUG
-
-/* You may define either or both of these. */
-#define MAC_USE_SCC_A /* Modem port */
-#define MAC_USE_SCC_B /* Printer port */
-
+#if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
 #define mac_scc_cha_b_ctrl_offset	0x0
 #define mac_scc_cha_a_ctrl_offset	0x2
 #define mac_scc_cha_b_data_offset	0x4
 #define mac_scc_cha_a_data_offset	0x6
-
-#if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
 	movel	%pc@(L(mac_sccbase)),%a0
 	/* Reset SCC register pointer */
 	moveb	%a0@(mac_scc_cha_a_ctrl_offset),%d0
@@ -2905,7 +2897,6 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	subq	#1,%d0
 	jne	5b
 #endif
-
 #ifdef MAC_USE_SCC_A
 	/* Initialize channel A */
 	lea	%pc@(L(scc_initable_mac)),%a1
@@ -2916,7 +2907,6 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	jra	5b
 6:
 #endif	/* MAC_USE_SCC_A */
-
 #ifdef MAC_USE_SCC_B
 	/* Initialize channel B */
 	lea	%pc@(L(scc_initable_mac)),%a1
@@ -2927,9 +2917,6 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	jra	7b
 8:
 #endif	/* MAC_USE_SCC_B */
-
-#endif	/* SERIAL_DEBUG */
-
 	jra	L(serial_init_done)
 L(serial_init_not_mac):
 #endif	/* CONFIG_MAC */
@@ -2998,27 +2985,19 @@ func_start	serial_putc,%d0/%d1/%a0/%a1
 
 #ifdef CONFIG_MAC
 	is_not_mac(5f)
-
-#ifdef SERIAL_DEBUG
-
 #if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
 	movel	%pc@(L(mac_sccbase)),%a1
 #endif
-
 #ifdef MAC_USE_SCC_A
 3:	btst	#2,%a1@(mac_scc_cha_a_ctrl_offset)
 	jeq	3b
 	moveb	%d0,%a1@(mac_scc_cha_a_data_offset)
 #endif	/* MAC_USE_SCC_A */
-
 #ifdef MAC_USE_SCC_B
 4:	btst	#2,%a1@(mac_scc_cha_b_ctrl_offset)
 	jeq	4b
 	moveb	%d0,%a1@(mac_scc_cha_b_data_offset)
 #endif	/* MAC_USE_SCC_B */
-
-#endif	/* SERIAL_DEBUG */
-
 	jra	L(serial_putc_done)
 5:
 #endif	/* CONFIG_MAC */
@@ -3195,7 +3174,7 @@ func_start	puts,%d0/%a0
 	movel	ARG1,%a0
 	jra	2f
 1:
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	console_putc	%d0
 #endif
 #ifdef SERIAL_DEBUG
@@ -3224,7 +3203,7 @@ func_start	putn,%d0-%d2
 	jls	2f
 	addb	#'A'-('9'+1),%d2
 2:
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	console_putc	%d2
 #endif
 #ifdef SERIAL_DEBUG
@@ -3256,7 +3235,7 @@ ENTRY(mac_early_print)
 	movel	%sp@(22),%d1		/* fetch parameter */
 	jra	2f
 1:
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	console_putc	%d0
 #endif
 #ifdef SERIAL_DEBUG
@@ -3292,7 +3271,7 @@ func_start	set_leds,%d0/%a0
 func_return	set_leds
 #endif
 
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 /*
  *	For continuity, see the data alignment
  *	to which this structure is tied.
@@ -3396,43 +3375,6 @@ L(console_clear_loop):
 1:
 func_return	console_init
 
-func_start	console_put_stats,%a0/%d7
-	/*
-	 *	Some of the register usage that follows
-	 *		a0 = pointer to boot_info
-	 *		d7 = value of boot_info fields
-	 */
-	puts	"\nMacLinux\n"
-
-#ifdef SERIAL_DEBUG
-	puts	"\n vidaddr:"
-	putn	%pc@(L(mac_videobase))		/* video addr. */
-
-	puts	"\n  _stext:"
-	lea	%pc@(_stext),%a0
-	putn	%a0
-
-	puts	"\nbootinfo:"
-	lea	%pc@(_end),%a0
-	putn	%a0
-
-	puts	"\n   cpuid:"
-	putn	%pc@(L(cputype))
-
-#  ifdef CONFIG_MAC
-	puts	"\n sccbase:"
-	putn	%pc@(L(mac_sccbase))
-#  endif
-#  ifdef MMU_PRINT
-	putc	'\n'
-	jbsr	mmu_print_machine_cpu_types
-#  endif
-#endif /* SERIAL_DEBUG */
-
-	putc	'\n'
-
-func_return	console_put_stats
-
 #ifdef CONFIG_LOGO
 func_start	console_put_penguin,%a0-%a1/%d0-%d7
 	/*
@@ -3774,7 +3716,7 @@ L(white_16):
 
 L(console_plot_pixel_exit):
 func_return	console_plot_pixel
-#endif /* CONSOLE */
+#endif /* CONSOLE_DEBUG */
 
 
 __INITDATA
@@ -3787,7 +3729,7 @@ L(iobase):
 	.long 0
 #endif
 
-#if defined(CONSOLE)
+#ifdef CONSOLE_DEBUG
 L(console_globals):
 	.long	0		/* cursor column */
 	.long	0		/* cursor row */
@@ -3798,7 +3740,7 @@ L(console_font):
 	.long	0		/* pointer to console font (struct font_desc) */
 L(console_font_data):
 	.long	0		/* pointer to console font data */
-#endif /* CONSOLE */
+#endif /* CONSOLE_DEBUG */
 
 #if defined(MMU_PRINT)
 L(mmu_print_data):
@@ -3856,10 +3798,8 @@ L(mac_dimensions):
 	.long	0
 L(mac_rowbytes):
 	.long	0
-#ifdef SERIAL_DEBUG
 L(mac_sccbase):
 	.long	0
-#endif
 #endif /* CONFIG_MAC */
 
 #if defined (CONFIG_APOLLO)
