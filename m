Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE29EB64DD
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 04:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjGYE0b (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 00:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjGYEY6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 00:24:58 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7EB3A9B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:11 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so4297282276.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258931; x=1690863731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=dIpSbxhiHoEZRybZXN/MVeO3g9uu5Wr3kckw/68K6KR19uhvm31rhYObpAHJDDboRN
         fN++WCiGx69nFrN6B8d/NLOzRwfLSelYXtCG2axa3nxyX1nLiBBRswcz9UUR+gYqr6j2
         ancXFsSIRjlVC+siGAlQPxsDtqvlS6d02kp43kWDLSl5AqbfL3SxRXE8QCvzAnUbAKUU
         YasskwMDZ8VrwnmHFnrCJmWDVf5znjGB85g4q/nAwV8W9HMi2mBDPg8zNmEW2Wmz/ahG
         Gd3GY4JptXSFLWhWmWPz4PD8TWa0sGWxRtah1a9utFkbDSvAH1sC4A2J8wMHczxZTgoj
         5RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258931; x=1690863731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=NZue9vll1u1745UWOgXPHRX/VqF5oks56pXlnS4sBLx21YKTS3b8VSHq2UTSxQ1JRw
         KxcHZogjaRCws58Je5HHdJDX1frPNT+DDjF5/TUhswzQYg4sm2SQTS65mm3RcCSddl6N
         typuJu9WRw8NhGlynJiWHzIbNqAMe9adMSBwB2wpifbPSisyy29JXn0QL6yvpdqUXmvx
         RuhLN5i5pvJLY+4qG7mIbRxFpkZ1j++o/aUJSuySHnq0EK9NgcIgIRwDJdVU0cIqI/Ry
         yG80Iz4ybWCwNYB+MOavrcPq7XeMXRe67Y2COo0MB1W73vAGMyFz8IygciEs9bQXfJuy
         vQbg==
X-Gm-Message-State: ABy/qLaqLFrSulQhfaehht2PZsoTRhd43CU877clH3lNtInKBA31i8qL
        vgScivY4G+PWZUtq2mzdy6s=
X-Google-Smtp-Source: APBJJlFFrRXSNeam/kWey2sQFPpJrG6DmS1yW3xEJWnQmkKSGkoB3AAvrxYF3pVhZLtkZcpr8uNrnQ==
X-Received: by 2002:a25:2517:0:b0:d0a:86fc:6110 with SMTP id l23-20020a252517000000b00d0a86fc6110mr5159740ybl.28.1690258930893;
        Mon, 24 Jul 2023 21:22:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:22:10 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date:   Mon, 24 Jul 2023 21:20:50 -0700
Message-Id: <20230725042051.36691-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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

