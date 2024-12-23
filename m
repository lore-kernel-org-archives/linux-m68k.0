Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC521A8F76
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947101; cv=none; b=Fb7ezU1OoMPXtaiatkGihRqXC2gFnoyXD498fjVGpZSyEJw4SAho1DLuCDmG1OZDBxpjBYG+zS9w5lyEnDETQQ7wE7fiTVxGRZYgxgeJyVn46juNpNyuo8C63F9264/cfOtYWP9deVEPfu/n+2f1nrZvl/SP1odg4wvF8o1ZHV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947101; c=relaxed/simple;
	bh=w9Tb6kkg2Q49UGEfUZpSUyo28N/wow0+21NvTYUEzY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coDAmMKcKEw4mRe8kboqWw9e5VMg+8T2lqz6BVGY0U+hobE4OM357lI+E9717hASRaNh3vRXllrlj3TYBugEuNkAnEoPsfLyCdj8q3D+EEmlMCBBSxTJSvRrIECCoKx22nIGhCQJNoJMO9odnR4Ff4GO2H8lXUssLvh4Uzo8V2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HIVJzXwU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HIVJzXwU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-728f1e66418so3210246b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947098; x=1735551898; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=HIVJzXwUYQpQ6SS/FspcRMm3Qzvix8GQtH0WepRqTxj+/SA43+IfGWFymEEbvUysSF
         ALYm4JxXnawQRlQvY8qBt7VU9Vl+H0mS3Xzk/yPCcS8MceeKQTX9ELYrysku2aFCXmtT
         pETsQv8KVaGFuKo1hHeiyZgL86V2W4VoxGV8VB2aC9DJs0nxhvGkRBiI8WkdJ2oANDp1
         AmVqBr5StzgaeaKfbfNeio1C0foG984WEbM6KoNJZMOZ3JjZTlqBYrW9KxAl73sdP4m5
         2V35W9Qw45oi+DUd0Uuu5PX7K36CfMqh+4H+TqPgtvuw9c1ds1TBUM2a7cGPc+kawzsC
         lMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947098; x=1735551898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=ha0s5V7q8KjVBGVsfhc6xdRr3qdrNGKBiz2NE4tj9adUBlrAhLIhgN0QVamGl2Srkd
         GsDqZjNy0zlnZ5HrBQbZu4e8/9cvEyJl7h3R7VK3cNaqa68t4VPpONIEHH8bno/PIMy6
         LZ0ZlTxje7QQ+Q59ObZc1qyKCTO9uamZOZTZIyoTMOFIuzjdNzPpT5oQLFXVKnmnZb4c
         a4d5a0S9O6HjDPETtdCYEZ3rOCNmjSQtkEjjWpwCsZ/FFfToT608osHGW7U5MHsjLuGO
         J6Je8peP/ay38hXrYFvl2/ZHgkI46XM3buwUgTQv9nqTMOiK0VySpIUJ/LJtofSEVCiv
         R0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTAGR42UfPAgCweqIKYj4QB1BIhVsi+720KmCjJGHcqRfbrqR94msPUELQJ3oogBYR8hOXkJv84YmB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxDbOUNizpsZCHnnhX3E2wlfWNG7eyxty16Te3FlMHqYWuCMl9U
	g7NaQw+QYO+UZ6e2wmUsp+YWUGWyzph90eXoyh9GCJ7ihqwB2VzYVhB10NBABWQ=
X-Gm-Gg: ASbGncsQ1JOeS7bTbyjncWdrqIG+kYJ6ckv3OK2fjilk8KKl/OGOq1N9qab/rKAkYeS
	alVZGX5xTJ72blMs4MYdfvl51FALWd91fiPSZ2fYNhiG9EnElGOyzo0apZWNhrLquS+zBaWHF3L
	uaAYhKk6W2Oewc/W/nSBo3qOadhVFiGVf5M72LIORjHSHfhpBuCYo3/ssIdatbczm3pfDzOhit3
	7OhnSF5jWW2ZOfPhaDeta4tbuD01b55gyVeb9d9vYg/VRx1H+uZplcNyybGctDGCU79S/um5hZ5
	66PK2RUZsr9frvqB5JIDlA==
X-Google-Smtp-Source: AGHT+IH27a1l8kT42WYYi2KTFhW6smXjjCcrkYYj/EF7HLDGUXcMfllZ3ayHCCSFU+IsHMUxZvkRwQ==
X-Received: by 2002:a05:6a21:6f87:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1e5e044b1c1mr19165305637.2.1734947098042;
        Mon, 23 Dec 2024 01:44:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:57 -0800 (PST)
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
Subject: [PATCH v3 09/17] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:55 +0800
Message-Id: <df71d1bd87ace445383b8ae62087ae14e35eac3b.1734945104.git.zhengqi.arch@bytedance.com>
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
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1

