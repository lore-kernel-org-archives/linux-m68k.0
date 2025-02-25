Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41557DA7F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Feb 2025 03:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455191; cv=none; b=aZZWOGot353geYHzgYCc2mOReRg/aq9q+Cue5qq7gYrLQG8ffu3q/6UAQdcuCgqR3Z75lYw3TzUWUhnVqBJOQ+0wtq65heB4HoJcSuikJPE+bV01v8A5hWteWIbnvKeo0SdoN3XdbcVa3+QY2dDNt9Oxfmdrs35P5hMtRoKxo2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455191; c=relaxed/simple;
	bh=+Ao5l71m8R2KBR4pKhSeuqtrK/FFUTZNCirhHcI/U+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QdVmgwMxw47F0LU0UZLjWllPCsi+X2s3Bf0REKL/x2pMC4W3fzR0B3ZSX4syV5G5atEuJPBduK9zXkIThSUmcaxvM4apYaGKMpcaUmzCb1xFHL3UX9NoAw7Cli93mTb4jwh5MKYPjZXcIPkoLQJ0SpBVbdxIFd2jnuIwAfg19dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IgfTZgmj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IgfTZgmj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220e989edb6so139802115ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Feb 2025 19:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455189; x=1741059989; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0Ocxe5/W3x8AaSNUp1nmQA6Ns9xuyK5JD/uD9z0OJg=;
        b=IgfTZgmjk1kAkcdw5HkriIbJa3Xwj4jyE5mXQz8mz/iDYTUenUaVSbUok1cjD9zsyu
         +zHMFm6WwLkMuGe4GTORGHtzQanoKIiudA3DGaaJgSqmB+/0ca0yPAlefx1IV3R7Ws8b
         CdKqo535OD0XyXFlQx6rhr0mwJszpZiRxVeL8nXDstCDU1LcbVz99diiOiiFxUEJ3Hc8
         OTXpFgkpn11CkppoILbtWcsrw9DWrOa0B1y7ZFY8R98L4eJmFhRndEIk30CDgU8xfYw4
         YP7EKs9CkJoXeDJiKPX7bVDMFILJEENfO7FhDnoRrJtK1h/8a7KPw0wSNXgViY9T6TTQ
         p8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455189; x=1741059989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0Ocxe5/W3x8AaSNUp1nmQA6Ns9xuyK5JD/uD9z0OJg=;
        b=oYLysWozTnTp1fXPg1re6AZniFbHlPU1jCvNB1AXSlYqphbgYYLAP0lV8OowYAWHV2
         5VzQQ9vkXAecsxQNJTUB8N8nBg+P4m/1n7WDkqrRGYTLoDtozv0qFXF8GsBhAvQakd76
         uN/GPcBWevDzasyseeCGHCf43gniSLNuMKIQZlEaiprD2unTTqWtdZ4brYRs7pmWzCFx
         OX/KGo/XDMbQrtg0ElShQiYjYFfp/3lv9FJ1KSPfZrcCrWPr4LVTc64/lnc45DwGF+hp
         fqwA5BUnWZQHpV4hsNi6sQLIDFvbWHVfcPStsuMoGzMo928nQ8tF381BlToitLSOlqyq
         tsog==
X-Forwarded-Encrypted: i=1; AJvYcCUtph4SRTsJUhp8ANokcsyBX3WuFjTiO7+WDwBtqgFPXBAxNFmm8fXg8tOQUGbL75MgH0azCbBvzQGw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzyocYpLI5ZqkihrHhXK6uTZ8KsGTU/UD+fYbSAyx2UmXnWxVLK
	eqJkqsABBok4zmqPJHf00rfBXzTjJ0eCTixs+BvnWQ+LN9jAosvqa/fYfgehYNo=
X-Gm-Gg: ASbGncvPOwKlTrx3VBOKuTKcOgTNZstOgGZJaClfSfD8ez/5mbaMFd1bA+Rh85onf1E
	b0chMhFbz4VooPx6X5newOGrPMpBfjG5DWTUExPSYOF1vn+1IlLvW/PTlebpACLPkDdiafLomzf
	3v+vNVa36I/zSNzljqYFqruQV61jbP92YDtVyj3bSvcDni/xISnVDRbN/D5f4MiawbjTBpPkFCM
	OuiPQnTH18oj1azvJJmWTYuibQlY6K1bUBcZ/L51wbrP3i/hSISKHlMEppUrjUM+wXtn7vviCKZ
	5O9UioFCxQ7ACP96jiiMGOBl0+w0QzdpkImcJk8ItJ8L6IJ2e2rkADV6ToGUT6ZU2A==
X-Google-Smtp-Source: AGHT+IGBfXw23ytiI6FvQDqnu6HA+6X81xKlY5Cdi/AJkyrR2YGvsG8wye6vZ+K3tNu1qHLJYKOiEg==
X-Received: by 2002:a05:6a00:22c9:b0:731:771:38f2 with SMTP id d2e1a72fcca58-734790de607mr3427312b3a.8.1740455188892;
        Mon, 24 Feb 2025 19:46:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:28 -0800 (PST)
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
Subject: [PATCH v2 1/6] mm: pgtable: make generic tlb_remove_table() use struct ptdesc
Date: Tue, 25 Feb 2025 11:45:51 +0800
Message-Id: <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
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

Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
table parameter is actually struct ptdesc * instead of struct page *.

Since struct ptdesc still overlaps with struct page and has not been
separated from it, forcing the table parameter to struct page * will not
cause any problems at this time. But this is definitely incorrect and
needs to be fixed. So just like the generic __tlb_remove_table(), let
generic tlb_remove_table() use struct ptdesc by default when
CONFIG_MMU_GATHER_TABLE_FREE is disabled.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/asm-generic/tlb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b35b36fa7aabf..54f579750c8e5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -232,10 +232,10 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
  */
 static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	struct page *page = (struct page *)table;
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(page_ptdesc(page));
-	tlb_remove_page(tlb, page);
+	pagetable_dtor(ptdesc);
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
-- 
2.20.1

