Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC21A265E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549823; cv=none; b=gAnPuPwPMx6NCfswlbM39xF6d7nAfjO8Nn3LR0HAhVpEKh4I34zGyJYDKUWz/LUOxBPWoihNCsTiFz824pbV2vej0P251T0l8rKHL2GNcAMewiWyndIgn9VAfeo82t1dPWk0LUnFxOo9plNyl0RGkiu7ruohCg2tN5++9oa/2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549823; c=relaxed/simple;
	bh=H/x1u07M3HXF9oVd+o3reuerQgd2pca8MMjlY49GFUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cK/riNZlDvpNCIkqyOEWI3J7NFq225f5JXC28pc/WhPqfa1kvksH20R2GaAqL0keHR99OB0Ivd8Vo0ISeaoE3qdXEiighkcPXFMpeBXlacOrcbMVuwT+kvqubBz2Pi1kI7fndS0dlKDknNoIUBXqxBORUq9Igm/qrgcENa60aNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Jg5fQqQn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Jg5fQqQn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-215770613dbso83813605ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549820; x=1736154620; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=Jg5fQqQnvfbYDu6X9WEwpIdHI9Ai25qPivrUrzQqA8oYEFcK1SiL7WxFSyKmh32mWa
         i9MMFHPDbuHkm9LrY1Eo9fwwwoj4uVqGFjsbaCK2aZS7gj8i0wDPiLsGsuTCc4GM97Cj
         +xl+l7f11GTlhIGeqA01wapuBgMTKk7PGLkFp62/l59x3Vye9012+jClB5qUjfoe0S63
         Dyks75CfhNG88CcXnVnoFmwGDXdyaoaSbZEwsOOtYa/fLypJz93pfKAsBd5OI3bvTqqI
         dQuR46RCayl+pJq5kyUr3jZT4NcYdegno8NPHc/ZnEuRJDDXdUZ8Jnk/P3U4vUWvAQm+
         gFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549820; x=1736154620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=vlJI4AYapMiqk2P/RcH2bM8rG6MMrD2sByIrPyKSTnYQgKriaEGcQGtNENRTSN5XVu
         IjAXgPyloKokElcrGmXD8hKLRL0qk9ipMoXwbclDyk8aotYHyViynjuHO83rLImQZWkJ
         CuY4bodve8icVtc11sG1tUpnkXGJ+6zBRR54eLaCZ25Qjq6zNgWdeeJlQyemF5KSqv6a
         b2dnSe916jm8DOuU6IMhxJJ6O6MH4RmwC7PGbEhJKU/pCCATWv/+zhYRLJSEUtnzv7Kn
         HDoPzW0R47pLdEsVwddRdDpjTjnOGzgtqrWU/t6yhE2CRUVLGy87K+KYLfq3rYaftmGk
         Uokg==
X-Forwarded-Encrypted: i=1; AJvYcCU1CeC9vuhh8dgZwYD4ZzXo/XgYQry3dZk1X8v/Gg8z7bTZXTm6orUKa59MY4Qf4FeQgZNCTbQJbQHN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwhCK1SjOn99ignYTq1JcwM9xonez7pz9n1PMiEvzj1p5XekmQU
	zF7ydZjzoZcTLLn/PnNHhriomGBBtMtk7JFu5TQ7qK7Jlkg1khbEU9BdYTg452A=
X-Gm-Gg: ASbGncu83died3JvYmOY+PVAL8z4k0waUQqoIv+irLegXKT/8NaS3+Vmq0U4HQ9R9yB
	GnnGM6F2utL/Z9eR5OENSxZ+dmKApMcEBEXR1BwuBeMBCnPT8Voqqbhg9MC6ulUG+zZC2fH/Z7N
	ZljvlkSxTJXLuvvDEMNPqB1WXFhL96sGbpFaZ2fM6pVJTj77truWP5KmKMKiw3hYqdiCB8sKhsj
	oQE40o/KWhRmLramJ9nM5UruY05+BpFzGzmd8Ouoi6cgT+G31EVYTzXXjBhyx7WJd5rBlHK14/r
	Ht3Jd7DJzTFuulCU0x8mAA==
X-Google-Smtp-Source: AGHT+IFX/3Df8AQRXbgF3uoP6h0ZSX98E/foDuPWt5IdgjLk00IpLZqU8w+lhMMb/JJOCncpjT7B0g==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e5e081c8d0mr60502051637.40.1735549820172;
        Mon, 30 Dec 2024 01:10:20 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:19 -0800 (PST)
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
Subject: [PATCH v4 08/15] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:43 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1735549103.git.zhengqi.arch@bytedance.com>
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

