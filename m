Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14E2ECEAE
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Nov 2025 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635159; cv=none; b=ZPffugdAysdFMHyiLYIMjgO6kKHQuC7HfOx1ITMcxxTA+3idcnhMN3CEnbUGBeE2XZEpaBAue/9Lhwef5zsApeIYuSapEjFb4DTLMTAOaslcaBiStg4iEjNc+85qZSnfIAVaB0XwZRVoYsUIrQzgT9NFdJ2l8CLPSzEgWwyoe+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635159; c=relaxed/simple;
	bh=FXQdQGSSxnGZe5fTanYaJCSQn9dW6/DpbT3X5VKCpSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CidgF2LiAeMIIH4eoeFbOubTsjoLD4kRoFi7HDKJ/eD3IeIU1WT7aVqvdQPf1Sooi8L7inA23teqlDFPaCvXHN7eoMCxFFLeZH2JVFSJIxBV39Jtg6aKaEOwe9VWLP63nQ5VU+xBi81bDoK8oR17HcV6QJqypARyANjnZfIfhlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=GR+TCMJj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="GR+TCMJj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29558061c68so10183935ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Nov 2025 02:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763635156; x=1764239956; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptek9aZDAHH5BbkXtUKp/FMaqKVeer3qFfxane+ASAw=;
        b=GR+TCMJjsBdKdMXBZmTTo1LQm3J1dqvzjDUN7RC9dj4o32OXW/YKXr7KjJtKZPrGyT
         OelGwcLJnIpLin9gSOVLRWUkClOv4AMWZ4mb3C102P0PSqi1j1GoblOO6nUb4KuFnKV8
         MR4/cnL5U+xeXvb/cAumJxAHsechK8GPNIa7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635156; x=1764239956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptek9aZDAHH5BbkXtUKp/FMaqKVeer3qFfxane+ASAw=;
        b=gyoalVCcggIgT7NC2WzCO5zYOlQffa66YowNLCN51pf40tCVnjjuriWxiGzOINgOHu
         BH5dRwtCNbuD0gKfwwpWMdPYzqVxUCWbAQx1/u/2yzHqXyRhQIaFYxh5xVeVzp16DzId
         7uqw/qcR8QvqF43lVmj6N5XIcJ3SncUFnqy/gTVABtmwXZJeqhTYIyYm/OP7IhZKxle/
         Z+YZ2YvYkTmRhYigwMDoIcUuNFixoUOwWFaDmeD0+nq+4xak9Ds6gXI9JlpII2NBclyE
         ziSu0ea1mGuL5UICIkbg4Jx3u2yk4Ip8ZdZhtPBDKha6I2QCi3O9gJ5Y8gZWIWgWdwa7
         xjGA==
X-Forwarded-Encrypted: i=1; AJvYcCXcZTcfyr6KpXdS5q8F73a3vv4hJ9SiiT8VD/Ou0CYT9NVu07KUG7vWr6dxBu2CT0cziuWJMscJYw4t@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywh9vPjIEPqJm79k1avSe/lNvLuIdw0Ldfz/E+55xAoAkTenn+P
	URM4aJu5HGKtnJfFdgJgC+M6Ff9qv410Sq1kc00y66XfONtvxy1736GWzetaZEI7yZA=
X-Gm-Gg: ASbGncueq4njGjWC8la0vQy1G11wFS2+t06WmcU1DXOhOFqTcoZrQFlNASyWquuMyBP
	JhNUmXBRKhBM2BG0tDmzCf4daAPKX7xINeCSh/l7NuXO6dmlIlkq7DNNC+NXJxSnoBBg2CROwlh
	I4/KA3iimWweiZd1q4SF1rZGP8ZmNgo007/sIxk38vE64+srB5dMBw3IbcSwdIF/rtPQW4Ibcq7
	zH5r0LOab5sGen3PsdnI72P60VNtXU1kayIPHsBYIg9vtfgcNF/LqI4yzlF+CUy+FGbDzmFVugS
	lUiaV7zKDygoTGwIKnwzhBrZa0l93YpbifY3gbFNKoUT5kepaN01kE0ChrigpuPG6U5k42AIeoU
	j1YLcoFe+mO4taGaD+HTYTgJLswjkjG1ikZptY4Bx34SIfMUrkMcazCfCyZQHwvoRPTYzfxn0co
	h3ccgm4gP7r8J0Kyqg4cRT6sUIOaS2qJuUz0pOS2mol4bYbF/oKDQ1xzfS41i4RZFwBrV2jtwWZ
	g==
X-Google-Smtp-Source: AGHT+IF+jWEmjlMOf8RKOPq0GysvlZDFC5fvcy7UGrC0FWCIFejplgGyDUvM73oAIpCUjB0SbgqrTQ==
X-Received: by 2002:a17:902:d586:b0:297:c638:d7ca with SMTP id d9443c01a7336-29b5ebbf47bmr26388565ad.14.1763635156446;
        Thu, 20 Nov 2025 02:39:16 -0800 (PST)
Received: from kinako.work.home.arpa (p1352012-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.28.12])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29b5b1387e3sm22381035ad.24.2025.11.20.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:39:15 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	gerg@kernel.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2 1/2] m68k: mm: motorola: Split the early term containing the end of the RO region
Date: Thu, 20 Nov 2025 19:38:53 +0900
Message-ID: <20251120103854.1630306-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120103854.1630306-1-daniel@thingy.jp>
References: <20251120103854.1630306-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the 020/030 the end of the RO region (from the start of kernel text
to the end of the RO data) can end up on an "early termination" that
represents 64 pages and is modelled as a pmd in the kernel.

You cannot set flags on individual pages in the pmd as the pte level
doesn't exist in the tables.

This means it's not possible to set the write protect bit for a range of
pages in the pmd and you either need to push RW stuff onto the next pmd
which wastes memory or convert the early termination into a normal pmd
with ptes first.

There is already some logic for splitting the pmd at the start of
memory into ptes so the first page can be unmapped. Refactor that
logic out into a little function and use it for the existing use
case and splitting the pmd that the tail of the RO region is on
so its possible to set the wp bit on the RO pages within.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/m68k/mm/motorola.c | 47 ++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 62283bc2ed79..9b5b9a52f819 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -298,6 +298,24 @@ static pmd_t * __init kernel_ptr_table(void)
 	return last_pmd_table;
 }
 
+/*
+ * This splits an early term created by head.S into ptes
+ * so things like removing pages in the range, marking
+ * part of the range as write protected can happen.
+ */
+static inline pte_t * __init __split_early_term(unsigned long physaddr)
+{
+	pte_t *pte_dir, *pte_dir_tmp;
+
+	pte_dir = kernel_page_table();
+	pte_dir_tmp = pte_dir;
+
+	for (int i = 0; i < PTRS_PER_PTE; physaddr += PAGE_SIZE, i++)
+		pte_val(*pte_dir_tmp++) = physaddr;
+
+	return pte_dir;
+}
+
 static void __init map_node(int node)
 {
 	unsigned long physaddr, virtaddr, size;
@@ -348,25 +366,34 @@ static void __init map_node(int node)
 
 		if (CPU_IS_020_OR_030) {
 			if (virtaddr) {
+				const unsigned long ro_tail_pmd =
+					((unsigned long) __end_rodata) & PMD_MASK;
+
+				if (virtaddr == ro_tail_pmd) {
+#ifdef DEBUG
+					printk("[wp split]\n");
+#endif
+					pte_dir = __split_early_term(physaddr);
+					pmd_set(pmd_dir, pte_dir);
+}
+				else {
 #ifdef DEBUG
-				printk ("[early term]");
+					printk("[early term]");
 #endif
-				pmd_val(*pmd_dir) = physaddr;
-				physaddr += PMD_SIZE;
+					pmd_val(*pmd_dir) = physaddr;
+				}
 			} else {
-				int i;
 #ifdef DEBUG
 				printk ("[zero map]");
 #endif
-				pte_dir = kernel_page_table();
+				pte_dir = __split_early_term(physaddr);
+				/* Remove the zero page */
+				pte_val(*pte_dir) = 0;
 				pmd_set(pmd_dir, pte_dir);
-
-				pte_val(*pte_dir++) = 0;
-				physaddr += PAGE_SIZE;
-				for (i = 1; i < PTRS_PER_PTE; physaddr += PAGE_SIZE, i++)
-					pte_val(*pte_dir++) = physaddr;
 			}
+
 			size -= PMD_SIZE;
+			physaddr += PMD_SIZE;
 			virtaddr += PMD_SIZE;
 		} else {
 			if (!pmd_present(*pmd_dir)) {
-- 
2.51.0

