From: <gerg@snapgear.com>
Subject: [PATCH v3 3/6] m68k: remove duplicate memmove() implementation
Date: Thu, 21 Apr 2011 10:24:48 +1000
Message-ID: <1303345491-27888-4-git-send-email-gerg@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
 <1303345491-27888-2-git-send-email-gerg@snapgear.com>
 <1303345491-27888-3-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:58628 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774Ab1DUAZp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:25:45 -0400
In-Reply-To: <1303345491-27888-3-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Merging the mmu and non-mmu directories we ended up with duplicate
(and identical) implementations of memmove(). Remove one of them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/lib/Makefile  |    4 +-
 arch/m68k/lib/memmove.c |    2 -
 arch/m68k/lib/string.c  |   95 -----------------------------------------------
 3 files changed, 2 insertions(+), 99 deletions(-)

diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 3d85fb6..ec479a9 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -3,12 +3,12 @@
 # Makefile for m68k-specific library files..
 #
 
-lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o checksum.o
+lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o memmove.o checksum.o
 
 ifdef CONFIG_MMU
 lib-y	+= string.o uaccess.o
 else
 lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o \
-	   memcpy.o memmove.o memset.o delay.o
+	   memcpy.o memset.o delay.o
 endif
 
diff --git a/arch/m68k/lib/memmove.c b/arch/m68k/lib/memmove.c
index b3dcfe9..6519f7f 100644
--- a/arch/m68k/lib/memmove.c
+++ b/arch/m68k/lib/memmove.c
@@ -4,8 +4,6 @@
  * for more details.
  */
 
-#define __IN_STRING_C
-
 #include <linux/module.h>
 #include <linux/string.h>
 
diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
index d399c5f..711fa74 100644
--- a/arch/m68k/lib/string.c
+++ b/arch/m68k/lib/string.c
@@ -148,98 +148,3 @@ void *memcpy(void *to, const void *from, size_t n)
 	return xto;
 }
 EXPORT_SYMBOL(memcpy);
-
-void *memmove(void *dest, const void *src, size_t n)
-{
-	void *xdest = dest;
-	size_t temp;
-
-	if (!n)
-		return xdest;
-
-	if (dest < src) {
-		if ((long)dest & 1) {
-			char *cdest = dest;
-			const char *csrc = src;
-			*cdest++ = *csrc++;
-			dest = cdest;
-			src = csrc;
-			n--;
-		}
-		if (n > 2 && (long)dest & 2) {
-			short *sdest = dest;
-			const short *ssrc = src;
-			*sdest++ = *ssrc++;
-			dest = sdest;
-			src = ssrc;
-			n -= 2;
-		}
-		temp = n >> 2;
-		if (temp) {
-			long *ldest = dest;
-			const long *lsrc = src;
-			temp--;
-			do
-				*ldest++ = *lsrc++;
-			while (temp--);
-			dest = ldest;
-			src = lsrc;
-		}
-		if (n & 2) {
-			short *sdest = dest;
-			const short *ssrc = src;
-			*sdest++ = *ssrc++;
-			dest = sdest;
-			src = ssrc;
-		}
-		if (n & 1) {
-			char *cdest = dest;
-			const char *csrc = src;
-			*cdest = *csrc;
-		}
-	} else {
-		dest = (char *)dest + n;
-		src = (const char *)src + n;
-		if ((long)dest & 1) {
-			char *cdest = dest;
-			const char *csrc = src;
-			*--cdest = *--csrc;
-			dest = cdest;
-			src = csrc;
-			n--;
-		}
-		if (n > 2 && (long)dest & 2) {
-			short *sdest = dest;
-			const short *ssrc = src;
-			*--sdest = *--ssrc;
-			dest = sdest;
-			src = ssrc;
-			n -= 2;
-		}
-		temp = n >> 2;
-		if (temp) {
-			long *ldest = dest;
-			const long *lsrc = src;
-			temp--;
-			do
-				*--ldest = *--lsrc;
-			while (temp--);
-			dest = ldest;
-			src = lsrc;
-		}
-		if (n & 2) {
-			short *sdest = dest;
-			const short *ssrc = src;
-			*--sdest = *--ssrc;
-			dest = sdest;
-			src = ssrc;
-		}
-		if (n & 1) {
-			char *cdest = dest;
-			const char *csrc = src;
-			*--cdest = *--csrc;
-		}
-	}
-	return xdest;
-}
-EXPORT_SYMBOL(memmove);
-- 
1.7.0.4
