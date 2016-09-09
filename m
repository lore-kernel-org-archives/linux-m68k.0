From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: generalize uboot command line support
Date: Fri,  9 Sep 2016 11:10:18 +1000
Message-ID: <1473383418-4824-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153]:28696
        "EHLO icp-osb-irony-out3.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750984AbcIIBKY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Sep 2016 21:10:24 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The uboot command line support needs to be used by both MMU and no-MMU
setups, but currently we only have the code in the no-MMU code paths.
Move the uboot command line processing code into its own file. Add
appropriate calls to it from both the MMU and no-MMU arch setup code.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/bootinfo.h |   4 ++
 arch/m68k/kernel/Makefile        |   1 +
 arch/m68k/kernel/setup_mm.c      |   3 ++
 arch/m68k/kernel/setup_no.c      |  79 +----------------------------
 arch/m68k/kernel/uboot.c         | 107 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 117 insertions(+), 77 deletions(-)
 create mode 100644 arch/m68k/kernel/uboot.c

diff --git a/arch/m68k/include/asm/bootinfo.h b/arch/m68k/include/asm/bootinfo.h
index 8e21326..f679843 100644
--- a/arch/m68k/include/asm/bootinfo.h
+++ b/arch/m68k/include/asm/bootinfo.h
@@ -22,6 +22,10 @@ extern void save_bootinfo(const struct bi_record *bi);
 static inline void save_bootinfo(const struct bi_record *bi) {}
 #endif
 
+#ifdef CONFIG_UBOOT
+void process_uboot_commandline(char *commandp, int size);
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index e47778f..8a1c4d3 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_HAS_DMA)	+= dma.o
 
 obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
+obj-$(CONFIG_UBOOT)		+= uboot.o
 
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 9afad2b..6f6ffb3 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -274,6 +274,9 @@ void __init setup_arch(char **cmdline_p)
 	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
 	m68k_command_line[CL_SIZE - 1] = 0;
 #endif /* CONFIG_BOOTPARAM */
+#if defined(CONFIG_UBOOT)
+	process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
+#endif
 	*cmdline_p = m68k_command_line;
 	memcpy(boot_command_line, *cmdline_p, CL_SIZE);
 
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 9309789..72d272e 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -34,6 +34,7 @@
 #include <linux/rtc.h>
 
 #include <asm/setup.h>
+#include <asm/bootinfo.h>
 #include <asm/irq.h>
 #include <asm/machdep.h>
 #include <asm/pgtable.h>
@@ -82,69 +83,6 @@ void (*mach_power_off)(void);
 #define	CPU_INSTR_PER_JIFFY	16
 #endif
 
-#if defined(CONFIG_UBOOT)
-/*
- * parse_uboot_commandline
- *
- * Copies u-boot commandline arguments and store them in the proper linux
- * variables.
- *
- * Assumes:
- *	_init_sp global contains the address in the stack pointer when the
- *	kernel starts (see head.S::_start)
- *
- *	U-Boot calling convention:
- *	(*kernel) (kbd, initrd_start, initrd_end, cmd_start, cmd_end);
- *
- *	_init_sp can be parsed as such
- *
- *	_init_sp+00 = u-boot cmd after jsr into kernel (skip)
- *	_init_sp+04 = &kernel board_info (residual data)
- *	_init_sp+08 = &initrd_start
- *	_init_sp+12 = &initrd_end
- *	_init_sp+16 = &cmd_start
- *	_init_sp+20 = &cmd_end
- *
- *	This also assumes that the memory locations pointed to are still
- *	unmodified. U-boot places them near the end of external SDRAM.
- *
- * Argument(s):
- *	commandp = the linux commandline arg container to fill.
- *	size     = the sizeof commandp.
- *
- * Returns:
- */
-static void __init parse_uboot_commandline(char *commandp, int size)
-{
-	extern unsigned long _init_sp;
-	unsigned long *sp;
-	unsigned long uboot_kbd;
-	unsigned long uboot_initrd_start, uboot_initrd_end;
-	unsigned long uboot_cmd_start, uboot_cmd_end;
-
-
-	sp = (unsigned long *)_init_sp;
-	uboot_kbd = sp[1];
-	uboot_initrd_start = sp[2];
-	uboot_initrd_end = sp[3];
-	uboot_cmd_start = sp[4];
-	uboot_cmd_end = sp[5];
-
-	if (uboot_cmd_start && uboot_cmd_end)
-		strncpy(commandp, (const char *)uboot_cmd_start, size);
-#if defined(CONFIG_BLK_DEV_INITRD)
-	if (uboot_initrd_start && uboot_initrd_end &&
-		(uboot_initrd_end > uboot_initrd_start)) {
-		initrd_start = uboot_initrd_start;
-		initrd_end = uboot_initrd_end;
-		ROOT_DEV = Root_RAM0;
-		printk(KERN_INFO "initrd at 0x%lx:0x%lx\n",
-			initrd_start, initrd_end);
-	}
-#endif /* if defined(CONFIG_BLK_DEV_INITRD) */
-}
-#endif /* #if defined(CONFIG_UBOOT) */
-
 void __init setup_arch(char **cmdline_p)
 {
 	int bootmap_size;
@@ -165,20 +103,7 @@ void __init setup_arch(char **cmdline_p)
 #endif /* CONFIG_BOOTPARAM */
 
 #if defined(CONFIG_UBOOT)
-	/* CONFIG_UBOOT and CONFIG_BOOTPARAM defined, concatenate cmdline */
-	#if defined(CONFIG_BOOTPARAM)
-		/* Add the whitespace separator */
-		command_line[strlen(CONFIG_BOOTPARAM_STRING)] = ' ';
-		/* Parse uboot command line into the rest of the buffer */
-		parse_uboot_commandline(
-			&command_line[(strlen(CONFIG_BOOTPARAM_STRING)+1)],
-			(sizeof(command_line) -
-			(strlen(CONFIG_BOOTPARAM_STRING)+1)));
-	/* Only CONFIG_UBOOT defined, create cmdline */
-	#else
-		parse_uboot_commandline(&command_line[0], sizeof(command_line));
-	#endif /* CONFIG_BOOTPARAM */
-	command_line[sizeof(command_line) - 1] = 0;
+	process_uboot_commandline(&command_line[0], sizeof(command_line));
 #endif /* CONFIG_UBOOT */
 
 	printk(KERN_INFO "\x0F\r\n\nuClinux/" CPU_NAME "\n");
diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
new file mode 100644
index 0000000..b3536a8
--- /dev/null
+++ b/arch/m68k/kernel/uboot.c
@@ -0,0 +1,107 @@
+/*
+ * uboot.c -- uboot arguments support
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/fb.h>
+#include <linux/module.h>
+#include <linux/mm.h>
+#include <linux/console.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/bootmem.h>
+#include <linux/seq_file.h>
+#include <linux/init.h>
+#include <linux/initrd.h>
+#include <linux/root_dev.h>
+#include <linux/rtc.h>
+
+#include <asm/setup.h>
+#include <asm/irq.h>
+#include <asm/machdep.h>
+#include <asm/pgtable.h>
+#include <asm/sections.h>
+
+/*
+ * parse_uboot_commandline
+ *
+ * Copies u-boot commandline arguments and store them in the proper linux
+ * variables.
+ *
+ * Assumes:
+ *	_init_sp global contains the address in the stack pointer when the
+ *	kernel starts (see head.S::_start)
+ *
+ *	U-Boot calling convention:
+ *	(*kernel) (kbd, initrd_start, initrd_end, cmd_start, cmd_end);
+ *
+ *	_init_sp can be parsed as such
+ *
+ *	_init_sp+00 = u-boot cmd after jsr into kernel (skip)
+ *	_init_sp+04 = &kernel board_info (residual data)
+ *	_init_sp+08 = &initrd_start
+ *	_init_sp+12 = &initrd_end
+ *	_init_sp+16 = &cmd_start
+ *	_init_sp+20 = &cmd_end
+ *
+ *	This also assumes that the memory locations pointed to are still
+ *	unmodified. U-boot places them near the end of external SDRAM.
+ *
+ * Argument(s):
+ *	commandp = the linux commandline arg container to fill.
+ *	size     = the sizeof commandp.
+ *
+ * Returns:
+ */
+static void __init parse_uboot_commandline(char *commandp, int size)
+{
+	extern unsigned long _init_sp;
+	unsigned long *sp;
+	unsigned long uboot_kbd;
+	unsigned long uboot_initrd_start, uboot_initrd_end;
+	unsigned long uboot_cmd_start, uboot_cmd_end;
+
+	sp = (unsigned long *)_init_sp;
+	uboot_kbd = sp[1];
+	uboot_initrd_start = sp[2];
+	uboot_initrd_end = sp[3];
+	uboot_cmd_start = sp[4];
+	uboot_cmd_end = sp[5];
+
+	if (uboot_cmd_start && uboot_cmd_end)
+		strncpy(commandp, (const char *)uboot_cmd_start, size);
+#if defined(CONFIG_BLK_DEV_INITRD)
+	if (uboot_initrd_start && uboot_initrd_end &&
+	    (uboot_initrd_end > uboot_initrd_start)) {
+		initrd_start = uboot_initrd_start;
+		initrd_end = uboot_initrd_end;
+		ROOT_DEV = Root_RAM0;
+		printk(KERN_INFO "initrd at 0x%lx:0x%lx\n",
+			initrd_start, initrd_end);
+	}
+#endif /* if defined(CONFIG_BLK_DEV_INITRD) */
+}
+
+__init void process_uboot_commandline(char *commandp, int size)
+{
+	int len, n;
+
+	n = strnlen(commandp, size);
+	commandp += n;
+	len = size - n;
+	if (len) {
+		/* Add the whitespace separator */
+		*commandp++ = ' ';
+		len--;
+	}
+
+	parse_uboot_commandline(commandp, len);
+	commandp[size - 1] = 0;
+}
-- 
1.9.1
