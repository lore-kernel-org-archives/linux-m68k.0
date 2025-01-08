Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9E1AA1D1
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319652; cv=none; b=FumxcHfphfVG/nnsXq6nWiD5IbdVxtxC3Uxf3BsS0lwUqP9J/hNEz/kZbc1cyrkZF5sKRzIv0mlLJN4QTQZEinzqP0MpVijcV739rL9+vgRMLUdm7/7ydoTyJQXc3aHFrDy+3PBSz96eACVO4Ue2gXEswPY0smnbGqlpPv/I3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319652; c=relaxed/simple;
	bh=aGqvHL2vBr0F32b5nn3s88qKn1CLr8WeccygZVRBAEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFTJKOZHWJIb+mdzdheSZ4WgJtDlEY1AmdnKpj/L3aatjJanr4ETijmfXMDJBMA1CACfV+bgv5ZbxOi1l2HhWDjTA7N9+ha+4tPSDS8mmYDOb0rkRIlxgNVXBn4jTqbT92nSFPek00WEBaSPO0sfAR7tP6LifvrYihybwQR2Dto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QeM2X7gE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QeM2X7gE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2165cb60719so246885315ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 23:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319650; x=1736924450; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=;
        b=QeM2X7gE3zhquFd9/5yYOfR//nUMJlQFIb+3zvoPSI8OcSvbRIc/KxQ26eVFKzz1eb
         qmiN2+7yCFQkWVpFMOmTWMg0GRcCRPn2gE/AGdrm2Vhskppw6I1+ae6NhDOspkTWy1al
         gPSBaSaWboeIBMiOOomYoB1Aflr+K8HRWGh9LTBpHErxKlfNUO7kP7Y1kwWX9I01fUMy
         3rCNYA86SxsrjkacBzezrka7j6WsF4CbAMcsHMHq2puth3YUqpaomzp/clcl7GEzPAE7
         +i5hBtHNqlw1v+rNWvXqdG10BJiqF8B0gQtEp8xgS9hcURiEEEjgfCcWRrgFaaupm47h
         kw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319650; x=1736924450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evJHXxUH8wpRsLAfhvt7S2AIimf3Ggw2vmlVHfN1TNM=;
        b=pH/QwfPJSdkLcBsmK4xAKpsIFKIEjPLgh4g6T1gx5mx1axmGJjJkSCiOdZHQlzsZeF
         bMMp0FjpAWWVKnVm/zX/SyhJ6XzImWMBZ+LpGB+ei+2mLxm8yqySMDjVCwYV5WBeJxlK
         orXz+l3L68b5R1fczhtd4SZz7dkVrmctnTDq0JhjmKKiRQ6N0FtLjCCYKxQlJWpFXeFp
         ROODQbSZmPqsFz0KT21/cZJVqARxBv7H5CiozaYUYRwHpZpLmxUixNyaG7nhiqvUqEuT
         nmwh01nh06NSejJPx2CS7IDoh+Ecdnan1ZuUCzGT7Z46gLi4PKVBmMWdIQdciSoJsStM
         DXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOftIHlxYVs2kMCTEzSfujUXXiRCOZmnS6McohVon/yPmvWdAfyCkKTwk9ptvBnwRT3eOGuUOxCtur@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxCsVow6znA5fFzQGAhRLoaPVBYziQzWsvPSo0xL9AIS5cGVEnG
	fB6OszR4RKRiq4iptnwk6oYi5MJHQmNd1sbmMgBhBVLoMa7UhKuTW3Kr6y0g7SU=
X-Gm-Gg: ASbGncuYjbryklNdihxsVUGVcY5O2Bo9eVj1CGr+G9Dl78ujK+zkWoqWF/b0wJ1vKn9
	M0dwR6d53sE+CUuzFLNNLgBhYuMDC3yfYXRruMWR/BzuUZvyqiZ7BcaBEBzbtdg/IqStoVMiK/4
	Ic1calh0Hrytu8X9xB1dNmJIv3nIP4unXASvsJRuGT1nHwi9JLJisZJHu1oS4RliR9xLREQCWDR
	EebOHa6hiQVSV7Un2j61VWAtvRlkNTRdnq8+cC67gYpd1QMnuyN9uQ+NI+j5BqNvYtXhbQpaPZ/
	iiRt875rGO5pJEyk69xFF9Robeo=
X-Google-Smtp-Source: AGHT+IF9X6lXCsguwyHO5KdCHubvdTIDd4Y888fAuDMWr6lGszjnzuDzetJYvdD8sXl2Z0Y5NvXbNg==
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:220b with SMTP id d9443c01a7336-21a83f4f43amr30110425ad.22.1736319649715;
        Tue, 07 Jan 2025 23:00:49 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:49 -0800 (PST)
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
Subject: [PATCH v5 06/17] s390: pgtable: add statistics for PUD and P4D level page table
Date: Wed,  8 Jan 2025 14:57:22 +0800
Message-Id: <4707dffce228ccec5c6662810566dd12b5741c4b.1736317725.git.zhengqi.arch@bytedance.com>
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

Like PMD and PTE level page table, also add statistics for PUD and P4D
page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/pgalloc.h | 29 +++++++++++++++++++++--------
 arch/s390/include/asm/tlb.h     |  2 ++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 7b84ef6dc4b6d..a0c1ca5d8423c 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -53,29 +53,42 @@ static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
 
-	if (table)
-		crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	pagetable_p4d_ctor(virt_to_ptdesc(table));
+
 	return (p4d_t *) table;
 }
 
 static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	if (!mm_p4d_folded(mm))
-		crst_table_free(mm, (unsigned long *) p4d);
+	if (mm_p4d_folded(mm))
+		return;
+
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	crst_table_free(mm, (unsigned long *) p4d);
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
-	if (table)
-		crst_table_init(table, _REGION3_ENTRY_EMPTY);
+
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION3_ENTRY_EMPTY);
+	pagetable_pud_ctor(virt_to_ptdesc(table));
+
 	return (pud_t *) table;
 }
 
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	if (!mm_pud_folded(mm))
-		crst_table_free(mm, (unsigned long *) pud);
+	if (mm_pud_folded(mm))
+		return;
+
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
+	crst_table_free(mm, (unsigned long *) pud);
 }
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index e95b2c8081eb8..907d57a68145c 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -122,6 +122,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -140,6 +141,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
-- 
2.20.1

