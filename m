From: <gerg@snapgear.com>
Subject: [PATCH 21/36] m68k: modify cache push and clear code for ColdFire with MMU enable
Date: Tue, 25 Oct 2011 17:19:13 +1000
Message-ID: <1319527168-11166-22-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25126 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754100Ab1JYHT3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:29 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The cache push and clear code only need to flush the branch cache on
the write-through cache setup of the ColdFire V4e with MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/memory.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/mm/memory.c b/arch/m68k/mm/memory.c
index 34c77ce..a5f51c8 100644
--- a/arch/m68k/mm/memory.c
+++ b/arch/m68k/mm/memory.c
@@ -203,6 +203,9 @@ static inline void pushcl040(unsigned long paddr)
 
 void cache_clear (unsigned long paddr, int len)
 {
+#ifdef CONFIG_COLDFIRE
+	flush_cf_bcache(0, DCACHE_MAX_ADDR);
+#else
     if (CPU_IS_040_OR_060) {
 	int tmp;
 
@@ -237,6 +240,7 @@ void cache_clear (unsigned long paddr, int len)
     if(mach_l2_flush)
 	mach_l2_flush(0);
 #endif
+#endif /* CONFIG_COLDFIRE */
 }
 EXPORT_SYMBOL(cache_clear);
 
@@ -250,6 +254,9 @@ EXPORT_SYMBOL(cache_clear);
 
 void cache_push (unsigned long paddr, int len)
 {
+#ifdef CONFIG_COLDFIRE
+	flush_cf_bcache(0, DCACHE_MAX_ADDR);
+#else
     if (CPU_IS_040_OR_060) {
 	int tmp = PAGE_SIZE;
 
@@ -290,6 +297,7 @@ void cache_push (unsigned long paddr, int len)
     if(mach_l2_flush)
 	mach_l2_flush(1);
 #endif
+#endif /* CONFIG_COLDFIRE */
 }
 EXPORT_SYMBOL(cache_push);
 
-- 
1.7.0.4
