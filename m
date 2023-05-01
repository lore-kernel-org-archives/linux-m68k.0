Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6E6C88C85
	for <linux-m68k@archiver.kernel.org>; Mon,  1 May 2023 19:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbjEATbk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 May 2023 15:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233530AbjEAT3o (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 May 2023 15:29:44 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052573A9E
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 12:29:16 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-51f597c975fso2541359a12.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 May 2023 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969346; x=1685561346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=q4na0YpY6+HIdR7eCjpOfgl3pLZKXaYPSEQBquag8z/68f0H1ARrXFU5GHdi9YxK8/
         rB/VLGJXy6D4ZufE/2LOOEwnretxgWAB++ZlGVRxVIYCoUOlMN8apcsmkHtbQevtOOJx
         LNKiQlcElPDsuGjD80MSn3zT41r1jijBtepWy2itQQP8kPb/qbuR3Nu9du37XsuFat5b
         tY9vSCaH65FZJZYGzqq6Sev5FEiEarceFI+PkCB4zysu+TPDmYzeupQ3qWrtewRiW+Ef
         pPbEC2E+2Gu9odmO4zWHfrgw5vSTXCdgYdvlBNlEJqZMmLFOH+elBEgtadEGjmhbbSeV
         twkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969346; x=1685561346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=MWAk61ia4FbBUg0ED20vtJMk2iQqsOx0rOyAvgbYMcIRwzrhfarjRG/p4MXHThSSJH
         Q3eNYXsGe6sgw0oT1Uz0pkerVK0vYTVCoGxWCx7ULQSFAgkMBI75O72i+LqHhtKP+a2Q
         S6cCmX6tT2Jv10TSd8ILZN5G7Ak7i7HR/1UHcOHMp3Mowm7qHuN0Q8zXONjLp57AUgEB
         ohvnkG8fGQ2Y0qUWLq2WmRr6w8eG2aP5sygsfpxNlxGdH8Wn2rOoX5kxhcyVABr5fgDI
         VFRgF7Z6sOJ1KWQNp85ero6L3KiXvEn4P9mrTkbzlscshUZ97yXcjBS8NsWksuIKEhIW
         sFwA==
X-Gm-Message-State: AC+VfDyCiSLcXUEhe3V+MuLPbOAepinJ90Cs/IXjK67u/5/My527T8Cj
        JTR7L/jAH6P2GTdI3jXXDU8=
X-Google-Smtp-Source: ACHHUZ4G7uSDpj0Az+Rf76NPdw6reyXbUYX/RD5L7uNUC8eMCewkmfrtYB+I6yNLHyDYyReDKoyXCw==
X-Received: by 2002:a17:902:c947:b0:1ab:8f4:af21 with SMTP id i7-20020a170902c94700b001ab08f4af21mr235908pla.42.1682969345737;
        Mon, 01 May 2023 12:29:05 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:05 -0700 (PDT)
From:   "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
        kvm@vger.kernel.org,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v2 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date:   Mon,  1 May 2023 12:28:17 -0700
Message-Id: <20230501192829.17086-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..af26f1191b43 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.39.2

