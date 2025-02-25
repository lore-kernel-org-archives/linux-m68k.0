Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504541925B8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Feb 2025 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455231; cv=none; b=PnOdlrdu+yBnudnhbsjynYonPh/VyJT5A3J77pxxZb79CdV7oUWfiAQpUh6WPQyTOUXv4hRIFqYOO6e3wCYLdZyvBNXxYrgSXfXZDXpegKcgMC/KUrB17OdewIKW/aKW30SMzbzAFDU1fEgK/vHoGfIFy7VfB2zCkAcN/BCvkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455231; c=relaxed/simple;
	bh=uEIt0iOIE1wq+fFnae14pvBZV4BJtIqtLEBiBKsbnt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=od/lOGjk0s/7DXI60hOb83AEQrESB/YvGhXCS+vbiXmLed7X3DfLvzmFgaHGr6aEmJ6ZGIFbcP1s1CLa+wsKMgAoKr8MCVRrkAzFYIndBBDL5DSLk6Zgdet9dL+TrWhIb8jmksQRM0Jo4hC+mtY+Xhkbn5lj2iUwTe6saYwuIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fPt7uCD4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fPt7uCD4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2230c74c8b6so4762935ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Feb 2025 19:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455228; x=1741060028; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=;
        b=fPt7uCD4abOXRzjIJn65Z6Jc7FqUoSzGNI7IRI/ZQgxwUJG6Tle71dUmcopwvcocRX
         2uxp5ZhnGSPHKcklF+Mo0evosaL3D1x4NbdLZfzosSrHG11JBTld+K3e5WD+aP6nrGB5
         ukUjAe7Q+b+pPbfYwB+PORf1GG7Cvf3b+fNmwE2ipGrZKlsEp09NiXvNUyov1rMft1p/
         XCfwXiQi2QfdGAKlb5e5YWdQCLGeGl28zcWVK0NGfG7QztIcMKRMdtf+oZfZGK0sfjTG
         S474TPtQ2b56IUmyO/1iWajEnOCTJFzY0F9Bwyl6CUaJfSFQrDN5RETn+ofLRqsCLnPz
         fZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455228; x=1741060028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=;
        b=PkZFWVQlh5npO4ZolkpIhnhM56SLiHggyCZwhR00Le7pWxdk79i0tYN5D3GQ0TTzEZ
         13gE2fZ9v8qDWHiYa+m+x8pa9wWeA+5efmPJZsjZkHPZnKAZNEb7EO24MiKd5Dp8lAFg
         PLJgJS/nqaySlwqRJQ9hS2dfgFCh28jHCCBF+yHi1aZgy69I1SHsQb6sSvEFp5KiOiak
         06VuRJAIrUmKmNO6jrpUfIv2xbHZddrRODKXT5igbMI8hbbOvMQdOxKkSFItSu1zmv58
         704GftJVlJ48E30wvJobKgYBYtwZrbaOLwuK4aMc46vCLO0dW08bD83/vpzGyqM0X70k
         vPXg==
X-Forwarded-Encrypted: i=1; AJvYcCXrYOR/6ENI/m6vPhMerumqu07q3jSXbWQSriY7m8B8Mn+a/afhiIhymCplRPuI9r+K09Cmv/7eTljt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyVSNsI5AiIbHyPvwj+0Q5ZxAIDVEabAHGX4BeTfZMc38XUzOOp
	FBfmACZISNO9KZVAyZYH2CzLLBmTujdnJDlIiSj9wciakitbSdZmEUgUX7nxBhs=
X-Gm-Gg: ASbGncudXUK5nodNzzRApkgf1i6vbcUMpwZFYAP0CemJoo6SuIoU+pbQkoRMHecMZ8c
	haH2iJj/AnDBjumrcNzi57U5L4Hu9lrO+AIBfL+p6tUSgiRCLRY9AC5jZwf9o4bfHvYyhsHyecb
	Fa9uriqszso9ytgNblCx07whMvTOr7ye6lnnaNECNZfWFX0h3/X3C+f+ahKSq+6LRMD/tSZJHe0
	nUbJphHEf9V93anr222GGjSYG6NaQulWTWgvVfnXm2PnKlvrVa1eGhZ8ZcrInkMq1K1UgKCJq8x
	a3Xzh6WLLfaL81WEa3UoyBkYA1CeQl/DvYX/Tgpdoh7nukZC/BNX4AiDva2/QJxClg==
X-Google-Smtp-Source: AGHT+IHErQlNtWAOdWTcDw4ZwAn3kttLeu4q3Mf0dru9ScBNUcUevexLBEyVDaZ2sKSBMgz3Y5FwbQ==
X-Received: by 2002:a05:6a21:7a44:b0:1ee:cb9c:9dc9 with SMTP id adf61e73a8af0-1f0fc89a091mr2965600637.35.1740455228677;
        Mon, 24 Feb 2025 19:47:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:08 -0800 (PST)
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
Subject: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
Date: Tue, 25 Feb 2025 11:45:55 +0800
Message-Id: <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x86 has already been converted to use struct ptdesc, so convert it to
use tlb_remove_ptdesc() instead of tlb_remove_table().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/mm/pgtable.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index b1c1f72c1fd1b..f28ddac0f734a 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -45,7 +45,7 @@ early_param("userpte", setup_userpte);
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
 	paravirt_release_pte(page_to_pfn(pte));
-	tlb_remove_table(tlb, page_ptdesc(pte));
+	tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -59,21 +59,21 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	tlb_remove_table(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
 void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	tlb_remove_table(tlb, virt_to_ptdesc(pud));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	tlb_remove_table(tlb, virt_to_ptdesc(p4d));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1

