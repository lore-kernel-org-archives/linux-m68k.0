Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2B2AE78
	for <linux-m68k@lists.linux-m68k.org>; Sun, 16 Nov 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763330765; cv=none; b=ZQergi3qh89BstLgkWt7neRojQ5kwNgpIFeR3owuOnrGrozmBAh/7j1Q1C686IEKt++jwOgJ1W8pMp0oQEVXTYXX/M8472r6vvWzAZ7NCwx3EC9eRrkgdRCpaYN1gexaaNcoQSLsCkms5VgOYzJfyu9KeuUNAVTgLcW0F7WpQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763330765; c=relaxed/simple;
	bh=NoMZ3Y2ifizfF05AKV3r0/RVY9sTBUE7f9wUu6gFsq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhZodEAYZg8xpdGWRLZ2tBi1fIS+c8JKguI0u0/iWq0qK22sppJs9/AnCoT/d9vu4B3+7hEqs+hGXdJKf/xNVIV4aWQg+Mh556WPKqaZV1yNEwTgZfE1Qd5dzqrSEvL4EomWTGP/Y3Lmz1CzedyiwtfLiCBXLK6PIPeqEmtSWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=acsrZeDQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="acsrZeDQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so3374048b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 16 Nov 2025 14:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763330761; x=1763935561; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwPHPRDAP+avrRYrwmR4toIK8fXHAU0A+bdBUwmg6mQ=;
        b=acsrZeDQSp21kQsp/XugoZ4FB+LDlQtExgH701Kqm0ORTEQqFBHYn+kihwa9Yr31M+
         UVnTul2q6emqQUa4M+eAZFD+eJ93iU5DsEZ5zDDDDaM4BHXm+YnONZSWosBl6BY9RgWf
         SOcmxzbOoO6UXeZxclcWPKgU8Hv8sbHcl+Gj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763330761; x=1763935561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwPHPRDAP+avrRYrwmR4toIK8fXHAU0A+bdBUwmg6mQ=;
        b=BgzrpMD0v1mv3zqa3s6PO5HH9qxtdIEW2rpIIyBE9dPO4v/DlzKBgUgTVtAjtXl37f
         NDHX9FMVLAcmwjp6CmwsJUapbPB4ydppwuAWbnAwP559BxU/71YlFV8y2j648qJCy/We
         858AGblaM+j+MdL5SvUGhTXEazw2DjuEWW03GM7HWaqErOlCy0DgCi+izqL+QW+wBjab
         Ng6wSzrzPJcpopcWBiHEbpQTE9WiWcz3hx2IWvrvdLlzFWBkjZmv/eRzUPzyPcjWvzT8
         0A7oa4ltc72pp/Vt0N2Kl94CGEGAQe6olBNV721Fm6HW/MYgQb+wL7WqkHJHRvndSaZt
         Ck1A==
X-Forwarded-Encrypted: i=1; AJvYcCUd7mVR3AS0lfiUIT6oY5Hpkje5bS9zrbTrt4cJNyes9bz1DJBn/3tXhhav9EetNNU11KfmViUriOkK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxzhBSAwMyTb8ncct2uwAnvG5PK406SXdyFC/HswYxYK06XqQSN
	cIhr0JPiQBm9CgUtJc87Rcc3nzteXBSziMSV6GN2uOzxcg6Rwet8pss7x/7BTl/RHaY=
X-Gm-Gg: ASbGncvpLqCFYxgPimErEBpOpZi+ESxPls3jZeHdH0rFPf8ockNmVx7up1F9LYL7vzN
	rlZjxxTs3w0WLOF9SzWiiGTSuaPBl5Dcy38q84aRNIXF9IQWIJbo8oVG6jW7/8kWsPNy5LCcagf
	/ChGrpCl8sr0rkeEOVmI8nsH7YqD+zJ9bvRrO+9C93n0rdGSwP3I0vg/eP1Jkxy6awUrh3jGpOE
	p0TPx0AKJAZdnu7wuOmThNoy6Hnj0o2z02clseYhE1OfdhmsVYgLTm4/zTGmc40Uv5TguduvFth
	yn6BXklApeVJpKlC5NtZ1nOemKpm1oVIrrpWXF0RCFeK5XMz/KyCsZqb/C10AmpxU/h+xkefHtc
	r/GTWlIUEfYnhT3g85xYsh4W0E8yfe5R+9dNS/4yTqWqgJe90u9FecrQQ3ba3DExHRlA=
X-Google-Smtp-Source: AGHT+IG+SSKSih/MoY+IPwcTb2Il/KY16m8hTqsMiKaO5XWtG7/0/rnS2tWfbIWmGccbDy8cZDCyEA==
X-Received: by 2002:a05:6a00:c91:b0:7b9:d7c2:fdf9 with SMTP id d2e1a72fcca58-7ba3bb9528dmr10624068b3a.15.1763330761220;
        Sun, 16 Nov 2025 14:06:01 -0800 (PST)
Received: from kinako ([2400:2200:5f7:2c14:5394:bb99:aaf4:3b1c])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7b927c22c5fsm11023129b3a.67.2025.11.16.14.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 14:06:00 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] m68k: Implement kernel memory protection
Date: Mon, 17 Nov 2025 07:05:08 +0900
Message-ID: <20251116220508.1513445-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
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
working, but I've only tested on the virt machine.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/m68k/Kconfig   |  1 +
 arch/m68k/mm/init.c | 69 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

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
index 488411af1b3f..bc1147f25624 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -123,3 +123,72 @@ void __init mem_init(void)
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
+	/* kernel text - kernel_pg_dir lives in the first page, so skip that */
+	start = (unsigned long) _stext + PAGE_SIZE;
+	end = (unsigned long) _etext;
+	pr_info("Write protecting kernel text: 0x%lx - 0x%lx\n", start, end);
+	__mark_ro_data(start, end - start);
+
+	/* ro data */
+	start = (unsigned long) __start_rodata;
+	end = (unsigned long) __end_rodata;
+	pr_info("Write protecting kernel read-only data: 0x%lx - 0x%lx\n", start, end);
+	__mark_ro_data(start, end - start);
+
+	flush_tlb_all();
+}
+#endif
-- 
2.51.0

