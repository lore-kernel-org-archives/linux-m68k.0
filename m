Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E960383
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600807; cv=none; b=naCXYYNvEwyJVkegBvhfVgbx3iJurnv5jGetVlIBDZm2YAGEAkiUnB4/rTUdKOZcuZnCrZDykeoceLMTB7Qa2hX9lfuh+inIK8OwtvhNxlkOB7gThvq0M9tu8bNZdqX8g3qQ2meynPeKCvPqIRjOMFC01Z+i8eiUijY8zMQlSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600807; c=relaxed/simple;
	bh=upZ5tIofQze3ejJqQCCQGr80sdlpcEmZzD/ZXL1PN80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0iEefVXGhg3PjKvKuyk0EUe70EhPDP4Qc0JBPqLkcBcuf85dwzWGHtw5D04I6N0FHFomGHMQVDLAmsWwQw9+JCXM1KaPNdO+0hJCpTipvJTe8+JcKAdVENchBt8xEo97BZKwylDpw6J2izRkbU5ci0EbiOPyMvnYRmTGtEPeqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZhE7TEb; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZhE7TEb"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af51596da56so4272418a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600805; x=1750205605; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlSU4jpCWDBdI4veUkREkqvjB82MepIf/LKbKmw4O7M=;
        b=PZhE7TEbgayTN3LqdkgdT/B8nlISXPuo1QqBkQA+plchpvHbjyjDiUhApohZjpbVhX
         1gojw4vOfNpY6eHHnqGACqSGI6Yl8nV7EccynAI1DMfoLmcBnAzGE7BbNwdC5AUDIQti
         4XhXiVnfLxNS1Clui/ltElWmZa6i0VhCdPs+5gLDMvcUqVqegWw3ulJj85hurvPt6nYS
         fnXPBGiivCGBFRD2QXcVJFEmkOkZl8ZZvroS4Y92t9m9SznFjTSrJaL+a6KpeZmJq0K+
         kIaHPogfoJXdhmQc5hvsI+lQxN9erND+5aWfR4AEOsxTSbTYd3WHkETPq3gxyW9FQD0t
         wGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600805; x=1750205605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlSU4jpCWDBdI4veUkREkqvjB82MepIf/LKbKmw4O7M=;
        b=qgy/3LNtwvB5pK6xxBsQTc5qDDcotVFWZn6dB4eGZI/2RZXb3AL8yvLn1B6vN0iXn8
         40hp8mJPybsApN4U4oq8jTf5VgLEhAf8Kz7mnffWkpFpeb0aVF9+/pfhClD4Tlw1R8I6
         DpmdfH3L32a6wOAQNyR5HLv6ro8YHLgB8MQzLURL2r17tj9HSEumwOBtWUdjjXoI1cTW
         VWueePMLWOSqMn6ZQPI5ciWsE5uZ2Wa297fxwWZCebJoesTgGWKUF7r3mNEHSSh8K89N
         Jih41TYlZ6XLpMt1D4N6W6/CkmoTLeMGVofetaZCKoe0etoQPjXdmtsk6lAA6leb9IGS
         zcIg==
X-Gm-Message-State: AOJu0YyHTiAxUuDBj7nZlUhMgXlk+QC6UIbF6r7wyl9/XvR7XI/he8Ox
	88w/AQC7NxFD3UllfbT3xNaaUjejG+KHtSuzZv0R+vtR5TBQmPkHXQH0++fPuLqO
X-Gm-Gg: ASbGncvjnJ49+DSubfTtyJZAjU/ipPXSuBrTJUtZZDMCjt4+eIfigU70fOaRvPvQafH
	b9qrTc9Ce0lOyDBT312KOC8Td/YjhiOiJgCsraqqZuAZMeOjOo5J0ebTJC0/gO0dLcMsJSfEKMs
	tCblQ37Xc52Moqkg9jJHibvjeOjWY5Ksb/uJ8mJFXDxtwpWt3Vc91VXzAME4jTX0//DMwkKTCqu
	ieGMjDcgtHewqswI+cqYrtNbD+omwcDRUVXc/eBmomMI+d5lA3YpZLWx/5+5TW7LQxhLhoZZGj8
	zDKfeaDQu/AneH3pCBaILx7UQhUZy2CUVK3HptXargILGZwXH/YMBCB9bm/O6NTThJySuhlVnzY
	72c4IRxKXR5WpGZI7Ph+CMn+7+/Jqaq4=
X-Google-Smtp-Source: AGHT+IE2MxKPxK6KnSy8t+jfSq7ys8qoXWj29rbTSR2ikUVUTNQCBj2S10f8+8rgAuGmp4fyImoeew==
X-Received: by 2002:a17:90b:4e90:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-313af21acdbmr1835486a91.30.1749600805524;
        Tue, 10 Jun 2025 17:13:25 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:25 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 2/4] m68k: mm: Convert free_pointer_table() to use ptdescs
Date: Tue, 10 Jun 2025 17:12:53 -0700
Message-ID: <20250611001255.527952-3-vishal.moola@gmail.com>
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

Motorola uses free_pointer_table() for page tables, so it should be using
struct ptdesc, not struct page.

This helps us prepare to allocate ptdescs as their own memory
descriptor, and prepares to remove a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 35c3571ffbef..6a459710b2a7 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -200,21 +200,20 @@ int free_pointer_table(void *table, int type)
 {
 	ptable_desc *dp;
 	unsigned long ptable = (unsigned long)table;
-	unsigned long page = ptable & PAGE_MASK;
-	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
+	unsigned long pt_addr = ptable & PAGE_MASK;
+	unsigned int mask = 1U << ((ptable - pt_addr)/ptable_size(type));
 
-	dp = PD_PTABLE(page);
+	dp = PD_PTABLE(pt_addr);
 	if (PD_MARKBITS (dp) & mask)
 		panic ("table already free!");
 
 	PD_MARKBITS (dp) |= mask;
 
 	if (PD_MARKBITS(dp) == ptable_mask(type)) {
-		/* all tables in page are free, free page */
+		/* all tables in ptdesc are free, free ptdesc */
 		list_del(dp);
-		mmu_page_dtor((void *)page);
-		pagetable_dtor(virt_to_ptdesc((void *)page));
-		free_page (page);
+		mmu_page_dtor((void *)pt_addr);
+		pagetable_dtor_free(virt_to_ptdesc((void *)pt_addr));
 		return 1;
 	} else if (ptable_list[type].next != dp) {
 		/*
-- 
2.49.0

