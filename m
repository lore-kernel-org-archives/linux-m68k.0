Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259CB2837B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Feb 2025 03:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455240; cv=none; b=ns5sndvQUfgkMf3A0GA136rBDdoOm2dGduMYOA6CO/TQcYAtucg1pd0OjfjKudwas8iPsSUtD4B5tS4Fz2Gv+i3vhpIZgznDlGOCG9YWy83tfzdgLmhrbEuw1h8xr2312wVtX4fOlziIWgCNzMgfnsynZmuwoBFNkalXJ8rk8Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455240; c=relaxed/simple;
	bh=007QVVVFe489JDQoxvXq6IPNtqGHUmY/RQmaczrx98Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S0GIYp1csFIJQyO7jVxOjXqifyVJDjGzN4gTVAywy4FNbTlmYR2X0znx7bCRYeTGcrz+jGHJ3N6IMJg/xVYetgNQJR01t1bwVbasr6dd2f3GUeU9vx+Vi8IwtF6WbXIYroUNTm94CkWjO6wnfp5srs+dtp7/Ua7Zvzakja3oKNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XkXYpYce; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XkXYpYce"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220dc3831e3so95477845ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Feb 2025 19:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455238; x=1741060038; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=XkXYpYceEYDdaLGZz1jYXdZjFMltlp1NNOlmOGrdQ0dfK+RNxEcZD7ntMcgHpXd98A
         llPofUj4W3h7iylTdSIfdGC//Cw1QyucMoFi8Zz9Ju8oEJRVNMcgKmiASVLl5MGTtQoy
         u35eek2YYtxKkH7pFzjEfbGv3tsbMdn6QEcm0t0vl78cCmidopuQVMjqNjvPVPbmByAA
         7LEws+RyjN7eN3OFd6KcRW4f9HVMDei7zDN4dOSiKY1Jv5Ghmr3rOHEkuQeoMsqpH0Bp
         W0fmOEvauP18EyKs0iOWaHeUNGm8He+Mm1jRsAmcNNMtLOcHE/2DKnkwtx7ZB1BJUT2/
         Lxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455238; x=1741060038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=JC8bVQR6Xe7jWV+QVZov/Zq7vpbuS0AZTl8Ng7MdY3T2/xnoAM20Ig6hqPaD+tWahm
         T/5tIPcRoMJV1Q4BVNKKsL6T5AHnSfTnZt7Zz7kz2h5yYWIitUMzGwPcURO52F66urFb
         V+hvhT4jXQ8wuozMHzN8RoJ/ns/cIcB94HOx/6I1YzbEuyS2Mmdon/cFmwlnhjEOTaNx
         t2DjC1qQWafm5BMi+g4SrnxIcW3tKlZsRpKRxE87Om0kuNRPbjUYil41B7RF7Ckmwx0L
         nP+IT/uP/XLu8HDkh+C8jQ5MndVs2ve6xtfNe5+Tf/Kj9tJEnhJCAxiTk3OFOxk/VsPd
         YQkw==
X-Forwarded-Encrypted: i=1; AJvYcCUVPhZboLQCeSH4F+wuuqE0adExumj7iVNFM/h8Oxr9AuOKWys1iv+rRhRFKLuaT5iGQqqLNX8+M1bD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyes5rV+B/2KjlKZlXSuVDSq5VjSWydP5zvn8DrRazDE1T76BsY
	uca7th4RPU6itmYwz/tFS+jTQqNY41zr8CKK0UlYUI8mRUQryorlD6Kq9ZFCRj0=
X-Gm-Gg: ASbGncsycfNuTIYH+vEqdkl1lqdCHzNvBj5b4RD81MTed/6EdZ6u+W7DWt2BaPpzdE8
	oqmjoAKzrw0ebGlDyxVKWqpR8P1JG0EfmgKEUXUMTKc3s4w43EyL3MY80WFbieHWugkQNBIqXHh
	10js27fcMY82XRUj4KWgkmnFD9RyurPefMGYKUUfEXnV1o2kwbB+JR0u2OJAr1E1ZWlVvUBrtF2
	i/3XOXjLfJq8o3dNMKC0Uh/8UTovv8zgEMgPOOhYJmdI9ZTdccEe0atQGHytiVyp1qoMCpSfVxG
	4wCutBkMQnGjewq/yI3XEuuNIG9po+yUYpsXhchTK6LoNM0U8Hodan/fZ9j/L5H8og==
X-Google-Smtp-Source: AGHT+IHDwvQZzbKv24vEjKNvLJNI+R1iJ4OqsIlmXN9p1d6u9OWq0+ZfVfD6gOTuv6xGQ3OntwSRRg==
X-Received: by 2002:a05:6a00:6f0e:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73426c62969mr26062579b3a.5.1740455238550;
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
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
Subject: [PATCH v2 6/6] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:56 +0800
Message-Id: <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
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

The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
table pages, and now all architectures have been converted to use it to
remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
currently has no users and should not be used for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 18bf499ef8801..dd292c6d3ce88 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -511,12 +511,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 	tlb_remove_table(tlb, pt);
 }
 
-/* Like tlb_remove_ptdesc, but for page-like page directories. */
-static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
-{
-	tlb_remove_page(tlb, ptdesc_page(pt));
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
-- 
2.20.1

