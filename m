Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098131A2860
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549896; cv=none; b=p9siAANFnzOWJNn/ks0rdB6WkAqrXNpVKgSz+lWFIQRD0+7mfls6GFVsRS8xRksfnrABPk1chFcIDPPwFhBOJ4ctMM0ScL58pDJQAxEKG1A0FyOT8XChqM/bcyONQObmDS1x1ptLuGsux2V1YzzU04SFmE86wlksBmenhrmEXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549896; c=relaxed/simple;
	bh=AOHzYz3e0W68bypaywk5PqwWiTbsh7X+wa84FHfFzTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=my/PJUI6/rU6u0oiFV9fYErMu1tmq4KsyhPF0hNHKTKP+VYfgQNmj+A1cW/l8X84lF/khw0oPoLWHB5tB3N6IEBfinEP0MrlCFGbl2ne9nqrGCCQo/tvDudgs7k+Qe4UzpK/+1D3xVCBrNsjZWjxHeIMPaA2TVrnHig1ftIk8aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fKB2P+RI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fKB2P+RI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21654fdd5daso108579775ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549894; x=1736154694; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=fKB2P+RI500yp4/ZdMVINm9aGmSbmuW8t4MWzOi/BrK50SbW8KLN78GpKdZ3OS3fIE
         w1F81E3AFyVw0nDxaavoe7Pg6JNmkFZObsDR/4yJO3yJMWYDl4aRjCuwgdeGNiZVJ2qK
         E3Jo8zdzziX65eX3uzJFt1yhi50Q4ggmHXtvtGZv+Ub78/WGkk1FVNLTqfjeF+eK9UlR
         kkF8txiDCBV8YSmyq1Fdc+jvcRXuh0VZhRjD9eugkM6TtwiKkfnriVTOH+Ekgw7wfPhV
         t0jzzAOA9Adh4GvP/+ORW6pxe5JSeUoA89Fq1IJZOOnyHxUyuCa9hYHaGF88W+vrCEFD
         P1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549894; x=1736154694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=im/2dzmz7naWgMduQNpKWCIdk8U5NT1vZK6YbY3LfyJGb0jyLbqYYVR/7a414LHPaE
         7iFOYZEroEhZZxtOzG6ZXjIpcmPuI2d9oW4HoC0Ube2DxrdFyOeJ3LqL+aL2JBFkDs4o
         WH+s2crRhOywIZfSgBGhuSi3Oik2Jy6PAFy1ZTMMVcGc2foP3ZD11SnIcPC3jKui1MJ/
         s8B93G7ErbRGXq4y20OwRB133tGHEMj014Z5pcc62Q1SRkpeFANvNZIkuxhA3xwI79c5
         s6jrRewPej5OBhu3H0hHS647yj0gyZxbieyNLi/YLKz8n81SrLYMi8JVdXzpDHHAHvhC
         D++w==
X-Forwarded-Encrypted: i=1; AJvYcCXrHZ9G/yZFO0VJtt4tknXVnleYUHJP8PFtxkzw4idcrX3ukUbxTwFEPqMvSG3B2c1TPm6jFXGaYmCZ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwwzfMi0qt73mkQ3qWjdPQeI8kYr6BAPpHpHlOwH3ivUpBMvVmj
	KvA1g1A+pMtwuVNQBqFDHM9gjycDGOc7SlQR9oSORqgx0YWnhBF3f19kPoEyB+4=
X-Gm-Gg: ASbGncsHYYontChvgC3DR/fIzkVl9kZVRq3PAzPtlu+iyF2HOGfqsZrZLgJt1UHt9Xr
	YO2o9zndOs3Ke5B2Z+0OGzI1D0/WUCFyPaHTiun0srbG9kH4U9Js+ZRb/3Uah0ghRO5NQdVkcT+
	V+CKtYpdk5Fx8XUv8nNyWb+c8MAFvp1vb+HliiwcTfDKDcR2uxkARYKOGhSMH1jtXcbJt1u/Rx6
	ONv0lnD++2MZsqqe5UuMxZD4alQJNm7xDGT8EtcHYnjMgJo7e4ujgGpVzR+1v5IT0ArIyLxnnwC
	jhZA9q9933Y5KaJSd7rxAg==
X-Google-Smtp-Source: AGHT+IF2zawjY8HUYTCaMJHzWmoJ2TNFStaqczmOTvWfDCo9S9fZfm/YNlaFMm14SUWbTnX0T2oRFg==
X-Received: by 2002:a05:6a00:600c:b0:728:b601:86ee with SMTP id d2e1a72fcca58-72abde82a17mr50548930b3a.16.1735549894520;
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 14/15] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 30 Dec 2024 17:07:49 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1

