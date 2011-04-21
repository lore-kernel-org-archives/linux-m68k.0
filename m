From: <gerg@snapgear.com>
Subject: [PATCH v3 6/6] m68k: let Makefile sort out compiling mmu and non-mmu lib/checksum.c
Date: Thu, 21 Apr 2011 10:24:51 +1000
Message-ID: <1303345491-27888-7-git-send-email-gerg@snapgear.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
 <1303345491-27888-2-git-send-email-gerg@snapgear.com>
 <1303345491-27888-3-git-send-email-gerg@snapgear.com>
 <1303345491-27888-4-git-send-email-gerg@snapgear.com>
 <1303345491-27888-5-git-send-email-gerg@snapgear.com>
 <1303345491-27888-6-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:58615 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753611Ab1DUAZY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:25:24 -0400
In-Reply-To: <1303345491-27888-6-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We don't need an arch/m68k/lib/checksum.c wrapper to include the correct
mmu or non-mmu version of the checksum code. Let the Makefile just build
the appropriate one.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/lib/Makefile   |    6 +++---
 arch/m68k/lib/checksum.c |    5 -----
 2 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 arch/m68k/lib/checksum.c

diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 2438d02..df421e5 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -4,11 +4,11 @@
 #
 
 lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
-	   memcpy.o memset.o memmove.o checksum.o
+	   memcpy.o memset.o memmove.o
 
 ifdef CONFIG_MMU
-lib-y	+= string.o uaccess.o
+lib-y	+= string.o uaccess.o checksum_mm.o
 else
-lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o delay.o
+lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o delay.o checksum_no.o
 endif
 
diff --git a/arch/m68k/lib/checksum.c b/arch/m68k/lib/checksum.c
deleted file mode 100644
index 1297536..0000000
--- a/arch/m68k/lib/checksum.c
+++ /dev/null
@@ -1,5 +0,0 @@
-#ifdef CONFIG_MMU
-#include "checksum_mm.c"
-#else
-#include "checksum_no.c"
-#endif
-- 
1.7.0.4
