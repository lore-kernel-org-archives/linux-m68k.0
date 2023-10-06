Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505C7E81E05
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Oct 2023 14:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjJFOl0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 Oct 2023 10:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbjJFOlY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 Oct 2023 10:41:24 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6E8E9
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Oct 2023 07:41:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5e53:403c:300c:38ca])
        by xavier.telenet-ops.be with bizsmtp
        id uehJ2A0090nPCdM01ehJXs; Fri, 06 Oct 2023 16:41:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qom10-005X4i-3t;
        Fri, 06 Oct 2023 16:41:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qom10-006v2Y-1I;
        Fri, 06 Oct 2023 16:41:18 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/5] m68k: Fix indentation by 2 or 5 spaces in <asm/page_mm.h>
Date:   Fri,  6 Oct 2023 16:41:13 +0200
Message-Id: <2819709eee2be69c93497d4e97413bd0e05a9268.1696602993.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696602993.git.geert@linux-m68k.org>
References: <cover.1696602993.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Indentation should use TABs, not spaces.
Fix whitespace in reindented code while at it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/page_mm.h | 45 ++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 363aa0f9ba8ae691..e0ae4d5fc98596a4 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -13,17 +13,16 @@
 #ifdef CPU_M68040_OR_M68060_ONLY
 static inline void copy_page(void *to, void *from)
 {
-  unsigned long tmp;
-
-  __asm__ __volatile__("1:\t"
-		       ".chip 68040\n\t"
-		       "move16 %1@+,%0@+\n\t"
-		       "move16 %1@+,%0@+\n\t"
-		       ".chip 68k\n\t"
-		       "dbra  %2,1b\n\t"
-		       : "=a" (to), "=a" (from), "=d" (tmp)
-		       : "0" (to), "1" (from) , "2" (PAGE_SIZE / 32 - 1)
-		       );
+	unsigned long tmp;
+
+	__asm__ __volatile__("1:\t"
+			     ".chip 68040\n\t"
+			     "move16 %1@+,%0@+\n\t"
+			     "move16 %1@+,%0@+\n\t"
+			     ".chip 68k\n\t"
+			     "dbra  %2,1b\n\t"
+			     : "=a" (to), "=a" (from), "=d" (tmp)
+			     : "0" (to), "1" (from), "2" (PAGE_SIZE / 32 - 1));
 }
 
 static inline void clear_page(void *page)
@@ -95,23 +94,23 @@ static inline void *__va(unsigned long paddr)
 #define __pa(x) ___pa((unsigned long)(x))
 static inline unsigned long ___pa(unsigned long x)
 {
-     if(x == 0)
-	  return 0;
-     if(x >= PAGE_OFFSET)
-        return (x-PAGE_OFFSET);
-     else
-        return (x+0x2000000);
+	if (x == 0)
+		return 0;
+	if (x >= PAGE_OFFSET)
+		return (x - PAGE_OFFSET);
+	else
+		return (x + 0x2000000);
 }
 
 static inline void *__va(unsigned long x)
 {
-     if(x == 0)
-	  return (void *)0;
+	if (x == 0)
+		return (void *)0;
 
-     if(x < 0x2000000)
-        return (void *)(x+PAGE_OFFSET);
-     else
-        return (void *)(x-0x2000000);
+	if (x < 0x2000000)
+		return (void *)(x + PAGE_OFFSET);
+	else
+		return (void *)(x - 0x2000000);
 }
 #endif	/* CONFIG_SUN3 */
 
-- 
2.34.1

