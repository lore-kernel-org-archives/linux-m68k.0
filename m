From: <gerg@snapgear.com>
Subject: [PATCH] m68k: fix ColdFire clear cache operation
Date: Tue, 10 Jul 2012 16:41:21 +1000
Message-ID: <1341902481-8321-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:43233 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647Ab2GJGm6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jul 2012 02:42:58 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The code for clearing (invalidating) the ColdFire cache is actually performing
a push operation. Add functions to clear the cache, and fix cache_clear() to
call the appropriate clear cache function.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/cacheflush_mm.h |   41 +++++++++++++++++++++++++++++++++
 arch/m68k/mm/memory.c                 |    2 +-
 2 files changed, 42 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/cacheflush_mm.h b/arch/m68k/include/asm/cacheflush_mm.h
index 8104bd8..a32ffc9 100644
--- a/arch/m68k/include/asm/cacheflush_mm.h
+++ b/arch/m68k/include/asm/cacheflush_mm.h
@@ -17,6 +17,47 @@
 #define DCACHE_SETMASK	0
 #endif
 
+/*
+ * ColdFire architecture has no way to clear individual cache lines, so we
+ * are stuck invalidating all the cache entries when we want a clear operation.
+ */
+static inline void clear_cf_icache(unsigned long start, unsigned long end)
+{
+	__asm__ __volatile__ (
+		"movel	%0,%%d0\n\t"
+		"movec	%%d0,%%cacr\n\t"
+		"nop\n\t"
+		:
+		: "i" (CACHE_MODE | CACR_ICINVA | CACR_BCINVA)
+		: "d0");
+}
+
+static inline void clear_cf_dcache(unsigned long start, unsigned long end)
+{
+	__asm__ __volatile__ (
+		"movel	%0,%%d0\n\t"
+		"movec	%%d0,%%cacr\n\t"
+		"nop\n\t"
+		:
+		: "i" (CACHE_MODE | CACR_DCINVA)
+		: "d0");
+}
+
+static inline void clear_cf_bcache(unsigned long start, unsigned long end)
+{
+	__asm__ __volatile__ (
+		"movel	%0,%%d0\n\t"
+		"movec	%%d0,%%cacr\n\t"
+		"nop\n\t"
+		:
+		: "i" (CACHE_MODE | CACR_ICINVA | CACR_BCINVA | CACR_DCINVA)
+		: "d0");
+}
+
+/*
+ * Use the ColdFire cpushl instruction to push (and invalidate) cache lines.
+ * The start and end addresses are cache line numbers not memory addresses.
+ */
 static inline void flush_cf_icache(unsigned long start, unsigned long end)
 {
 	unsigned long set;
diff --git a/arch/m68k/mm/memory.c b/arch/m68k/mm/memory.c
index 250b8b7..51bc9d2 100644
--- a/arch/m68k/mm/memory.c
+++ b/arch/m68k/mm/memory.c
@@ -203,7 +203,7 @@ static inline void pushcl040(unsigned long paddr)
 void cache_clear (unsigned long paddr, int len)
 {
     if (CPU_IS_COLDFIRE) {
-	flush_cf_bcache(0, DCACHE_MAX_ADDR);
+	clear_cf_bcache(0, DCACHE_MAX_ADDR);
     } else if (CPU_IS_040_OR_060) {
 	int tmp;
 
-- 
1.7.0.4
