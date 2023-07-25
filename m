Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753AAC001DF
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 04:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbjGYEZr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 00:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjGYEYa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 00:24:30 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BD03589
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:01 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ca3cc52ee62so5589310276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258920; x=1690863720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=pF3/aUrb3JX49e0u22fW9ciATl7u+MUedSxMIodJhkvCSur2UbV1ymLo02TZ+J+kPF
         Kx5HeDHnWoCFEiMJQRkEFLmGeKvRgst1SRco5Nf2sutYKL2w+MtMEjm9RYoVaVV/WbaV
         YVQVPd7LOUuBtkmGFl+FmiiuwqN1u54q2lW5pHrezKOb3piONF3+v81Wt/4bQq44saNJ
         XmrP/XQPqOefJAz6PJqT1BLnizFGrc2xSl/LadxebvB7doG0PAx8D01yebNX4JhyxCLk
         tgaBucE6SVITexqLzDjpMrpbMyKpy8WP6lMzfEvzG49OmJW0+1GrWwpk6bQXNmC80wMv
         +HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258920; x=1690863720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=AohB4mnGU9+7xPcRNKE9rhtcaAozIZaO8lCk2vnYcTRwhW0UlVm7+U7FcCFxR3qB91
         4142ktDcF5VP6qlhjZDzW82bNVTo+7512djxcld/CWChQJlp64jYBsEShSGTNGH8vv03
         QadZ56wguoqHupw5+NLH7IP+p8/tc5J635e5+UtQgPu7esegVev5+TO1w70z0HXSVJz1
         LpMdPEtLr91MAb96jol/10F/IOIO7qWfQs0kqpkczF10AjNEXsGM+4I0iQa8zuv8tLFe
         iZJ/GnBhK3tSoY58c7H8fjQ4k8bBgCK58HtVcSrlBLPXQnhW9ojVltMizxlqpmvActPW
         N+Bw==
X-Gm-Message-State: ABy/qLbG5Y3D6XTqogJRgbJZR28miznGvA5MVnhYs/724iVSRFpuhzJf
        uDEDfrIV6+MMteyW7O5YSl0=
X-Google-Smtp-Source: APBJJlEdkcahnNVyEvlWTLDmpaRsWSF5WciOnYxL0p0ce55MSQlJt+bgPnW2jeW0QxRihWyF8hwpDQ==
X-Received: by 2002:a25:ac42:0:b0:d0a:da40:638e with SMTP id r2-20020a25ac42000000b00d0ada40638emr6436068ybd.12.1690258920108;
        Mon, 24 Jul 2023 21:22:00 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:59 -0700 (PDT)
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
        Jonas Bonn <jonas@southpole.se>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date:   Mon, 24 Jul 2023 21:20:45 -0700
Message-Id: <20230725042051.36691-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
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
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

