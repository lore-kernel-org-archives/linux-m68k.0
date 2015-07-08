From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 8/8] m68k: uImage generation support
Date: Wed,  8 Jul 2015 11:51:32 +0200
Message-ID: <1436349092-2214-9-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:34900 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933084AbbGHJvz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:55 -0400
Received: by wgjx7 with SMTP id x7so190632869wgj.2
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:54 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.53
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:53 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Adding an arch/m68k/boot subdirectory as output dir
for generated uImage.

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/Makefile      |  8 +++++++-
 arch/m68k/boot/Makefile | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 arch/m68k/boot/Makefile

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 0b29dcf..bf5cbdd 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -118,7 +118,6 @@ core-$(CONFIG_M68360)		+= arch/m68k/68360/
 core-$(CONFIG_M68000)		+= arch/m68k/68000/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/coldfire/
 
-
 all:	zImage
 
 lilo:	vmlinux
@@ -154,8 +153,15 @@ else
 	bzip2 -1c vmlinux >vmlinux.bz2
 endif
 
+boot := arch/m68k/boot
+
+uImage: vmlinux
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+
 archclean:
 	rm -f vmlinux.gz vmlinux.bz2
+	$(Q)$(MAKE) $(clean)=$(boot)
+
 
 install:
 	sh $(srctree)/arch/m68k/install.sh $(KERNELRELEASE) vmlinux.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/m68k/boot/Makefile b/arch/m68k/boot/Makefile
new file mode 100644
index 0000000..af0b110
--- /dev/null
+++ b/arch/m68k/boot/Makefile
@@ -0,0 +1,45 @@
+#
+# arch/m68k/boot/Makefile
+#
+# based on initial file from Freescale m5441x BSP
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+
+MKIMAGE := $(srctree)/scripts/mkuboot.sh
+
+#
+# Assign safe dummy values if these variables are not defined,
+# in order to suppress error message.
+#
+CONFIG_KERNELBASE	?= 0x40020000
+
+targets := uImage
+
+UIMAGE_LOADADDR		:= $(CONFIG_KERNELBASE)
+UIMAGE_ENTRYADDR	:= $(CONFIG_KERNELBASE)
+UIMAGE_COMPRESSION	?= none
+
+export UIMAGE_LOADADDR UIMAGE_ENTRYADDR UIMAGE_COMPRESSION
+
+ifeq ($(UIMAGE_COMPRESSION),gzip)
+UIMAGE_SRCBIN		:= $(obj)/vmlinux.bin.gz
+else
+UIMAGE_SRCBIN		:= $(obj)/vmlinux.bin
+endif
+
+$(obj)/uImage: $(UIMAGE_SRCBIN) FORCE
+	$(call if_changed,uimage)
+	@echo '  Image $@ is ready'
+
+OBJCOPYFLAGS_vmlinux.bin := -I elf32-m68k -O binary
+$(obj)/vmlinux.bin: vmlinux FORCE
+	$(call if_changed,objcopy)
+
+$(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,gzip)
+
+clean-files	+= uImage vmlinux.bin vmlinux.bin.gz
+
-- 
1.9.1.286.g5172cb3
