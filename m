Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0C20FAA4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638950; cv=none; b=t8V8wDLJl+CuohYztkTZyVBoUVYryNtuzlkJiF/XbYPwslbjOzmY41UfCvDXjyj2Ddsq0HIpbyCiYwwRHm5dnEjM7VjQile47cNloSf4+IGOxOkiO2bN56pBC55ql1CYstHAgXmmJ6HsKYoRVUdoxhaQLLYB7w9Xi7BXiNNRSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638950; c=relaxed/simple;
	bh=xyoxab241Xbf++2pkWevGXAMdg+Lltm4zD7nrlxitWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KEXZVi4nMXXb2O4J2T1zUWzezF1yD4ItrRzDyVSqR1WKgN5yAYj0WzRiVE3tE/uNraohprJUDFOk7W8LNkuGhjN75O9jpM0DaRECuOflMDx5Z0CmK51nhg9F1SzdIr9Mw7yVTkxJcS46FKtkQNXiAOmBkdDxbweu155+d7TGv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RZaatDZB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RZaatDZB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21654fdd5daso14796515ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638948; x=1738243748; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=RZaatDZB1rhb5E+lR8oC6XuVkz/oTYPPqwNqF6vBV6TK/W9o/5juj9GyrwSB9CZo97
         oFIq9ITY9T7EPQZUv+miQ28BhYBJZDC1A9YQIwxW4Xodhnw5X1pD1pzLCabaFlXafqT6
         x/mE+9FtAO51U4Rdz1+q4wIfFDNYI1cYfMZxqXcbNJrCvvbCgjAGX5RuZanJBcoKOlnA
         h6JFqwnhtedlHjXZ+6+Jb75nwV+3KmpVFIA0TLz2jmZGyWdWF7TIJ05Nniqeqz6DnocR
         EtJwhar0BndaUYoTVh+tIOgp0tDFSA5ispQIgyvRI5qKiWt2bL/Zgbkn3QADB9lv3B0z
         JUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638948; x=1738243748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=twu6z+boCMiuxefcN6xwxh+kzLVlXCaYJqbHwoc+Y2/g5AAqtIM5utQiB4rrfhCRrY
         0zm3ddqO1UuXhNY/MNTcmDYl+LqsiNLTHUVlmXT/wM4ALxxuZwTXPbIqBxGS0XS6KIae
         Ev4xiX4HRAGxvdVJM2IL7mOb0qnv3CtLwvQDUl/QAEqIAG82GbTKM0qe6FO8ZDP9S1m3
         ir3p0ABjhNxMj1N0G3cWBtBVuEIoLu0XQfP5IC1+4+JEesv1RtrO9QWVdUYepFjAavyy
         Ylv70ZQIAOOiFmDU4RcwY4oqbOXOTmFlq+YVV9JbXImtNxwzvTMaXTZTDLp7xAOPF27E
         NabA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4myTkWwmcIVN7MDKaBzQA+LqfI6WsRivdEEyHyOMshqkUMbBeuuLAy8RhZpUF1hZ2c7XYHXRywTj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxX+DCx4k06NCrne+KTJN0Ba++RIUr7o0/q2QvTeFiFQs018ya4
	DDZdzYJLvaCvkmb6BN3JPoGFviqEqs0lvVMG/mHujyKPb5qEKMJWNNGuGIlB2Y0=
X-Gm-Gg: ASbGnctEiR/6dv3slqgOykdql6f3NdWsolkEzfkjo/FoBGugD0PKS7hcwztcBHPRTlM
	9kbATpNC3ZvT462d1qeqbJhc5GGLoyPae1OLSgo0EIkmklyWS67Ghfa1Wx/7O6sZx/yuVjvdtIl
	SeKcYkGxbnajc8ULS3a0PcoV3lKEGRzVdIStWwnnJE54sa/UzcmpSQUIPFkyrEdSS5uBMwNZs50
	+oXRLKmjNp3QpOZDK9b+Vkcv/PCmd30PDY9DC74JNU7GT24wt+NlPQVc7JKWhXkfe8okdEnC1kA
	Ea74PFDrJa095gtYlGMlnT0tRi95jZXu3o9GHTaHaF1R
X-Google-Smtp-Source: AGHT+IFkSdO3UtmG5jKkAJtanqQZSHufZoNoVtMFPHl42HZUz79kP6iB5Pw4LWGczfrtYHtt4kZUXA==
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr376126085ad.4.1737638948337;
        Thu, 23 Jan 2025 05:29:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:29:07 -0800 (PST)
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
Subject: [PATCH 5/5] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:18 +0800
Message-Id: <62d6a04c3a0e70efd435cc2c8a4d9d07d94e7ece.1737637631.git.zhengqi.arch@bytedance.com>
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
index 10cdbe0e7adfe..dec030cb12108 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -509,12 +509,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
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

