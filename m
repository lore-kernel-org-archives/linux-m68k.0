Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1121D8A16
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319730; cv=none; b=IJ7PAX/mcTO1LkBEubrC+jlK7Q55wQKN4MW7BknSRbvD6PVhshPV72NBvuLt2ZbRShlOx3dmRbUsOP9GyOnkloMd2xUzo+6/nl0jZwLrR3Pt2Jj4nsYglKsj6vfJnVOyywNpyWPIVt8WnXXQMAa2rZoBfe/7QCZPRs5y1fXLzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319730; c=relaxed/simple;
	bh=JuAN2Ut1lswaL65ulGMlfU8k8Ha5cBPlqTo0nAX0MOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fmz7TgUMSkOk7LDkelX+e1mfmP462S6Z9CxeAYfE2hTPr9uHUMauzBdNMsydwkoZhaHUmKhjMz3iQQr2uDC+0ij18CN1R79qWx2cvWDbICC4A1/SzN5Gy6jgeoUT3nYMLCXVEx6s7gh5FLRcz0kjKuHCcjDce51i4wAmDnZirig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bX3TMY0t; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bX3TMY0t"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216281bc30fso25984115ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 23:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319727; x=1736924527; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
        b=bX3TMY0t22yTFFbgYgSvna7l8LwUeBFaAWaSQpyKSpuh4N2DVgjBXgTsPewGZFxsr1
         aztmFYHhSSz2RU1CTyLOPMAn+X1C7Yi9e4b6VkPgMCVPCQTKf000P44EyzvvmQK3BKsx
         HX54vKevRSGozEF5fokVctI9ZzscZCskLBjqP1I+AbAMSHEmUlMNkLBbellDXs9lP6Sq
         IpM5SPjSQrSQmYdDnOtcdTYoSLFfXlIM5FZorjM3zTWN+4OS6yxaHzJbMz5S24oSF0lX
         YdvV5p5D+FFMlDzEpI0pr0QJ9I3tjpl8/QzBywzeh4x9kCia8afLRb1criJP9pQdWzor
         zcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319727; x=1736924527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
        b=nzwL1yexsGSaGFJ3E3/ClCeFkfpSSA5rWOnGomOpmAztAY7HSPNEdmPo6a6Kl0AV78
         WbOGvU37ESKWbBYEKIZhfvxn4ikZsXC8gLRE33ZRt6KZhY70aCEFDBdWg6iGUMONNEYv
         r0n1SZal1DYE1d6/vm4xW/daOC9pkpOmbOX1DETKzrcc05WA7TTNf0KbrOZMIFTnXIGm
         8iZMDYgoCgknB6sIbILOz2e653xlMUUVVaVTH/YCifWXXGQc4lUglDucpKad9KbHXISj
         GBzHmBafWv+ol/4RcmzVPyTm5m93toZPqsEW4M0xIOMJjRp8tkNWKnY9Ycy8Thru5V2B
         LuDw==
X-Forwarded-Encrypted: i=1; AJvYcCWPbI1HQUXCZFpwD0/9VlPtzrNqUG25ricLEg+nXmuACZx6oXRUyPNCfIA0uxXLcLgcLGV+AajX3Shr@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzsmWV77bYaPfxtuLAiFwop1e3gfCyQAhgS6oXk1YBSWrwJ0ly6
	GEjwyCHG/NfDFbdWgKelOavzgDT/TA+IlSI0LXVkGZoxPt56pzl9QjScnFopQNc=
X-Gm-Gg: ASbGncsIrUq/iJ8WVZcgj2fH9TjrvfMmchXoI0SMyyc1Poh6Pu+an3s+ZXdcel221d4
	qGiibff8U3gLRe2UMy6+ksxi5/Ii5Syyljw8dS+Hj55khlV3S4ZQMHiQ3U/a2Lhik7/q2G9dmXh
	wHnES2dEMgDMhe5/pmcNG9q0uIFkAEUk/jJBr7kib2w1GciyWkMWHikRCZG6F7Kmpu882eBr95L
	RNZjvdYMQnrpuPLprj5CcXR3Mkq7UT9aoFq6+9V81JYXRgdVBPZGwr0nYXeblb+BQrNO0lwKxL4
	DNUNInTXBw1neD53tjOaq9e9VUE=
X-Google-Smtp-Source: AGHT+IFHWir1ocwTjoDZn2JicpigLOS4g472SxX6v3Yl/J2b2LHmsbTHHj3CMM+1OfXcdbPj30xuWQ==
X-Received: by 2002:a17:902:c406:b0:216:7ee9:21ff with SMTP id d9443c01a7336-21a83fdf307mr27262725ad.49.1736319726731;
        Tue, 07 Jan 2025 23:02:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:06 -0800 (PST)
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
Subject: [PATCH v5 11/17] x86: pgtable: convert __tlb_remove_table() to use struct ptdesc
Date: Wed,  8 Jan 2025 14:57:27 +0800
Message-Id: <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
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

Convert __tlb_remove_table() to use struct ptdesc, which will help to move
pagetable_dtor() to __tlb_remove_table().

And page tables shouldn't have swap cache, so use pagetable_free() instead
of free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 16 +++++++++-------
 arch/x86/kernel/paravirt.c |  4 +++-
 arch/x86/mm/pgtable.c      | 12 +++++++-----
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 73f0786181cc9..680ec3d47915a 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -31,24 +31,26 @@ static inline void tlb_flush(struct mmu_gather *tlb)
  */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_free(ptdesc);
 }
 
 #ifdef CONFIG_PT_RECLAIM
 static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = container_of(head, struct page, rcu_head);
-	put_page(page);
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
 }
 
 static inline void __tlb_remove_table_one(void *table)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = table;
-	call_rcu(&page->rcu_head, __tlb_remove_table_one_rcu);
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
 }
 #define __tlb_remove_table_one __tlb_remove_table_one
 #endif /* CONFIG_PT_RECLAIM */
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 7bdcf152778c0..dc1ab9301d2c6 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -62,7 +62,9 @@ void __init native_pv_lock_init(void)
 #ifndef CONFIG_PT_RECLAIM
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	tlb_remove_page(tlb, table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index a6cd9660e29ec..f9516024cbe5d 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -23,7 +23,9 @@ EXPORT_SYMBOL(physical_mask);
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	tlb_remove_page(tlb, table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
 static inline
@@ -62,7 +64,7 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
 	pagetable_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
-	paravirt_tlb_remove_table(tlb, pte);
+	paravirt_tlb_remove_table(tlb, page_ptdesc(pte));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -78,7 +80,7 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 	tlb->need_flush_all = 1;
 #endif
 	pagetable_dtor(ptdesc);
-	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
@@ -88,7 +90,7 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 
 	pagetable_dtor(ptdesc);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(pud));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
@@ -98,7 +100,7 @@ void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 
 	pagetable_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1

