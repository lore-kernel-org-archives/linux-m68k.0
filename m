Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE03C7EE3A
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Apr 2023 20:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjDQUw7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Apr 2023 16:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjDQUwy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Apr 2023 16:52:54 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A6A3ABC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:52:49 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id hg14-20020a17090b300e00b002471efa7a8fso14355002pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764769; x=1684356769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds3IS9TWlY4iXOF1Vygr3Q/N2fJxO0/Dzlxnv3cq6/0=;
        b=hr7pEt7A7XcPfK4WHrNDJyXTyW/f522/QxHB9K2NM6BmG8KnIlcSk7Prak06XFsubX
         Sjsu1MPagS5Ajy0wM6nwYZFly4hHrr9DYIrVTEdELHRdfsGo64oEk7qD+41S/NMObi8y
         l8A2tz8IWZ1X+Du4Mg5V1agW+uGCUPtQdgx1HioQtiEf01hZXw902OFYpkixEmc4936W
         rbvY3hq0N/ZSHnXC+KGydT6+ZrTUjCaNrxKIoD5OlWamJ5QPi1l2Tt7uz8xTA1Fp0QB2
         97/hz5zZCcVfwzgfNZP+zBkRfPzWu3gB3ojY6/LKA9XIpl4tn1OEejbLEhRl9E9QH4p3
         YC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764769; x=1684356769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds3IS9TWlY4iXOF1Vygr3Q/N2fJxO0/Dzlxnv3cq6/0=;
        b=NY7BudP8lebqMYx26y2d+rrA5AJ+N/GRX3c0GEPWVCPk5HmW5BkHW8s6MdQ2qTJoVc
         z6DY8WQ2+NcGzmeGaGOPZ/jgj7MS1OmwTr3dIVi41vNEueMEIclZK/sMPSTm2lNbfnKn
         wS1uTakVGYaxV3ulgHN626dvYa0M3JkjIOz6a9hfiuP00XfN0aG/U8HyU3JluDLd5GHG
         qVyPnWHO2J3tzpsSQKEs7SIuIsUVowa8cYNM6vU0s4cgHHm24cVtVIB3sMsJdBFljWmx
         hdoNz54jarBr2WElHnKYR2O4cw9kIOyP9WWyIZP/LFc/zoGit54kjSJnh7Zu/ef83dJ7
         Cyhw==
X-Gm-Message-State: AAQBX9evg841aureo8zupQXOdT1lbRBvXZAzI7UVPzbIrVbQyuTa3fWj
        p94z6Fw0IYZzmdEnGF3gOEY=
X-Google-Smtp-Source: AKy350bKOtS2RU5+UPauyBEeUGcMLqfRctd5dndnPm3bZbQM5N2yHnkL/dVsnC5V83h9pYCSEFQOHw==
X-Received: by 2002:a05:6a20:6595:b0:eb:ad6a:ccf4 with SMTP id p21-20020a056a20659500b000ebad6accf4mr15296929pzh.18.1681764769281;
        Mon, 17 Apr 2023 13:52:49 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:52:49 -0700 (PDT)
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
Subject: [PATCH 03/33] pgtable: Create struct ptdesc
Date:   Mon, 17 Apr 2023 13:50:18 -0700
Message-Id: <20230417205048.15870-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pgtable.h | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 023918666dd4..7cc6ea057ee9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -47,6 +47,56 @@
 #define pmd_pgtable(pmd) pmd_page(pmd)
 #endif
 
+/**
+ * struct ptdesc - Memory descriptor for page tables.
+ * @__page_flags: Same as page flags. Unused for page tables.
+ * @pt_list: List of used page tables. Used for s390 and x86.
+ * @_pt_pad_1: Padding that aliases with page's compound head.
+ * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
+ * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap only.
+ * @pt_mm: Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
+ * @ptl: Lock for the page table.
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long _pt_s390_gaddr;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+	};
+
+#if ALLOC_SPLIT_PTLOCKS
+	spinlock_t *ptl;
+#else
+	spinlock_t ptl;
+#endif
+};
+
+#define TABLE_MATCH(pg, pt)						\
+	static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
+TABLE_MATCH(flags, __page_flags);
+TABLE_MATCH(compound_head, pt_list);
+TABLE_MATCH(compound_head, _pt_pad_1);
+TABLE_MATCH(mapping, _pt_s390_gaddr);
+TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
  *
-- 
2.39.2

