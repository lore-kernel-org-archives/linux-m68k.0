From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge mmu and non-mmu arch Makefiles
Date: Thu, 23 Jun 2011 11:56:48 +1000
Message-ID: <1308794208-22482-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:37592 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757061Ab1FWB7J (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Jun 2011 21:59:09 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Most of the build logic is the same for the mmu and non-mmu m68k targets.
Merge the top level architecture Makefiles back into a single Makefile.

For the most part this is just adding the non-mmu processor types and
their specific cflags and other options into the mmu Makefile.

Note that all the BOARD setting logic that was in the non-mmu Makefile
is completely removed. It was no longer being used at all.

This has been build and run tested on ColdFire targets and ARAnyM.
It has been build tested on all the m68k defconfig targets using a
gcc-4.5.1 based toolchain.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Makefile                |  168 ++++++++++++++++++++++++++++++++++++-
 arch/m68k/Makefile_mm             |  121 --------------------------
 arch/m68k/Makefile_no             |  124 ---------------------------
 arch/m68k/platform/68328/Makefile |    5 +-
 arch/m68k/platform/68360/Makefile |    6 +-
 5 files changed, 174 insertions(+), 250 deletions(-)
 delete mode 100644 arch/m68k/Makefile_mm
 delete mode 100644 arch/m68k/Makefile_no

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index be46cad..eddfe80 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -1,7 +1,171 @@
+#
+# m68k/Makefile
+#
+# This file is included by the global makefile so that you can add your own
+# architecture-specific flags and dependencies. Remember to do have actions
+# for "archclean" and "archdep" for cleaning up and making dependencies for
+# this architecture
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1994 by Hamish Macdonald
+# Copyright (C) 2002,2011 Greg Ungerer <gerg@snapgear.com>
+#
+
 KBUILD_DEFCONFIG := multi_defconfig
 
+#
+#	Enable processor type. Ordering of these is important - we want to
+#	use the minimum processor type of the range we support. The logic
+#	for 680x0 will only allow use of the -m68060 or -m68040 if no other
+#	680x0 type is specified - and no option is specified for 68030 or
+#	68020. The other m68k/ColdFire types always specify some type of
+#	compiler cpu type flag.
+#
+ifndef CONFIG_M68040
+cpuflags-$(CONFIG_M68060)	:= -m68060
+endif
+ifndef CONFIG_M68060
+cpuflags-$(CONFIG_M68040)	:= -m68040
+endif
+cpuflags-$(CONFIG_M68030)	:= 
+cpuflags-$(CONFIG_M68020)	:= 
+cpuflags-$(CONFIG_M68360)	:= -m68332
+cpuflags-$(CONFIG_M68000)	:= -m68000
+cpuflags-$(CONFIG_M54xx)	:= $(call cc-option,-mcpu=5475,-m5200)
+cpuflags-$(CONFIG_M5407)	:= $(call cc-option,-mcpu=5407,-m5200)
+cpuflags-$(CONFIG_M532x)	:= $(call cc-option,-mcpu=532x,-m5307)
+cpuflags-$(CONFIG_M5307)	:= $(call cc-option,-mcpu=5307,-m5200)
+cpuflags-$(CONFIG_M528x)	:= $(call cc-option,-mcpu=528x,-m5307)
+cpuflags-$(CONFIG_M5275)	:= $(call cc-option,-mcpu=5275,-m5307)
+cpuflags-$(CONFIG_M5272)	:= $(call cc-option,-mcpu=5272,-m5307)
+cpuflags-$(CONFIG_M5271)	:= $(call cc-option,-mcpu=5271,-m5307)
+cpuflags-$(CONFIG_M523x)	:= $(call cc-option,-mcpu=523x,-m5307)
+cpuflags-$(CONFIG_M5249)	:= $(call cc-option,-mcpu=5249,-m5200)
+cpuflags-$(CONFIG_M520x)	:= $(call cc-option,-mcpu=5208,-m5200)
+cpuflags-$(CONFIG_M5206e)	:= $(call cc-option,-mcpu=5206e,-m5200)
+cpuflags-$(CONFIG_M5206)	:= $(call cc-option,-mcpu=5206,-m5200)
+
+KBUILD_AFLAGS += $(cpuflags-y)
+KBUILD_CFLAGS += $(cpuflags-y) -pipe
 ifdef CONFIG_MMU
-include $(srctree)/arch/m68k/Makefile_mm
+# without -fno-strength-reduce the 53c7xx.c driver fails ;-(
+KBUILD_CFLAGS += -fno-strength-reduce -ffixed-a2
+else
+# we can use a m68k-linux-gcc toolchain with these in place
+KBUILD_CFLAGS += -DUTS_SYSNAME=\"uClinux\"
+KBUILD_CFLAGS += -D__uClinux__
+KBUILD_AFLAGS += -D__uClinux__
+endif
+
+LDFLAGS := -m m68kelf
+KBUILD_LDFLAGS_MODULE += -T $(srctree)/arch/m68k/kernel/module.lds
+ifneq ($(SUBARCH),$(ARCH))
+	ifeq ($(CROSS_COMPILE),)
+		CROSS_COMPILE := $(call cc-cross-prefix, \
+			m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
+	endif
+endif
+
+ifdef CONFIG_SUN3
+LDFLAGS_vmlinux = -N
+endif
+
+CHECKFLAGS += -D__mc68000__
+
+
+ifdef CONFIG_KGDB
+# If configured for kgdb support, include debugging infos and keep the
+# frame pointer
+KBUILD_CFLAGS := $(subst -fomit-frame-pointer,,$(KBUILD_CFLAGS)) -g
+endif
+
+#
+# Select the assembler head startup code. Order is important. The default
+# head code is first, processor specific selections can override it after.
+#
+head-y				:= arch/m68k/kernel/head.o
+head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
+head-$(CONFIG_M68360)		:= arch/m68k/platform/68360/head.o
+head-$(CONFIG_M68000)		:= arch/m68k/platform/68328/head.o
+head-$(CONFIG_COLDFIRE)		:= arch/m68k/platform/coldfire/head.o
+
+core-y				+= arch/m68k/kernel/	arch/m68k/mm/
+libs-y				+= arch/m68k/lib/
+
+core-$(CONFIG_Q40)		+= arch/m68k/q40/
+core-$(CONFIG_AMIGA)		+= arch/m68k/amiga/
+core-$(CONFIG_ATARI)		+= arch/m68k/atari/
+core-$(CONFIG_MAC)		+= arch/m68k/mac/
+core-$(CONFIG_HP300)		+= arch/m68k/hp300/
+core-$(CONFIG_APOLLO)		+= arch/m68k/apollo/
+core-$(CONFIG_MVME147)		+= arch/m68k/mvme147/
+core-$(CONFIG_MVME16x)		+= arch/m68k/mvme16x/
+core-$(CONFIG_BVME6000)		+= arch/m68k/bvme6000/
+core-$(CONFIG_SUN3X)		+= arch/m68k/sun3x/	arch/m68k/sun3/
+core-$(CONFIG_SUN3)		+= arch/m68k/sun3/	arch/m68k/sun3/prom/
+core-$(CONFIG_NATFEAT)		+= arch/m68k/emu/
+core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
+core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
+core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
+core-$(CONFIG_M68360)		+= arch/m68k/platform/68360/
+core-$(CONFIG_M68000)		+= arch/m68k/platform/68328/
+core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
+core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
+core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
+core-$(CONFIG_M5206)		+= arch/m68k/platform/5206/
+core-$(CONFIG_M5206e)		+= arch/m68k/platform/5206/
+core-$(CONFIG_M520x)		+= arch/m68k/platform/520x/
+core-$(CONFIG_M523x)		+= arch/m68k/platform/523x/
+core-$(CONFIG_M5249)		+= arch/m68k/platform/5249/
+core-$(CONFIG_M527x)		+= arch/m68k/platform/527x/
+core-$(CONFIG_M5272)		+= arch/m68k/platform/5272/
+core-$(CONFIG_M528x)		+= arch/m68k/platform/528x/
+core-$(CONFIG_M5307)		+= arch/m68k/platform/5307/
+core-$(CONFIG_M532x)		+= arch/m68k/platform/532x/
+core-$(CONFIG_M5407)		+= arch/m68k/platform/5407/
+core-$(CONFIG_M54xx)		+= arch/m68k/platform/54xx/
+
+
+all:	zImage
+
+lilo:	vmlinux
+	if [ -f $(INSTALL_PATH)/vmlinux ]; then mv -f $(INSTALL_PATH)/vmlinux $(INSTALL_PATH)/vmlinux.old; fi
+	if [ -f $(INSTALL_PATH)/System.map ]; then mv -f $(INSTALL_PATH)/System.map $(INSTALL_PATH)/System.old; fi
+	cat vmlinux > $(INSTALL_PATH)/vmlinux
+	cp System.map $(INSTALL_PATH)/System.map
+	if [ -x /sbin/lilo ]; then /sbin/lilo; else /etc/lilo/install; fi
+
+zImage compressed: vmlinux.gz
+
+vmlinux.gz: vmlinux
+
+ifndef CONFIG_KGDB
+	cp vmlinux vmlinux.tmp
+	$(STRIP) vmlinux.tmp
+	gzip -9c vmlinux.tmp >vmlinux.gz
+	rm vmlinux.tmp
 else
-include $(srctree)/arch/m68k/Makefile_no
+	gzip -9c vmlinux >vmlinux.gz
 endif
+
+bzImage: vmlinux.bz2
+
+vmlinux.bz2: vmlinux
+
+ifndef CONFIG_KGDB
+	cp vmlinux vmlinux.tmp
+	$(STRIP) vmlinux.tmp
+	bzip2 -1c vmlinux.tmp >vmlinux.bz2
+	rm vmlinux.tmp
+else
+	bzip2 -1c vmlinux >vmlinux.bz2
+endif
+
+archclean:
+	rm -f vmlinux.gz vmlinux.bz2
+
+install:
+	sh $(srctree)/arch/m68k/install.sh $(KERNELRELEASE) vmlinux.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/m68k/Makefile_mm b/arch/m68k/Makefile_mm
deleted file mode 100644
index d449b6d..0000000
--- a/arch/m68k/Makefile_mm
+++ /dev/null
@@ -1,121 +0,0 @@
-#
-# m68k/Makefile
-#
-# This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
-#
-# This file is subject to the terms and conditions of the GNU General Public
-# License.  See the file "COPYING" in the main directory of this archive
-# for more details.
-#
-# Copyright (C) 1994 by Hamish Macdonald
-#
-
-# override top level makefile
-AS += -m68020
-LDFLAGS := -m m68kelf
-KBUILD_LDFLAGS_MODULE += -T $(srctree)/arch/m68k/kernel/module.lds
-ifneq ($(SUBARCH),$(ARCH))
-	ifeq ($(CROSS_COMPILE),)
-		CROSS_COMPILE := $(call cc-cross-prefix, \
-			m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
-	endif
-endif
-
-ifdef CONFIG_SUN3
-LDFLAGS_vmlinux = -N
-endif
-
-CHECKFLAGS += -D__mc68000__
-
-# without -fno-strength-reduce the 53c7xx.c driver fails ;-(
-KBUILD_CFLAGS += -pipe -fno-strength-reduce -ffixed-a2
-
-# enable processor switch if compiled only for a single cpu
-ifndef CONFIG_M68020
-ifndef CONFIG_M68030
-
-ifndef CONFIG_M68060
-KBUILD_CFLAGS += -m68040
-endif
-
-ifndef CONFIG_M68040
-KBUILD_CFLAGS += -m68060
-endif
-
-endif
-endif
-
-ifdef CONFIG_KGDB
-# If configured for kgdb support, include debugging infos and keep the
-# frame pointer
-KBUILD_CFLAGS := $(subst -fomit-frame-pointer,,$(KBUILD_CFLAGS)) -g
-endif
-
-ifndef CONFIG_SUN3
-head-y := arch/m68k/kernel/head.o
-else
-head-y := arch/m68k/kernel/sun3-head.o
-endif
-
-core-y				+= arch/m68k/kernel/	arch/m68k/mm/
-libs-y				+= arch/m68k/lib/
-
-core-$(CONFIG_Q40)		+= arch/m68k/q40/
-core-$(CONFIG_AMIGA)		+= arch/m68k/amiga/
-core-$(CONFIG_ATARI)		+= arch/m68k/atari/
-core-$(CONFIG_MAC)		+= arch/m68k/mac/
-core-$(CONFIG_HP300)		+= arch/m68k/hp300/
-core-$(CONFIG_APOLLO)		+= arch/m68k/apollo/
-core-$(CONFIG_MVME147)		+= arch/m68k/mvme147/
-core-$(CONFIG_MVME16x)		+= arch/m68k/mvme16x/
-core-$(CONFIG_BVME6000)		+= arch/m68k/bvme6000/
-core-$(CONFIG_SUN3X)		+= arch/m68k/sun3x/	arch/m68k/sun3/
-core-$(CONFIG_SUN3)		+= arch/m68k/sun3/	arch/m68k/sun3/prom/
-core-$(CONFIG_NATFEAT)		+= arch/m68k/emu/
-core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
-core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
-core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
-
-all:	zImage
-
-lilo:	vmlinux
-	if [ -f $(INSTALL_PATH)/vmlinux ]; then mv -f $(INSTALL_PATH)/vmlinux $(INSTALL_PATH)/vmlinux.old; fi
-	if [ -f $(INSTALL_PATH)/System.map ]; then mv -f $(INSTALL_PATH)/System.map $(INSTALL_PATH)/System.old; fi
-	cat vmlinux > $(INSTALL_PATH)/vmlinux
-	cp System.map $(INSTALL_PATH)/System.map
-	if [ -x /sbin/lilo ]; then /sbin/lilo; else /etc/lilo/install; fi
-
-zImage compressed: vmlinux.gz
-
-vmlinux.gz: vmlinux
-
-ifndef CONFIG_KGDB
-	cp vmlinux vmlinux.tmp
-	$(STRIP) vmlinux.tmp
-	gzip -9c vmlinux.tmp >vmlinux.gz
-	rm vmlinux.tmp
-else
-	gzip -9c vmlinux >vmlinux.gz
-endif
-
-bzImage: vmlinux.bz2
-
-vmlinux.bz2: vmlinux
-
-ifndef CONFIG_KGDB
-	cp vmlinux vmlinux.tmp
-	$(STRIP) vmlinux.tmp
-	bzip2 -1c vmlinux.tmp >vmlinux.bz2
-	rm vmlinux.tmp
-else
-	bzip2 -1c vmlinux >vmlinux.bz2
-endif
-
-archclean:
-	rm -f vmlinux.gz vmlinux.bz2
-
-install:
-	sh $(srctree)/arch/m68k/install.sh $(KERNELRELEASE) vmlinux.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/m68k/Makefile_no b/arch/m68k/Makefile_no
deleted file mode 100644
index 81652ab..0000000
--- a/arch/m68k/Makefile_no
+++ /dev/null
@@ -1,124 +0,0 @@
-#
-# arch/m68k/Makefile
-#
-# This file is subject to the terms and conditions of the GNU General Public
-# License.  See the file "COPYING" in the main directory of this archive
-# for more details.
-#
-# (C) Copyright 2002, Greg Ungerer <gerg@snapgear.com>
-#
-
-platform-$(CONFIG_M68328)	:= 68328
-platform-$(CONFIG_M68EZ328)	:= 68EZ328
-platform-$(CONFIG_M68VZ328)	:= 68VZ328
-platform-$(CONFIG_M68360)	:= 68360
-platform-$(CONFIG_M5206)	:= 5206
-platform-$(CONFIG_M5206e)	:= 5206e
-platform-$(CONFIG_M520x)	:= 520x
-platform-$(CONFIG_M523x)	:= 523x
-platform-$(CONFIG_M5249)	:= 5249
-platform-$(CONFIG_M527x)	:= 527x
-platform-$(CONFIG_M5272)	:= 5272
-platform-$(CONFIG_M528x)	:= 528x
-platform-$(CONFIG_M5307)	:= 5307
-platform-$(CONFIG_M532x)	:= 532x
-platform-$(CONFIG_M5407)	:= 5407
-platform-$(CONFIG_M54xx)	:= 54xx
-PLATFORM := $(platform-y)
-
-board-$(CONFIG_PILOT)		:= pilot
-board-$(CONFIG_UC5272)          := UC5272
-board-$(CONFIG_UC5282)          := UC5282
-board-$(CONFIG_UCSIMM)		:= ucsimm
-board-$(CONFIG_UCDIMM)		:= ucdimm
-board-$(CONFIG_UCQUICC)		:= uCquicc
-board-$(CONFIG_DRAGEN2)		:= de2
-board-$(CONFIG_ARNEWSH)		:= ARNEWSH
-board-$(CONFIG_FREESCALE)	:= FREESCALE
-board-$(CONFIG_M5235EVB)	:= M5235EVB
-board-$(CONFIG_M5271EVB)	:= M5271EVB
-board-$(CONFIG_M5275EVB)	:= M5275EVB
-board-$(CONFIG_M5282EVB)	:= M5282EVB
-board-$(CONFIG_ELITE)		:= eLITE
-board-$(CONFIG_NETtel)		:= NETtel
-board-$(CONFIG_SECUREEDGEMP3)	:= MP3
-board-$(CONFIG_CLEOPATRA)	:= CLEOPATRA
-board-$(CONFIG_senTec)		:= senTec
-board-$(CONFIG_SNEHA) 	        := SNEHA
-board-$(CONFIG_M5208EVB)	:= M5208EVB
-board-$(CONFIG_MOD5272)		:= MOD5272
-board-$(CONFIG_AVNET)           := AVNET
-board-$(CONFIG_SAVANT)		:= SAVANT
-BOARD := $(board-y)
-
-model-$(CONFIG_RAMKERNEL)	:= ram
-model-$(CONFIG_ROMKERNEL)	:= rom
-MODEL := $(model-y)
-
-#
-# Some code support is grouped together for a common cpu-subclass (for
-# example all ColdFire cpu's are very similar). Determine the sub-class
-# for the selected cpu. ONLY need to define this for the non-base member
-# of the family.
-#
-cpuclass-$(CONFIG_M5206)	:= coldfire
-cpuclass-$(CONFIG_M5206e)	:= coldfire
-cpuclass-$(CONFIG_M520x)	:= coldfire
-cpuclass-$(CONFIG_M523x)	:= coldfire
-cpuclass-$(CONFIG_M5249)	:= coldfire
-cpuclass-$(CONFIG_M527x)	:= coldfire
-cpuclass-$(CONFIG_M5272)	:= coldfire
-cpuclass-$(CONFIG_M528x)	:= coldfire
-cpuclass-$(CONFIG_M5307)	:= coldfire
-cpuclass-$(CONFIG_M532x)	:= coldfire
-cpuclass-$(CONFIG_M5407)	:= coldfire
-cpuclass-$(CONFIG_M54xx)	:= coldfire
-cpuclass-$(CONFIG_M68328)	:= 68328
-cpuclass-$(CONFIG_M68EZ328)	:= 68328
-cpuclass-$(CONFIG_M68VZ328)	:= 68328
-cpuclass-$(CONFIG_M68360)	:= 68360
-CPUCLASS := $(cpuclass-y)
-
-ifneq ($(CPUCLASS),$(PLATFORM))
-CLASSDIR := arch/m68k/platform/$(cpuclass-y)/
-endif
-
-export PLATFORM BOARD MODEL CPUCLASS
-
-#
-# Some CFLAG additions based on specific CPU type.
-#
-cflags-$(CONFIG_M5206)		:= $(call cc-option,-mcpu=5206,-m5200)
-cflags-$(CONFIG_M5206e)		:= $(call cc-option,-mcpu=5206e,-m5200)
-cflags-$(CONFIG_M520x)		:= $(call cc-option,-mcpu=5208,-m5200)
-cflags-$(CONFIG_M523x)		:= $(call cc-option,-mcpu=523x,-m5307)
-cflags-$(CONFIG_M5249)		:= $(call cc-option,-mcpu=5249,-m5200)
-cflags-$(CONFIG_M5271)		:= $(call cc-option,-mcpu=5271,-m5307)
-cflags-$(CONFIG_M5272)		:= $(call cc-option,-mcpu=5272,-m5307)
-cflags-$(CONFIG_M5275)		:= $(call cc-option,-mcpu=5275,-m5307)
-cflags-$(CONFIG_M528x)		:= $(call cc-option,-mcpu=528x,-m5307)
-cflags-$(CONFIG_M5307)		:= $(call cc-option,-mcpu=5307,-m5200)
-cflags-$(CONFIG_M532x)		:= $(call cc-option,-mcpu=532x,-m5307)
-cflags-$(CONFIG_M5407)		:= $(call cc-option,-mcpu=5407,-m5200)
-cflags-$(CONFIG_M54xx)		:= $(call cc-option,-mcpu=5475,-m5200)
-cflags-$(CONFIG_M68328)		:= -m68000
-cflags-$(CONFIG_M68EZ328)	:= -m68000
-cflags-$(CONFIG_M68VZ328)	:= -m68000
-cflags-$(CONFIG_M68360)		:= -m68332
-
-KBUILD_AFLAGS += $(cflags-y)
-
-KBUILD_CFLAGS += $(cflags-y)
-KBUILD_CFLAGS += -D__linux__
-KBUILD_CFLAGS += -DUTS_SYSNAME=\"uClinux\"
-
-head-y := arch/m68k/platform/$(cpuclass-y)/head.o
-
-core-y	+= arch/m68k/kernel/ \
-	   arch/m68k/mm/ \
-	   $(CLASSDIR) \
-	   arch/m68k/platform/$(PLATFORM)/
-libs-y	+= arch/m68k/lib/
-
-archclean:
-
diff --git a/arch/m68k/platform/68328/Makefile b/arch/m68k/platform/68328/Makefile
index 5e54355..e4dfd8f 100644
--- a/arch/m68k/platform/68328/Makefile
+++ b/arch/m68k/platform/68328/Makefile
@@ -2,7 +2,10 @@
 # Makefile for arch/m68knommu/platform/68328.
 #
 
-head-y			= head-$(MODEL).o
+model-y			  := ram
+model-$(CONFIG_ROMKERNEL) := rom
+
+head-y			= head-$(model-y).o
 head-$(CONFIG_PILOT)	= head-pilot.o
 head-$(CONFIG_DRAGEN2)	= head-de2.o
 
diff --git a/arch/m68k/platform/68360/Makefile b/arch/m68k/platform/68360/Makefile
index cf5af73..f6f4343 100644
--- a/arch/m68k/platform/68360/Makefile
+++ b/arch/m68k/platform/68360/Makefile
@@ -1,10 +1,12 @@
 #
 # Makefile for arch/m68knommu/platform/68360.
 #
+model-y			  := ram
+model-$(CONFIG_ROMKERNEL) := rom
 
 obj-y := config.o commproc.o entry.o ints.o
 
 extra-y := head.o
 
-$(obj)/head.o: $(obj)/head-$(MODEL).o
-	ln -sf head-$(MODEL).o $(obj)/head.o
+$(obj)/head.o: $(obj)/head-$(model-y).o
+	ln -sf head-$(model-y).o $(obj)/head.o
-- 
1.7.0.4
