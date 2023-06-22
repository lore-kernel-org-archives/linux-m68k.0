Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3269EB64DA
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Jun 2023 21:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjFVVDW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Jun 2023 17:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbjFVVCI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Jun 2023 17:02:08 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A769D2D78
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jun 2023 13:59:58 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-460eb67244eso2862386e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jun 2023 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467543; x=1690059543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=JIPmtJWZzsFuYAbPd3iclg33SdIOk6GD+7bRoJGsXkLCA1qQrwoboYccPvVKSwty8z
         /qB14KJSfGNtyZY8gC2KXxRSZzLDqLeIztRDYfuoehM6XT+tgKnz6817MlJhyGs2y+Ff
         nzC5sPDHJyAHEqzN9xTnBixLp+PW75W3jhf77P4PsuZDMkZ6OcWV4Xi+Rqew178LHkOZ
         sutRPAF9NDYk2/4a4fGlPwKxe3Z/pKSq61jE0ZBiyKHaHi8RSPhHJpH4MRgs4uLl46tG
         QM0pvqokM6W0xltWNxHmZb4kL6K9Vi53nErkSfWOsX8epBIiO3LuoRLa0NZXa1LOWk1D
         I+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467543; x=1690059543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=colRDduexceCy26aafqgtPXzrW+XvcAyB4ldW/0FjhaB/Y8kiDExYO1IxAa796ifdh
         hupAhKRU8RO3MdW2GzbhTL/jZZeR1iXrD0HE/FNPVfAvb+mBHnP4KhRHwaaQx7CnQWcE
         WY1lFNGQ8Eje0BTbyObqBN4n6hzpwY4afAdT5KALHC+wp9mp4+XX8jOB+HuqmkVDFWer
         Vgv7t760Ac9New562QK2SIg/d7qvB/Er0Xp14+em9clAAARCcR3SklYpB1LPeP+fnfrC
         gpk9Dp3pH7L1uhaEkWgTffXkSe0ZreQ7Edn7yMLEQ1eUEwasu4W68C1HMq9kVqbnwPos
         R37g==
X-Gm-Message-State: AC+VfDz8hqdkIFEPaWK1VLRDltDb7PD7K59fugJE+R3y4DjyrvM0w6vQ
        /xyYxLPJ33SAyMXYCSwrYA4=
X-Google-Smtp-Source: ACHHUZ4B8dweYtEIi2rY8Mw0qtzsz5NxOVUlUIQPQfiDh4wzrLYoG70uIa1HADP+PMU/T07FaShgdg==
X-Received: by 2002:a67:d087:0:b0:438:d4bd:f1f2 with SMTP id s7-20020a67d087000000b00438d4bdf1f2mr9462119vsi.22.1687467543144;
        Thu, 22 Jun 2023 13:59:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:59:02 -0700 (PDT)
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
        Richard Weinberger <richard@nod.at>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 32/33] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date:   Thu, 22 Jun 2023 13:57:44 -0700
Message-Id: <20230622205745.79707-33-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1

