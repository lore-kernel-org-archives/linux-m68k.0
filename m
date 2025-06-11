Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018DECA52
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 00:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600806; cv=none; b=l5xNuuev4YZtahM3jv+OyapvAXzITrKp2pgSbyzWkwjz6vIDN1hRkb4EMVzd5X9INOUriqSzOp65T9IReK7FDd48m8GW25xkOXBsBtaqHS8s32i2XyerdHgl6ysm6WGTMAdWbmaWTGp1vJr59Q+3BsmPnD4SnmpSWeAGe2DHWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600806; c=relaxed/simple;
	bh=SNItmd5R2WhZINe253nyh/MHq5OLywdOxcZlfMkpENg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS8P0ZrQiDSZ7hAMrBQjNH76d1k6Op9N1HVtzVISHzvOP0DtLYGZSNjM2AVjIs42xu6rNLm/LJRfwrAC0luoHijIjP91G2OfHBM+SKY0oe4kya0tytaT4gOcV4pC3YgOrXza25mo5QbC0xCZ/b7+xEXu0OTtobcYCGvQc4uiNp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALxZZ6ju; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALxZZ6ju"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so2422485a91.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 17:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600804; x=1750205604; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwNzgrxrzZm1rRDLFM6hWfUfWXH1JJ/RfVhLHdqYs2A=;
        b=ALxZZ6juG8ONW/C4gS8OMmFuZeZ60Eb9WwkOtTSJw+F2SdN0IYDMsqX7F9QSfLoP4k
         TNzxFn6kX5kYbevBk2RpCNGWWOvWujdPBs9SXJyGTr8a95rNCIUuqR2ocr0d/rMU+rDm
         Br01Sd7Na/g1aww8UUwL8EnCmE1W82ddU6AoF93eRNEEHo/Wsq1XFHeCr2AhpGGqaQKI
         P5tQsr5ZxHg6khoF2OuNODSlwsK0szzNu4FSR5JFrLBN1cAyYkV/5k+6/4lSSV/lLfzP
         1i1N3roToFcu6jI9X08Z4Avnz2jBMKCKdzYbx3ecbMAD5iSgYuuVtCzV2C2qgla/v3i+
         mQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600804; x=1750205604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwNzgrxrzZm1rRDLFM6hWfUfWXH1JJ/RfVhLHdqYs2A=;
        b=UjZCwgcOqCu3A/kyJXffPo+tygZ/BrFmfu90LV8+GHnr6ypEGCWNOvGgWkmgVRVMcI
         fAriZyz1+GuW93GMaYjhEiwpEb5RbA1Z8TVGMwMGoYp9XGS58JUJ5da/X2ReoRJiytcF
         aMJpKA104w6RgdKXloAH+HLCalNYcqXxgihb+s/Rj7HkgofV1CTkUFGcu2Sx/1UukpCF
         0aueg1KyerZtmNBN14nc2XIueb4HgMnCm6z+t0b5bixQZelsFssQ7vsNqm+To/JthrLJ
         eQAIKOPXTj9z237ERQzml8zNiRe9Mq3ixy92GJs32JH5oLwrAkTUpNWrwGIaDIp/SeSk
         y5Jw==
X-Gm-Message-State: AOJu0Yzh9vpy3TW/qdH9Yl5GUIW2bKacwnk6CNXT0arQLyZjRUDk1ZRK
	dXziAUObOM3VxMyKiqAGb++FPnzth5jC28p1gJ1oXPpxV9hDJbYo32LR
X-Gm-Gg: ASbGnct6aCeiVSZPPSgWbQmM1lAfCN25xSq0H7w5ncFNmZPjipHNpslmhxXalPOFo+v
	xlUs7q/bKHoCO6FgzAQx1pH7J368qI622CbhcTN/+3xDK868wW7cZRgKxCOR5sr5tkbKmesWVon
	xM0kwrBcjRAfDAfp7HAV91CTbiZtZJEqHlXLqKazeHe54BEY9AZrbmae5778GX9uxpP+iSTEzrk
	mzyFRqXByBHzI5Chrb3cD16g1LmcCerreYZI7L26SBJy+fjeH4MN1cYxf2xp+PQ7I3uB3W+IT3k
	v8D6eLlmTKnWXGcOflH20fMDFQm9DhaAFclL5ru/K2kg8axidTFc8gOj7WdnsSmIQaPzDYUfjTZ
	XXjaBKx5YrDgJeRG5BhBd
X-Google-Smtp-Source: AGHT+IEnVIJq8re2nkxKhrVozBJlMxoUvTXEOoZn3mbH4xRKhEQUjhgYJTFjn9s27Mup4N+t/eXxRA==
X-Received: by 2002:a17:90b:274a:b0:312:e1ec:de44 with SMTP id 98e67ed59e1d1-313af1f4a63mr1816899a91.27.1749600804133;
        Tue, 10 Jun 2025 17:13:24 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:23 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 1/4] m68k: mm: Convert get_pointer_table() to use ptdescs
Date: Tue, 10 Jun 2025 17:12:52 -0700
Message-ID: <20250611001255.527952-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Motorola uses get_pointer_table() for page tables, so it should be using
struct ptdesc, not struct page.

This helps us prepare to allocate ptdescs as their own memory
descriptor, and prepares to remove a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 745bd575dcfa..35c3571ffbef 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -148,16 +148,18 @@ void *get_pointer_table(struct mm_struct *mm, int type)
 
 	/*
 	 * For a pointer table for a user process address space, a
-	 * table is taken from a page allocated for the purpose.  Each
-	 * page can hold 8 pointer tables.  The page is remapped in
+	 * table is taken from a ptdesc allocated for the purpose.  Each
+	 * ptdesc can hold 8 pointer tables.  The ptdesc is remapped in
 	 * virtual address space to be noncacheable.
 	 */
 	if (mask == 0) {
-		void *page;
+		struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+		void *pt_addr;
 		ptable_desc *new;
 
-		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
+		if (!ptdesc)
 			return NULL;
+		pt_addr = ptdesc_address(ptdesc);
 
 		switch (type) {
 		case TABLE_PTE:
@@ -165,23 +167,23 @@ void *get_pointer_table(struct mm_struct *mm, int type)
 			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
 			 * SMP.
 			 */
-			pagetable_pte_ctor(mm, virt_to_ptdesc(page));
+			pagetable_pte_ctor(mm, ptdesc);
 			break;
 		case TABLE_PMD:
-			pagetable_pmd_ctor(mm, virt_to_ptdesc(page));
+			pagetable_pmd_ctor(mm, ptdesc);
 			break;
 		case TABLE_PGD:
-			pagetable_pgd_ctor(virt_to_ptdesc(page));
+			pagetable_pgd_ctor(ptdesc);
 			break;
 		}
 
-		mmu_page_ctor(page);
+		mmu_page_ctor(pt_addr);
 
-		new = PD_PTABLE(page);
+		new = PD_PTABLE(pt_addr);
 		PD_MARKBITS(new) = ptable_mask(type) - 1;
 		list_add_tail(new, dp);
 
-		return (pmd_t *)page;
+		return (pmd_t *)pt_addr;
 	}
 
 	for (tmp = 1, off = 0; (mask & tmp) == 0; tmp <<= 1, off += ptable_size(type))
@@ -191,7 +193,7 @@ void *get_pointer_table(struct mm_struct *mm, int type)
 		/* move to end of list */
 		list_move_tail(dp, &ptable_list[type]);
 	}
-	return page_address(PD_PAGE(dp)) + off;
+	return ptdesc_address(PD_PTDESC(dp)) + off;
 }
 
 int free_pointer_table(void *table, int type)
-- 
2.49.0

