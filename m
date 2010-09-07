From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH] m68k: move definition of THREAD_SIZE into thread_info_mm.h
Date: Tue, 7 Sep 2010 15:49:00 +1000
Message-ID: <201009070549.o875n08s008032@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:36520 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751254Ab0IGFtN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 01:49:13 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org


Hi All,

I would like to move the m68k THREAD_SIZE definition into thread_info.h.
It looks like most architectures define it there (not all though), and
this makes it consistent with m68knommu which defines it there too.

(The motivation is to merge common parts of page.h and thread_info.h
for the mmu and non-mmu varients ultimately).

Regards
Greg




m68k: move definition of THREAD_SIZE into thread_info_mm.h

Move the definition of THREAD_SIZE from page_mm.h to thread_info_mm.h
This logically associates it with the other thread definitions, and will
make it easier to merge the MMU and non-MMU versions of page.h and
thread_info.h.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/page_mm.h        |    6 ------
 arch/m68k/include/asm/thread_info_mm.h |    5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index d009f3e..eeb6764 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -14,12 +14,6 @@
 
 #include <asm/setup.h>
 
-#if PAGE_SHIFT < 13
-#define THREAD_SIZE (8192)
-#else
-#define THREAD_SIZE PAGE_SIZE
-#endif
-
 #ifndef __ASSEMBLY__
 
 #include <linux/compiler.h>
diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/include/asm/thread_info_mm.h
index 3bf31dc..d08046c 100644
--- a/arch/m68k/include/asm/thread_info_mm.h
+++ b/arch/m68k/include/asm/thread_info_mm.h
@@ -34,6 +34,11 @@ struct thread_info {
 }
 
 /* THREAD_SIZE should be 8k, so handle differently for 4k and 8k machines */
+#if PAGE_SHIFT < 13
+#define THREAD_SIZE (8192)
+#else
+#define THREAD_SIZE PAGE_SIZE
+#endif
 #define THREAD_SIZE_ORDER (13 - PAGE_SHIFT)
 
 #define init_thread_info	(init_task.thread.info)
-- 
1.6.3.3
