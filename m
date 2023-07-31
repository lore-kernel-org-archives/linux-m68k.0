Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F7AC0729B
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjGaRGs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbjGaRF1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:05:27 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8BB210D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:20 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d124309864dso3747880276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823056; x=1691427856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=VD/5YQf9dWYT3s+XLCXcwwiIVAHAp/pIe7AMdOvpExYmK5HjPOWTZu09sLOfQMxAfC
         OXuPdz7Tj/gRexFEV/+v0Lea9a4mnAUKnOzN7P73JNN0+oqdEeWVHp/XrVyDKMN3Sqzq
         XyvfOK4vNNg4SIqEO+DbR5HnEigDlCQMi9XWjP33h/pZyUUMJf9cJEbHTYSdJe7xIVgq
         5L6GenpajpPmM3TvCUDFhBdcux4f7GetW1kVA2GoYO0OMNWSzyNz+zkHnzCWEOnqLDpJ
         MBPlFqECJSKW8b/LiB8vJt+wWDGPekjS3XxHyTLS29uaM77UixmV7cvi9KvK+lFaz9YU
         pXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823056; x=1691427856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=BkVCZGEUXQ+hzxnDDVmzeWLaSoDxloYKD+XRCAhOf7NqYkkRbs2PXSAGSAtp0SQGNZ
         okk7z70k4PMsoFtxqmx792SsmFy845l692JVWHt3w1fmm1n5s1IiHdQ3PE7j+N++hzs0
         ZSdMbtvVP5sNYmGI8pTOB+KV6sbxUXBZsEvvfZdeYQ0oq6KZKroXFZr+OFZIREhI7jXi
         mm3+cxZtK/ngPmsD7w0WJVCWKthZ4gFpZd/kjhefPZHdEmq5YbjTlteuY3dKLCIQLeZ/
         Dv1gkzl2TI+EoNh433DkUoVRH0iY09Tzd86sEddcnksB57LByeSsM82w9wf3bC9vdn98
         bp2A==
X-Gm-Message-State: ABy/qLYKAMBOYFRV5YdozFtDfNH3NXORq94diB1yak0sBQAd79swFbEE
        7iMjmxYa8RrkDuIYFsI82XU=
X-Google-Smtp-Source: APBJJlFHDXc0WViYFSb3R2hW52w3IhQItZ8A+xKJNI719Lf54J20Rc3nckyX4WKCIAYzzN+QzoVnBw==
X-Received: by 2002:a25:734c:0:b0:d11:61da:3a58 with SMTP id o73-20020a25734c000000b00d1161da3a58mr7589775ybc.54.1690823056172;
        Mon, 31 Jul 2023 10:04:16 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:15 -0700 (PDT)
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
        kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Guo Ren <guoren@kernel.org>, Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 19/31] csky: Convert __pte_free_tlb() to use ptdescs
Date:   Mon, 31 Jul 2023 10:03:20 -0700
Message-Id: <20230731170332.69404-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1

