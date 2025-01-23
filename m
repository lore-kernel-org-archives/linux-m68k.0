Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9B20F98D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638911; cv=none; b=m50dJHYn462mDXqB07NmL6kZDKPOkSIl4c6H/tkn1OXfXYiXaCXDLX2SwxUA99kgW+f5wqvU0ZsnCCvQ8nCEJCUpMKXSJG/v4gBhrnUYNuwBIQfX45zNvt6AbLMmSUZ4EPgjpjR5wdwFeP5nbz2xnJj0Fv78quSQx9EbdJD/Jm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638911; c=relaxed/simple;
	bh=FefxEocj4IoJjXKARUpJHCYOj+T2Zg9VgaSRz05BYQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NR+S4F43jDWU8m/7dq+nCUzTSXkroeKtSPINDTWB7GpnFz+1TLf+8WuzAfPGoXVvO+jdrBD4MC4XPutDfvi1ua3prm4vRFTl1dYv9NsbVod4N8425yhpUDnqniRsToWcXm/kRQThlJF74vjzKTdSnHd80PInWIRLwkBWSjg3Hok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lWCiQa1m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lWCiQa1m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-219f8263ae0so16873235ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 05:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638908; x=1738243708; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDJpscd5iDH1/vb94JK69W34zwsdKCnkCWvmFoEl4dc=;
        b=lWCiQa1mvlrzkN0Tc8v3VDL5tMT5pDA95Hw9naq8lR2uWMJe24JqNU9emhgT8TB/2x
         m8NkI5V0GSl9JEqejslsoI4Im2uxMXl632i16EvRoCWVwWyuBLPu3B15hkYDMk6EHYgh
         S1+/bULGss20m0VtLPjfggAnFD9dc1BGZWBL88Ezam6DxDCgxSUYgW4xjN/+KLVsZXJ4
         RrHe8QvIE/w312x75Le9u5HqQUz8Xj4p8e19BidjaSq4C/5YckoCyMch21md1xuRCndf
         ZtyJr/wG/We6RgjiECpSlQBsSIuMXQB5FwjnO2N3iIc3Vo5CjbNU3kuo3xNR9hdtm05q
         rD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638908; x=1738243708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDJpscd5iDH1/vb94JK69W34zwsdKCnkCWvmFoEl4dc=;
        b=MmfRL5F6blbq2tOJI2F1cysPQ2W4oX1fbKyO8sALvAjyxzBNBuhW3e3nOFQ/J64svH
         BOzxYxK9nCJBbBgtFtnW6JW7fLLCvlIMAgK8lFq55oFJMdijmMk4F6KwZq84re5fIQsw
         3ak7skVWUiapt5q37mJz1+CIYIMat2zIZeP2630p5DCZv7ViLtUcxTBwJyQa21GZGmAb
         c3GisLrx2O2LE5vAXDTWTiAfrK2fsL80gDs2IJU3ndlO/kF2sS3zYFe4qVFAtDurwBH1
         vjruXKIIgo/b3Bv/MpPbS7mtYL0Nt5pUfMTn/cBFFAJgYjxeRtT2PYjW5uuVlUnISVdu
         LKeA==
X-Forwarded-Encrypted: i=1; AJvYcCVjfikcCWWwDeh5dEenxxGZaYbMkBU8J58Vj++0zA3bCGtK5AG5loLj2/Ad/6V/emYW0Dk7ZVW5wm+Q@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxY1MqviOZqRzrwXk5d72SSTLYKb0qP1UB1IpXBmoM/4WDt1kEb
	dkSpyf1ElXBJUHfbbEIe4hhkB0eQ4K6iAwwWlLHXbSe3Liv1htUVDyhZOIC1Tn8=
X-Gm-Gg: ASbGncvCIILwVKGzsNRwd2Ttmcc/W0Pl4D1KQh/k11n8XDyOeY1nOovfvFpgEZzfRXH
	2cVVAwVL2Pi62o5RFB8go4jce+XxAgt5ywlxlZbiUpwTwK9NiDPKU361JkfRUYuvRz8QaeuEZoP
	L2aU1cf45MjB/6KteDJwTOMIwM7plA1gXBOqA6U3TMbOHlsa8XaJJG7Sgt+w9kXdPODXzh7u+Dn
	Iwe2FoeyxEhr+IBB8WgQht7fua4/X4qtfWQdTWlkXu7a9CXJm8Do4pW2eM6WLkez1xuk5o1X+ph
	7JtbjIrnfSskrQwrqYecZRHCjTCHSwqjEX8MVxwYvXpD
X-Google-Smtp-Source: AGHT+IGvH4jPt9gEk2i8wJlEQCGHtq7Z8F/nhrt9cHdxqXKECEeUfNk2qVC/Ig+lLuwaqRjslO9WHQ==
X-Received: by 2002:a17:902:da8d:b0:216:386e:dd8 with SMTP id d9443c01a7336-21c3540cd05mr367659545ad.17.1737638908563;
        Thu, 23 Jan 2025 05:28:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:28 -0800 (PST)
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
Subject: [PATCH 1/5] mm: pgtable: make generic tlb_remove_table() use struct ptdesc
Date: Thu, 23 Jan 2025 21:26:14 +0800
Message-Id: <e2a1b07eda16eb84bdc51f6227fec02f2c0a54f7.1737637631.git.zhengqi.arch@bytedance.com>
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
index e402aef79c93e..10cdbe0e7adfe 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -228,10 +228,10 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
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

