From: sfking@fdwdc.com
Subject: [RFC 04/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:54 -0700
Message-ID: <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking__4530.53218448094$1252302442$gmane$org@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34387 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758830AbZIGFrE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:04 -0400
In-Reply-To: <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/Makefile |  129 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 129 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 570d85c..9ef31fc 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -1,3 +1,5 @@
+ifdef CONFIG_MMU
+
 #
 # m68k/Makefile
 #
@@ -120,3 +122,130 @@ archclean:
 
 install:
 	sh $(srctree)/arch/m68k/install.sh $(KERNELRELEASE) vmlinux.gz System.map "$(INSTALL_PATH)"
+
+else
+
+#
+# arch/m68knommu/Makefile
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# (C) Copyright 2002, Greg Ungerer <gerg@snapgear.com>
+#
+
+KBUILD_DEFCONFIG := m5208evb_defconfig
+
+platform-$(CONFIG_M68328)	:= 68328
+platform-$(CONFIG_M68EZ328)	:= 68EZ328
+platform-$(CONFIG_M68VZ328)	:= 68VZ328
+platform-$(CONFIG_M68360)	:= 68360
+platform-$(CONFIG_M5206)	:= 5206
+platform-$(CONFIG_M5206e)	:= 5206e
+platform-$(CONFIG_M520x)	:= 520x
+platform-$(CONFIG_M523x)	:= 523x
+platform-$(CONFIG_M5249)	:= 5249
+platform-$(CONFIG_M527x)	:= 527x
+platform-$(CONFIG_M5272)	:= 5272
+platform-$(CONFIG_M528x)	:= 528x
+platform-$(CONFIG_M5307)	:= 5307
+platform-$(CONFIG_M532x)	:= 532x
+platform-$(CONFIG_M5407)	:= 5407
+PLATFORM := $(platform-y)
+
+board-$(CONFIG_PILOT)		:= pilot
+board-$(CONFIG_UC5272)          := UC5272
+board-$(CONFIG_UC5282)          := UC5282
+board-$(CONFIG_UCSIMM)		:= ucsimm
+board-$(CONFIG_UCDIMM)		:= ucdimm
+board-$(CONFIG_UCQUICC)		:= uCquicc
+board-$(CONFIG_DRAGEN2)		:= de2
+board-$(CONFIG_ARNEWSH)		:= ARNEWSH
+board-$(CONFIG_FREESCALE)	:= FREESCALE
+board-$(CONFIG_M5235EVB)	:= M5235EVB
+board-$(CONFIG_M5271EVB)	:= M5271EVB
+board-$(CONFIG_M5275EVB)	:= M5275EVB
+board-$(CONFIG_M5282EVB)	:= M5282EVB
+board-$(CONFIG_ELITE)		:= eLITE
+board-$(CONFIG_NETtel)		:= NETtel
+board-$(CONFIG_SECUREEDGEMP3)	:= MP3
+board-$(CONFIG_CLEOPATRA)	:= CLEOPATRA
+board-$(CONFIG_senTec)		:= senTec
+board-$(CONFIG_SNEHA) 	        := SNEHA
+board-$(CONFIG_M5208EVB)	:= M5208EVB
+board-$(CONFIG_MOD5272)		:= MOD5272
+board-$(CONFIG_AVNET)           := AVNET
+board-$(CONFIG_SAVANT)		:= SAVANT
+BOARD := $(board-y)
+
+model-$(CONFIG_RAMKERNEL)	:= ram
+model-$(CONFIG_ROMKERNEL)	:= rom
+MODEL := $(model-y)
+
+#
+# Some code support is grouped together for a common cpu-subclass (for
+# example all ColdFire cpu's are very similar). Determine the sub-class
+# for the selected cpu. ONLY need to define this for the non-base member
+# of the family.
+#
+cpuclass-$(CONFIG_M5206)	:= coldfire
+cpuclass-$(CONFIG_M5206e)	:= coldfire
+cpuclass-$(CONFIG_M520x)	:= coldfire
+cpuclass-$(CONFIG_M523x)	:= coldfire
+cpuclass-$(CONFIG_M5249)	:= coldfire
+cpuclass-$(CONFIG_M527x)	:= coldfire
+cpuclass-$(CONFIG_M5272)	:= coldfire
+cpuclass-$(CONFIG_M528x)	:= coldfire
+cpuclass-$(CONFIG_M5307)	:= coldfire
+cpuclass-$(CONFIG_M532x)	:= coldfire
+cpuclass-$(CONFIG_M5407)	:= coldfire
+cpuclass-$(CONFIG_M68328)	:= 68328
+cpuclass-$(CONFIG_M68EZ328)	:= 68328
+cpuclass-$(CONFIG_M68VZ328)	:= 68328
+cpuclass-$(CONFIG_M68360)	:= 68360
+CPUCLASS := $(cpuclass-y)
+
+ifneq ($(CPUCLASS),$(PLATFORM))
+CLASSDIR := arch/m68k/platform/$(cpuclass-y)/
+endif
+
+export PLATFORM BOARD MODEL CPUCLASS
+
+#
+# Some CFLAG additions based on specific CPU type.
+#
+cflags-$(CONFIG_M5206)		:= $(call cc-option,-mcpu=5206,-m5200)
+cflags-$(CONFIG_M5206e)		:= $(call cc-option,-m5206e,-m5200)
+cflags-$(CONFIG_M520x)		:= $(call cc-option,-mcpu=5208,-m5200)
+cflags-$(CONFIG_M523x)		:= $(call cc-option,-mcpu=523x,-m5307)
+cflags-$(CONFIG_M5249)		:= $(call cc-option,-mcpu=5249,-m5200)
+cflags-$(CONFIG_M5271)		:= $(call cc-option,-mcpu=5271,-m5307)
+cflags-$(CONFIG_M5272)		:= $(call cc-option,-mcpu=5271,-m5200)
+cflags-$(CONFIG_M5275)		:= $(call cc-option,-mcpu=5275,-m5307)
+cflags-$(CONFIG_M528x)		:= $(call cc-option,-m528x,-m5307)
+cflags-$(CONFIG_M5307)		:= $(call cc-option,-m5307,-m5200)
+cflags-$(CONFIG_M532x)		:= $(call cc-option,-mcpu=532x,-m5307)
+cflags-$(CONFIG_M5407)		:= $(call cc-option,-m5407,-m5200)
+cflags-$(CONFIG_M68328)		:= -m68000
+cflags-$(CONFIG_M68EZ328)	:= -m68000
+cflags-$(CONFIG_M68VZ328)	:= -m68000
+cflags-$(CONFIG_M68360)		:= -m68332
+
+KBUILD_AFLAGS += $(cflags-y)
+
+KBUILD_CFLAGS += $(cflags-y)
+KBUILD_CFLAGS += -D__linux__
+KBUILD_CFLAGS += -DUTS_SYSNAME=\"uClinux\"
+
+head-y := arch/m68k/platform/$(cpuclass-y)/head.o
+
+core-y	+= arch/m68k/kernel/ \
+	   arch/m68k/mm/ \
+	   $(CLASSDIR) \
+	   arch/m68k/platform/$(PLATFORM)/
+libs-y	+= arch/m68k/lib/
+
+archclean:
+
+endif
-- 
1.5.6.5

