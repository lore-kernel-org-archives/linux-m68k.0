From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 2/6] m68k: merge mmu and non-mmu versions of lib/Makefile
Date: Wed, 30 Mar 2011 17:58:23 +1000
Message-ID: <00a6d601745e273b89d2cdc767303d88974880d4.1301471809.git.gerg@uclinux.org>
References: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:57659 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752641Ab1C3IBE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 04:01:04 -0400
In-Reply-To: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

We can easily support the slight differences in libs needed by the
mmu and non-mmu builds in a single Makefile, so merge them back into
a single file again.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
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
