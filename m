Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E916FC88CB7
	for <linux-m68k@archiver.kernel.org>; Mon,  1 May 2023 19:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbjEATbm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 May 2023 15:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbjEAT3r (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 May 2023 15:29:47 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B5930EB
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 12:29:28 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aaec9ad820so16457525ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 May 2023 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969359; x=1685561359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=JvPLlmC/XzUWqdECLyDwvfeLFLPFT450E92A3QXyvZyOZFiHjs0SqrfxeBMPzeb8LI
         K2VYtEv3r+e+UcHKuqN8TTRgEDMk5QiHg2w8LWe4aiFQNNV8Hh6df9gt7z6D8qxOouWJ
         wLPmS/k/ifaj+fNqHq4KBrLkalomexLgsPcDr4xMzpwyPwPn0hyVLwNcBBGjvlXZkwRl
         lPtqWGJrBs3wn3DJU9zWYI2bb/1KFvoVhNYahmv1oY0+idoipKM5ABGGY8tIdglpIS4E
         WqBtNig6OCJrivJLAJr7mSv5nUheWG1j4pFaa5KN6zFjtfYkKhLunWXNp9G65rPn/E55
         zhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969359; x=1685561359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=NcBV1lJ+g7E2DXLq3BOeBvdWPio/VI39KwGd8LoWCpSoVLEl2ehWSnR8j7a/HOlvgK
         MsE4xy5Z0sZik2lMWP5wEsGRKHmu+BrQI7dpvilKCNNPpuHSvxsRzeW/EEV6pXI2bG7b
         880z8AhtZTPKIdEiq8Ofem2CTN5QSEILPERfwU/zWMXGuQW6Xmb8ZPRI1jK/SruVGlK2
         JxqB2+lUuLQAmdoaeh3jEHj1no8WPa1txjY/E7MLfL366UXZniAqlXl5V062SKwvrf3B
         OWvc44r96HixG4vJUJ+pSizFQ2PJ2ODFtNpZOsUGeYzS7DCmUO/tFBM3Z9tqCAcFU5b8
         9NRQ==
X-Gm-Message-State: AC+VfDw15uRonmRmhVafNgiFTK4c1J69dLNvNZSYYdXuPI2BLVZnOeoK
        jeIlsuIWO9E1iSHrHO67jbI=
X-Google-Smtp-Source: ACHHUZ4XGLMgkIB9Q6wCsJwFAYUMJfuCSptJDhnDjc9kz87hQFDk4CAG77uXolw+VTSUtUndXFrgrA==
X-Received: by 2002:a17:903:120c:b0:1aa:f53a:5e45 with SMTP id l12-20020a170903120c00b001aaf53a5e45mr5020547plh.39.1682969359666;
        Mon, 01 May 2023 12:29:19 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:19 -0700 (PDT)
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
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH v2 31/34] sparc64: Convert various functions to use ptdescs
Date:   Mon,  1 May 2023 12:28:26 -0700
Message-Id: <20230501192829.17086-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..eedb3e03b1fe 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!ptdesc_pte_ctor(ptdesc)) {
+		ptdesc_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return (pte_t *) ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	ptdesc_pte_dtor(ptdesc);
+	ptdesc_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.39.2

