Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0081A2C11
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947088; cv=none; b=FluNCwSkQ3U5sDWuqe2r9WXISGZ/HTmUmfsgJpqbtNSj4kLux9XS+nuXjyudk2/V+u38sidRkoMr9L/pqG6XcWIcjvhlPr7cJC9+g1KD3ikNlLg9UF08zyAXeA9+eCGB2YqFpOcEr35I7nZttsXk9p0wDRd4v2ldrQsd300y5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947088; c=relaxed/simple;
	bh=H/x1u07M3HXF9oVd+o3reuerQgd2pca8MMjlY49GFUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIZ5W54iIzOb9ktLFnwrmJQub7NrTJi++dAAMjiAUZKs9zfOw7AGtHOWjOKloWPOL2epqYzPTBmwFmOPEtYW9lEDVTJz5WQ1ixQraUtixztFtCZZDL/BjOQRoPczNy+YA8VGuJIttIx/LXCCVFSbe8bbMDrZJkXIHPQ5N6KskXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ebXEd8rR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ebXEd8rR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-725abf74334so3354385b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947085; x=1735551885; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=ebXEd8rR+bRcY6myXWV1ZN3S4KBjwUgDypwH+51qHsX9RDkPjQ94TlrglHJC8epUf1
         NfaCEHIUjDxEvvgvDUtUauhukyOB/ACbxI1k8AOwdBxUaxXFs9WU/8zHbKlgTd9Fnt8Z
         7oHL9yCzN94R+5j3q88q7IPUtZA7nYFtvnSaoOKuSQ6Rw8ty28B/+S65nzcaqIUD1dyq
         /W/sjl0lvNcNL6Komhs35MEfijM3burqyPPcw3PfXReFybcISStjoU4CY+0kuMhGY52D
         gETEErJanPvtK5Bt1nNjN7vTz2GMpOH8lY01guW4AWW6tJwwxDpkkWXzRetIoTGYTZRP
         hnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947085; x=1735551885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=bbdT6P/w34+mBL1sgYmNCWb2EkVedlYS5vQx5ci1uHesZ4WhxNFBXg+DX3mas9thOM
         pSI76XLWkdGFdbEx4gr2ES4DOGyYiEVEUi366sWYcG+mPN8xhxGgKcCB8PLqx5I4ySXA
         0Mt7KwoHk0lSvhsm6eafu/9JnRCDYeCrx6mv+VvUcj1xPU9LAELa1s0P2ORl3cht1RqM
         Z5trm+POU3sLcxgkKChsswwZcU5xOS2pb88v9P4RfQwArVDrswD61NDwqCsTea+sv5Xf
         vh4k6kfMqH5FTOLIAEH7lkOu8mofz4xIgIZGbq1pCvrgJ9P2RTQQmTtjBsxj+obJTdbN
         6Ldg==
X-Forwarded-Encrypted: i=1; AJvYcCUmKM9d+vH/GmiFuj978z12InpjwONR7Cz9SOpGGWbVXHr6QwNrcPFB7yOi5yaUhiNKaUl2mXallvU9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwUwFphfBe0ksJr9L1yTL3gEFxoVH6J4I4gKZZqxTHqucRi+pif
	yyqFaRRwo4yNN+OtqgtUWDK1t+c2TzETjGns5cdxLGtriiGNNXC065f9T6+/Gl4=
X-Gm-Gg: ASbGnctCjOAM72CW+v5wwDnNHwqj32meWZ+HP5E1aaoq2pV9c+dRlTlSEfPXqZCPhjG
	GhDYpAmeCdSmpxEZt0wS0FkYWG+g4RQInH+tITJrNk5XyxGz4aIRxd72aq4U0gf10XvME3kGcSv
	PzHgjchhXDSaZXdvLAoeGzEK20R5ttj4t4os3M8nkiCHg4qmi1n+YVBTF9BiN1f2igjohwAX4YW
	WvdtD+2IRwPJuONAUJ5KKljhhh3ylWlSC+y8mBNL3wqRBJpk3JQGrXwzmHUiEZ7U88qZZp6PLYY
	n80zOZPggrFTU8QbY0LGKg==
X-Google-Smtp-Source: AGHT+IEwnxNRxjpY566VNLJW6lRIrSoOOApqv/9DKS3yUbVNE+/391+nOnqyFIwO+T3gR5XgQach6A==
X-Received: by 2002:a05:6a00:330b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72abdd7bae3mr14443469b3a.9.1734947085429;
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:54 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1

