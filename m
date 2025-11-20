Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CA12ECEAE
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Nov 2025 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635161; cv=none; b=My1FWewnVg8EWbWx2rZhAbrH0lcPF7+RZug2Y5S2ZIPdGcFFUJ3QZEngiJkJPumplYSDFToPUC3zOP/abKa3GPHmDYh26BwTryNiJMNob7+HNRXwRHgaf/5+U/dsQntV9bCRYmxn42NMAlZnNWkd7CNsEI0mRwPaYU0oS76Kpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635161; c=relaxed/simple;
	bh=BHE8ecW080hEUBYHsfRQy6FJfv9ooT+paLaeKuAiPQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evWyx2SXIK8MN1xGAtI+tMZroJtfqCnGazhLrLHeIXYsGEQhG6oOvIAbyKQnNr+mciqO93BZLgNjXcRrNGymDc7xWjyo8Z+TeWdhas7dA5kJ60XAD4O2lnxYP2YCSytFgIQId9eWbFLbvAwtgJ4gb/pQqzrGL98rhjNz3rYAbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=SzGiWCtL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="SzGiWCtL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2984dfae0acso12039195ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Nov 2025 02:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763635159; x=1764239959; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhwxa2PuTpIzju4Jjb3k2siPGNsjvz97d+Kdch7Zl9s=;
        b=SzGiWCtLjZ7MknOtd1NAdpY02YUSSz9NssgK1Ml2O+7K1hvcuMml1FEU9x+voT2yK1
         dkHwvXRWhEGGM5K7/lHGdBSTiel7suOEEQrt8632pakqPdwBBlsu5lXrohfopo/L9oUt
         cIS+WFhFKq32wvXl/gYGo3a1rbpq8I+B4V8hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635159; x=1764239959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhwxa2PuTpIzju4Jjb3k2siPGNsjvz97d+Kdch7Zl9s=;
        b=pakLdxq3pNHoJTzoWPENfnzasXXZ5/REQhrMpnCh2tn2Qo6VAk0fwXxhxe3riyaxwd
         F5yEM7nYxxtfTMl0lJlDiFii/vqAfFQpv0Y2UMhj9Rw2+8gjhG4tFOlDLh+lHE0iJFwi
         mI2ruPtgL0SID1d8bgsfwl8ZomVmes8ZQh/aS/eP23B3jARHTe5Px0nlv8aYKDnuyKHC
         TIv5WV+7SYbWt1A/smRjcW6YqVm8Y1co8g3LrSsbJfqeff3I934SFfUTLU3ULE8F2Es1
         8S/NkAQGlesEw0erQgZu9tCcDoJA7F1IpPufu/xCxj0v4xV+h2+wNZpbhjoYVDldFEWB
         VIOg==
X-Forwarded-Encrypted: i=1; AJvYcCUJMUHU7BGeBY6ERP+RkVlYsE+14oxwJny/CUeEdeg13RRPleFKdeLa3T1Xsl0NyH4KHBtJm7Aj+Kbh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzghbYfRKXoZWBNFaSqCBLJKXldRp0qtEtikNTQ8NtKr/4e9bQK
	cjqnz/WBNephPg/HJ+VgvgWRT3uv5KJ63hUPGFpTyXN8vinGbN3VQLy2XuLkIue/djI=
X-Gm-Gg: ASbGncu0ApjZjgFoOawDMIntnJkGM+yV/VeAC4exLJVoB42bMMtzqiyE9idqCElNRzI
	RqKu2oleRsuOld4B2nh4J6BudKP5tb2Viykhq0iJL3p2JPCLIj42UKKz5P87iB5hh+mxtSk4pBz
	ofVUcU+RwhNL4wNwwbtP7alM9oyZLvzo7MUQxGeoxmc8oOGAbEgZvQl5n7JURpls0rPBGoDldsp
	dnxG7+dG7symkPjdrX92UI0jfSPa+skOvvNZhwbCMbtrjLNtMQ/dCsE4OOt3fwFZwmJKd6njEAs
	VJK4VbM373j/0XIWUzlSM0oAT2I9IaBdiuoP37LXAA/uUyf/M3k3c5w1M9NOXEWRR3bFs9mgu3t
	iTPvq2Vh35sSCnvUDCV5EAUGx0t9MaUmcC/iZV6CR8uchrodxa36UKJTaRqp+aqlkzXA8oDE3j4
	wvQL3vCuJk6yE3cltrrYRMRswvHfLMrKRsTF0KCPKcZt9QoTGMlqijO7uUoQ2BlV3tYxQZg2Bu0
	Q==
X-Google-Smtp-Source: AGHT+IEJHD9EOFgAlpBP7xrnEfuWDeJ5213S3zMr53sttOFn6TCus9wLiTU7vAcQ3zsDVAbTLEnEjg==
X-Received: by 2002:a17:902:f689:b0:295:50f5:c0e1 with SMTP id d9443c01a7336-29b5b06a956mr42913245ad.15.1763635159468;
        Thu, 20 Nov 2025 02:39:19 -0800 (PST)
Received: from kinako.work.home.arpa (p1352012-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.28.12])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29b5b1387e3sm22381035ad.24.2025.11.20.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:39:18 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	gerg@kernel.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2 2/2] m68k: Implement kernel memory protection
Date: Thu, 20 Nov 2025 19:38:54 +0900
Message-ID: <20251120103854.1630306-3-daniel@thingy.jp>
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

Every time I boot linux on my various m68k machines I see
"This architecture does not have kernel memory protection."

I wondered why this was as some of my machines even have one of
those fancy MMU doodads. I worked out it was because we don't have
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX, found kernel_set_cachemode()
seemed like it had the code for setting some extra flags for
kernel pages and turned that into something that sets write
protect for kernel pages.

So now we can make CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y and
provide mark_rodata_ro() to mark the kernel text and rodata
as write protected.

The test enabled by CONFIG_DEBUG_RODATA_TEST=y says this is
working.

Tested on Amiga 4000 (060), virt (040), MVME147 (030)

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/m68k/Kconfig   |  1 +
 arch/m68k/mm/init.c | 73 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 11835eb59d94..2137fd19ffbd 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -8,6 +8,7 @@ config M68K
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
+	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 488411af1b3f..f11597751741 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -123,3 +123,76 @@ void __init mem_init(void)
 {
 	init_pointer_tables();
 }
+
+#ifdef CONFIG_MMU
+/*
+ * Based on (basically copy/pasted) kernel_set_cachemode() because
+ * presumably that is correct and covers the required differences.
+ */
+static void __mark_ro_data(unsigned long virtaddr, ssize_t size)
+{
+	pgd_t *pgd_dir;
+	p4d_t *p4d_dir;
+	pud_t *pud_dir;
+	pmd_t *pmd_dir;
+	pte_t *pte_dir;
+
+	while (size > 0) {
+		pgd_dir = pgd_offset_k(virtaddr);
+		p4d_dir = p4d_offset(pgd_dir, virtaddr);
+		pud_dir = pud_offset(p4d_dir, virtaddr);
+		if (pud_bad(*pud_dir)) {
+			pud_clear(pud_dir);
+			return;
+		}
+		pmd_dir = pmd_offset(pud_dir, virtaddr);
+
+#if CONFIG_PGTABLE_LEVELS == 3
+		if (CPU_IS_020_OR_030) {
+			unsigned long pmd = pmd_val(*pmd_dir);
+
+			if ((pmd & _DESCTYPE_MASK) == _PAGE_PRESENT) {
+				/* We cannot write protect part of an early term */
+				if (WARN_ON(size < PMD_SIZE))
+					break;
+
+				*pmd_dir = __pmd(pmd | _PAGE_RONLY);
+				virtaddr += PMD_SIZE;
+				size -= PMD_SIZE;
+				continue;
+			}
+		}
+#endif
+
+		if (pmd_bad(*pmd_dir)) {
+			pmd_clear(pmd_dir);
+			return;
+		}
+
+		/* We cannot write protect part of a page */
+		if (WARN_ON(size < PAGE_SIZE))
+			break;
+
+		pte_dir = pte_offset_kernel(pmd_dir, virtaddr);
+
+		set_pte(pte_dir, pte_wrprotect(*pte_dir));
+		virtaddr += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
+}
+
+void mark_rodata_ro(void)
+{
+	unsigned long start;
+	unsigned long end;
+
+	/* kernel text + 1 page , kernel_pg_dir lives in the first page, so skip that */
+	start = (unsigned long) _stext + PAGE_SIZE;
+	end = (unsigned long) __end_rodata;
+
+	pr_info("Write protecting kernel text and read-only data: 0x%lx - 0x%lx\n", start, end);
+	__mark_ro_data(start, end - start);
+
+	flush_tlb_all();
+}
+#endif
-- 
2.51.0

