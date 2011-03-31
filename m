From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 4/5] m68k: merge the non-mmu and mm mm/Makefile
Date: Thu, 31 Mar 2011 14:19:30 +1000
Message-ID: <6db6e1b9b4a0b93d6a5327b235a2f55162607aef.1301544679.git.gerg@uclinux.org>
References: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31859 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab1CaEWF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 00:22:05 -0400
In-Reply-To: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

Its is trivial to megre the mmu and non-mmu mm/Makefile's back into
a single file. So do it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/Makefile    |   14 +++++++++-----
 arch/m68k/mm/Makefile_mm |    8 --------
 arch/m68k/mm/Makefile_no |    5 -----
 3 files changed, 9 insertions(+), 18 deletions(-)
 delete mode 100644 arch/m68k/mm/Makefile_mm
 delete mode 100644 arch/m68k/mm/Makefile_no

diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile
index b60270e..09cadf1 100644
--- a/arch/m68k/mm/Makefile
+++ b/arch/m68k/mm/Makefile
@@ -1,5 +1,9 @@
-ifdef CONFIG_MMU
-include arch/m68k/mm/Makefile_mm
-else
-include arch/m68k/mm/Makefile_no
-endif
+#
+# Makefile for the linux m68k-specific parts of the memory manager.
+#
+
+obj-y	:= init.o
+
+obj-$(CONFIG_MMU)		+= cache.o fault.o hwtest.o
+obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o
+obj-$(CONFIG_MMU_SUN3)		+= sun3kmap.o sun3mmu.o
diff --git a/arch/m68k/mm/Makefile_mm b/arch/m68k/mm/Makefile_mm
deleted file mode 100644
index 5eaa43c..0000000
--- a/arch/m68k/mm/Makefile_mm
+++ /dev/null
@@ -1,8 +0,0 @@
-#
-# Makefile for the linux m68k-specific parts of the memory manager.
-#
-
-obj-y		:= cache.o init.o fault.o hwtest.o
-
-obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o
-obj-$(CONFIG_MMU_SUN3)		+= sun3kmap.o sun3mmu.o
diff --git a/arch/m68k/mm/Makefile_no b/arch/m68k/mm/Makefile_no
deleted file mode 100644
index 80579c6..0000000
--- a/arch/m68k/mm/Makefile_no
+++ /dev/null
@@ -1,5 +0,0 @@
-#
-# Makefile for the linux m68knommu specific parts of the memory manager.
-#
-
-obj-y += init.o
-- 
1.7.0.4
