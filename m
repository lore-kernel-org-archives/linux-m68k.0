Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24F20F98B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638901; cv=none; b=bvGgewhfYTXsd3fJNp7hfU3YLjo+tLo8KodbVFIunRHX+Zk9LDWU1EK4UHZI53coSVsK9nykW2lItOsoiBk7CwDY12dy2pLAmns37ZRzdkzC0L2oaxOOs+7/hCdtU37bkSMAKkTfSo3hlob9Ln6F5SZMxgw6o7rNWZA/kU37Q7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638901; c=relaxed/simple;
	bh=2QT8xw8Hnr0PZ0li5OKVWEtgoR+SI3nKyV65SN+WB9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kBp6vtUem1+bABw4im0Av5bRvheVy+GRVyDVkPpxFIjNTcCuyFer5LDKLyfFEKV5PWmTwKvfrGlWbUJCr1YFylqgxgN3SZnXnIBCkIT2wJ89TBI2lsi4HxVvj02M+LeaREUkH6pA/GyLQTnF86JQk14JN8OKLnSEs7sICUt5Tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hdXx9yiX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hdXx9yiX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21636268e43so18733105ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jan 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638899; x=1738243699; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=hdXx9yiXLvK2LgGc5VzOyEdZZH0+of9sAX7CiTOFxDcE8vibFR9sBMeE27an9U6Rjr
         q6E9nMY5TkzXxWNWxByKX9G5XrjyClfTu0ok2kVXLuM3xCm88F6y80UsJa7ljvyNIJ01
         bWXXE7+JsyqKZFa6dhlc4Ii4TmRMC/n8Qd/DBiC1xM7YLzVgDnShXPeCCHYoziG1lLYy
         lqHB9oBm+ZOTsEUx1zJ4/24QJsxXXKXBAgG9rmqVrTyOGcZorbVGAboWHw3VAdUCUM1f
         FNFd3tgqGIVO4BK1KILmlskkhvO54ylmEr9aQItPvvgS958o14oLv+1Lwqog4tw1gVZT
         iOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638899; x=1738243699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=mtE5c92pP/MGGos0l+qdqtzMFBaY/2zdkJrXUZl2Ti+hODHYQR/KVYla7jXUmnpXAa
         2qyf4wU9Eyvdd+tO8BGSn8JegiNy1z+YEFlMUzVijTik0z8dPB1OS+WzKvn0bqrL5Nd5
         lBLBhKa+E8oQsilVJpKf9jettZB3W/Vxcr0/gPGwTz0HyhhQC/GHcZTY5nZi2KoLYCtU
         feGMT1AfX8TKpQzUwzayGjROlcw31pZs0ggc+uzUboo/lA0wuPQR8jKn2+lVgQKv0cOz
         773IDx36nlGMB7bTNYKiP3g2bkz47wRL5N7I9hwdc47etntikppTGeR3Ou9teu0AB1ja
         3vBg==
X-Forwarded-Encrypted: i=1; AJvYcCW7P1pzhMxUVChRj4vJUGM7ruu/wDOsfe80uM3dtT1DauZoU3BHN1ftUahSc88Co8z704efLteLNyqG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwnUeGAzTzUk5dBCAeIPFr07txCo4k7ZAxW4ELuvXOcrOamXTu0
	qonzS+Ujy5Upv3+kT6SMV9fGfgO2dRK1Ovzs/nrpuNR4sYskvBY+aJOxfciR1vA=
X-Gm-Gg: ASbGnctiwLymZglYeWfVYAAX6y50DZkRC4NME988ZjFJG6jshoYJMHNCJj1PaevHB/h
	653pNLTuKW52fR9nkVjeZtgH6VrGvI5T4Qj6Vs0Bz5M4eG1LdAmaKEpSc/0GmQV9g5zjDZPMUdP
	5NpmXrM1fARebp9EBOkVfjlg46oOGKtem9uZHvs9g8lGsJIv7Ixo0JyIZ7i4CnbP11IqsOrbxFt
	PuWCeCWMRI7dgcwyufYcmNYN5TfAe0DrH9D5IWUC5wfzWRpSwG8Ipi2aIKbgmz2/+62rT0/I26U
	xGyz5sewAqYoaAgYOGbqBxhPpcruTzSn8EmmHCztUZIJ
X-Google-Smtp-Source: AGHT+IEganAe939WGDJlfH9nAWVZpA3TvM5SaYn7UYpmBsqsQlG5HSrZSGt5JfnUpmvzTx71ZR7Ekg==
X-Received: by 2002:a17:902:f545:b0:215:6e01:ad19 with SMTP id d9443c01a7336-21c35587f37mr410676135ad.29.1737638898793;
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
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
Subject: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:13 +0800
Message-Id: <cover.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

As suggested by Peter Zijlstra below [1], this series aims to remove
tlb_remove_page_ptdesc().

: Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
: there should not be a page-table anywhere near here *ever*.
:
: Yes, some architectures use tlb_remove_page() for page-tables too, but
: that is more or less an implementation detail that can be fixed.

After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
to remove the page table pages. In the future, once all architectures using
tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
may be possible to use only tlb_remove_ptdesc().

Note: there will be some overlap between my patch #4 and Rik van Riel's patch #1 [2],
      once his patch is merged into the next branch, I can rebase onto his patch.
      And patch #4 can actually make x86 use tlb_remove_ptdesc(), but due to the
      above situation, I have not done so yet.

This series is based on next-20250122.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/lkml/20250123042447.2259648-2-riel@surriel.com/

Qi Zheng (5):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: unconditionally use tlb_remove_table()
  mm: pgtable: remove tlb_remove_page_ptdesc()

 arch/csky/include/asm/pgalloc.h      |  3 +--
 arch/hexagon/include/asm/pgalloc.h   |  3 +--
 arch/loongarch/include/asm/pgalloc.h |  3 +--
 arch/m68k/include/asm/sun3_pgalloc.h |  3 +--
 arch/mips/include/asm/pgalloc.h      |  3 +--
 arch/nios2/include/asm/pgalloc.h     |  9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  |  3 +--
 arch/riscv/include/asm/pgalloc.h     | 26 ++++----------------------
 arch/sh/include/asm/pgalloc.h        |  3 +--
 arch/um/include/asm/pgalloc.h        |  9 +++------
 arch/x86/kernel/paravirt.c           | 17 +----------------
 arch/x86/mm/pgtable.c                | 11 -----------
 include/asm-generic/tlb.h            | 12 +++---------
 13 files changed, 22 insertions(+), 83 deletions(-)

-- 
2.20.1

