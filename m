Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508220F98A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638920; cv=none; b=JsVvUSwShF4+OJl6iJTSldKop9WiI7utdQ9WliUTstI0Yp9hIW8aafL8mkV/WvHMc6UpN5SOy8cFqjhcgA+/61Rnl2qPtM/tBIzzeXuWz4d0PyuoiiWHpeKv2hOr6YzDA7CM2znxcdi8z5X8r1hO3rFW3r33HF2xsMM9ua0AjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638920; c=relaxed/simple;
	bh=eQ1gDVYEi4GJ9NNk990799a8vwaHFwWdA59vhGfOsTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LFfKnaGFEDhAdJNHdI9/fu/nw1KuxPOKVkgNLa1PC7hX2jSmxxdmx78JiGNWfTdwNQAFXoZ96Bo+DEOnMBstBMBxa4ZrGrtrgnPh+B2QrcrqS5rpmGpSG+qpZYOk6sPpSpmwMmSQCn9hz5GB1UMNvEIN5WjuX9ydI7LtG6G0XFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WNo7bHqF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WNo7bHqF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso12320735ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638918; x=1738243718; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYmxrc32hC6wxjmJA23IxEYTBygiQADV4kK+4R+dKSU=;
        b=WNo7bHqFpmH7klJlFfEi7DGAY0v57fsHvbDSaOLSFc+JSeYhpaxuIWAnz0+1LoBkQN
         hFBYGPy+/GGL7BA1ugb7g56j9DnJ8mPPJoMqcAFZ9RuZ+vEscQKGRq9UixFVZy5zCeVS
         xgPqRalJfPu4L9hIlmiprxUHe5cZSfB651q/AOmmNwgQi6IH7EEOLSc+VfOEF/pNTbHN
         hvAxYoRT+ZiW3Hcif0YK5Hp7cwsw6Gki/byDgeCzk6CpQsl37ThrWadLuve8gYDEUhm7
         /g8JwdW9NmKfkTEiopRcO9JrRZCEBRa0UuTKQh7q4vIi/IlTy/aVfvxM/UUz3swcLPCI
         jS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638918; x=1738243718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYmxrc32hC6wxjmJA23IxEYTBygiQADV4kK+4R+dKSU=;
        b=TSGUrqhQ0218k0VmNOp3ejmmdmGXqnbiJY+K8q+5qPAhV/0hJPxD+m5IKkiEFp8Tfr
         FvvoYCEqey5eV8UyskkNUJvnblaqiynUU+aIw1/07Yul1k1/8EIzPpe+U5pYpB6Uol1P
         Elr5pcofEd7HKjemlzsmQRS+o9pGmKEvKcs3zOTl5ejMkXfKJwTQFNQ3+gp1/dhnRUv5
         RoLXa0PmcNvsrokdXXqXxou4YvgGPlOSle0gKvVP1t3el7VMdnqRXvxY6sIvL3I9sHxe
         MRduuSy5/iQi8VsKs9CZ9kPZR7DszBrDx3VxxEwLb1B1mVGEIwZH4AfNOtVuejjS2SAj
         23jA==
X-Forwarded-Encrypted: i=1; AJvYcCW2ucwqLPx/ZL8fW2PIt2Un/eOhh0RLEKLHtI573Nl/vbV+RS5TV7M/uECQdJu1h0RvPwL+vzk6/oHC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwK8aOsFXxKNpp6aL+530YQssyWFifh3vvjqAqImnz+5jMbs2gC
	IRSPMIgZ5jOCu/IzqP8TS/7MhpPRxGcTQyXgcKp5sABu37pUU5KFyflEUV1WNFs=
X-Gm-Gg: ASbGnctgS2x6ub9z16PdLEcv8ypWL4bcRiQJVph9iJTTdPJQh7yoiaUXufw2Y3dULuo
	JdvljX2g1xPyQog6XgRlP9yWlMhfgfHZ7xd2uFihsoGvWWc73BigLJMEbOpBKwPTRI0ruNlMFha
	at1wclg14/TDSHE3BnB0QHFETB2eMU1+Get7LU4FH0IV7FkW94CG9tVHkQxyQd2FfHqNAKadm5V
	GaV6oNFJmade/FFQ/FQw2WpQpJdf0hBGLbnV8Ju1c8SU6bYAlJc9m7ouWJ8Jj8CiZcmtt0Bog5U
	rpmIPF+otasmHjYtvrxo1vehS5H6+BUsVZyYeUKZYDIY
X-Google-Smtp-Source: AGHT+IG+jllXP/317uDYbnlVUGPZ9HFJ1DJp/HAbnaAGo0uqbORoOrOrnQgvR5mS4AHQ1q7HvBksTg==
X-Received: by 2002:a17:902:cf45:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-21d9937ac97mr46072665ad.19.1737638918431;
        Thu, 23 Jan 2025 05:28:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:37 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 2/5] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
Date: Thu, 23 Jan 2025 21:26:15 +0800
Message-Id: <f32bcf7fe9740e891c4e76a92c0ef0349bb87e8b.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
tlb_remove_page()). This is the same as the implementation of
tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
convert these architectures to use tlb_remove_ptdesc().

The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
or tlb_remove_table() for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/csky/include/asm/pgalloc.h      | 3 +--
 arch/hexagon/include/asm/pgalloc.h   | 3 +--
 arch/loongarch/include/asm/pgalloc.h | 3 +--
 arch/m68k/include/asm/sun3_pgalloc.h | 3 +--
 arch/mips/include/asm/pgalloc.h      | 3 +--
 arch/nios2/include/asm/pgalloc.h     | 9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  | 3 +--
 arch/sh/include/asm/pgalloc.h        | 3 +--
 arch/um/include/asm/pgalloc.h        | 9 +++------
 9 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index bf8400c28b5a3..9d2b50265a8d8 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pagetable_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 1ee5f5f157ca7..3d35d2bc42534 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -89,8 +89,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 7211dff8c969e..ac026146e7e95 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -57,8 +57,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index f1ae4ed890db5..55a982ffb0457 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 26c7a6ede983c..7e73d2f913dd4 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -50,8 +50,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index 12a536b7bfbd4..4b4a1766e2cc7 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,9 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)					\
-	do {								\
-		pagetable_dtor(page_ptdesc(pte));			\
-		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
-	} while (0)
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
+} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index 3372f4e6ab4b5..2964e26980a18 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,8 +66,7 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 96d938fdf2244..c376d4b708fda 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -34,8 +34,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index f0af23c3aeb2b..a70151cfd11c9 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -27,24 +27,21 @@ extern pgd_t *pgd_alloc(struct mm_struct *);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 2
 
 #define __pmd_free_tlb(tlb, pmd, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pmd));			\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
 #define __pud_free_tlb(tlb, pud, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pud));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pud));		\
 } while (0)
 
 #endif
-- 
2.20.1

