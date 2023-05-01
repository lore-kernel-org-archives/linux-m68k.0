Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF9DC88CB4
	for <linux-m68k@archiver.kernel.org>; Mon,  1 May 2023 19:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbjEATbl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 May 2023 15:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbjEAT3r (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 May 2023 15:29:47 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730A62733
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 12:29:26 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1aaf21bb427so10622805ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 May 2023 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969355; x=1685561355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=pbOgq641Q1VbKkWYpSKEOBTaJbK7N+gn3tPQxAnQMHVxsbuYS7d6gCFZWWRyAoJPvd
         QWBoalX7ztTkXy1/S77S44wUsaYiw+c9l0pjoAvj83RwanS2FHVDTD9b5yLt3dvSiRkC
         Y6FbuRkXeTez8mU8JwqFdJ8q3udPbLVyCGPniHNdmE3Bvis2G1N5Cf54GBHK19m19dh2
         ECy1qDfhwNI4K2KlZeZKdUsb//pSuTNjtcr9BAZz+ZE7jjtZb0g8W7o+eLshkW2fWRhk
         rjbBHucvZ06kdc4e0Uijz1mCvV4V1RY1P7Hdmh8XbAUQYZvgzIuSpNmzClPaEZvw/eBL
         VKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969355; x=1685561355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=JMkk8qMxOs3651V4N44lAqA2ao2JqqImdoe+O+e0uJBkvHmQwhmN4phSgDnq3uopq8
         3mx6q1JifYQzMDlcwpHTzbLJvVgzUrMfj5c8EFzS4idfKcxsvewWRDdRASdH6ywV8umw
         qVd8kJBpWYP5B6zkG/RNgdUnJK1j/6sEZu27MOpdSuvhDiTdOHn9BPc943E6CsF2tsCV
         oYIrWpa50kqa+Cdx2Og6+czmLCp5YyKiwpTCsuaiO9meGr0JPcFm/p5NS+JatBGC04dJ
         0Pg8CO2UIbKtWKZhvm6QiruMeS75/U9ORE27sxR/mW9x4SEOeF6ev5lXOdcJ7NMQ3sHQ
         AAEw==
X-Gm-Message-State: AC+VfDzykJwqDeKhh0R2HpQFrxxaNSrz5xnAvU8V1mGp6PnlBodt7phS
        JucDH+9MQ7JwGei994moONw=
X-Google-Smtp-Source: ACHHUZ5aUwQpmXFq62IOwkeTiJiFUSz6Wt9PaXTxNdRH/kylJwLUJvf08r71LifeGRMo3EYnyRIKBw==
X-Received: by 2002:a17:902:dacb:b0:1a8:d7a:9255 with SMTP id q11-20020a170902dacb00b001a80d7a9255mr17869996plx.54.1682969355424;
        Mon, 01 May 2023 12:29:15 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:15 -0700 (PDT)
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
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Jonas Bonn <jonas@southpole.se>
Subject: [PATCH v2 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date:   Mon,  1 May 2023 12:28:23 -0700
Message-Id: <20230501192829.17086-29-vishal.moola@gmail.com>
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
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..14e641686281 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2

