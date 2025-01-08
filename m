Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB01E1C3B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319684; cv=none; b=D4u8rHYjOWajl710uGZbOMXaxLAZUnyMRCPUFqg3bUY8EruqXHJ5xJjzDe+vpnFhfr9gre7B4ejQe+R6nMj5CVhDDJQeXtBGFGRI6ly/aUuQw1i1ZJkBaqjbPlWK3GK1I1ex8HYdFk3z4n6ZVOLQtfE06l9cJrt5Z0/uFy7LJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319684; c=relaxed/simple;
	bh=wfTgGSVhXTkiP60cV7XgYAcbBAoscYS/kqOY2RPeVxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n4vt4lTta+5WvsKMGE19b/25U2DA6/LbpcgWV5nDRGVEax/8NSdbWUKT8qNCom+tK9VCvcszEh1lwbXekrdehZZBI1W2BGKGaRudZG+ePIyOlcYuIpTPG3usy0dBh+AK1APcLc4CK3XuB6qhiCmquRqakx/RSRRgL7tU0T8Xnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FVFmQ+8n; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FVFmQ+8n"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so213580725ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319680; x=1736924480; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=FVFmQ+8nznelvuxUCCiyHdYf3ktLnJZ86CVmQRokBmW9wADBcjf4ymXxlvEy7IEXQG
         nvkKPjHo5BkDbyxT/aF0i/dOewauzluhA3XHM5jjRVeyuzULdTO9hkUww5nJrgZJant4
         8p/2tHnHXJ/+Ih8dA92hGiS0rAnQlHz6OhGWs2/fen7A2ATpSSvRdQuPUq2Gtw8Y+0XL
         klwxwYQTCOvDni/BAIRRuQ0wzY5tIU0xJfg4W/YDyTT3gl6V3nORwkFC4lPC5QBdjd9o
         BzhcwilnI4MARLAaxzHSiL1tai5XY9wLXu2Mz9WcxWDVOQn7TwhqYXbboZWwTmOloe0b
         fEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319680; x=1736924480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=FQvI//qVS+aFhcdPCi0mmnEfRVCq7TL4ib6rQDtV9wbrIeES50x6+05Py0hYFC0l9n
         P8PkmdhH0pbz859jBvQkjyR1dRZT7OIyR3iCoiIDquwx+69luQ+6RMxVatz8xpfsRrii
         xwmdtbvhHqlfjs+0L65LZ1MZ/FeSW3aocfR0GRwIp63pDTI51P1EgC3BKY0vKuD3q5iS
         w9XSxZuEX39pnAWCgb6AWczgaWX7jcKOC7DjWk5DI+7mEts5HywYYWCseO8GMS5fEsqg
         cOIfc7H5ztyv+73dfoYFI58S9o4N7/TXt1RoT/Gla7lXie81iUtCBmuHxbf85JWne8D1
         AHzg==
X-Forwarded-Encrypted: i=1; AJvYcCWqKWpiiDbrpb/P18Z6vBz0Ji9gA3aPqqneUcM3Ox1E8WG+6evYMgq3Z6j6e1ksT7zifuBHIBZHCWnR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzgeSmr6yHzE4xY5w+UXdK+v4wWD1hZPYzznBAnIWDgfHeVhk4T
	x7qJ9X5qSZozUyhSIyGElPSJL3qCWOrPz8daJj8gnI7qw/uca6oa+u9/T+3Hn0g=
X-Gm-Gg: ASbGncuCXaqcKbRHZnLLU4aQZnEy++spOXYkOg6G5dr3hQ1+61NzsdAWFL3XxIj+S60
	yDLxoI+nItetW5IG5qOQV3E6Yge6Xz/gQp66635KukJyTEtB4RlQlvaRXbPZ+0YPE2Gjcr2M2h+
	1F4/aweguTjAxoZWGSJCJ5RCC+03sfnOAu1h5WzljC0OAL4G6HSkrlyMm0FMn+KpBlVJEZbbrsM
	YY+tJaP6L25x79P86ECOqUR3GImYuPW9IHHV0ULjDulv0OQbl5ofLiUVmb2XatYIHAyvvF376Yn
	OS4CXW4pl70GlrmDDvuL9HNIOwE=
X-Google-Smtp-Source: AGHT+IGA+MEO+KKVHOehVcxKdAaP4kVFc+4x/MGW5FidU7ZYZhG+ejtfRbHdQiRj7WdzfqmV0LUjgQ==
X-Received: by 2002:a17:902:d352:b0:215:8847:435c with SMTP id d9443c01a7336-21a83f4b133mr25527805ad.12.1736319679689;
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
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
Subject: [PATCH v5 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:24 +0800
Message-Id: <327b4b8990729edd4ce97d9d5acbdaff2d9fa1d1.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
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
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..59854c6b97bc5 100644
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
@@ -41,7 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
 	pagetable_dtor(ptdesc);
+#endif
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -61,7 +65,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1

