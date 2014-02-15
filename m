From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 4/4] m68k: toward platform agnostic framebuffer debug logging
Date: Sat, 15 Feb 2014 15:49:07 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402151534030.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>


Code subject to #ifdef CONSOLE is made more generic, as was apparently 
intended by the original author of that code.

Remove console_put_stats() routine. If it should be somehow useful, it 
should also be useful on platforms without framebuffer debug logging. The 
present implementation is only built #if defined CONFIG_MAC && defined 
CONSOLE even though puts() works everywhere...

---

The CONSOLE_DEBUG and SERIAL_DEBUG macros can be used independently. I 
think renaming CONSOLE as CONSOLE_DEBUG makes this apparent. (Though it's 
unclear how to implement a kernel command line UI to enable them 
independently. That might need to be controlled from the bootloader.)


Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-02-15 15:06:30.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-02-15 15:06:36.000000000 +1100
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
@@ -275,7 +274,7 @@
 #ifdef CONFIG_EARLY_PRINTK
 #  define SERIAL_DEBUG
 #  ifdef CONFIG_MAC
-#    define CONSOLE
+#    define CONSOLE_DEBUG
 #  endif
 #endif
 
@@ -470,22 +469,21 @@ func_define	serial_putc,1
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
@@ -505,7 +503,7 @@ func_define	putn,1
 .endm
 
 .macro	puts		string
-#if defined(CONSOLE) || defined(SERIAL_DEBUG)
+#if defined(CONSOLE_DEBUG) || defined(SERIAL_DEBUG)
 	__INITDATA
 .Lstr\@:
 	.string	"\string"
@@ -875,13 +873,12 @@ L(nothp):
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
 
@@ -1386,7 +1383,7 @@ L(mmu_fixup_done):
 	andl	L(mac_videobase),%d0
 	addl	#VIDEOMEMBASE,%d0
 	movel	%d0,L(mac_videobase)
-#if defined(CONSOLE)
+#ifdef CONSOLE_DEBUG
 	movel	%pc@(L(phys_kernel_start)),%d0
 	subl	#PAGE_OFFSET,%d0
 	subl	%d0,L(console_font)
@@ -3185,7 +3182,7 @@ func_start	puts,%d0/%a0
 	movel	ARG1,%a0
 	jra	2f
 1:
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	console_putc	%d0
 #endif
 #ifdef SERIAL_DEBUG
@@ -3214,7 +3211,7 @@ func_start	putn,%d0-%d2
 	jls	2f
 	addb	#'A'-('9'+1),%d2
 2:
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	console_putc	%d2
 #endif
 #ifdef SERIAL_DEBUG
@@ -3244,7 +3241,7 @@ ENTRY(boot_cons_write)
 	movel	%sp@(22),%d1		/* fetch parameter */
 	jra	2f
 1:
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 	console_putc	%d0
 #endif
 #ifdef SERIAL_DEBUG
@@ -3280,7 +3277,7 @@ func_start	set_leds,%d0/%a0
 func_return	set_leds
 #endif
 
-#ifdef CONSOLE
+#ifdef CONSOLE_DEBUG
 /*
  *	For continuity, see the data alignment
  *	to which this structure is tied.
@@ -3384,43 +3381,6 @@ L(console_clear_loop):
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
@@ -3762,7 +3722,7 @@ L(white_16):
 
 L(console_plot_pixel_exit):
 func_return	console_plot_pixel
-#endif /* CONSOLE */
+#endif /* CONSOLE_DEBUG */
 
 
 __INITDATA
@@ -3775,7 +3735,7 @@ L(iobase):
 	.long 0
 #endif
 
-#if defined(CONSOLE)
+#ifdef CONSOLE_DEBUG
 L(console_globals):
 	.long	0		/* cursor column */
 	.long	0		/* cursor row */
@@ -3786,7 +3746,7 @@ L(console_font):
 	.long	0		/* pointer to console font (struct font_desc) */
 L(console_font_data):
 	.long	0		/* pointer to console font data */
-#endif /* CONSOLE */
+#endif /* CONSOLE_DEBUG */
 
 #if defined(MMU_PRINT)
 L(mmu_print_data):
