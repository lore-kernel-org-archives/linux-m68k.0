From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68knommu: remove obsolete 68360 support
Date: Mon, 29 Feb 2016 12:07:12 +1000
Message-ID: <1456711632-22519-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:44728
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751202AbcB2CMC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 28 Feb 2016 21:12:02 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

Remove the obsolete Motorola/Freescale 68360 SoC support. It has been
bit rotting for many years with little active use in mainlne. There has
been no serial driver support for many years, so it is largely not
useful in its current state.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
Note: this patch generated with "-D". So deleted files are only shown as
      delete markers.

 arch/m68k/68360/Makefile             |  12 -
 arch/m68k/68360/commproc.c           | 309 ----------------
 arch/m68k/68360/config.c             | 169 ---------
 arch/m68k/68360/entry.S              | 164 ---------
 arch/m68k/68360/head-ram.S           | 402 ---------------------
 arch/m68k/68360/head-rom.S           | 413 ----------------------
 arch/m68k/68360/ints.c               | 138 --------
 arch/m68k/Kconfig.cpu                |   7 -
 arch/m68k/Kconfig.debug              |   2 +-
 arch/m68k/Kconfig.machine            |   6 -
 arch/m68k/Makefile                   |   3 -
 arch/m68k/include/asm/commproc.h     | 664 -----------------------------------
 arch/m68k/include/asm/m68360.h       |  13 -
 arch/m68k/include/asm/m68360_enet.h  | 177 ----------
 arch/m68k/include/asm/m68360_pram.h  | 431 -----------------------
 arch/m68k/include/asm/m68360_quicc.h | 362 -------------------
 arch/m68k/include/asm/m68360_regs.h  | 408 ---------------------
 arch/m68k/kernel/early_printk.c      |   8 +-
 arch/m68k/kernel/setup_no.c          |   7 -
 19 files changed, 5 insertions(+), 3690 deletions(-)
 delete mode 100644 arch/m68k/68360/Makefile
 delete mode 100644 arch/m68k/68360/commproc.c
 delete mode 100644 arch/m68k/68360/config.c
 delete mode 100644 arch/m68k/68360/entry.S
 delete mode 100644 arch/m68k/68360/head-ram.S
 delete mode 100644 arch/m68k/68360/head-rom.S
 delete mode 100644 arch/m68k/68360/ints.c
 delete mode 100644 arch/m68k/include/asm/commproc.h
 delete mode 100644 arch/m68k/include/asm/m68360.h
 delete mode 100644 arch/m68k/include/asm/m68360_enet.h
 delete mode 100644 arch/m68k/include/asm/m68360_pram.h
 delete mode 100644 arch/m68k/include/asm/m68360_quicc.h
 delete mode 100644 arch/m68k/include/asm/m68360_regs.h

diff --git a/arch/m68k/68360/Makefile b/arch/m68k/68360/Makefile
deleted file mode 100644
index 591ce42..0000000
diff --git a/arch/m68k/68360/commproc.c b/arch/m68k/68360/commproc.c
deleted file mode 100644
index 14d7f35..0000000
diff --git a/arch/m68k/68360/config.c b/arch/m68k/68360/config.c
deleted file mode 100644
index b65fe4e..0000000
diff --git a/arch/m68k/68360/entry.S b/arch/m68k/68360/entry.S
deleted file mode 100644
index 22eb302..0000000
diff --git a/arch/m68k/68360/head-ram.S b/arch/m68k/68360/head-ram.S
deleted file mode 100644
index 62bc56f..0000000
diff --git a/arch/m68k/68360/head-rom.S b/arch/m68k/68360/head-rom.S
deleted file mode 100644
index b3a7e40..0000000
diff --git a/arch/m68k/68360/ints.c b/arch/m68k/68360/ints.c
deleted file mode 100644
index 2360fc0..0000000
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c496d48..0dfcf12 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -114,13 +114,6 @@ config M68VZ328
 	help
 	  Motorola 68VZ328 processor support.
 
-config M68360
-	bool "MC68360"
-	depends on !MMU
-	select MCPU32
-	help
-	  Motorola 68360 processor support.
-
 endif # M68KCLASSIC
 
 if COLDFIRE
diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index 64776d7..50a67d0 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -12,7 +12,7 @@ config BOOTPARAM_STRING
 
 config EARLY_PRINTK
 	bool "Early printk"
-	depends on !(SUN3 || M68360 || M68000 || COLDFIRE)
+	depends on !(SUN3 || M68000 || COLDFIRE)
 	help
           Write kernel log output directly to a serial port.
           Where implemented, output goes to the framebuffer as well.
diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 61dc643..2a5c7ab 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -187,12 +187,6 @@ config MEMORY_RESERVE
 	help
 	  Reserve certain memory regions on 68x328 based boards.
 
-config UCQUICC
-	bool "Lineo uCquicc board support"
-	depends on M68360
-	help
-	  Support for the Lineo uCquicc board.
-
 config ARN5206
 	bool "Arnewsh 5206 board support"
 	depends on M5206
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 0b29dcf..f0dd9fc 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -39,7 +39,6 @@ cpuflags-$(CONFIG_M68040)	:= -m68040
 endif
 cpuflags-$(CONFIG_M68030)	:=
 cpuflags-$(CONFIG_M68020)	:=
-cpuflags-$(CONFIG_M68360)	:= -m68332
 cpuflags-$(CONFIG_M68000)	:= -m68000
 cpuflags-$(CONFIG_M5441x)	:= $(call cc-option,-mcpu=54455,-mcfv4e)
 cpuflags-$(CONFIG_M54xx)	:= $(call cc-option,-mcpu=5475,-m5200)
@@ -92,7 +91,6 @@ endif
 #
 head-y				:= arch/m68k/kernel/head.o
 head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
-head-$(CONFIG_M68360)		:= arch/m68k/68360/head.o
 head-$(CONFIG_M68000)		:= arch/m68k/68000/head.o
 head-$(CONFIG_COLDFIRE)		:= arch/m68k/coldfire/head.o
 
@@ -114,7 +112,6 @@ core-$(CONFIG_NATFEAT)		+= arch/m68k/emu/
 core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
 core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
 core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
-core-$(CONFIG_M68360)		+= arch/m68k/68360/
 core-$(CONFIG_M68000)		+= arch/m68k/68000/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/coldfire/
 
diff --git a/arch/m68k/include/asm/commproc.h b/arch/m68k/include/asm/commproc.h
deleted file mode 100644
index f41c968..0000000
diff --git a/arch/m68k/include/asm/m68360.h b/arch/m68k/include/asm/m68360.h
deleted file mode 100644
index 4664180..0000000
diff --git a/arch/m68k/include/asm/m68360_enet.h b/arch/m68k/include/asm/m68360_enet.h
deleted file mode 100644
index 4d04037..0000000
diff --git a/arch/m68k/include/asm/m68360_pram.h b/arch/m68k/include/asm/m68360_pram.h
deleted file mode 100644
index c0cbd96..0000000
diff --git a/arch/m68k/include/asm/m68360_quicc.h b/arch/m68k/include/asm/m68360_quicc.h
deleted file mode 100644
index 59414cc..0000000
diff --git a/arch/m68k/include/asm/m68360_regs.h b/arch/m68k/include/asm/m68360_regs.h
deleted file mode 100644
index d57217c..0000000
diff --git a/arch/m68k/kernel/early_printk.c b/arch/m68k/kernel/early_printk.c
index ff9708d..7d3fe08a 100644
--- a/arch/m68k/kernel/early_printk.c
+++ b/arch/m68k/kernel/early_printk.c
@@ -20,8 +20,8 @@ asmlinkage void __init debug_cons_nputs(const char *s, unsigned n);
 static void __ref debug_cons_write(struct console *c,
 				   const char *s, unsigned n)
 {
-#if !(defined(CONFIG_SUN3)   || defined(CONFIG_M68360) || \
-      defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE))
+#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
+      defined(CONFIG_COLDFIRE))
 	if (MACH_IS_MVME16x)
 		mvme16x_cons_write(c, s, n);
 	else
@@ -52,8 +52,8 @@ early_param("earlyprintk", setup_early_printk);
  * debug_cons_nputs() defined in arch/m68k/kernel/head.S cannot be called
  * after init sections are discarded (for platforms that use it).
  */
-#if !(defined(CONFIG_SUN3)   || defined(CONFIG_M68360) || \
-      defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE))
+#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
+      defined(CONFIG_COLDFIRE))
 
 static int __init unregister_early_console(void)
 {
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 76b9113..9309789 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -68,9 +68,6 @@ void (*mach_power_off)(void);
 #define CPU_NAME	"MC68000"
 #endif
 #endif /* CONFIG_M68000 */
-#ifdef CONFIG_M68360
-#define CPU_NAME	"MC68360"
-#endif
 #ifndef CPU_NAME
 #define	CPU_NAME	"UNKNOWN"
 #endif
@@ -209,10 +206,6 @@ void __init setup_arch(char **cmdline_p)
 #if defined( CONFIG_PILOT ) && defined( CONFIG_M68EZ328 )
 	printk(KERN_INFO "PalmV support by Lineo Inc. <jeff@uclinux.com>\n");
 #endif
-#if defined (CONFIG_M68360)
-	printk(KERN_INFO "QUICC port done by SED Systems <hamilton@sedsystems.ca>,\n");
-	printk(KERN_INFO "based on 2.0.38 port by Lineo Inc. <mleslie@lineo.com>.\n");
-#endif
 #ifdef CONFIG_DRAGEN2
 	printk(KERN_INFO "DragonEngine II board support by Georges Menie\n");
 #endif
-- 
1.9.1
