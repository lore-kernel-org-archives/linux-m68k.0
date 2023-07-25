Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8F7C04FDF
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 04:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbjGYEZ7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 00:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbjGYEY5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 00:24:57 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877853A90
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:09 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d18566dc0c1so252275276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258929; x=1690863729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=cSKYfsxsSJS7ffOM4NEt7zqMXRoog1hv17RKdUNV14hwO6VLFQmWr65pOVoZcWEcHO
         ZTxl5sTEIPleNQWx16W6XrYvQNc8QXYYi7iNKk/WLCGUAw+9con++Nm/zKIXiRkvFnF7
         Kmn+uijjQiZlrdtiQKHDxzRwNsdnc8EVkdLLz/rRCQKPLyPDRXi+bbVeFHkpJoJjSqoQ
         LLoMyhXQM5hAlfwlKm9TGFpC4wUaQoFel3CzrwsKFljyIKf+UmRISO6P0XGMas/PtQ7m
         PZz9tli6d2qqtk+AGtTpbrNJSRqge28gNGwJ8TouzN1vk9cQxwcl+kcXzH8Il6o+JKN2
         oqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258929; x=1690863729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=Fpt0NuPGi5ZXKKVs4rNuzRLYopa8pNcxF9kPqqtMzrRRdw6p66SexjdhG+6EJ2F0xE
         uKelOWd7Jfzfee4A0Nh2HHFPniTNvXBbkqWzfjlTnG9e2ngYkYYZ2XMmK1hB7AUZ1Rfg
         QM+pL6nb/eiCKpGJovMiZ+dQzHbRVvf9UkY7M39n1xqa2cVQa4QdXtnhPXa1Iex78+yL
         PQ86B73jX2V0oQlp1fwx0qqf6W9RXsRVR1sipI/p5yjxA67Xn+w+d+NXkLQkG01ATIjP
         v763nSoWKUkqttTbLR4cl2X9e1gudnt93APDgemFyK2VSnZnp9Fb7eGPpvd7nb6R80Gg
         Ml9w==
X-Gm-Message-State: ABy/qLZEKjq7HwKayfJTlf49+BmA0qp+qUdtauTB5ZHWPpvkCJEH1gYT
        8582bEuTA0CKuWdjDIpxZVQ=
X-Google-Smtp-Source: APBJJlHinG28bY5749COLWHo/TBHjyABo5nSLZGYajOWLjAfKDEgrRU/vgHTv2Ygbb3WniVSdKl5LA==
X-Received: by 2002:a25:700a:0:b0:d16:c58a:e63a with SMTP id l10-20020a25700a000000b00d16c58ae63amr1491610ybc.23.1690258928721;
        Mon, 24 Jul 2023 21:22:08 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:22:08 -0700 (PDT)
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
        "David S. Miller" <davem@davemloft.net>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 29/31] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date:   Mon, 24 Jul 2023 21:20:49 -0700
Message-Id: <20230725042051.36691-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..8393faa3e596 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!pagetable_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		pagetable_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.40.1

