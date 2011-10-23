From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 04/16] m68k/mac: early console
Date: Mon, 24 Oct 2011 01:11:12 +1100
Message-ID: <20111023141129.239234190@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46000 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755602Ab1JWOLe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:11:34 -0400
Content-Disposition: inline; filename=mac-early-console
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Revive the old mac_serial_print() routine as mac_early_print(). mac_serial_print() did not function because it did not use the right offsets for its stack arguments. Fix this and make compilation conditional on CONFIG_EARLY_PRINTK instead of the obscure MAC_SERIAL_DEBUG macro.

Give mac_early_print() a new string length parameter to fit the early console API.

Send output to the framebuffer as well as serial ports.

Change the line rate to 38400 baud to match the default for the real (pmac_zilog) serial console.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/Kconfig.debug
===================================================================
--- linux-m68k.orig/arch/m68k/Kconfig.debug	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/Kconfig.debug	2011-10-22 23:02:38.000000000 +1100
@@ -4,7 +4,7 @@ source "lib/Kconfig.debug"
 
 config EARLY_PRINTK
 	bool "Early printk" if EMBEDDED
-	depends on MVME16x
+	depends on MVME16x || MAC
 	default y
 	help
           Write kernel log output directly to a serial port.
Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2011-10-22 23:02:38.000000000 +1100
@@ -250,9 +250,8 @@
  * USE_MFP:	Use the ST-MFP port (Modem1) for serial debug.
  *
  * Macintosh constants:
- * MAC_SERIAL_DEBUG:	Turns on serial debug output for the Macintosh.
- * MAC_USE_SCC_A:	Use the SCC port A (modem) for serial debug.
- * MAC_USE_SCC_B:	Use the SCC port B (printer) for serial debug (default).
+ * MAC_USE_SCC_A: Use SCC port A (modem) for serial debug and early console.
+ * MAC_USE_SCC_B: Use SCC port B (printer) for serial debug and early console.
  */
 
 #include <linux/linkage.h>
@@ -268,33 +267,25 @@
 
 #include <asm/machw.h>
 
-/*
- * Macintosh console support
- */
-
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE
 #define CONSOLE
 #define CONSOLE_PENGUIN
 #endif
 
-/*
- * Macintosh serial debug support; outputs boot info to the printer
- *   and/or modem serial ports
- */
-#undef MAC_SERIAL_DEBUG
+#ifdef CONFIG_EARLY_PRINTK
+#define SERIAL_DEBUG
+#else
+#undef SERIAL_DEBUG
+#endif
 
-/*
- * Macintosh serial debug port selection; define one or both;
- *   requires MAC_SERIAL_DEBUG to be defined
- */
-#define MAC_USE_SCC_A		/* Macintosh modem serial port */
-#define MAC_USE_SCC_B		/* Macintosh printer serial port */
+#else /* !CONFIG_MAC */
 
-#endif	/* CONFIG_MAC */
+#define SERIAL_DEBUG
+
+#endif /* !CONFIG_MAC */
 
 #undef MMU_PRINT
 #undef MMU_NOCACHE_KERNEL
-#define SERIAL_DEBUG
 #undef DEBUG
 
 /*
@@ -655,11 +646,11 @@ ENTRY(__start)
 	lea	%pc@(L(mac_rowbytes)),%a1
 	movel	%a0@,%a1@
 
-#ifdef MAC_SERIAL_DEBUG
+#ifdef SERIAL_DEBUG
 	get_bi_record	BI_MAC_SCCBASE
 	lea	%pc@(L(mac_sccbase)),%a1
 	movel	%a0@,%a1@
-#endif /* MAC_SERIAL_DEBUG */
+#endif
 
 #if 0
 	/*
@@ -1427,7 +1418,7 @@ L(mmu_fixup_done):
 	subl	%d0,L(console_font)
 	subl	%d0,L(console_font_data)
 #endif
-#ifdef MAC_SERIAL_DEBUG
+#ifdef SERIAL_DEBUG
 	orl	#0x50000000,L(mac_sccbase)
 #endif
 1:
@@ -1917,7 +1908,7 @@ mmu_030_print:
 	jbne	30b
 
 mmu_print_done:
-	puts	"\n\n"
+	puts	"\n"
 
 func_return	mmu_print
 
@@ -2768,7 +2759,7 @@ L(scc_initable_mac):
 	.byte	9,0		/* no interrupts */
 	.byte	10,0		/* NRZ */
 	.byte	11,0x50		/* use baud rate generator */
-	.byte	12,10,13,0	/* 9600 baud */
+	.byte	12,1,13,0	/* 38400 baud */
 	.byte	14,1		/* Baud rate generator enable */
 	.byte	3,0xc1		/* enable receiver */
 	.byte	5,0xea		/* enable transmitter */
@@ -2906,10 +2897,12 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 #endif
 #ifdef CONFIG_MAC
 	is_not_mac(L(serial_init_not_mac))
-#ifdef MAC_SERIAL_DEBUG
-#if !defined(MAC_USE_SCC_A) && !defined(MAC_USE_SCC_B)
-#define MAC_USE_SCC_B
-#endif
+
+#ifdef SERIAL_DEBUG
+/* You may define either or both of these. */
+#define MAC_USE_SCC_A /* Modem port */
+#define MAC_USE_SCC_B /* Printer port */
+
 #define mac_scc_cha_b_ctrl_offset	0x0
 #define mac_scc_cha_a_ctrl_offset	0x2
 #define mac_scc_cha_b_data_offset	0x4
@@ -2940,7 +2933,7 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 	jra	7b
 8:
 #endif	/* MAC_USE_SCC_B */
-#endif	/* MAC_SERIAL_DEBUG */
+#endif	/* SERIAL_DEBUG */
 
 	jra	L(serial_init_done)
 L(serial_init_not_mac):
@@ -3011,7 +3004,7 @@ func_start	serial_putc,%d0/%d1/%a0/%a1
 #ifdef CONFIG_MAC
 	is_not_mac(5f)
 
-#ifdef MAC_SERIAL_DEBUG
+#ifdef SERIAL_DEBUG
 
 #ifdef MAC_USE_SCC_A
 	movel	%pc@(L(mac_sccbase)),%a1
@@ -3029,7 +3022,7 @@ func_start	serial_putc,%d0/%d1/%a0/%a1
 	moveb	%d0,%a1@(mac_scc_cha_b_data_offset)
 #endif	/* MAC_USE_SCC_B */
 
-#endif	/* MAC_SERIAL_DEBUG */
+#endif	/* SERIAL_DEBUG */
 
 	jra	L(serial_putc_done)
 5:
@@ -3248,33 +3241,39 @@ func_return	putn
 
 #ifdef CONFIG_MAC
 /*
- *	mac_serial_print
+ *	mac_early_print
  *
  *	This routine takes its parameters on the stack.  It then
- *	turns around and calls the internal routine.  This routine
- *	is used until the Linux console driver initializes itself.
+ *	turns around and calls the internal routines.  This routine
+ *	is used by the boot console.
  *
  *	The calling parameters are:
- *		void mac_serial_print(const char *str);
+ *		void mac_early_print(const char *str, unsigned length);
  *
  *	This routine does NOT understand variable arguments only
  *	simple strings!
  */
-ENTRY(mac_serial_print)
-	moveml	%d0/%a0,%sp@-
-#if 1
-	move	%sr,%sp@-
+ENTRY(mac_early_print)
+	moveml	%d0/%d1/%a0,%sp@-
+	movew	%sr,%sp@-
 	ori	#0x0700,%sr
-#endif
-	movel	%sp@(10),%a0		/* fetch parameter */
+	movel	%sp@(18),%a0		/* fetch parameter */
+	movel	%sp@(22),%d1		/* fetch parameter */
 	jra	2f
-1:	serial_putc	%d0
-2:	moveb	%a0@+,%d0
-	jne	1b
-#if 1
-	move	%sp@+,%sr
+1:
+#ifdef CONSOLE
+	console_putc	%d0
 #endif
-	moveml	%sp@+,%d0/%a0
+#ifdef SERIAL_DEBUG
+	serial_putc	%d0
+#endif
+	subq	#1,%d1
+2:	jeq	3f
+	moveb	%a0@+,%d0
+	jne	1b
+3:
+	movew	%sp@+,%sr
+	moveml	%sp@+,%d0/%d1/%a0
 	rts
 #endif /* CONFIG_MAC */
 
@@ -3409,10 +3408,10 @@ func_start	console_put_stats,%a0/%d7
 	 *		a0 = pointer to boot_info
 	 *		d7 = value of boot_info fields
 	 */
-	puts	"\nMacLinux\n\n"
+	puts	"\nMacLinux\n"
 
 #ifdef SERIAL_DEBUG
-	puts	" vidaddr:"
+	puts	"\n vidaddr:"
 	putn	%pc@(L(mac_videobase))		/* video addr. */
 
 	puts	"\n  _stext:"
@@ -3423,19 +3422,21 @@ func_start	console_put_stats,%a0/%d7
 	lea	%pc@(_end),%a0
 	putn	%a0
 
-	puts	"\ncpuid:"
+	puts	"\n   cpuid:"
 	putn	%pc@(L(cputype))
-	putc	'\n'
 
-#ifdef MAC_SERIAL_DEBUG
+#  ifdef CONFIG_MAC
+	puts	"\n sccbase:"
 	putn	%pc@(L(mac_sccbase))
+#  endif
+#  ifdef MMU_PRINT
 	putc	'\n'
-#endif
-#  if defined(MMU_PRINT)
 	jbsr	mmu_print_machine_cpu_types
-#  endif /* MMU_PRINT */
+#  endif
 #endif /* SERIAL_DEBUG */
 
+	putc	'\n'
+
 func_return	console_put_stats
 
 #ifdef CONSOLE_PENGUIN
@@ -3896,11 +3897,11 @@ L(mac_dimensions):
 	.long	0
 L(mac_rowbytes):
 	.long	0
-#ifdef MAC_SERIAL_DEBUG
+#ifdef SERIAL_DEBUG
 L(mac_sccbase):
 	.long	0
-#endif /* MAC_SERIAL_DEBUG */
 #endif
+#endif /* CONFIG_MAC */
 
 #if defined (CONFIG_APOLLO)
 LSRB0        = 0x10412
Index: linux-m68k/arch/m68k/mac/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/config.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/config.c	2011-10-23 00:51:07.000000000 +1100
@@ -71,6 +71,31 @@ static void mac_get_model(char *str);
 static void mac_identify(void);
 static void mac_report_hardware(void);
 
+#ifdef CONFIG_EARLY_PRINTK
+asmlinkage void __init mac_early_print(const char *s, unsigned n);
+
+static void __init mac_early_cons_write(struct console *con,
+                                 const char *s, unsigned n)
+{
+	mac_early_print(s, n);
+}
+
+static struct console __initdata mac_early_cons = {
+	.name  = "early",
+	.write = mac_early_cons_write,
+	.flags = CON_PRINTBUFFER | CON_BOOT,
+	.index = -1
+};
+
+int __init mac_unregister_early_cons(void)
+{
+	/* mac_early_print can't be used after init sections are discarded */
+	return unregister_console(&mac_early_cons);
+}
+
+late_initcall(mac_unregister_early_cons);
+#endif
+
 static void __init mac_sched_init(irq_handler_t vector)
 {
 	via_init_clock(vector);
@@ -164,6 +189,10 @@ void __init config_mac(void)
 	mach_beep = mac_mksound;
 #endif
 
+#ifdef CONFIG_EARLY_PRINTK
+	register_console(&mac_early_cons);
+#endif
+
 	/*
 	 * Determine hardware present
 	 */
