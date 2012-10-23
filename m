From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] Platform code merge for 68000 core cpus
Date: Wed, 24 Oct 2012 00:45:23 +0100
Message-ID: <1351035923-10955-1-git-send-email-ljalvs@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:52814 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933579Ab2JWXp3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Oct 2012 19:45:29 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so2334229wey.19
        for <linux-m68k@vger.kernel.org>; Tue, 23 Oct 2012 16:45:27 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: gerg@snapgear.com, ljalvs@gmail.com


Hello again,

I've fixed the previous issue.

As a test I've built a kernel for the 68000 based on the git sources with this patch and everything went smooth. (Tested it in real hardware) 


Regards,
Luis



Signed-off-by: Luis Alves <ljalvs@gmail.com>
---
 arch/m68k/Kconfig.cpu                              |    2 +-
 arch/m68k/Makefile                                 |    6 +-
 arch/m68k/platform/68000/Makefile                  |   18 ++
 .../{68VZ328/bootlogo.h => 68000/bootlogo-vz.h}    |    0
 arch/m68k/platform/{68328 => 68000}/bootlogo.h     |    0
 arch/m68k/platform/{68328 => 68000}/entry.S        |    0
 arch/m68k/platform/68000/head.S                    |  240 ++++++++++++++++++++
 arch/m68k/platform/{68328 => 68000}/ints.c         |    2 +-
 .../platform/{68328/config.c => 68000/m68328.c}    |    2 +-
 .../{68EZ328/config.c => 68000/m68EZ328.c}         |    2 +-
 .../{68VZ328/config.c => 68000/m68VZ328.c}         |    4 +-
 arch/m68k/platform/{68328 => 68000}/romvec.S       |    2 +-
 arch/m68k/platform/{68328 => 68000}/timers.c       |    2 +-
 arch/m68k/platform/68328/Makefile                  |   21 --
 arch/m68k/platform/68328/head-de2.S                |  128 -----------
 arch/m68k/platform/68328/head-pilot.S              |  207 -----------------
 arch/m68k/platform/68328/head-ram.S                |  141 ------------
 arch/m68k/platform/68328/head-rom.S                |  105 ---------
 arch/m68k/platform/68EZ328/Makefile                |    5 -
 arch/m68k/platform/68VZ328/Makefile                |    5 -
 20 files changed, 268 insertions(+), 624 deletions(-)
 create mode 100644 arch/m68k/platform/68000/Makefile
 rename arch/m68k/platform/{68VZ328/bootlogo.h => 68000/bootlogo-vz.h} (100%)
 rename arch/m68k/platform/{68328 => 68000}/bootlogo.h (100%)
 rename arch/m68k/platform/{68328 => 68000}/entry.S (100%)
 create mode 100644 arch/m68k/platform/68000/head.S
 rename arch/m68k/platform/{68328 => 68000}/ints.c (98%)
 rename arch/m68k/platform/{68328/config.c => 68000/m68328.c} (97%)
 rename arch/m68k/platform/{68EZ328/config.c => 68000/m68EZ328.c} (97%)
 rename arch/m68k/platform/{68VZ328/config.c => 68000/m68VZ328.c} (98%)
 rename arch/m68k/platform/{68328 => 68000}/romvec.S (94%)
 rename arch/m68k/platform/{68328 => 68000}/timers.c (98%)
 delete mode 100644 arch/m68k/platform/68328/Makefile
 delete mode 100644 arch/m68k/platform/68328/head-de2.S
 delete mode 100644 arch/m68k/platform/68328/head-pilot.S
 delete mode 100644 arch/m68k/platform/68328/head-ram.S
 delete mode 100644 arch/m68k/platform/68328/head-rom.S
 delete mode 100644 arch/m68k/platform/68EZ328/Makefile
 delete mode 100644 arch/m68k/platform/68VZ328/Makefile

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c4eb79e..aad3b0b 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -35,7 +35,7 @@ endchoice
 if M68KCLASSIC
 
 config M68000
-	bool
+	bool "MC68000"
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_MULDIV64
 	select CPU_HAS_NO_UNALIGNED
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 7636751..2f02acf 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -92,7 +92,7 @@ endif
 head-y				:= arch/m68k/kernel/head.o
 head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
 head-$(CONFIG_M68360)		:= arch/m68k/platform/68360/head.o
-head-$(CONFIG_M68000)		:= arch/m68k/platform/68328/head.o
+head-$(CONFIG_M68000)		:= arch/m68k/platform/68000/head.o
 head-$(CONFIG_COLDFIRE)		:= arch/m68k/platform/coldfire/head.o
 
 core-y				+= arch/m68k/kernel/	arch/m68k/mm/
@@ -114,9 +114,7 @@ core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
 core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
 core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
 core-$(CONFIG_M68360)		+= arch/m68k/platform/68360/
-core-$(CONFIG_M68000)		+= arch/m68k/platform/68328/
-core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
-core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
+core-$(CONFIG_M68000)		+= arch/m68k/platform/68000/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
 
 
diff --git a/arch/m68k/platform/68000/Makefile b/arch/m68k/platform/68000/Makefile
new file mode 100644
index 0000000..1eab70c
--- /dev/null
+++ b/arch/m68k/platform/68000/Makefile
@@ -0,0 +1,18 @@
+##################################################
+#
+# Makefile for 68000 core based cpus
+#
+# 2012.10.21, Luis Alves <ljalvs@gmail.com>
+#             Merged all 68000 based cpu's config
+#             files into a single directory.
+#
+
+# 68328, 68EZ328, 68VZ328
+
+obj-y			+= entry.o ints.o timers.o
+obj-$(CONFIG_M68328)	+= m68328.o
+obj-$(CONFIG_M68EZ328)	+= m68EZ328.o
+obj-$(CONFIG_M68VZ328)	+= m68VZ328.o
+obj-$(CONFIG_ROM)	+= romvec.o
+
+extra-y 		:= head.o
diff --git a/arch/m68k/platform/68VZ328/bootlogo.h b/arch/m68k/platform/68000/bootlogo-vz.h
similarity index 100%
rename from arch/m68k/platform/68VZ328/bootlogo.h
rename to arch/m68k/platform/68000/bootlogo-vz.h
diff --git a/arch/m68k/platform/68328/bootlogo.h b/arch/m68k/platform/68000/bootlogo.h
similarity index 100%
rename from arch/m68k/platform/68328/bootlogo.h
rename to arch/m68k/platform/68000/bootlogo.h
diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68000/entry.S
similarity index 100%
rename from arch/m68k/platform/68328/entry.S
rename to arch/m68k/platform/68000/entry.S
diff --git a/arch/m68k/platform/68000/head.S b/arch/m68k/platform/68000/head.S
new file mode 100644
index 0000000..536ef96
--- /dev/null
+++ b/arch/m68k/platform/68000/head.S
@@ -0,0 +1,240 @@
+/*
+ * head.S - Common startup code for 68000 core based CPU's
+ *
+ * 2012.10.21, Luis Alves <ljalvs@gmail.com>, Single head.S file for all
+ *             68000 core based CPU's. Based on the sources from:
+ *             Coldfire by Greg Ungerer <gerg@snapgear.com>
+ *             68328 by D. Jeff Dionne <jeff@ryeham.ee.ryerson.ca>,
+ *                      Kenneth Albanowski <kjahds@kjahds.com>,
+ *                      The Silver Hammer Group, Ltd.
+ *
+ */
+
+#include <linux/linkage.h>
+#include <linux/init.h>
+#include <asm/asm-offsets.h>
+#include <asm/thread_info.h>
+
+
+/*****************************************************************************
+ * UCSIMM and UCDIMM use CONFIG_MEMORY_RESERVE to reserve some RAM
+ *****************************************************************************/
+#ifdef CONFIG_MEMORY_RESERVE
+#define RAMEND (CONFIG_RAMBASE+CONFIG_RAMSIZE)-(CONFIG_MEMORY_RESERVE*0x100000)
+#else
+#define RAMEND (CONFIG_RAMBASE+CONFIG_RAMSIZE)
+#endif
+/*****************************************************************************/
+
+.global _start
+.global _rambase
+.global _ramvec
+.global _ramstart
+.global _ramend
+
+#if defined(CONFIG_PILOT) || defined(CONFIG_INIT_LCD)
+.global bootlogo_bits
+#endif
+
+/* Defining DEBUG_HEAD_CODE, serial port in 68x328 is inited */
+/* #define DEBUG_HEAD_CODE */
+#undef DEBUG_HEAD_CODE
+
+.data
+
+/*****************************************************************************
+ * RAM setup pointers. Used by the kernel to determine RAM location and size.
+ *****************************************************************************/
+
+_rambase:
+	.long	0
+_ramvec:
+	.long	0
+_ramstart:
+	.long	0
+_ramend:
+	.long	0
+
+__HEAD
+
+/*****************************************************************************
+ * Entry point, where all begins!
+ *****************************************************************************/
+
+_start:
+
+/* Pilot need this specific signature at the start of ROM */
+#ifdef CONFIG_PILOT
+	.byte	0x4e, 0xfa, 0x00, 0x0a		/* bra opcode (jmp 10 bytes) */
+	.byte	'b', 'o', 'o', 't'
+	.word	10000
+	nop
+	moveq	#0, %d0
+	movew	%d0, 0xfffff618			/* Watchdog off */
+	movel	#0x00011f07, 0xfffff114		/* CS A1 Mask */
+#endif /* CONFIG_PILOT */
+
+	movew	#0x2700, %sr			/* disable all interrupts */
+
+/*****************************************************************************
+ * Setup PLL and wait for it to settle (in 68x328 cpu's).
+ * Also, if enabled, init serial port.
+ *****************************************************************************/
+#if defined(CONFIG_M68328) || \
+    defined(CONFIG_M68EZ328) || \
+    defined(CONFIG_M68VZ328)
+
+/* Serial port setup. Should only be needed if debugging this startup code. */
+#ifdef DEBUG_HEAD_CODE
+	movew	#0x0800, 0xfffff906		/* Ignore CTS */
+	movew	#0x010b, 0xfffff902		/* BAUD to 9600 */
+	movew	#0xe100, 0xfffff900		/* enable */
+#endif /* DEBUG_HEAD */
+
+#ifdef CONFIG_PILOT
+	movew	#0x2410, 0xfffff200		/* PLLCR */
+#else
+	movew	#0x2400, 0xfffff200		/* PLLCR */
+#endif
+	movew	#0x0123, 0xfffff202		/* PLLFSR */
+	moveq	#0, %d0
+	movew	#16384, %d0			/* PLL settle wait loop */
+_pll_settle:
+	subw	#1, %d0
+	bne	_pll_settle
+#endif /* CONFIG_M68x328 */
+
+
+/*****************************************************************************
+ * If running kernel from ROM some specific initialization has to be done.
+ * (Assuming that everything is already init'ed when running from RAM)
+ *****************************************************************************/
+#ifdef CONFIG_ROMKERNEL
+
+/*****************************************************************************
+ * Init chip registers (uCsimm specific)
+ *****************************************************************************/
+#ifdef CONFIG_UCSIMM
+	moveb	#0x00, 0xfffffb0b	/* Watchdog off */
+	moveb	#0x10, 0xfffff000	/* SCR */
+	moveb	#0x00, 0xfffff40b	/* enable chip select */
+	moveb	#0x00, 0xfffff423	/* enable /DWE */
+	moveb	#0x08, 0xfffffd0d	/* disable hardmap */
+	moveb	#0x07, 0xfffffd0e	/* level 7 interrupt clear */
+	movew	#0x8600, 0xfffff100	/* FLASH at 0x10c00000 */
+	movew	#0x018b, 0xfffff110	/* 2Meg, enable, 0ws */
+	movew	#0x8f00, 0xfffffc00	/* DRAM configuration */
+	movew	#0x9667, 0xfffffc02	/* DRAM control */
+	movew	#0x0000, 0xfffff106	/* DRAM at 0x00000000 */
+	movew	#0x068f, 0xfffff116	/* 8Meg, enable, 0ws */
+	moveb	#0x40, 0xfffff300	/* IVR */
+	movel	#0x007FFFFF, %d0	/* IMR */
+	movel	%d0, 0xfffff304
+	moveb	0xfffff42b, %d0
+	andb	#0xe0, %d0
+	moveb	%d0, 0xfffff42b
+#endif
+
+/*****************************************************************************
+ * Init LCD controller.
+ * (Assuming that LCD controller is already init'ed when running from RAM)
+ *****************************************************************************/
+#ifdef CONFIG_INIT_LCD
+#ifdef CONFIG_PILOT
+	moveb	#0, 0xfffffA27			/* LCKCON */
+	movel	#_start, 0xfffffA00		/* LSSA */
+	moveb	#0xa, 0xfffffA05		/* LVPW */
+	movew	#0x9f, 0xFFFFFa08		/* LXMAX */
+	movew	#0x9f, 0xFFFFFa0a		/* LYMAX */
+	moveb	#9, 0xfffffa29			/* LBAR */
+	moveb	#0, 0xfffffa25			/* LPXCD */
+	moveb	#0x04, 0xFFFFFa20		/* LPICF */
+	moveb	#0x58, 0xfffffA27		/* LCKCON */
+	moveb	#0x85, 0xfffff429		/* PFDATA */
+	moveb	#0xd8, 0xfffffA27		/* LCKCON */
+	moveb	#0xc5, 0xfffff429		/* PFDATA */
+	moveb	#0xd5, 0xfffff429		/* PFDATA */
+	movel	#bootlogo_bits, 0xFFFFFA00	/* LSSA */
+	moveb	#10, 0xFFFFFA05			/* LVPW */
+	movew	#160, 0xFFFFFA08		/* LXMAX */
+	movew	#160, 0xFFFFFA0A		/* LYMAX */
+#else /* CONFIG_PILOT */
+	movel	#bootlogo_bits, 0xfffffA00	/* LSSA */
+	moveb	#0x28, 0xfffffA05		/* LVPW */
+	movew	#0x280, 0xFFFFFa08		/* LXMAX */
+	movew	#0x1df, 0xFFFFFa0a		/* LYMAX */
+	moveb	#0, 0xfffffa29			/* LBAR */
+	moveb	#0, 0xfffffa25			/* LPXCD */
+	moveb	#0x08, 0xFFFFFa20		/* LPICF */
+	moveb	#0x01, 0xFFFFFA21		/* -ve pol */
+	moveb	#0x81, 0xfffffA27		/* LCKCON */
+	movew	#0xff00, 0xfffff412		/* LCD pins */
+#endif /* CONFIG_PILOT */
+#endif /* CONFIG_INIT_LCD */
+
+/*****************************************************************************
+ * Kernel is running from FLASH/ROM (XIP)
+ * Copy init text & data to RAM
+ *****************************************************************************/
+	moveal	#_etext, %a0
+	moveal	#_sdata, %a1
+	moveal	#__bss_start, %a2
+_copy_initmem:
+	movel	%a0@+, %a1@+
+	cmpal	%a1, %a2
+	bhi	_copy_initmem
+#endif /* CONFIG_ROMKERNEL */
+
+/*****************************************************************************
+ * Setup basic memory information for kernel
+ *****************************************************************************/
+	movel	#CONFIG_VECTORBASE,_ramvec	/* set vector base location */
+	movel	#CONFIG_RAMBASE,_rambase	/* set the base of RAM */
+	movel	#RAMEND, _ramend		/* set end ram addr */
+	lea	__bss_stop,%a1
+	movel	%a1,_ramstart
+
+/*****************************************************************************
+ * If the kernel is in RAM, move romfs to right above bss and
+ * adjust _ramstart to where romfs ends.
+ *
+ * (Do this only if CONFIG_MTD_UCLINUX is true)
+ *****************************************************************************/
+
+#if defined(CONFIG_ROMFS_FS) && defined(CONFIG_RAMKERNEL) && \
+    defined(CONFIG_MTD_UCLINUX)
+	lea	__bss_start, %a0		/* get start of bss */
+	lea	__bss_stop, %a1			/* set up destination  */
+	movel	%a0, %a2			/* copy of bss start */
+
+	movel	8(%a0), %d0			/* get size of ROMFS */
+	addql	#8, %d0				/* allow for rounding */
+	andl	#0xfffffffc, %d0		/* whole words */
+
+	addl	%d0, %a0			/* copy from end */
+	addl	%d0, %a1			/* copy from end */
+	movel	%a1, _ramstart			/* set start of ram */
+_copy_romfs:
+	movel	-(%a0), -(%a1)			/* copy dword */
+	cmpl	%a0, %a2			/* check if at end */
+	bne	_copy_romfs
+#endif /* CONFIG_ROMFS_FS && CONFIG_RAMKERNEL && CONFIG_MTD_UCLINUX */
+
+/*****************************************************************************
+ * Clear bss region
+ *****************************************************************************/
+	lea	__bss_start, %a0		/* get start of bss */
+	lea	__bss_stop, %a1			/* get end of bss */
+_clear_bss:
+	movel	#0, (%a0)+			/* clear each word */
+	cmpl	%a0, %a1			/* check if at end */
+	bne	_clear_bss
+
+/*****************************************************************************
+ * Load the current task pointer and stack.
+ *****************************************************************************/
+	lea	init_thread_union,%a0
+	lea	THREAD_SIZE(%a0),%sp
+	jsr	start_kernel			/* start Linux kernel */
+_exit:
+	jmp	_exit				/* should never get here */
diff --git a/arch/m68k/platform/68328/ints.c b/arch/m68k/platform/68000/ints.c
similarity index 98%
rename from arch/m68k/platform/68328/ints.c
rename to arch/m68k/platform/68000/ints.c
index b3810fe..cda49b1 100644
--- a/arch/m68k/platform/68328/ints.c
+++ b/arch/m68k/platform/68000/ints.c
@@ -1,5 +1,5 @@
 /*
- * linux/arch/m68knommu/platform/68328/ints.c
+ * ints.c - Generic interrupt controller support
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
diff --git a/arch/m68k/platform/68328/config.c b/arch/m68k/platform/68000/m68328.c
similarity index 97%
rename from arch/m68k/platform/68328/config.c
rename to arch/m68k/platform/68000/m68328.c
index 8c20e89..a86eb66 100644
--- a/arch/m68k/platform/68328/config.c
+++ b/arch/m68k/platform/68000/m68328.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *  linux/arch/m68knommu/platform/68328/config.c
+ *  m68328.c - 68328 specific config
  *
  *  Copyright (C) 1993 Hamish Macdonald
  *  Copyright (C) 1999 D. Jeff Dionne
diff --git a/arch/m68k/platform/68EZ328/config.c b/arch/m68k/platform/68000/m68EZ328.c
similarity index 97%
rename from arch/m68k/platform/68EZ328/config.c
rename to arch/m68k/platform/68000/m68EZ328.c
index 4f158d5..a6eb72d 100644
--- a/arch/m68k/platform/68EZ328/config.c
+++ b/arch/m68k/platform/68000/m68EZ328.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *  linux/arch/m68knommu/platform/68EZ328/config.c
+ *  m68EZ328.c - 68EZ328 specific config
  *
  *  Copyright (C) 1993 Hamish Macdonald
  *  Copyright (C) 1999 D. Jeff Dionne
diff --git a/arch/m68k/platform/68VZ328/config.c b/arch/m68k/platform/68000/m68VZ328.c
similarity index 98%
rename from arch/m68k/platform/68VZ328/config.c
rename to arch/m68k/platform/68000/m68VZ328.c
index 2ed8dc3..eb6964f 100644
--- a/arch/m68k/platform/68VZ328/config.c
+++ b/arch/m68k/platform/68000/m68VZ328.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *  linux/arch/m68knommu/platform/68VZ328/config.c
+ *  m68VZ328.c - 68VZ328 specific config
  *
  *  Copyright (C) 1993 Hamish Macdonald
  *  Copyright (C) 1999 D. Jeff Dionne
@@ -28,7 +28,7 @@
 #include <asm/bootstd.h>
 
 #ifdef CONFIG_INIT_LCD
-#include "bootlogo.h"
+#include "bootlogo-vz.h"
 #endif
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/68328/romvec.S b/arch/m68k/platform/68000/romvec.S
similarity index 94%
rename from arch/m68k/platform/68328/romvec.S
rename to arch/m68k/platform/68000/romvec.S
index 3108446..15c70cd 100644
--- a/arch/m68k/platform/68328/romvec.S
+++ b/arch/m68k/platform/68000/romvec.S
@@ -1,5 +1,5 @@
 /*
- * linux/arch/m68knommu/platform/68328/romvec.S
+ * romvec.S - Vector table for 68000 cpus
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
diff --git a/arch/m68k/platform/68328/timers.c b/arch/m68k/platform/68000/timers.c
similarity index 98%
rename from arch/m68k/platform/68328/timers.c
rename to arch/m68k/platform/68000/timers.c
index f4dc9b2..ec30acb 100644
--- a/arch/m68k/platform/68328/timers.c
+++ b/arch/m68k/platform/68000/timers.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *  linux/arch/m68knommu/platform/68328/timers.c
+ *  timers.c - Generic hardware timer support.
  *
  *  Copyright (C) 1993 Hamish Macdonald
  *  Copyright (C) 1999 D. Jeff Dionne
diff --git a/arch/m68k/platform/68328/Makefile b/arch/m68k/platform/68328/Makefile
deleted file mode 100644
index ee61bf8..0000000
--- a/arch/m68k/platform/68328/Makefile
+++ /dev/null
@@ -1,21 +0,0 @@
-#
-# Makefile for arch/m68knommu/platform/68328.
-#
-
-model-y			  := ram
-model-$(CONFIG_ROMKERNEL) := rom
-
-head-y			= head-$(model-y).o
-head-$(CONFIG_PILOT)	= head-pilot.o
-head-$(CONFIG_DRAGEN2)	= head-de2.o
-
-obj-y			+= entry.o ints.o timers.o
-obj-$(CONFIG_M68328)	+= config.o
-obj-$(CONFIG_ROM)	+= romvec.o
-
-extra-y			:= head.o
-
-$(obj)/head.o: $(obj)/$(head-y)
-	ln -sf $(head-y) $(obj)/head.o
-
-clean-files := $(obj)/head.o $(head-y)
diff --git a/arch/m68k/platform/68328/head-de2.S b/arch/m68k/platform/68328/head-de2.S
deleted file mode 100644
index 537d324..0000000
--- a/arch/m68k/platform/68328/head-de2.S
+++ /dev/null
@@ -1,128 +0,0 @@
-
-#define	MEM_END	0x00800000	/* Memory size 8Mb */
-
-#undef CRT_DEBUG
-
-.macro	PUTC CHAR
-#ifdef CRT_DEBUG
-	moveq	#\CHAR, %d7
-	jsr	putc
-#endif
-.endm
-
-	.global	_start
-	.global _rambase
-	.global _ramvec
-	.global	_ramstart
-	.global	_ramend
-	
-	.data
-
-/*
- *	Set up the usable of RAM stuff
- */
-_rambase:
-	.long	0
-_ramvec:
-	.long	0
-_ramstart:
-	.long	0
-_ramend:
-	.long	0
-
-	.text
-
-_start:
-
-/*
- * Setup initial stack
- */
-	/* disable all interrupts */
-	movew	#0x2700, %sr
-	movel	#-1, 0xfffff304
-	movel	#MEM_END-4, %sp
-
-	PUTC	'\r'
-	PUTC	'\n'
-	PUTC	'A'
-	PUTC	'B'
-
-/*
- *	Determine end of RAM
- */
-
-	movel	#MEM_END, %a0
-	movel	%a0, _ramend
-
-	PUTC	'C'
-
-/*
- *	Move ROM filesystem above bss :-)
- */
-
-	moveal	#__bss_start, %a0		/* romfs at the start of bss */
-	moveal	#__bss_stop, %a1		/* Set up destination  */
-	movel	%a0, %a2			/* Copy of bss start */
-
-	movel	8(%a0), %d1			/* Get size of ROMFS */
-	addql	#8, %d1				/* Allow for rounding */
-	andl	#0xfffffffc, %d1	/* Whole words */
-
-	addl	%d1, %a0			/* Copy from end */
-	addl	%d1, %a1			/* Copy from end */
-	movel	%a1, _ramstart		/* Set start of ram */
-
-1:
-	movel	-(%a0), %d0			/* Copy dword */
-	movel	%d0, -(%a1)
-	cmpl	%a0, %a2			/* Check if at end */
-	bne	1b
-
-	PUTC	'D'
-
-/*
- * Initialize BSS segment to 0
- */
-
-	lea	__bss_start, %a0
-	lea	__bss_stop, %a1
-
-	/* Copy 0 to %a0 until %a0 == %a1 */
-2:	cmpal	%a0, %a1
-	beq	1f
-	clrl	(%a0)+
-	bra	2b
-1:
-
-	PUTC	'E'
-
-/*
- * Load the current task pointer and stack
- */
-
-	lea	init_thread_union, %a0
-	lea	0x2000(%a0), %sp
-
-	PUTC	'F'
-	PUTC	'\r'
-	PUTC	'\n'
-
-/*
- * Go
- */
-
-	jmp	start_kernel
-
-/*
- * Local functions
- */
- 
-#ifdef CRT_DEBUG
-putc:
-	moveb	%d7, 0xfffff907
-1:
-	movew	0xfffff906, %d7
-	andw	#0x2000, %d7
-	beq	1b
-	rts
-#endif
diff --git a/arch/m68k/platform/68328/head-pilot.S b/arch/m68k/platform/68328/head-pilot.S
deleted file mode 100644
index 45a9dad..0000000
--- a/arch/m68k/platform/68328/head-pilot.S
+++ /dev/null
@@ -1,207 +0,0 @@
-/*
- * linux/arch/m68knommu/platform/68328/head-pilot.S
- * - A startup file for the MC68328
- *
- * Copyright (C) 1998  D. Jeff Dionne <jeff@ryeham.ee.ryerson.ca>,
- *                     Kenneth Albanowski <kjahds@kjahds.com>,
- *                     The Silver Hammer Group, Ltd.
- *
- * (c) 1995, Dionne & Associates
- * (c) 1995, DKG Display Tech.
- */
-
-#define ASSEMBLY
-
-#define IMMED #
-#define	DBG_PUTC(x)	moveb IMMED x, 0xfffff907
-
-
-.global _stext
-.global _start
-
-.global _rambase
-.global _ramvec
-.global _ramstart
-.global _ramend
-
-.global bootlogo_bits
-
-/*****************************************************************************/
-
-.data
-
-/*
- *      Set up the usable of RAM stuff. Size of RAM is determined then
- *      an initial stack set up at the end.
- */
-.align 4
-_ramvec:
-.long   0
-_rambase:
-.long   0
-_ramstart:
-.long   0
-_ramend:
-.long   0
-
-.text
-	
-_start:
-_stext:
-
-
-#ifdef CONFIG_M68328
-
-#ifdef CONFIG_PILOT
-	.byte 0x4e, 0xfa, 0x00, 0x0a /* Jmp +X bytes */
-	.byte 'b', 'o', 'o', 't'
-	.word 10000
-
-	nop
-#endif
-
-	moveq	#0, %d0
-	movew   %d0, 0xfffff618 /* Watchdog off */
-	movel	#0x00011f07, 0xfffff114 /* CS A1 Mask */
-
-	movew	#0x0800, 0xfffff906 /* Ignore CTS */
-	movew	#0x010b, 0xfffff902 /* BAUD to 9600 */
-
-	movew	#0x2410, 0xfffff200 /* PLLCR */
-	movew	#0x123, 0xfffff202 /* PLLFSR */
-
-#ifdef CONFIG_PILOT
-	moveb	#0, 0xfffffA27 /* LCKCON */
-	movel   #_start, 0xfffffA00 /* LSSA */
-	moveb   #0xa, 0xfffffA05 /* LVPW */
-	movew	#0x9f, 0xFFFFFa08 /* LXMAX */
-	movew	#0x9f, 0xFFFFFa0a /* LYMAX */
-	moveb   #9, 0xfffffa29 /* LBAR */
-	moveb   #0, 0xfffffa25 /* LPXCD */
-	moveb	#0x04, 0xFFFFFa20 /* LPICF */
-	moveb	#0x58, 0xfffffA27 /* LCKCON */
-	moveb	#0x85, 0xfffff429 /* PFDATA */
-	moveb	#0xd8, 0xfffffA27 /* LCKCON */
-	moveb	#0xc5, 0xfffff429 /* PFDATA */
-	moveb	#0xd5, 0xfffff429 /* PFDATA */
-
-	moveal	#0x00100000, %a3
-	moveal	#0x100ffc00, %a4
-#endif /* CONFIG_PILOT */
-
-#endif /* CONFIG_M68328 */
-
-	movew   #0x2700, %sr
-	lea	%a4@(-4), %sp
-
-	DBG_PUTC('\r')
-	DBG_PUTC('\n')
-	DBG_PUTC('A')
-
-   	moveq   #0,%d0
-	movew	#16384, %d0  /* PLL settle wait loop */
-L0:
-	subw	#1, %d0
-	bne	L0
-
-	DBG_PUTC('B')
-
-	/* Copy command line from beginning of RAM (+16) to end of bss */
-	movel	#CONFIG_VECTORBASE, %d7
-	addl	#16, %d7
-	moveal	%d7, %a0
-	moveal	#__bss_stop, %a1
-	lea	%a1@(512), %a2
-
-	DBG_PUTC('C')
-
-	/* Copy %a0 to %a1 until %a1 == %a2 */
-L2:
-	movel	%a0@+, %d0
-	movel	%d0, %a1@+
-	cmpal	%a1, %a2
-	bhi	L2
-
-	/* Copy data+init segment from ROM to RAM */
-	moveal	#_etext, %a0
-	moveal	#_sdata, %a1
-	moveal	#__init_end, %a2
-
-	DBG_PUTC('D')
-
-	/* Copy %a0 to %a1 until %a1 == %a2 */
-LD1:
-	movel	%a0@+, %d0
-	movel	%d0, %a1@+
-	cmpal	%a1, %a2
-	bhi	LD1
-
-	DBG_PUTC('E')
-
-	moveal	#__bss_start, %a0
-	moveal	#__bss_stop, %a1
-
-	/* Copy 0 to %a0 until %a0 == %a1 */
-L1:
-	movel	#0, %a0@+
-	cmpal	%a0, %a1
-	bhi	L1
-
-	DBG_PUTC('F')
-
-	/* Copy command line from end of bss to command line */
-	moveal	#__bss_stop, %a0
-	moveal	#command_line, %a1
-	lea	%a1@(512), %a2
-
-	DBG_PUTC('G')
-
-	/* Copy %a0 to %a1 until %a1 == %a2 */
-L3:
-	movel	%a0@+, %d0
-	movel	%d0, %a1@+
-	cmpal	%a1, %a2
-	bhi	L3
-
-	movel	#_sdata, %d0	
-	movel	%d0, _rambase	
-	movel	#__bss_stop, %d0
-	movel	%d0, _ramstart
-
-	movel	%a4, %d0
-	subl	#4096, %d0	/* Reserve 4K of stack */
-	moveq	#79, %d7
-	movel	%d0, _ramend
-
-	pea	0
-	pea	env
-	pea	%sp@(4)
-	pea	0
-
-	DBG_PUTC('H')
-
-#ifdef CONFIG_PILOT
-	movel	#bootlogo_bits, 0xFFFFFA00
-	moveb	#10, 0xFFFFFA05
-	movew	#160, 0xFFFFFA08
-	movew	#160, 0xFFFFFA0A
-#endif /* CONFIG_PILOT */
-
-	DBG_PUTC('I')
-
-	lea	init_thread_union, %a0
-	lea	0x2000(%a0), %sp
-
-	DBG_PUTC('J')
-	DBG_PUTC('\r')
-	DBG_PUTC('\n')
-
-	jsr	start_kernel
-_exit:
-
-	jmp	_exit
-
-
-	.data
-env:
-	.long	0
diff --git a/arch/m68k/platform/68328/head-ram.S b/arch/m68k/platform/68328/head-ram.S
deleted file mode 100644
index 5189ef9..0000000
--- a/arch/m68k/platform/68328/head-ram.S
+++ /dev/null
@@ -1,141 +0,0 @@
-
-	.global __main
-	.global __rom_start
-
-        .global _rambase
-        .global _ramstart
-	
-	.global splash_bits
-	.global _start
-	.global _stext
-	.global _edata
-
-#define DEBUG
-#define ROM_OFFSET 0x10C00000
-#define STACK_GAURD 0x10
-
-	.text
-	
-_start:
-_stext:
-	movew	#0x2700, %sr            /* Exceptions off! */
-
-#if 0
-	/* Init chip registers.  uCsimm specific */
-	moveb	#0x00,   0xfffffb0b	/* Watchdog off */
-	moveb	#0x10,   0xfffff000	/* SCR */
-
-	movew   #0x2400, 0xfffff200	/* PLLCR */
-	movew   #0x0123, 0xfffff202	/* PLLFSR */
-
-	moveb	#0x00,   0xfffff40b	/* enable chip select */
-	moveb	#0x00,   0xfffff423	/* enable /DWE */
-	moveb	#0x08,   0xfffffd0d	/* disable hardmap */
-	moveb	#0x07,   0xfffffd0e	/* level 7 interrupt clear */
-
-	movew	#0x8600, 0xfffff100	/* FLASH at 0x10c00000 */
-	movew	#0x018b, 0xfffff110	/* 2Meg, enable, 0ws */
-
-	movew	#0x8f00, 0xfffffc00	/* DRAM configuration */
-	movew	#0x9667, 0xfffffc02	/* DRAM control */
-	movew	#0x0000, 0xfffff106	/* DRAM at 0x00000000 */
-	movew	#0x068f, 0xfffff116	/* 8Meg, enable, 0ws */
-
-	moveb	#0x40,   0xfffff300	/* IVR */
-	movel	#0x007FFFFF, %d0	/* IMR */
-	movel	%d0,     0xfffff304
-
-	moveb	0xfffff42b, %d0
-	andb	#0xe0,	 %d0
-	moveb	%d0,	 0xfffff42b
-
-	moveb	#0x08,   0xfffff907	/* Ignore CTS */
-	movew	#0x010b, 0xfffff902	/* BAUD to 9600 */
-	movew	#0xe100, 0xfffff900	/* enable */
-#endif
-
-	movew	#16384, %d0  /* PLL settle wait loop */
-L0:
-	subw	#1, %d0
-	bne	L0
-#ifdef DEBUG
-	moveq	#70, %d7		/* 'F' */
-	moveb	%d7,0xfffff907          /* No absolute addresses */
-pclp1:
-	movew	0xfffff906, %d7
-	andw	#0x2000, %d7
-	beq	pclp1
-#endif /* DEBUG */
-
-#ifdef DEBUG
-	moveq	#82, %d7		/* 'R' */
-	moveb	%d7,0xfffff907          /* No absolute addresses */
-pclp3:
-	movew	0xfffff906, %d7
-	andw	#0x2000, %d7
-	beq	pclp3
-#endif /* DEBUG */
-	moveal	#0x007ffff0, %ssp
-	moveal	#__bss_start, %a0
-	moveal	#__bss_stop, %a1
-
-	/* Copy 0 to %a0 until %a0 >= %a1 */
-L1:
-	movel	#0, %a0@+
-	cmpal	%a0, %a1
-	bhi	L1
-
-#ifdef DEBUG
-	moveq	#67, %d7                /* 'C' */
-	jsr	putc
-#endif /* DEBUG */
-
-	pea	0
-	pea	env
-	pea	%sp@(4)
-	pea	0
-
-#ifdef DEBUG
-	moveq	#70, %d7		/* 'F' */
-	jsr	putc
-#endif /* DEBUG */
-
-lp:
-	jsr	start_kernel
-        jmp lp
-_exit:
-
-	jmp	_exit
-
-__main:
-	/* nothing */
-	rts
-
-#ifdef DEBUG
-putc:
-	moveb	%d7,0xfffff907
-pclp:
-	movew	0xfffff906, %d7
-	andw	#0x2000, %d7
-	beq	pclp
-	rts
-#endif /* DEBUG */
-
-	.data
-
-/*
- *      Set up the usable of RAM stuff. Size of RAM is determined then
- *      an initial stack set up at the end.
- */
-.align 4
-_ramvec:
-.long   0
-_rambase:
-.long   0
-_ramstart:
-.long   0
-_ramend:
-.long   0
-
-env:
-	.long	0
diff --git a/arch/m68k/platform/68328/head-rom.S b/arch/m68k/platform/68328/head-rom.S
deleted file mode 100644
index 3dff98b..0000000
--- a/arch/m68k/platform/68328/head-rom.S
+++ /dev/null
@@ -1,105 +0,0 @@
-	
-	.global _start
-	.global _stext
-
-	.global _rambase
-	.global _ramvec
-	.global _ramstart
-	.global _ramend
-
-#ifdef CONFIG_INIT_LCD
-	.global bootlogo_bits
-#endif
-
-	.data
-
-/*
- *      Set up the usable of RAM stuff. Size of RAM is determined then
- *      an initial stack set up at the end.
- */
-.align 4
-_ramvec:
-.long   0
-_rambase:
-.long   0
-_ramstart:
-.long   0
-_ramend:
-.long   0
-
-#define	RAMEND	(CONFIG_RAMBASE + CONFIG_RAMSIZE)
-
-	.text
-_start:
-_stext:	movew	#0x2700,%sr
-#ifdef CONFIG_INIT_LCD
-	movel	#bootlogo_bits, 0xfffffA00 /* LSSA */
-	moveb	#0x28,   0xfffffA05	/* LVPW */
-	movew	#0x280,  0xFFFFFa08	/* LXMAX */
-	movew	#0x1df,  0xFFFFFa0a	/* LYMAX */
-	moveb	#0,      0xfffffa29	/* LBAR */
-	moveb	#0,      0xfffffa25	/* LPXCD */
-	moveb	#0x08,   0xFFFFFa20	/* LPICF */
-	moveb	#0x01,   0xFFFFFA21	/* -ve pol */
-	moveb	#0x81,   0xfffffA27	/* LCKCON */
-	movew	#0xff00, 0xfffff412	/* LCD pins */
-#endif
-	moveal  #RAMEND-CONFIG_MEMORY_RESERVE*0x100000 - 0x10, %sp
-	movew	#32767, %d0  /* PLL settle wait loop */
-1:	subq	#1, %d0
-	bne	1b
-
-	/* Copy data segment from ROM to RAM */
-	moveal	#_etext, %a0
-	moveal	#_sdata, %a1
-	moveal	#_edata, %a2
-
-	/* Copy %a0 to %a1 until %a1 == %a2 */
-1:	movel	%a0@+, %a1@+
-	cmpal	%a1, %a2
-	bhi	1b
-
-	moveal	#__bss_start, %a0
-	moveal	#__bss_stop, %a1
-	/* Copy 0 to %a0 until %a0 == %a1 */
-	
-1:
-	clrl	%a0@+
-	cmpal	%a0, %a1
-	bhi	1b
-
-        movel   #_sdata, %d0    
-        movel   %d0, _rambase        
-        movel   #__bss_stop, %d0
-        movel   %d0, _ramstart
-	movel	#RAMEND-CONFIG_MEMORY_RESERVE*0x100000, %d0
-	movel	%d0, _ramend
-	movel	#CONFIG_VECTORBASE,	%d0
-	movel	%d0, _ramvec
-	
-/*
- * load the current task pointer and stack
- */
-	lea	init_thread_union, %a0
-	lea	0x2000(%a0), %sp
-
-1:	jsr	start_kernel
-        bra 1b
-_exit:
-
-	jmp	_exit
-
-
-putc:
-	moveb	%d7,0xfffff907
-1:
-	movew	0xfffff906, %d7
-	andw	#0x2000, %d7
-	beq	1b
-	rts
-
-	.data
-env:
-	.long	0
-	.text
-
diff --git a/arch/m68k/platform/68EZ328/Makefile b/arch/m68k/platform/68EZ328/Makefile
deleted file mode 100644
index b44d799..0000000
--- a/arch/m68k/platform/68EZ328/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-#
-# Makefile for arch/m68knommu/platform/68EZ328.
-#
-
-obj-y := config.o
diff --git a/arch/m68k/platform/68VZ328/Makefile b/arch/m68k/platform/68VZ328/Makefile
deleted file mode 100644
index 8166741..0000000
--- a/arch/m68k/platform/68VZ328/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-#
-# Makefile for arch/m68k/platform/68VZ328.
-#
-
-obj-y		:= config.o
-- 
1.7.10.4
