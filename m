Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F697C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7379561056
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhIPHHB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 03:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhIPHHB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 03:07:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA1FC061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 00:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=wm37+ydTrV9KbuJsat0VVXh7HzRUEfZyWy1vRBLoHMI=; b=BEY1cTA4ed5p3LGUmxybh6R9LA
        erjQCRfiDkyaYlAbsHPrCQ4tOWFQlYJiSln6kzVvIg9GNk6b4NENGF2j0cjnLCo29TwqTNdGS/QFz
        10rJrNfyjAUIqljKdZsONHuca0oHlIJLhnmLW7yzVsjo2tCVFqXY1f5jKC++rkmEiDRR9fk8jPoCq
        7N6RW+uzeejKxsK2BKJv9e+rMxlmz/JaIFkWeM7RkCWbmuVWsZTotLpgv2LtKw7bsNkaBKxpZPWHC
        ZRCU0+tfw284r90uShpFOxXlNlSy18qM+cHUWF8hC9xb5DjPOecGW2BG3GgbQWfzh4HP5Nc5vlvRl
        1h8EpKSQ==;
Received: from [2001:4bb8:184:72db:6d44:b004:a9fa:2cf3] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQlRu-00GOzg-He; Thu, 16 Sep 2021 07:04:59 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 1/6] m68k: document that access_ok is broken for !CONFIG_CPU_HAS_ADDRESS_SPACES
Date:   Thu, 16 Sep 2021 09:04:00 +0200
Message-Id: <20210916070405.52750-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916070405.52750-1-hch@lst.de>
References: <20210916070405.52750-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Document that access_ok is completely broken for coldfire and friends at
the moment.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index f98208ccbbcd1..610bfe8d64d5f 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -16,6 +16,10 @@
 static inline int access_ok(const void __user *addr,
 			    unsigned long size)
 {
+	/*
+	 * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
+	 * for TASK_SIZE!
+	 */
 	return 1;
 }
 
-- 
2.30.2

