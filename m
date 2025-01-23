Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A0211293
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638941; cv=none; b=YOVzyfLiga+ZTZR+4XcbTzModWXoHQJpNz8+7MCAe6sFkZi4bWrmwMiJ1UtsPZf+M3Z03Fkm7gDqQyNsW2hIj6kxnKptovf7EQ0YaPMYutcgICUpXb+OmIV1wnFae54T68DXLAJd0fYFE5dgK9nGD7Jm934GewB6Cajoa5jLKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638941; c=relaxed/simple;
	bh=XyLnW1p4MsGHgpzOh0HFNu0AzM3/S/jW+m0owjdfXKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CxPpjbAFeqkahAAo0AUF1G5jk43XcVk7o527N9bhDpRsSpwal69u42HqC0xspwdaJBvVc770iXfQuqCl7qGpA9qh921gCVdoRJmcvALkrbIUuUnHJ+f+g2h5H+zSrX8B+r5L+c6/VK7ZUyT190S05Vk6nGRHZ6A9IKdEdZGI/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UsuvGG8X; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UsuvGG8X"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165cb60719so14884145ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 05:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638938; x=1738243738; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSVoet4BIZh93xV/DLydReH1JogDWuAFDaImcbetZJc=;
        b=UsuvGG8Xge9nJv0IpXZUbDcORsFjpVHC/BITfteG30LpVxp+fYWdjiWhNIZomGU9K+
         0r63TPXU4m5yjr7BFt/RbrIt7e7fsmHuAI7f5YFvh2oI+ez5ehtv1MLC8ymnxLq5YzMr
         m61UVPzvJizN2TF/z0rrwMYxG9LVOVOLvVACuxO4stwq6P9ceGal9clxvdfPMWs9HC29
         v3Og+Kf4ai+65Ps3nCZvyod0fl2276S0ypzMKljJcvxcAvqQwilXAWfmW1IRGzcbB8N/
         Ss8aVX5gVS1Ey8ZQW5XMTeswCpCKKsx+//2mLaIv94jugvxv1xq2jpHMMxw1cO0xLrO3
         rv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638938; x=1738243738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSVoet4BIZh93xV/DLydReH1JogDWuAFDaImcbetZJc=;
        b=mBDkAEA8UFJvcGLlyY/QtSWO+FRD03O8A+J0ZBQJjbdgTZ69XKppritJgZB6C9IwPC
         vSB+7CUNe++cPfOs3q/8TeWCHbcAX4KY3uwzDR40zd/PiozY5gOp9qWE+R5LyF+Sppob
         CRnd5aagSwyDCXstqMh7lgSbfp+amMjSJ8u08KmrRO1uMbNndKZhAM+1tBritUEPhtyZ
         ZF+Z3kn8e03e2tXJ0+Q+kIEtVRtF3DweOLioTPMlEPI/7dPRT5CDAPVNhzpIMSK5HUWC
         6AWJ9cTFw972Sld1Rzq8lRfv7xvsMy806G6AhoJ9v6C3KQXJLd9JwELhsDoZw47/b7SS
         5Cog==
X-Forwarded-Encrypted: i=1; AJvYcCU3bdPWQXZ5lj+Wp5EfnzrpExj/ccOqURvqDIhVbc5M2QIzKsWlMtpzgzz9oY/EHRp8SzK2EQiALJkh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzsygDiR+ucATqlrCOZnyNxD2603oSQP63x4UrCL/YwzZhhZVsj
	szH++fEec/ElDJDNp0vKTchaPOtXE5MmffheJgZID0yvH1PT5fVP1G1F4ZgCZ98=
X-Gm-Gg: ASbGncvRvhNB19vNbulpcqKyB0NNJFv+0qGz0x7qWSJbPiQrYnNF1Ha+AXEY4VNI0ei
	8gBNGxHJBt+SLe5RYqptCuthHMsoqiKSA2f1GPta4QM5h401SQVzAJr1NJ/H72ypYqt0ofDnJ8J
	hbSQY2jIXlPjzo3UQToPbipX9dblZ+yOxegtDAC03rY+SK4MFgaviqrOHtjUIYOISAhQYG+XWNZ
	baEf9BOU+7HNERHZuYoXr9ExuIwMqDDvkc/WW21ySukBht5UzmTZ20RK+kEVfFwVR9DIz/JioBi
	nkfwD63A6KrUvwYFWedtTdD+wSAhEPQjZwDyp/0vzNxl
X-Google-Smtp-Source: AGHT+IE9ITT+lxW4q5ku2WHS5AYNu8WFWCG+wILMASo2spfcLUt1T5YAi0clrsTLRCDPofgLk2+QPw==
X-Received: by 2002:a17:902:e5ce:b0:216:6590:d472 with SMTP id d9443c01a7336-21c3551ae48mr419794535ad.21.1737638938491;
        Thu, 23 Jan 2025 05:28:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:57 -0800 (PST)
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
Subject: [PATCH 4/5] x86: pgtable: unconditionally use tlb_remove_table()
Date: Thu, 23 Jan 2025 21:26:17 +0800
Message-Id: <00bf7935d65826eee547ac195d7854b1c946dbc5.1737637631.git.zhengqi.arch@bytedance.com>
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

If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
will fall back to pagetable_dtor() + tlb_remove_page(). So let's use
tlb_remove_table() unconditionally to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/kernel/paravirt.c | 17 +----------------
 arch/x86/mm/pgtable.c      | 11 -----------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccaa3397a670..527f5605aa3e5 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -59,21 +59,6 @@ void __init native_pv_lock_init(void)
 		static_branch_enable(&virt_spin_lock_key);
 }
 
-#ifndef CONFIG_PT_RECLAIM
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	tlb_remove_table(tlb, table);
-}
-#endif
-
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -195,7 +180,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
 	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
 	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
-	.mmu.tlb_remove_table	= native_tlb_remove_table,
+	.mmu.tlb_remove_table	= tlb_remove_table,
 
 	.mmu.exit_mmap		= paravirt_nop,
 	.mmu.notify_page_enc_status_changed	= paravirt_nop,
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 1fef5ad32d5a8..3bc8ad282b272 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -19,22 +19,11 @@ EXPORT_SYMBOL(physical_mask);
 #endif
 
 #ifndef CONFIG_PARAVIRT
-#ifndef CONFIG_PT_RECLAIM
-static inline
-void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	tlb_remove_table(tlb, table);
 }
-#endif /* !CONFIG_PT_RECLAIM */
 #endif /* !CONFIG_PARAVIRT */
 
 gfp_t __userpte_alloc_gfp = GFP_PGTABLE_USER | PGTABLE_HIGHMEM;
-- 
2.20.1

