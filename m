Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD21A23B1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549749; cv=none; b=TaKDOdAdXMtaIXb2SHao/Wl32HoxYWCLga0UvlP1bT3/tUO4NSzVQEG7k0nD8S1Vk4QsA13nDfCF0wx5eJBe1JKmfml37kHgUMyc7jiAz1vBTqh+cDPKiRXJiKndpiqe1X9yWZdwuRjcdz6YCyh2XzfhtPEmutPrY8uZEYQlTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549749; c=relaxed/simple;
	bh=PKxGSwR+56aVOtqiYfVzo+PhXISkTKu7YVtS9mMtvvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrdSkKqwyjUF1HqC8QoAxp5mixnFv4B4haOn2KGSm/+lVHo8L2+6V5cj6YrpQG1STlIzfCXP4J4k+ROSHsEn6g/uJuDoTs5mguy3JS2rdp29gnEwCQZA41Ca1kLttwJcVgUP706GcdQNRWJ1wbJQskXVIi6u9Xx/8r9RFVbx9p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SEzLCaiB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SEzLCaiB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21649a7bcdcso113076015ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549745; x=1736154545; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=SEzLCaiBquLqP87POvh4DGuXyVA8LZD70im5fsYE3Qj5av0xlLXm4mL8YeV0H4CoYm
         pqT3RdzRH2ns6M0Tp5+mQ7JlzjCNafTco44BYZFn+J0/vjdenCN7CS0lI1V1pj81DkI+
         iaPnU7arkdVDCYGcdZaABEQ9b60b7irajwW4o1N09j8SNx+QcFPN8QGyUK0q7L40yuao
         +3GQW8hALFM6foG5DTZj/bnjdjLGkvAxsTTafjZ9mupBLQroLDxZuUKLKZUQDbNwdxIe
         xAm6knBqFJYFaxWdDotUxqBD1wbqADdgZxcKf1oA9fvCvlIxtOAnJzCeV0IH5zkBQeGo
         6tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549745; x=1736154545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=POwQ9q4RJ5fKE3NdHSxwAaLPGz6lNidltvQWxeSmnyuL+LzLXtpE/xjdI4PWME7xlW
         j418GZMA+gWeCkfpIcLaKokYH5wArAbxrF1VUrYC0+owPBoBQ18cNUAwjreU14ExshHN
         Y+ZaCoVePiG0ppacL2elcR0K5JphyZ2KBewPzNuyyoZyT+ZtXHEtqKv3k8fm7JIZFzy0
         sLvJneD9ozTukwV5ceUy5YOofI4ngfaWkO0ZQWYBdQcOmG+YFt4yfb773fLyRJERJxX8
         31bI6Y/VudVfqPZYeGhxl4JouroXhnv8SpQaHlwCG8gnaMZ9GFu1vz/kn3YOLdem6hv4
         t1uw==
X-Forwarded-Encrypted: i=1; AJvYcCVz806CVaKxukQGvqPX673Nm1oGugBYQ7lL07OfNxFp0iCA69IckeucZS0RO6MUsxswZHWqU6/fn8+3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw3jyjv8R9ac832kDrx4gVwz8fSdUkPeXbCIvliy9swTR7GVyOR
	oPQ1gax5CKHVWt3wAenChKh93yjtWVkgR0H8kH+K2Eoq0cJ7/3IYwd6r0G24byg=
X-Gm-Gg: ASbGnctlnHHUGI0NhOc52NZkjpIMHKH2LQKGJY+Phz7yL9k4xEgPQ84kmoqZj6tLxVM
	jRj8tJT4e4Gok4zWfmCbLhxtPu4OsVFS5CsBi/ZraDARZ01PGgKPi3g4jbLa7kcCeNCT9gRzOkM
	/qz4vZyMq3Lvd2FXrqqIYir8QWcNqoS6Yi0lCaxVXNcuxXbdVuy5trE7LYfx8xCFUXR0SsTKTFp
	87hPldJon4eWhQQujhW/oGvn0nJDMAlzxaSsQHFimHrOBnXtB4x4WYGpgp9Zk2+U0HQnptCt8F5
	gVRCW9vKmcFIZc8clHOMpQ==
X-Google-Smtp-Source: AGHT+IEdmvGR6U/qwRYH5ruA02a+sFRctKWchidIfEBAoumo12DzBepIE5K3QuQVJJ60xG/AvigJ4Q==
X-Received: by 2002:a05:6a20:a127:b0:1db:ddba:8795 with SMTP id adf61e73a8af0-1e5e08028cfmr53967973637.36.1735549745320;
        Mon, 30 Dec 2024 01:09:05 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:04 -0800 (PST)
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 02/15] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 30 Dec 2024 17:07:37 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1735549103.git.zhengqi.arch@bytedance.com>
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

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1

