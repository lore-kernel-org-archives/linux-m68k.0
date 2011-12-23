From: <gerg@snapgear.com>
Subject: [PATCH 22/35] m68k: modify cache push and clear code for ColdFire with MMU enable
Date: Fri, 23 Dec 2011 13:15:35 +1000
Message-ID: <1324610148-20666-23-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39290 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756399Ab1LWDPN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:15:13 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The cache push and clear code only need to flush the branch cache on
the write-through cache setup of the ColdFire V4e with MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/mm/memory.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/mm/memory.c b/arch/m68k/mm/memory.c
index 34c77ce..a5dbb74 100644
--- a/arch/m68k/mm/memory.c
+++ b/arch/m68k/mm/memory.c
@@ -203,7 +203,9 @@ static inline void pushcl040(unsigned long paddr)
 
 void cache_clear (unsigned long paddr, int len)
 {
-    if (CPU_IS_040_OR_060) {
+    if (CPU_IS_COLDFIRE) {
+	flush_cf_bcache(0, DCACHE_MAX_ADDR);
+    } else if (CPU_IS_040_OR_060) {
 	int tmp;
 
 	/*
@@ -250,7 +252,9 @@ EXPORT_SYMBOL(cache_clear);
 
 void cache_push (unsigned long paddr, int len)
 {
-    if (CPU_IS_040_OR_060) {
+    if (CPU_IS_COLDFIRE) {
+	flush_cf_bcache(0, DCACHE_MAX_ADDR);
+    } else if (CPU_IS_040_OR_060) {
 	int tmp = PAGE_SIZE;
 
 	/*
-- 
1.7.0.4
