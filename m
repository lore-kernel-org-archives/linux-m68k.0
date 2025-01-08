Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F741A9B40
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319589; cv=none; b=I+4xHmK2zPt9ukOS1CNbgsSsE5u0DJSoPtaHwuJo9GjloHLt3I16XF3TuKPeGJDpP1gohXn8DZ1AmMwBk93YZCIfERtu636+/ZKF9KzmFlcV4sBC7wunvOPLRoRNAgEGK+WGXReTN4E9Qxhe+StVHL+U/BUS2alQHgDZCHe8/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319589; c=relaxed/simple;
	bh=ma5h64nM92pGVw8WsUJDDYGPNfXZFgLftucZEsbzZpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jYOXlyMFgcIiU+eoRHtU4nBb/Nqt0QNP+kL7RdC5vjQmnfp8zuKL+Ry0WliAHEYg34Zsl4OJ5dz+PcjUwAEt4lJPm2FjXnx5gcROpWBI0bg6Z0as8sr1qDIj9Wfrxq9uR+k4zTQB2EqEn5ue7wW80kav+uiIR9zFN72T4e3EqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QNpI0hhO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QNpI0hhO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2167141dfa1so9476795ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jan 2025 22:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319586; x=1736924386; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgpljFzcR37DW+k0izImY02NXJU+2N4CamZhPf6BMmU=;
        b=QNpI0hhOXg5V59abim3ux3qpTNuxJ03rFJEdNP7yiYh7hUgcy3/hHnltV7OMxo7KdX
         YJuxBjJu3w3nM6WPYYrQdCi+mrJmM5nEcza5ljEc4M9u/ZWwbkgex0+vfJY6UVZCEzdl
         rDoQt4+Up2CHsDFp2Gto2BhFCYMd4rolkOV56B5lMvo1NsGj7j0cVKO7QY1at+RJxdnU
         iMIiJpWX6oAB7h3NfFPRQVFDMTAB6dF4Z9r2ExGR3crK91a+I4a9YAw+zRqpJBQJRzxd
         SEL6S2pZPb3s0JkeQ26a1WMw9OT2Zir6RJb8TpY0D/lo/FHZ9/0oeesOi01pyTmysCzB
         TnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319586; x=1736924386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgpljFzcR37DW+k0izImY02NXJU+2N4CamZhPf6BMmU=;
        b=OFdWgzYSUKOUQvAuGLmb32e0yfNl7fnGm/3njVzlDcY5J3N7G54gvdvB8IA8C7ySL9
         vl8zpuiKsZsjArHKSDpDiX1g4ce6WDa2aMypROaeTm8W4yF5Hvq/h6eGqCivSgdPR0vC
         y41e1nYflo6uCUyRnSREY7tYm/c0Rqhob/W/uwkNvet7znPDSi49QwCOcM3pJE1yoQJ2
         M4LWFRkQa/SRnmet1jG0I9Wd0Qjs5o1YpUeCqIyK3S8ksJ/NIQjemlhzMFJgAGdDlI/W
         81oda9K6u4CKwbtVMOjW5F1D5QHpjLEtkPZ7Q4nY0A9027cIP1Mg2MgiWh6SXyy46b7P
         jMXg==
X-Forwarded-Encrypted: i=1; AJvYcCUx63dPJzK6fGRxFJpt8918r5Ipegl+ZFPgrW8HVUAQcsOAuswcMY3xmAMV/JIKdDAoFEJU8Mq67k4r@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyYko4nsCYLGzjUMCSZu73nlXZWmc3IYS5hANoCKpHN9exnfsbK
	l6L2lYiBcjvAUBdzgMu/IxS7Aqzcn8eo85axxp8hll1YXfbnpU6ut40UsKimobc=
X-Gm-Gg: ASbGncuN33md1Gx5bh9KIYowx21tpD7jxS7f0Z29Sr0Tz9onuSdiho9lAUYCgIXSqP7
	VDYvrt48LwUT2HJgUUVpUxONWMWMk+Yj5HNXbxOV3WmdGJYa1M2cLcHLCWs537GCailsUpZpNVM
	UpGhYUhi5UgnzznLKgLLwsRfKGOY/q1M1t1NRim+zdOpl5EEYNaU23dD9tndnvgkwJUzdy/wbQ/
	GyozUAcqRMl4WhE72gMHpaCX6s95TAGE8FBxEdVa8/3kY0MFZZYqqkEzctBot9cxnKqrddYpgM/
	4hpiObaMi/kTmiisDRUAFCuTxHA=
X-Google-Smtp-Source: AGHT+IEXmx6aGyXUatDDUSC3BIwwvJRBe2xxgGmNdG6bwRG2a4u7PgHO01+qr8GDOf9tBGHx3RRkKg==
X-Received: by 2002:a17:902:fc4d:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-21a83bb9991mr32206305ad.1.1736319586298;
        Tue, 07 Jan 2025 22:59:46 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:45 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Wed,  8 Jan 2025 14:57:18 +0800
Message-Id: <93a1c6bddc0ded9f1a9f15658c1e4af5c93d1194.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1

