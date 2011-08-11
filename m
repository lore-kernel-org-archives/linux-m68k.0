From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge the mmu and non-mmu kernel/Makefiles
Date: Thu, 11 Aug 2011 14:47:24 +1000
Message-ID: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51939 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751026Ab1HKEn7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 11 Aug 2011 00:43:59 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

[This is a resend of this patch. If no-one has any objections then I
want to push this into linux-next, for eventual inclusion in the 3.2
merge window.]

The few differences between the mmu and non-mmu kernel/Makefiles can
easily be handled inside of a single Makefile. Merge the 2 back into
a single Makefile.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/Makefile    |   23 +++++++++++++++++++----
 arch/m68k/kernel/Makefile_mm |   17 -----------------
 arch/m68k/kernel/Makefile_no |   10 ----------
 3 files changed, 19 insertions(+), 31 deletions(-)
 delete mode 100644 arch/m68k/kernel/Makefile_mm
 delete mode 100644 arch/m68k/kernel/Makefile_no

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index c482ebc..5e1bf94 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -1,5 +1,20 @@
-ifdef CONFIG_MMU
-include arch/m68k/kernel/Makefile_mm
-else
-include arch/m68k/kernel/Makefile_no
+#
+# Makefile for the linux kernel.
+#
+
+extra-$(CONFIG_MMU)	:= head.o
+extra-$(CONFIG_SUN3)	:= sun3-head.o
+extra-y			+= vmlinux.lds
+
+obj-y	:= entry.o m68k_ksyms.o process.o ptrace.o setup.o signal.o \
+	   sys_m68k.o syscalltable.o time.o traps.o
+
+obj-y$(CONFIG_MMU_SUN3) += dma.o	# no, it's not a typo
+obj-$(CONFIG_MMU)	+= ints.o module.o devres.o
+devres-$(CONFIG_MMU)	= ../../../kernel/irq/devres.o
+
+ifndef CONFIG_MMU
+obj-y			+= init_task.o irq.o
+obj-$(CONFIG_MODULES)   += module.o
 endif
+
diff --git a/arch/m68k/kernel/Makefile_mm b/arch/m68k/kernel/Makefile_mm
deleted file mode 100644
index aced678..0000000
--- a/arch/m68k/kernel/Makefile_mm
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Makefile for the linux kernel.
-#
-
-ifndef CONFIG_SUN3
-  extra-y := head.o
-else
-  extra-y := sun3-head.o
-endif
-extra-y	+= vmlinux.lds
-
-obj-y	:= entry.o process.o traps.o ints.o signal.o ptrace.o module.o \
-	   sys_m68k.o time.o setup.o m68k_ksyms.o devres.o syscalltable.o
-
-devres-y = ../../../kernel/irq/devres.o
-
-obj-y$(CONFIG_MMU_SUN3) += dma.o	# no, it's not a typo
diff --git a/arch/m68k/kernel/Makefile_no b/arch/m68k/kernel/Makefile_no
deleted file mode 100644
index 37c3fc0..0000000
--- a/arch/m68k/kernel/Makefile_no
+++ /dev/null
@@ -1,10 +0,0 @@
-#
-# Makefile for arch/m68knommu/kernel.
-#
-
-extra-y := vmlinux.lds
-
-obj-y += dma.o entry.o init_task.o irq.o m68k_ksyms.o process.o ptrace.o \
-	 setup.o signal.o syscalltable.o sys_m68k.o time.o traps.o
-
-obj-$(CONFIG_MODULES)	+= module.o
-- 
1.7.0.4
