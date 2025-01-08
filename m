Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5111A9B39
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319575; cv=none; b=K5w+GPiR2IuKzAw6Fb4v1syKZ1ryBIOWbCH+ZUEpbxlYuPlYXF5SGTVIyHemGxKlP+OrpLj5bMBGPuQnJkTKrHOAVKzDVBSKw3d18j8WATBycuLKxHKWkRyb1T12ReX577xeDmOEvHesFEQtp2kQ1RrQAtsnROqjla1YMe798hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319575; c=relaxed/simple;
	bh=AE6ZwrHtnhWSEtac69meSe/nEVBLF2lFdOsyctg6W6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y31j69L9JYL0dy511jL2ch3LueL5WI7ku2ll9Zb6TPoy4k3vUSrIfAsoPbqUQ6UTVtre3oYz8R58s2vwNfzFq/IGZwIruEpqAd2t2g1q7DKDerKmnVD/MFwrY+zwZAW5wj31SiSVrgvJvoK1NMruCTg0pd4smSSDCXR+JSoVk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BV4QK5Gh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BV4QK5Gh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21a7ed0155cso22810465ad.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 22:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319571; x=1736924371; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK7UmD8A9xmARwj2p/zsqM766rIMmkR9OD65YlbhPf0=;
        b=BV4QK5GhFjHhCQh4YwfOwkOEdWLJrrOcM4o1X7g+uT+G1qFQf7SXED7gRK32wXLM32
         Hl9rlIoGjxYJ4j8Jnur1n9Uk0tu/VO8cGGVuzl2CcjgqneufijZWQ2HZtwfFu+Moyui9
         a9Dn5lL2WN+vqgqEecXWhnRT9IME49pYWg5SChBa3azlBFfeRlmJbPkZ1OO9iyjlspLd
         79/IfhEC2WeT6qAAw+CpvkI8tu+9ossSiIymt+54cFl2ZmTWZFwZWOx2NgKdmKEOHkLR
         u6oiXhZNJUYLs+yN2Cv3M28xC7nWDaC/hM9H6VepGSemZuwW+ll55IqZROyreT3t36Rz
         8zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319571; x=1736924371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK7UmD8A9xmARwj2p/zsqM766rIMmkR9OD65YlbhPf0=;
        b=iQmf2wwUw80eX3b11vXKh8Dc5mJzUjj6IaglHz+63RgiZHZoUVDtGn/rZzXdnTedSO
         +c8w/etBSamvhgS4rs4jlp8qrXGBLc68HaHcPSO6gF8bqt6yM0c70jK3WSTKDu7E7DUr
         ipoCxUhygDCyJeHBSFAzauOIW8+0mhOKgwjefl2VMa4cR5xni0hEpKsdZ6UoVpyaAeZP
         HC/1Jb/4oR/Nxr+6/OdMWf4zHa8HqJdqi+rgsRj7AAv6LbZN79OHFr0RBVMbTXZueJdu
         V3sPT9yXuvl4m5kUJl6iys/v1T1SjUOvgKnfz3OQwD+RBECbD3SnulBkVsiJx/goet7O
         D7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrBfm33roubYj7AxitSDNj6Kn4Zmrgg5b1rM4fPm6dHx3R8He+08/vpgaltMO7p110c1AAS4pdF/7U@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwJqQVnosqnxSO7dQyxMj8a2Pj5MEQkrHSCAfvucxEYUCJB4g4h
	JgQhX127Jjh9NCPFryFfDVU+ka7KaEOCtRZlFw8QXYIqdFoqNHsayCVzdL8hpDY=
X-Gm-Gg: ASbGncutCfQRbC4ULchKHaUym/l12cr5zm1WTHTj0yctDgjU2cJOGc3ZPr8FItYM/SS
	QjW29UtzkLde3Tb/RozekHM3QRHio8J3ttddT/ly3En0Q3ZvJQzRM/IfoegP7GTi3L9Lt14tEdD
	aI4REkPm/8TsQWYieeIsNTdEpWYSlawawcooxqkQM8eK3PSFVTnlIqW6d8iXO2KOshJYby9863W
	70Oed8aqCSA8r9/uAUiJaSlPlrCrZYKmFhoYf/XJT07YtZJBxoNXp1rqHRrZXzSO0+Fc6hOJ0Sh
	sfiODKeRipiZ5wM7R5hj3wgt36s=
X-Google-Smtp-Source: AGHT+IHPv/02/1SYwL+5wvpHkGRfZSWRMZ218tgsJxwry8Gh8x8rNq2cUbRiuSy0SgfT7Mb+CNVIfg==
X-Received: by 2002:a17:903:186:b0:216:34e5:6e49 with SMTP id d9443c01a7336-21a84001250mr22590365ad.57.1736319571238;
        Tue, 07 Jan 2025 22:59:31 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:30 -0800 (PST)
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
Subject: [PATCH v5 01/17] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Wed,  8 Jan 2025 14:57:17 +0800
Message-Id: <366002e0af83f0d5cad3f356db036cb6447492f7.1736317725.git.zhengqi.arch@bytedance.com>
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

This reverts commit 2f3443770437e49abc39af26962d293851cbab6d.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h       |  2 +-
 include/linux/mm_types.h |  9 +--------
 mm/memory.c              | 22 ++++++----------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d61b9c7a3a7b0..c49bc7b764535 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2925,7 +2925,7 @@ void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &(ptdesc->ptl->ptl);
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 90ab8293d714a..6b27db7f94963 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -434,13 +434,6 @@ FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
 
-#if ALLOC_SPLIT_PTLOCKS
-struct pt_lock {
-	spinlock_t ptl;
-	struct rcu_head rcu;
-};
-#endif
-
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -489,7 +482,7 @@ struct ptdesc {
 	union {
 		unsigned long _pt_pad_2;
 #if ALLOC_SPLIT_PTLOCKS
-		struct pt_lock *ptl;
+		spinlock_t *ptl;
 #else
 		spinlock_t ptl;
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index b9b05c3f93f11..9423967b24180 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7034,34 +7034,24 @@ static struct kmem_cache *page_ptl_cachep;
 
 void __init ptlock_cache_init(void)
 {
-	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(struct pt_lock), 0,
+	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(spinlock_t), 0,
 			SLAB_PANIC, NULL);
 }
 
 bool ptlock_alloc(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock;
+	spinlock_t *ptl;
 
-	pt_lock = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
-	if (!pt_lock)
+	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
+	if (!ptl)
 		return false;
-	ptdesc->ptl = pt_lock;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-static void ptlock_free_rcu(struct rcu_head *head)
-{
-	struct pt_lock *pt_lock;
-
-	pt_lock = container_of(head, struct pt_lock, rcu);
-	kmem_cache_free(page_ptl_cachep, pt_lock);
-}
-
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock = ptdesc->ptl;
-
-	call_rcu(&pt_lock->rcu, ptlock_free_rcu);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1

