Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB62C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 187B961207
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhIPHHp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 03:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhIPHHo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 03:07:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F01C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=2512wqbPF3Ps3PXlHBWJr4hDqcPuS4kA7CNwrMD1uGA=; b=p6HMCRb69d/4dCWsV8beKqW6eX
        ucdq7xhYB/AYG2Ve1GK4GCUImfxJwmvOyoJVs0VLC3fxyuvv/sxzd41tqHuVvGOoh1XIlfVEa03ZB
        5aGfaJi+XM7vlkTEdnoNqTyzoCt9byxQivCu/efSCKnPyOGBU+khXDrIK/trG6D91tYvFj+pMsJpc
        Q/TpeWAH/6GIAWt7Ez3eoE9t/RAdoBM41/y5+szyTsf4klkmUyEMWzDaTF2LF2LmtZmgrUvzSOpel
        2Avkndzluc3i16TM9Oiyp3JX0qTfS42RLlNK3nGwHkAJ/eXGeK3CgXZU3Yvb31Y9+nUvyREPx8NIu
        P21HRYCA==;
Received: from [2001:4bb8:184:72db:6d44:b004:a9fa:2cf3] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQlSX-00GP20-Vo; Thu, 16 Sep 2021 07:05:40 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 2/6] m68k: remove the 030 case in virt_to_phys_slow
Date:   Thu, 16 Sep 2021 09:04:01 +0200
Message-Id: <20210916070405.52750-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916070405.52750-1-hch@lst.de>
References: <20210916070405.52750-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The 030 case in virt_to_phys_slow can't ever be reached, so remove it.

Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/mm/cache.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index b486c0889eece..e7c1cabbfac45 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -49,24 +49,7 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 		if (mmusr & MMU_R_040)
 			return (mmusr & PAGE_MASK) | (vaddr & ~PAGE_MASK);
 	} else {
-		unsigned short mmusr;
-		unsigned long *descaddr;
-
-		asm volatile ("ptestr %3,%2@,#7,%0\n\t"
-			      "pmove %%psr,%1"
-			      : "=a&" (descaddr), "=m" (mmusr)
-			      : "a" (vaddr), "d" (get_fs().seg));
-		if (mmusr & (MMU_I|MMU_B|MMU_L))
-			return 0;
-		descaddr = phys_to_virt((unsigned long)descaddr);
-		switch (mmusr & MMU_NUM) {
-		case 1:
-			return (*descaddr & 0xfe000000) | (vaddr & 0x01ffffff);
-		case 2:
-			return (*descaddr & 0xfffc0000) | (vaddr & 0x0003ffff);
-		case 3:
-			return (*descaddr & PAGE_MASK) | (vaddr & ~PAGE_MASK);
-		}
+		WARN_ON_ONCE(!CPU_IS_040_OR_060);
 	}
 	return 0;
 }
-- 
2.30.2

