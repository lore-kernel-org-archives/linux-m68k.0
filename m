Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5211A2554
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549786; cv=none; b=JaN1JUkGYenNiqRgdsMdwBpeWOjTkBZO3rO67+dMu2tM8QNKzCNEfIIpfuBgmTkkpf60TjYci2nwc8otScDAvFoS35TnMzqjQ+6nHhMyHjkixIKhkx3Lcqy9G6bk0bkLCPiSSpmfJtM7DHwhGhPh3hKNXP/ooPw/ofvyLVz4UIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549786; c=relaxed/simple;
	bh=jiyynG1cSpqMCUPKcTsBXQhnImP0khzMQlCaAfJaSPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FGEs/Y4v2V6PaCP+3qzmng5hRYJ3ezksQ7HN/CkwupTjQoK4Qj2FyXFOXGrXo9we+2d5kUdqKq8oe01h9SnW6ntzmUv5gyjXjEmxr93uqtSZVTdoDuaCg2fOez+62XcZsAfeP/KU/lcF3wMxOqL7OteGwDM7dPSCFJJmUgluwQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TfuLQtui; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TfuLQtui"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so112898335ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549783; x=1736154583; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=TfuLQtuiZmwsyV4vNzi0IUQTP7XpmtOl40xnT4cEYM7i1+AkZay5taRYpPj4jRO+/i
         K/5OxG8zh7GQvRRWvbwoIaLtcVqcpOxQqD63mnLOHphRbA8TkKO/R0xz/L86WEgWXtkx
         fbMePIpiaNX3/pDbXyRzOaKwB6RuDWjS56bnOiBOalGSxACDtsa5wt9HRhea49au0Krf
         AiLH7SLu/AjEVef0wmpTxsQjCtOpfU3g4EAQKYGqhpxd04dmVrN1F/ZMyJT2dmwruoM5
         oO/gv0pV/5Rx/S6MaN4LEqrZJ6u6VTxePGOelmBIT3W36BRMTuBdISgw9vD9vB059ttP
         V7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549783; x=1736154583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=PvvYUSsK6qqpJDXUOtDFHwkidMHG+fwqOV8ZCHlk+w+bBPbO291CNmlAUhZyLDe3wS
         taobu+5BjGilQGRxNSttS+1l/QxsgsjmA538QQ380y2JQS60TXZVy0LMUlfIGw+0rkQa
         sspWpC/j0uNIyobMTy8e20TUxhf1E1gB593PR08RxBbo7w58+z7yQpqj61uMgJ2ZFwa0
         5L6UxbZ2d2q4tIWS6tjyOUsXMh8b/Lt8ouGOlihpTx5sFLutzXfN6620LBEXnJ8OGyKL
         MehxdASLUFiEyRPDcfJeBsbXNsiW/0DvMpJ5nijuoXWeXe+2jmqup2g2Ihdoopu2BxZW
         xkHw==
X-Forwarded-Encrypted: i=1; AJvYcCWhYUk1oVODI/Beyibzysb69QFYeAYJbIYoiXHhEVIDewXw1k+I/r40Y5Vy1dZ1dkKbPjnqtDpdfrgG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz8X20pXZO24J50kfhyFjrSWbYie6RDnH3/4S6f4MtjC0Ra9p0t
	MnXvp6s09fyZ/0G7fxYacE54ckFHMHlKLmXCUt3JnsG8ALbemquN9uG2fhtYGuQ=
X-Gm-Gg: ASbGncu9nA1QEBVfOzXP3IPT2Z/8vWUfseKNJs0GOVgJ5l56kGwyqei+zzkYVrb8C6D
	VxMBdRtOjTxpbTNhJXVLhyzFA/CnswYYh93pJ4DV5aIRpR+3dk7TOsPGVGQrEisW4aP1YcBnZ7l
	lKQivI4IxZ0A6IQxa4rQfqWcLZA5PX3SgdXHZZ0FzOorLEzSOkC2Ae3UR26ztYE1dwVAfmHpBNG
	mOYpClTrlK5F5GvR+vs4KuH2M7Eznpu1E36F/m/m0JQWYNqXZCk53qQN+Dk8KC1j7y+/qbzkgNC
	2gZ0JcnlQP+f7Iohp8ZSiQ==
X-Google-Smtp-Source: AGHT+IFA+DEWtAOVikEXL1Ne96u+hKYy4bbBxlgPSiON1NV20vNo54NDlhKj2iEhoHPJgNNx6Etn8w==
X-Received: by 2002:a17:903:2a87:b0:216:3f6e:fabd with SMTP id d9443c01a7336-219da5cc2d0mr588821545ad.7.1735549782882;
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
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
Subject: [PATCH v4 05/15] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 30 Dec 2024 17:07:40 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1

