From: <gerg@snapgear.com>
Subject: [PATCH 1/2] m68knommu: reorganize the no-MMU cache flushing to match m68k
Date: Fri, 4 May 2012 16:50:46 +1000
Message-ID: <1336114247-22764-2-git-send-email-gerg@snapgear.com>
References: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:15691 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090Ab2EDGwJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 May 2012 02:52:09 -0400
In-Reply-To: <1336114247-22764-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Introduce cache_push() and cache_clear() functions for the non-MMU m68k
devices. With these in place we can more easily merge some of the common
m68k arch code.

In particular by reorganizing the __flush_caceh_all() code and separating
the cache push and clear functions it becomes trivial to implement the
new cache_push() and cache_clear() functions.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/cacheflush_no.h |   32 ++++++++++++++++++++++++++++----
 1 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/cacheflush_no.h b/arch/m68k/include/asm/cacheflush_no.h
index cb88aa9..7cafb53 100644
--- a/arch/m68k/include/asm/cacheflush_no.h
+++ b/arch/m68k/include/asm/cacheflush_no.h
@@ -30,11 +30,8 @@
 
 void mcf_cache_push(void);
 
-static inline void __flush_cache_all(void)
+static inline void __clear_cache_all(void)
 {
-#ifdef CACHE_PUSH
-	mcf_cache_push();
-#endif
 #ifdef CACHE_INVALIDATE
 	__asm__ __volatile__ (
 		"movel	%0, %%d0\n\t"
@@ -44,6 +41,14 @@ static inline void __flush_cache_all(void)
 #endif
 }
 
+static inline void __flush_cache_all(void)
+{
+#ifdef CACHE_PUSH
+	mcf_cache_push();
+#endif
+	__clear_cache_all();
+}
+
 /*
  * Some ColdFire parts implement separate instruction and data caches,
  * on those we should just flush the appropriate cache. If we don't need
@@ -76,4 +81,23 @@ static inline void __flush_dcache_all(void)
 	__asm__ __volatile__ ( "nop" );
 #endif
 }
+
+/*
+ * Push cache entries at supplied address. We want to write back any dirty
+ * data and the invalidate the cache lines associated with this address.
+ */
+static inline void cache_push(unsigned long paddr, int len)
+{
+	__flush_cache_all();
+}
+
+/*
+ * Clear cache entries at supplied address (that is don't write back any
+ * dirty data).
+ */
+static inline void cache_clear(unsigned long paddr, int len)
+{
+	__clear_cache_all();
+}
+
 #endif /* _M68KNOMMU_CACHEFLUSH_H */
-- 
1.7.0.4
