Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB11DC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:06:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9022861056
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhIPHIP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 03:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhIPHIO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 03:08:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0D7C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 00:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=QBgFm0BhkwqI+vB9C/+cYM7tzLfRP6PoZHyUZlcnITM=; b=sOzxIzDGFC9msdl6rsALuNBpnX
        +G7eQ0jRr1CHejfjqjHEMoY9bSPSEGsL2BMvhfXukl0DVvD//lOcFU60kaTgvqLu8nnVVPYyDXE9t
        /+Zp1Ei+p2Ks+Ryk8dHJMxpZ3kY3IQtS0kv/5ARDvWU4iHFrb8Y7vcf0zZsoY1Dpfz01CEY+yhMe6
        7a//7bRDh2wVKiAJiQFnJKkX0DxRO6d1ElR/jng5u57sZUuxhlZ93de3eecKyuyxvXhCMKImbYLOm
        TUsxtWQzBZIdGkUBOKHk1Gr7aPAj5oYksXudtaS8Kp3mX6KNzrvaMACEDo9UvnNFibN7cCMkvM0FN
        HsTJH9CQ==;
Received: from [2001:4bb8:184:72db:6d44:b004:a9fa:2cf3] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQlTF-00GP3I-UZ; Thu, 16 Sep 2021 07:06:22 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 3/6] m68k: use BUILD_BUG for passing invalid sizes to get_user/put_user
Date:   Thu, 16 Sep 2021 09:04:02 +0200
Message-Id: <20210916070405.52750-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916070405.52750-1-hch@lst.de>
References: <20210916070405.52750-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Simplify the handling a bit by using the common helper instead of
referencing undefined symbols.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/uaccess.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 610bfe8d64d5f..01334a9658c40 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -39,9 +39,6 @@ static inline int access_ok(const void __user *addr,
 #define	MOVES	"move"
 #endif
 
-extern int __put_user_bad(void);
-extern int __get_user_bad(void);
-
 #define __put_user_asm(res, x, ptr, bwl, reg, err)	\
 asm volatile ("\n"					\
 	"1:	"MOVES"."#bwl"	%2,%1\n"		\
@@ -105,8 +102,7 @@ asm volatile ("\n"					\
 		break;							\
 	    }								\
 	default:							\
-		__pu_err = __put_user_bad();				\
-		break;							\
+		BUILD_BUG();						\
 	}								\
 	__pu_err;							\
 })
@@ -179,8 +175,7 @@ asm volatile ("\n"					\
 		break;							\
 	}								\
 	default:							\
-		__gu_err = __get_user_bad();				\
-		break;							\
+		BUILD_BUG();						\
 	}								\
 	__gu_err;							\
 })
-- 
2.30.2

