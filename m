From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 6/6] m68k: remove no longer used arch/m68k/lib/string.c
Date: Wed, 30 Mar 2011 17:58:27 +1000
Message-ID: <0868d051884e72c38116ab6c89d619050b319ed0.1301471810.git.gerg@uclinux.org>
References: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:57645 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175Ab1C3IAz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 04:00:55 -0400
In-Reply-To: <de032cfd09b94c8803091bf143890ce48e61304a.1301471809.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The last remaining functions in string.c, strcpy() and strcat(), are
not actually used. They are defined inline in asm/string.h. So remove
string.h.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/lib/Makefile |    2 +-
 arch/m68k/lib/string.c |   22 ----------------------
 2 files changed, 1 insertions(+), 23 deletions(-)
 delete mode 100644 arch/m68k/lib/string.c

diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 2438d02..60fae1c 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -7,7 +7,7 @@ lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
 	   memcpy.o memset.o memmove.o checksum.o
 
 ifdef CONFIG_MMU
-lib-y	+= string.o uaccess.o
+lib-y	+= uaccess.o
 else
 lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o delay.o
 endif
diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
deleted file mode 100644
index b9a57ab..0000000
--- a/arch/m68k/lib/string.c
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- */
-
-#define __IN_STRING_C
-
-#include <linux/module.h>
-#include <linux/string.h>
-
-char *strcpy(char *dest, const char *src)
-{
-	return __kernel_strcpy(dest, src);
-}
-EXPORT_SYMBOL(strcpy);
-
-char *strcat(char *dest, const char *src)
-{
-	return __kernel_strcpy(dest + __kernel_strlen(dest), src);
-}
-EXPORT_SYMBOL(strcat);
-- 
1.7.0.4
