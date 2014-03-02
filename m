From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 3/4] m68k/mvme16x: adopt common boot console
Date: Mon, 3 Mar 2014 10:55:49 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403022341400.5357@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

In a multi-platform kernel binary we only need one early console instance. 
The difficulty here is that the common early console gets started by 
early_param(), whereas the MVME16x instance would be started later by 
config_mvme16x(). That means some interrupt setup must be done earlier.

---
This patch is untested on MVME16x.

---
 arch/m68k/kernel/early_printk.c |   18 ++++++++++++------
 arch/m68k/kernel/head.S         |   11 +++++++++++
 arch/m68k/mvme16x/config.c      |   27 ++-------------------------
 3 files changed, 25 insertions(+), 31 deletions(-)

Index: linux-m68k/arch/m68k/kernel/early_printk.c
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/early_printk.c	2014-03-03 10:29:59.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/early_printk.c	2014-03-03 10:30:01.000000000 +1100
@@ -12,6 +12,9 @@
 #include <linux/string.h>
 #include <asm/setup.h>
 
+extern void mvme16x_cons_write(struct console *co,
+                               const char *str, unsigned count);
+
 asmlinkage void __init debug_cons_nputs(const char *s, unsigned n);
 
 static void __init debug_cons_write(struct console *c,
@@ -20,7 +23,11 @@ static void __init debug_cons_write(stru
 	debug_cons_nputs(s, n);
 }
 
+#ifdef CONFIG_MVME16X
+static struct console early_console_instance = {
+#else
 static struct console early_console_instance __initdata = {
+#endif
 	.name  = "debug",
 	.flags = CON_PRINTBUFFER | CON_BOOT,
 	.index = -1
@@ -28,14 +35,13 @@ static struct console early_console_inst
 
 static int __init setup_early_printk(char *buf)
 {
-	/* MVME16x registers an early console after interrupt setup. */
-	if (MACH_IS_MVME16x)
-		return 0;
-
 	if (early_console || buf)
 		return 0;
 
-	early_console_instance.write = debug_cons_write;
+	if (MACH_IS_MVME16x)
+		early_console_instance.write = mvme16x_cons_write;
+	else
+		early_console_instance.write = debug_cons_write;
 
 	early_console = &early_console_instance;
 	register_console(early_console);
@@ -47,7 +53,7 @@ early_param("earlyprintk", setup_early_p
 
 static int __init unregister_early_console(void)
 {
-	if (!early_console)
+	if (!early_console || MACH_IS_MVME16x)
 		return 0;
 
 	/* debug_cons_nputs() can't be used after init sections are discarded */
Index: linux-m68k/arch/m68k/mvme16x/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mvme16x/config.c	2014-03-03 10:17:44.000000000 +1100
+++ linux-m68k/arch/m68k/mvme16x/config.c	2014-03-03 10:30:01.000000000 +1100
@@ -213,7 +213,8 @@ static void __init mvme16x_init_IRQ (voi
 #define CySCRH		(0x22)
 #define CyTFTC		(0x80)
 
-static void cons_write(struct console *co, const char *str, unsigned count)
+void mvme16x_cons_write(struct console *co,
+                        const char *str, unsigned count)
 {
 	volatile unsigned char *base_addr = (u_char *)CD2401_ADDR;
 	volatile u_char sink;
@@ -268,20 +269,6 @@ static void cons_write(struct console *c
 	base_addr[CyIER] = ier;
 }
 
-static struct console cons_info =
-{
-	.name	= "sercon",
-	.write	= cons_write,
-	.flags	= CON_PRINTBUFFER | CON_BOOT,
-	.index	= -1,
-};
-
-static void __init mvme16x_early_console(void)
-{
-	register_console(&cons_info);
-
-	printk(KERN_INFO "MVME16x: early console registered\n");
-}
 #endif
 
 void __init config_mvme16x(void)
@@ -336,16 +323,6 @@ void __init config_mvme16x(void)
     else
     {
 	mvme16x_config = MVME16x_CONFIG_GOT_LP | MVME16x_CONFIG_GOT_CD2401;
-
-	/* Dont allow any interrupts from the CD2401 until the interrupt */
-	/* handlers are installed					 */
-
-	pcc2chip[PccSCCMICR] = 0x10;
-	pcc2chip[PccSCCTICR] = 0x10;
-	pcc2chip[PccSCCRICR] = 0x10;
-#ifdef CONFIG_EARLY_PRINTK
-	mvme16x_early_console();
-#endif
     }
 }
 
Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-03-03 10:29:59.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-03-03 10:30:01.000000000 +1100
@@ -2936,6 +2936,15 @@ L(serial_init_not_mac):
 2:
 #endif
 
+#ifdef CONFIG_MVME16x
+	is_not_mvme16x(L(serial_init_not_mvme16x))
+	moveb	#0x10,M167_PCSCCMICR
+	moveb	#0x10,M167_PCSCCTICR
+	moveb	#0x10,M167_PCSCCRICR
+	jra	L(serial_init_done)
+L(serial_init_not_mvme16x):
+#endif
+
 #ifdef CONFIG_APOLLO
 /* We count on the PROM initializing SIO1 */
 #endif
@@ -3768,7 +3777,9 @@ M167_CYIER = 0xfff45011
 M167_CYLICR = 0xfff45026
 M167_CYTEOIR = 0xfff45085
 M167_CYTDR = 0xfff450f8
+M167_PCSCCMICR = 0xfff4201d
 M167_PCSCCTICR = 0xfff4201e
+M167_PCSCCRICR = 0xfff4201f
 M167_PCTPIACKR = 0xfff42025
 #endif
 
