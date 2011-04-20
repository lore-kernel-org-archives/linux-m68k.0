From: <gerg@snapgear.com>
Subject: [PATCH v2 2/6] m68k: merge mmu and non-mmu versions of lib/Makefile
Date: Wed, 20 Apr 2011 15:54:36 +1000
Message-ID: <1303278880-16153-4-git-send-email-gerg@snapgear.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com>
 <1303278880-16153-2-git-send-email-gerg@snapgear.com>
 <1303278880-16153-3-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44809 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626Ab1DTF44 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 01:56:56 -0400
In-Reply-To: <1303278880-16153-3-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We can easily support the slight differences in libs needed by the
mmu and non-mmu builds in a single Makefile, so merge them back into
a single file again.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/lib/Makefile    |   13 +++++++++++--
 arch/m68k/lib/Makefile_mm |    6 ------
 arch/m68k/lib/Makefile_no |    7 -------
 3 files changed, 11 insertions(+), 15 deletions(-)
 delete mode 100644 arch/m68k/lib/Makefile_mm
 delete mode 100644 arch/m68k/lib/Makefile_no

diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 1f95881..3d85fb6 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -1,5 +1,14 @@
+
+#
+# Makefile for m68k-specific library files..
+#
+
+lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o checksum.o
+
 ifdef CONFIG_MMU
-include arch/m68k/lib/Makefile_mm
+lib-y	+= string.o uaccess.o
 else
-include arch/m68k/lib/Makefile_no
+lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o \
+	   memcpy.o memmove.o memset.o delay.o
 endif
+
diff --git a/arch/m68k/lib/Makefile_mm b/arch/m68k/lib/Makefile_mm
deleted file mode 100644
index af9abf8..0000000
--- a/arch/m68k/lib/Makefile_mm
+++ /dev/null
@@ -1,6 +0,0 @@
-#
-# Makefile for m68k-specific library files..
-#
-
-lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
-	   checksum.o string.o uaccess.o
diff --git a/arch/m68k/lib/Makefile_no b/arch/m68k/lib/Makefile_no
deleted file mode 100644
index 32d852e..0000000
--- a/arch/m68k/lib/Makefile_no
+++ /dev/null
@@ -1,7 +0,0 @@
-#
-# Makefile for m68knommu specific library files..
-#
-
-lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o \
-	   muldi3.o mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o \
-	   checksum.o memcpy.o memmove.o memset.o delay.o
-- 
1.7.0.4
