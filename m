Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9A7CA9EA2
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jun 2023 21:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239649AbjFLVJG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 17:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239282AbjFLVIR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 17:08:17 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF853C3B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:41 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-56d1ca11031so19157597b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603941; x=1689195941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=qp0OZHJwYJBDFbnZ3ou1P2Ehue21X+g8zcdgyQxIvQy+nDe0qfAi0dHJH17SnCCz1g
         tKKUvfmw/BkCu2VWGVC9FTcKBTfgeit8iCuiiB2iFwBx6PIhFHMGEsTNb4ySvFT/d3ft
         wztSHCS6L0P5NyGlzSq35fcEZtgvv+BauybZ4ibvcrCUVHnGp/kHvLFHDT0vMZoFlpUX
         ovC+Ec8QSOvfx2fBvS9GXwZis3S10LP+c5zNsCcscOq3kZyLxngh/87tdHFT9B3GKdNj
         CWUudKrbpvmp3qcd3NPPZgIOvQGRSzySt8ja54VpNcHj9wUPZRrXlqZutJQePE3+1Opa
         Ut9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603941; x=1689195941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=jfunxWqxyqQ7hQMkf+fJeqIq11LgMjWstt7g2s8mLE/kpwPh6SnBxO7hDvCZ5zNSX0
         4yF7JE8nvY2UI7Gcq9MYFMh+3E4xQK/XwT2P2lKljBczd3Nui9fQvKzfS5TFwfyp+3gC
         OmCprZwflcVdES/CVPDKdg+AZJP0Ohs3VKUFkneP/R2mCoxambi4DveOF4T+XomPAraE
         Bl3FBTwdJL+pggVqefJ/TFlO6FoAm7BC2BB0RoPuO0xxKbiKGdteBdp1vY0VpdqLB+gM
         yrYR/BQv7DPGd15XElBr1/qJQ45DCcuWfFSc1DGTQ+6SSu6gGExb70cgqq5Kj2OkT0Q3
         Dx8Q==
X-Gm-Message-State: AC+VfDyPh4+NT19dY0ZrOngxnJrqNTNgj6Xvei840Vf80d7gXo09sIGx
        cIFOV+Y8KTO54hXgqPQM95c=
X-Google-Smtp-Source: ACHHUZ6f4dQwcKAKk/nBaLFqSfud3ZdJTCw6E1GbyeLYv9ZLF94Eu4p9/l66ZpbQ0joORm5hDbfhlQ==
X-Received: by 2002:a81:9e53:0:b0:565:a081:a925 with SMTP id n19-20020a819e53000000b00565a081a925mr2763652ywj.29.1686603940939;
        Mon, 12 Jun 2023 14:05:40 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:40 -0700 (PDT)
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
        Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date:   Mon, 12 Jun 2023 14:04:16 -0700
Message-Id: <20230612210423.18611-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1

