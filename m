Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9A3C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42E0B613C9
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhGIHEs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHEs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:04:48 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7855FC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=Cxl4zs2Ub3sCYcBILDMArSAUpR4lxjXZBZKYimaeRIs=; b=NtlLmRwmlduzzMKeiV4yVxAUNJ
        gDCNQ9liVArkSFgm11cXQ7G2XLXjhCkNhf9ADV81uOqK76PsqzRqyH/u3HKZdyrwQsozvQ0tCG/Pr
        dJodoTOjw/2s+Oi08hmns2NlfhxFADaIK3vUDV2ZxIWrWyfX6JsGnJIiJ+orhpfaUh2OV1amerYc5
        S6Lhc7AtJd3zJ5cElQp0y+8OLdo98PNdF4/q3N93D3wxICI6mLztYoRJGfCK3ZScY9GEXxLZTThrd
        ZuyoS//0PTfworH40+btTPhOAJdUAL1tt6dEYomyGxuxtcQYv77nDVm8mhXovboGRtqv8JZBMBaWQ
        tWotZI1w==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kWM-00EFNY-DD; Fri, 09 Jul 2021 07:02:00 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 2/7] m68k: use BUILD_BUG for passing invalid sizes to get_user/put_user
Date:   Fri,  9 Jul 2021 09:01:27 +0200
Message-Id: <20210709070132.3387689-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
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
index 610bfe8d64d5..01334a9658c4 100644
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

