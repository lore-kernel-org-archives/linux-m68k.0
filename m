Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B52C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91AA0613C9
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhGIHEq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHEp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:04:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4EDC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=pwuIcITniK9w5IFF54eSZuDc9sU7bVsabmXQgDk1Ybc=; b=wOzxKJ1hlN3J7N5KxzJEBMDB2v
        UPXO4vmhgKFBZzHW4ahHiUwrjkJzgtf4GuwhzAh0FIESftF7bEmV+zmjfWQpzUgeWIGURcg70RIZV
        0WRGc1ApP6viENf0RNAX/d+wBs1ro5U2nuef15TPubTHimhJgK3XlA+7PWW/WA64CvpCKqOGh87Uw
        AdIY4rrEn2tS/Koq0dI4HQmsK1fwF6l7EkBkUdLRltu4JQF+doYPKmx01EozqyRUzP3SRRtOwGEV5
        +mOIdxnW1tT31PomDLRZyPeuiKGtEabBAsMTtAyJiqDcjn6dS5AhOuLpFjXR03kLpv90duTAA+Vvb
        eIY6Tr9A==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kWB-00EFMt-Sy; Fri, 09 Jul 2021 07:01:53 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 1/7] m68k: document that access_ok is broken for !CONFIG_CPU_HAS_ADDRESS_SPACES
Date:   Fri,  9 Jul 2021 09:01:26 +0200
Message-Id: <20210709070132.3387689-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
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
index f98208ccbbcd..610bfe8d64d5 100644
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

