Return-Path: <SRS0=fcbT=6A=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C6FC38A2E
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Apr 2020 22:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAC0A2223F
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Apr 2020 22:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YivNE6h0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgDPWBg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Apr 2020 18:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728723AbgDPWBe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Apr 2020 18:01:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D58C03C1A7;
        Thu, 16 Apr 2020 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=F6uwV0dK4QcGmstuIjk7zawn3mkCIgERs8uRasM7rEM=; b=YivNE6h01//PWHeUmhZKv4n31Y
        Pw68M3VYkHu3yP3KQuaVotKwMCt0JL+kOsKFEq/PhjkXOTGRT45U/yYLqRvDyPEdOnmYFLutq81Jj
        hFn8cXtzfgVXTiAdikpFMbCHbo2Rk+XxxD96Ukd+y1o+jVe+F4+j9Gl/A3A3gqd8aTpK3yBEPu30G
        vvCI3ZhJJvuV0X9LfcRftvqv7BtHm5DghBNHgkEeg006nlFg2fFOvxE7dsw6Gyxk2wJjgp0yLAg5C
        +a/0t9hqoKaDab3sTbaUfSKynDbRKoBxD3DVfNl+1hOcvcXww7PjOYhnudVi+QKq1HNQbxd8DzyYc
        /E1TBZ0g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jPCZg-0003UJ-Fe; Thu, 16 Apr 2020 22:01:32 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH v3 03/11] m68k: Add clear_bit_unlock_is_negative_byte implementation
Date:   Thu, 16 Apr 2020 15:01:22 -0700
Message-Id: <20200416220130.13343-4-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200416220130.13343-1-willy@infradead.org>
References: <20200416220130.13343-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This is the generic implementation.  Someone who knows m68k assembly
can probably do better (the BFCLR instruction appears to set the N bit
appropriately).

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/include/asm/bitops.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 10133a968c8e..bfb34e0748fe 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -524,6 +524,13 @@ static inline int __fls(int x)
 #define clear_bit_unlock	clear_bit
 #define __clear_bit_unlock	clear_bit_unlock
 
+static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
+						volatile unsigned long *p)
+{
+	clear_bit_unlock(nr, p);
+	return test_bit(7, p);
+}
+
 #include <asm-generic/bitops/ext2-atomic.h>
 #include <asm-generic/bitops/le.h>
 #include <asm-generic/bitops/fls64.h>
-- 
2.25.1

