Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348571AA786
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319823; cv=none; b=SWDGq5WIBf/5XbmgQ0KmYehfCKgLOm73SvKfHpG5WKWnhvDy5nJAcXEBOYhUn7/CS74lXUK0xv3/4CQcuaUTPnhX4LfBBUlC72SDG+eNZs1Kfzh1mOikxOAOF5LM6JkzLupQXH/yJQOVAMVmSkfyTnFoW2lxGBb4XD8QRq+vIpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319823; c=relaxed/simple;
	bh=6Tm9tzzLwfPI5sWMJ+gGPjjpg7Ij0ovc/RrCPGoP6W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RZuHpsA8Dac3QreiCjhJkEMUeLp7nKRKUYBBkVLMfY6WWdH/KF6FG909jWiKIq9lLrA08g2tXM47SwtCafMdgni+B2EI6HF3hSS3pKcMNmq5vHmF95NzPXYpSTzJwObMrBe/v3y+B2ic7c46tk4khJNkd8nUPZlzov452aaI0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eAagS+1S; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eAagS+1S"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2167141dfa1so9535605ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 23:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319820; x=1736924620; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
        b=eAagS+1SXtV6qMNZijRa4h3AhtAEe25MGnBxuX1CJF0RcedfrE4OgDE/uWqupC5nlF
         Gii0g8WEs6apwDadPHHTPXixxEWO5tpRsKYUSB1hUiLso2N/lQJ9Zczm1UHX3b5R58KL
         8J6NDxTsecnFWRTQStr9MgNUPle0IhdblsK/6G/GmhnZ5cvFIHANZr6T9CxI5Ki2AMbO
         0WXADt9c5N8gumZWQImHcF/byv71J46uaCgDdz8i++qmZSJbPEcufa+A7Rtn9fUs/PCZ
         iYCP8D60VE6pzAnXWelZKRl2TN0lU19L+OLwq4hXQZVb82dGvsI382rroOOeZT9/1tHk
         uutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319820; x=1736924620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
        b=DdZAlhIdz5601tQRQILm6a8w3WTj04wzdG0Dx1LA6sBFhpH4Y/8rMPo/Y188c16Ek6
         gpxA2yLU3LUerzKq4cIIpHu8S4JxpPr089ia86wopIHqv1F7YPOig3jTmO0Wjj0+mo8f
         Pu7Vx4t5hvIPy7Dt5mirK6mchUlxG0UMuwNSNIqOzsewJHNRGhDuWksGSxEKH3z4HMTG
         XrVmCgM7OeE6jg9LMgDN+d4qcPEulbx35rSALO4qpJvKTgmyJ6k2cGSLqrwyT2a3iMlw
         zrxaeLupC/uTN4s94lOYqPQR1kaoRD3ozzzIZYojtVlOq8jK8bGcIxnxFNf7DIED4geW
         LUuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3X77azZfXlarOUj4EvV9mcjMe8M46YFbF2q8Cs8/wrz2OAI69i5qHaLo2iklY1zwkQQnIn2ho/zTq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YysOABrRf8uNrUbX2bZ2oSRyRi/SDE2Ev3CX5a0/agX3XB9lGvj
	VsYMTKg34i+uJBjqc83IA7n1sqRPRXhVLA5raO7GDdt8iBT8BJgDRnw3ONdsRx4=
X-Gm-Gg: ASbGncvFNzXDohe8KAeluzwe38yAqlW/W1WmjMqET+lRKQ8BD/b/ABhL+LJ4F29Pmni
	6/WfKeHAbzXzYEySDcUYERxq4cX/USULq0l3dGyZloo2R46VHn+VEaE6B75O9uIctdqLft2b7r7
	3fcJF0tqFdrjJR6ttEethzqhT7pIhtKAfGztp/eulH5nuRU0gxBwTHAN96dA4pWPbUn2x6lmlK4
	jMEsh8N8UfOOgfw2PQbZh/mlpo6Bs8efdFd1MrhCYob/kca/CRb0iZsxn5evq8LfvuifRABGudq
	u2ZdTk9+AZ2Z+cEK/9zZmB8yufw=
X-Google-Smtp-Source: AGHT+IFPhscn4ro6sBJsBOR2a8pRlJGCRsiSDouRo+43OGNlwIzbjZLHQRkjQ8iB7a2FmZbbQjyk4w==
X-Received: by 2002:a17:902:fc46:b0:216:4fad:35d0 with SMTP id d9443c01a7336-21a7a1d4731mr100818035ad.9.1736319820276;
        Tue, 07 Jan 2025 23:03:40 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:39 -0800 (PST)
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
Subject: [PATCH v5 17/17] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Wed,  8 Jan 2025 14:57:33 +0800
Message-Id: <1663a0565aca881d1338ceb7d1db4aa9c333abd6.1736317725.git.zhengqi.arch@bytedance.com>
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

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 does the same thing, so
let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
---
 arch/s390/mm/pgalloc.c        |  6 ------
 include/asm-generic/pgalloc.h | 12 ++++--------
 include/asm-generic/tlb.h     |  3 +--
 include/linux/mm.h            |  6 ++++++
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..a4e7619020931 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,12 +180,6 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..e3977ddca15e4 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -109,8 +109,7 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte_page);
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 
@@ -153,8 +152,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
@@ -202,8 +200,7 @@ static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -248,8 +245,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 53ae7748f555b..e402aef79c93e 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -213,8 +213,7 @@ static inline void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..94078c488e904 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,12 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
+{
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1

