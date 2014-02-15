From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 3/4] m68k: multi-platform EARLY_PRINTK
Date: Sat, 15 Feb 2014 15:47:40 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>


Make the head.S debug console available to all m68k platforms.
  
The boot console is subject to the "earlyprintk" command line argument, 
which is how most other architectures do this.

This is a change of behaviour for the Mac but does not impact the common 
use-case which is not debugging. It is also a change of behaviour for 
other platforms, because it means the serial port stays quiet when 
CONFIG_EARLY_PRINTK is not enabled, eliminating debugging output that's 
not normally needed.

---

This patch set is mostly aimed at making Mac-specific code more useful to 
other platforms. The early printk code becomes more generic, which is 
probably the approach I should have taken when I first implemented it for 
Macs.
 
This should mean that multi-platform configs behave in a more consistent 
way.

The use of the Kconfig and kernel command line user interfaces seems more 
sensible than having obscure macros buried in asm source files to control 
this functionality.


Index: linux-m68k/arch/m68k/Kconfig.debug
===================================================================
--- linux-m68k.orig/arch/m68k/Kconfig.debug	2014-02-15 14:49:18.000000000 +1100
+++ linux-m68k/arch/m68k/Kconfig.debug	2014-02-15 15:06:30.000000000 +1100
@@ -12,12 +12,15 @@ config BOOTPARAM_STRING
 
 config EARLY_PRINTK
 	bool "Early printk"
-	depends on MVME16x || MAC
 	help
           Write kernel log output directly to a serial port.
+          Where implemented, output goes to the framebuffer as well.
+
+          Pass "earlyprintk=debug" on the kernel command line to get a
+          boot console (not required on MVME16x).
 
           This is useful for kernel debugging when your machine crashes very
-          early before the console code is initialized.
+          early, i.e. before the normal console driver is loaded.
           You should normally say N here, unless you want to debug such a crash.
 
 if !MMU
Index: linux-m68k/arch/m68k/kernel/Makefile
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/Makefile	2014-02-15 14:49:18.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/Makefile	2014-02-15 15:06:30.000000000 +1100
@@ -25,3 +25,5 @@ obj-$(CONFIG_HAS_DMA)	+= dma.o
 obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
 
+obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
+
Index: linux-m68k/arch/m68k/kernel/early_printk.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-m68k/arch/m68k/kernel/early_printk.c	2014-02-15 15:06:30.000000000 +1100
@@ -0,0 +1,56 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (c) 2014 Finn Thain
+ */
+
+#include <linux/kernel.h>
+#include <linux/console.h>
+#include <linux/init.h>
+#include <linux/string.h>
+#include <asm/setup.h>
+
+asmlinkage void __init debug_cons_write(const char *s, unsigned n);
+
+static void __init early_cons_write(struct console *c,
+                                    const char *s, unsigned n)
+{
+	debug_cons_write(s, n);
+}
+
+static struct console early_console_instance __initdata = {
+	.name  = "early",
+	.write = early_cons_write,
+	.flags = CON_PRINTBUFFER | CON_BOOT,
+	.index = -1
+};
+
+static int __init setup_early_printk(char *buf)
+{
+	/* MVME16x registers an early console after interrupt setup. */
+	if (MACH_IS_MVME16x)
+		return 0;
+
+	if (early_console || !buf || strcmp(buf, "debug"))
+		return 0;
+
+	early_console = &early_console_instance;
+	register_console(early_console);
+
+	return 0;
+}
+
+early_param("earlyprintk", setup_early_printk);
+
+static int __init unregister_early_console(void)
+{
+	if (!early_console)
+		return 0;
+
+	/* debug_cons_write() can't be used after init sections are discarded */
+	return unregister_console(early_console);
+}
+
+late_initcall(unregister_early_console);
Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-02-15 15:06:30.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-02-15 15:08:06.000000000 +1100
@@ -222,7 +222,7 @@
  * MMU_PRINT:	There is a routine built into head.S that can display the
  * MMU data structures.  It outputs its result through the serial_putc
  * interface.  So where ever that winds up driving data, that's where the
- * mmu struct will appear.  On the Macintosh that's typically the console.
+ * mmu struct will appear.
  *
  * SERIAL_DEBUG:	There are a series of putc() macro statements
  * scattered through out the code to give progress of status to the
@@ -250,8 +250,8 @@
  * USE_MFP:	Use the ST-MFP port (Modem1) for serial debug.
  *
  * Macintosh constants:
- * MAC_USE_SCC_A: Use SCC port A (modem) for serial debug and early console.
- * MAC_USE_SCC_B: Use SCC port B (printer) for serial debug and early console.
+ * MAC_USE_SCC_A: Use SCC port A (modem) for serial debug.
+ * MAC_USE_SCC_B: Use SCC port B (printer) for serial debug.
  */
 
 #include <linux/linkage.h>
@@ -268,27 +268,17 @@
 #include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/asm-offsets.h>
-
 #ifdef CONFIG_MAC
-
-#include <asm/machw.h>
-
-#ifdef CONFIG_FRAMEBUFFER_CONSOLE
-#define CONSOLE
+#  include <asm/machw.h>
 #endif
 
 #ifdef CONFIG_EARLY_PRINTK
-#define SERIAL_DEBUG
-#else
-#undef SERIAL_DEBUG
+#  define SERIAL_DEBUG
+#  ifdef CONFIG_MAC
+#    define CONSOLE
+#  endif
 #endif
 
-#else /* !CONFIG_MAC */
-
-#define SERIAL_DEBUG
-
-#endif /* !CONFIG_MAC */
-
 #undef MMU_PRINT
 #undef MMU_NOCACHE_KERNEL
 #undef DEBUG
@@ -2883,7 +2873,7 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 #ifdef SERIAL_DEBUG
 
 /* You may define either or both of these. */
-#define MAC_USE_SCC_A /* Modem port */
+#undef MAC_USE_SCC_A /* Modem port */
 #define MAC_USE_SCC_B /* Printer port */
 
 #define mac_scc_cha_b_ctrl_offset	0x0
@@ -3234,21 +3224,19 @@ func_start	putn,%d0-%d2
 
 func_return	putn
 
-#ifdef CONFIG_MAC
+#ifdef CONFIG_EARLY_PRINTK
 /*
- *	mac_early_print
- *
  *	This routine takes its parameters on the stack.  It then
  *	turns around and calls the internal routines.  This routine
  *	is used by the boot console.
  *
  *	The calling parameters are:
- *		void mac_early_print(const char *str, unsigned length);
+ *		void debug_cons_write(const char *str, unsigned length)
  *
  *	This routine does NOT understand variable arguments only
  *	simple strings!
  */
-ENTRY(mac_early_print)
+ENTRY(debug_cons_write)
 	moveml	%d0/%d1/%a0,%sp@-
 	movew	%sr,%sp@-
 	ori	#0x0700,%sr
@@ -3270,7 +3258,7 @@ ENTRY(mac_early_print)
 	movew	%sp@+,%sr
 	moveml	%sp@+,%d0/%d1/%a0
 	rts
-#endif /* CONFIG_MAC */
+#endif /* CONFIG_EARLY_PRINTK */
 
 #if defined(CONFIG_HP300) || defined(CONFIG_APOLLO)
 func_start	set_leds,%d0/%a0
Index: linux-m68k/arch/m68k/mac/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/config.c	2014-02-15 14:49:18.000000000 +1100
+++ linux-m68k/arch/m68k/mac/config.c	2014-02-15 15:06:30.000000000 +1100
@@ -71,31 +71,6 @@ static void mac_get_model(char *str);
 static void mac_identify(void);
 static void mac_report_hardware(void);
 
-#ifdef CONFIG_EARLY_PRINTK
-asmlinkage void __init mac_early_print(const char *s, unsigned n);
-
-static void __init mac_early_cons_write(struct console *con,
-                                 const char *s, unsigned n)
-{
-	mac_early_print(s, n);
-}
-
-static struct console __initdata mac_early_cons = {
-	.name  = "early",
-	.write = mac_early_cons_write,
-	.flags = CON_PRINTBUFFER | CON_BOOT,
-	.index = -1
-};
-
-int __init mac_unregister_early_cons(void)
-{
-	/* mac_early_print can't be used after init sections are discarded */
-	return unregister_console(&mac_early_cons);
-}
-
-late_initcall(mac_unregister_early_cons);
-#endif
-
 static void __init mac_sched_init(irq_handler_t vector)
 {
 	via_init_clock(vector);
@@ -190,10 +165,6 @@ void __init config_mac(void)
 	mach_beep = mac_mksound;
 #endif
 
-#ifdef CONFIG_EARLY_PRINTK
-	register_console(&mac_early_cons);
-#endif
-
 	/*
 	 * Determine hardware present
 	 */
