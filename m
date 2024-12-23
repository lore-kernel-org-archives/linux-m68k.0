Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19F198A29
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947166; cv=none; b=JGO79A0gt+0skqxE57ISpntGf4G6YFrv8DjE+DnIaQ16z0FLokTbh0HykhlSA9Qw6kKcWZM4c8xJtspqFNHATjVlm56QRlU/trn/WVj//6J2hI4AAKK6R9VOxFlGEra3VUepNuSXa8vc5t+3L6MDDsILQmm3++U2nHtgRPzkvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947166; c=relaxed/simple;
	bh=AOHzYz3e0W68bypaywk5PqwWiTbsh7X+wa84FHfFzTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KtyUibiQfAsyBRL7YFYarVwUUiVLco/Q7b6HQhUdkHMK3vgaKWiLAmgPH5aL8hWWsWblMAk0E7Xdz5vn7A6+Wree/tbmZWjtBe7SF83b/t/f+ZtUVw/r3eajyNPLVkYcoygmlzMmqczE4YI8VD2W3a0PeUSVWkgbr4iKPJsoUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aEKiZcJH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aEKiZcJH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72909c459c4so3086425b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947162; x=1735551962; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=aEKiZcJHNCcd+GfdMAO+JO6hEmsIJmOaEjogAaeGunoFubPF24Bm+rTzCyMRMy4f7W
         wizluZ9ZjQz5H7cUqiZcvTrNY1bUJlLVcGzkT7YIYZ09xp736ctnksaSa22evU9S2pEa
         +hOnX9fNRbhedKnuLRhhGtzqNEhbctXmwm8mQkjXGbAC/B7glFSF9UfLAMqVo2ECMzlE
         47LaJCvYGRF+65zTyKzlAEl4y194+Xg45z/tq+SOFZkD/uT5z2clmZygKJseyybFHI85
         HbqSQhiP03SWUYTGv9Bu3sluBjkG79iP+1W8zw+NyxrhWYliFPrjFDiAUKi31ZtWce6v
         dS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947162; x=1735551962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=rPxC3UGSZ0b6nKOI8gNg8t+dD8d8r5lhFaIjhg7Og9865WC/Pr0qmEoE/GKXAjREBx
         p9x17oLP+BMWMOwfY2wsXvBLd7P4q9P8yB50u4nAICTZXQ8yuAg9YC2z5gypJ0tud4g+
         JK440KaSHallwXd1D+Jwd0JiYuEIh0M4oNPaEJeEYM4/NGh9Dzra7HE3UI3bPoSujcXD
         9TR7xrRvNVInvIeLUFFcgo9PJDMs8WW9Ier8YPvsdi0QkjXhrAlh1tcqYzc3KpHJEscn
         ABz22QU/4j7q2k1SnLrXgBr9G8onvOe5NpnCqst7I/69CIbE0RdisX9pQphK6MHS5U/G
         M9kA==
X-Forwarded-Encrypted: i=1; AJvYcCWcWjShAY6V5j1da84xOoC80Jr0tHrDO0MNakIbMP8g+LlJchyZw92NbUMfGU48AhHIz8hDFt2u2pxE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzqSuY/xbJCNHREw1ILw2+Wn20Sn5n3RhvKJPHvDM3IfWFQSj7z
	kC31VDQ/t5FNXKgd7t60jItKPxuUXJsw4aKh4JjeiE/+Q43ehSBl/VLgyZQiO0Q=
X-Gm-Gg: ASbGncsij8nbv+OciTmKRXc0xHA+JPd/loF6tTxFzIHZ4jzLOWvBAzXOCd3uLesOb1j
	AgXntBhMo8o0YKL3rWMpWE4XkyqaGxt3htu3xl325KKLTDTRJ5PdFIl4p/46V/DEyi2+nLKFo2a
	iCcOqtf3VgZtubhDDZVCEo8uwYp9gJZ1J5CzNGbOUFikc00DKMBwPRgkPflN3yTWsMmjgsme8pc
	XKgBXFS/qFuXpY8d7RC39S1Pifd7ZaUO9Y7souUcC+aGDIT1Q680Ahbaw4GXaoZku15fuiLJvHZ
	AUw9eyDsxryjwsFCMt4CEw==
X-Google-Smtp-Source: AGHT+IEiKQiNoCztX+vEmXJ78+SVJHcoRjQcReSYKDpgexw8hG6RQW+fGx0o5GN+OmUz8JwpFgmgkg==
X-Received: by 2002:a05:6a20:c88f:b0:1d5:10d6:92b9 with SMTP id adf61e73a8af0-1e5e07f88demr18787949637.30.1734947161832;
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 14/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 23 Dec 2024 17:41:00 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1

