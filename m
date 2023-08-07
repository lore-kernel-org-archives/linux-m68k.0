Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411ACC25B73
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Aug 2023 23:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjHGXIj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Aug 2023 19:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjHGXHL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Aug 2023 19:07:11 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD852102
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Aug 2023 16:06:19 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5860c7fc2fcso52485927b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Aug 2023 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449567; x=1692054367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke0Z6VjA86Q0iJYCAtHmQzMGt2iXqJZdkl8QiQF9dCo=;
        b=W+7e7ZXA6pq6bkOdiU4kqXMdaRoaFiJYq1YjNheTen2BEAKrJsHyDCwylC8TwIaELf
         OoOeKnKEm2Bup1E3lQkfzBFhNx4UEQeZdbP6gFS8EtHNx1s6wSSR8pJNy131BEuCYsID
         5yHclRtlDqB0YUpxc8mp/j3duvqB/kcSwVKs7titgSAxTd3bahGpDvqB1s5BR/l1Q8b5
         JJTz17F1sukT0v2fD4c6TeVfoKxL+4R8ZKOAgjggAvDHXskwAwGz/9+hK5mkw3BMis+2
         8wcIPPvCrUvFi8Oxcy9SzYIpq7haNxXeYlICDRNRlufgVcr5TYo9K2btnO8SAcdlpPvp
         77sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449567; x=1692054367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke0Z6VjA86Q0iJYCAtHmQzMGt2iXqJZdkl8QiQF9dCo=;
        b=HTy2g0Xz5A2t8vb4awhYElICz4PMtz77tfsN4uehYa2itzVW9IShpVqp9Uwr8vZghX
         H5MYhIAOmc24gEh5dp/Bp1KUb317kJjEXaSY3nvHua1Kt3w0ZDVk6LryEjR5wWeFh+3a
         7yhxI1G3ZdrY+fden0eJ4eKLDXqeWJOdTgS3I57ljmtcgfGjo7nwE1+X/89rgxKFT6br
         y8vtrTW8FiGpxD+XpHauORuU+qGTfNz79xwe1Qqu9mcDvTnOiPH15ccviQjzmRWuaQjW
         N1eoLbynpSj863CaKIxVqZtbTS2M2OZdAsyQou2upNJDLJ0oy10cJBxGHl8KM92OlnvR
         73IA==
X-Gm-Message-State: AOJu0Ywokb3AgwtXJGF7YhqqD0jfO+MCt3YVcJdLuEQuQ8sbTxhfUJtR
        zkCmP2WFh6N1AGzSUetYyW4=
X-Google-Smtp-Source: AGHT+IEFwZzf7hWzCaDcJ0rf5o011LKpXcZZ+QgyAwbXtivToV2K1Z3qkIAZZunAX4r/XJQivv3Vpw==
X-Received: by 2002:a25:29c2:0:b0:d4c:f456:d562 with SMTP id p185-20020a2529c2000000b00d4cf456d562mr4842541ybp.1.1691449567341;
        Mon, 07 Aug 2023 16:06:07 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:07 -0700 (PDT)
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
        Mike Rapoport <rppt@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH mm-unstable v9 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date:   Mon,  7 Aug 2023 16:05:06 -0700
Message-Id: <20230807230513.102486-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
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

