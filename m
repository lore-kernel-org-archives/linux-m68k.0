Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFC1C77B72
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Apr 2023 20:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbjDQUxo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Apr 2023 16:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjDQUx0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Apr 2023 16:53:26 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F63728D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:53:09 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso15384723pjb.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764789; x=1684356789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySUR2NhNYIi45iieMc0XGAHKG7J++HPTQWlVu2Tasao=;
        b=r15/y1KDif+Drf/4AN1jpq4aAvcL2g0C6yBlVejRZjViwAKdx4tN5lVxRrilW72t8W
         lxYrwwZ1V+6OuCBWGNjnVnFHs9fxA0+y+Hq/T2Xun9HaX6uevRtPhFT+6Fyn6rL6cuxl
         Z3/9OHOOCrjsch5rq9oWYEod7RCMO4fFtyd7gUBrmXZG32pCnlsISiWWId2b7LrGrhST
         kpDrkb186Ifgo7UoD/Ti/tLM6Mv74UfKgE7j3u4BhSVZUj1yrtlCsZDlhuTy+CmGW1TT
         t+a+qaRd0Bf5+Wl/CDmlKFz2wUcV2Pe9TbKsnSy3YV2N+zpAWDFA5l3JzNu+kIHHm1Jf
         2puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764789; x=1684356789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySUR2NhNYIi45iieMc0XGAHKG7J++HPTQWlVu2Tasao=;
        b=jnFccQn12GsZxVaVWlMs2zKr419TGqPk37mU8oFcDHbe09SSTYt+mQBEA86i68TLe0
         aHqxfDFbXTLVCih+giUfTm5GTzRMyY2BQQLz47Asf429dsHE1WYk1llEIkyR/OjIHd0v
         PfJc05JZNEGvO0lvGuaX0gujw7WHdu0bYoQ4HOjMEELSmXsU+WnwkvIAcJLdgvxzx+3I
         rVikJnOyl3AxPhWVaGaA99jK6XBAlmOoo3F/fiFgimlGwNRSXNZ/Bh+/7WloBkSO1sSZ
         eErmOp6nnz0UtC++bKt3C1XfA3/zlSSFzbzM5zr4yAwg59efbCEQd1DjCTJlBOA5fOpf
         pOOA==
X-Gm-Message-State: AAQBX9fa10qy5mRjaFfc/SYHD8AbPNVRI5gcd0mn7D+8rWkWNHduOTuX
        jDxfZ4rhAhdl2TDQCDn3Rf4=
X-Google-Smtp-Source: AKy350ZVl3PNdJ0+nN/Rb9LpMw5+uyjbe8u9t4N4aIteNFpQkEwBCpgg7+YRGDc+SZWH4x4d964lpw==
X-Received: by 2002:a17:90a:d205:b0:234:409:9752 with SMTP id o5-20020a17090ad20500b0023404099752mr15223725pju.25.1681764789129;
        Mon, 17 Apr 2023 13:53:09 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:08 -0700 (PDT)
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
Subject: [PATCH 17/33] mm: Remove page table members from struct page
Date:   Mon, 17 Apr 2023 13:50:32 -0700
Message-Id: <20230417205048.15870-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2616d64c0e8c..4355f95abc5a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,20 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			unsigned long _pt_s390_gaddr;	/* mapping */
-			union {
-				struct mm_struct *pt_mm; /* x86 pgds only */
-				atomic_t pt_frag_refcount; /* powerpc */
-			};
-#if ALLOC_SPLIT_PTLOCKS
-			spinlock_t *ptl;
-#else
-			spinlock_t ptl;
-#endif
-		};
 		struct {	/* ZONE_DEVICE pages */
 			/** @pgmap: Points to the hosting device page map. */
 			struct dev_pagemap *pgmap;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 7cd803aa38eb..8cacdf1fc411 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -91,9 +91,6 @@ TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
-- 
2.39.2

