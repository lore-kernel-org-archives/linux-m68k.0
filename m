Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349492;
	b=Od337xbYNTaj5CA0frdjQlh6C8srIf2QVT4kDB+ZgwzVeXQg9RNR14ejhemv6tiEN42O
	 w8FDJHNqjNNTwafDxVGLdE8Q8NgdY8T1DMfocBBH0LGKhfllApH8vJQdiUKWnUCob/Fao
	 xtVuI+zvyWeY6lZ2z0314Plb2S+XgdiYwADCB7fmncGcjo5epcivxNwvNC24+Qu37KlgZ
	 df2GYWkDkQ9rDZrG1/1ba7LqniLVHCe/BZGZbqnebPkm99lekA8ORRXbg4rjAHl38VZgp
	 rVz+CM1sjFECdr3lYiAZjuSQ53h1wQcyH33rSy2Z2dZw2KOa4ujrvxr0TqAiqrEGVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ml5g8GJyiKqZW7cPKgtShDnwVwZ+S7TeGUyvRqBFqBI=;
	b=vUtu4Rg7746Q2Yq+6noYK3a4Yc3cg/ZdvYptJJoqBXl9KSnqiDjZ/kfFEefADayj2Dzj
	 tqgZtYZTpUrUiORfpIc3RYNzQfS5ygAMsBFX1ftJhAkmEmg6Jw3RLsMwwbA9aBZ/+yQFB
	 uvzXSkCJ5svDVDQ6Am74maoZ589TmxKWgdzN0F782Bp8eSAVlbQbMLzoXaYFabMEouT5Q
	 p6zQ9mHi27llBj8wVNtOYhqUYfRrSY+RFiq2osuj29WE8RNdqmmY2aewSSYlhJu1FdurC
	 hSvKw9wIk7/79f9+kDKBEot2xXO/H7lWPgzG8vICsbfv+/8vvLVVZX+O+s4akeuUtIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bFtbPWQQ;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB43606A31C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 08:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bFtbPWQQ
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso273540a12.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793349491; x=1793954291; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml5g8GJyiKqZW7cPKgtShDnwVwZ+S7TeGUyvRqBFqBI=;
        b=bFtbPWQQ8OWCcqrdgQiH+91O4yDRdhyDbq+yyyXoWZVP7u2lUL2z43ErsE5XIKtTSa
         5exG+Vnee6ilZ8lP79DD4Y67OCqIOB31A41UJdRRECX97s7g1KmwxCIlFUoGRv+iyCni
         UDSlAE8l92lnDifNKDu+f4sa7q0IFlK4+T1KDqhI3gcNWP2AnY8OGQhwvl1GRHOilvzR
         OPWVGa8xabK9CANF1mB/c89gWAjM28xwaEwW2Yp9tGqTN9kHI+x67s3b+ypBlit0QoMK
         LRWWqk+uh6DzHFFeSvf5SofzghD9h6erYCckDMnfSifIPrS4ETMStqjW+9NAT5PgC8mI
         8Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349491; x=1793954291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml5g8GJyiKqZW7cPKgtShDnwVwZ+S7TeGUyvRqBFqBI=;
        b=PIiTIx6cheNqWCfPyBqd4PXh0jwj3m/kcAtWLk2AB8E96fU7VWy/8WzTm+M3sa3qKQ
         jnJehcn8x1hl+TXosoJIhUSOOY0JTRTrwu1YOFQhxB0SUiphI99auO9fUn4PqeW+dOC4
         bhHAP1EsVNmoUG9uBNRzBu+yAsuLtTf5OE1vcSwQqCf66qqiLBvRh6/fq2jrjgUXv5o1
         zqUPI+xrPW/IjZbVGwkejgX6AqeWTdlnm1xnfBAusGn3PqaLFTShgrCGOrVALwDXs8Rg
         5zbj1siu/DtYaHMISbWNcOO3CTHbWIb+X1o6kCrOL12hHAB2ACFR9WFdLhDd7Z6teVkc
         Wr4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6rOCfyKYqN0suLj/MxL3RW+ix28NE2cg5v44wc+OAxryk+JZV4JmYo0PKYH/MEV9RsPqJbEFvD0XC@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYIr51coVT2aQ72ZaHV3CEHsy1in1s2v1B5BkQ4dzvP4136y1/pr
	YkRDQ888sS8e14HI6vn+GvGMvBx8vzZBjNbFGpumdvbmwTpjt7shodev7WKh1rm2VpE=
X-Gm-Gg: AYBFou2khPB9R5cAduNUpvnzWkQvCoLe81MZ1Ge/t8FZqsv8g5/zsH3l2TOOzRNSjpS
	nLh0aLN4TsFI9MFFbzZnIeMakdr7+UrfPI79yHC4fHPNI4IzMDy7/k43+jgm5STOR8GObIPY3F9
	hX2Nmy5kG7ab37BK+SoR/nOHqhzlr0cZx+BX9UfcyYkPkuL8nKJpjYqYKkgD3iTa2FXy/h3W/S6
	YzAXBa6ki97kRLxqA7QWOO6E2Yd3qvqttwK2eK1HWnjy/EZiZfIUAbXxmKDsM4M/i82obZBUxwm
	l9dkbuMrSbGJfw2hBLL9EvAZfyq0Uil6NSkS8zquBK2EnjQJLZLSm4nVapkb4Yi2tr9W9sPUpz7
	ZB0HiKT7RiZHI/SxGZMw9m8Xm0EOUTMHGbOROXwQzXZDYPxXgCS16C30OKWNiKRqm40ZNWcWb/V
	gDxGNOmr1BXxMuBOM4YXa/98V8jZ565928YYDY3xfKPjO8BUhjlUW+upUH/cxz1fHEOLWewCf1r
	vymfGEVk+UHQDpbKO62n6J5gCoxWBkXSZ8tlyThbwz6+Qh6o7z4VSXsVPUgXOaJvWON6JyncRUJ
	chn91/e3hFV30UNJ8vzzc8NtpwSPro7IIIekrIkXoo9yit1ihgM=
X-Received: by 2002:a17:90b:5147:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ae897c7c28mr1424866a91.14.1793349491405;
        Fri, 30 Oct 2026 01:38:11 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm7542122a91.15.2026.10.30.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:38:10 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alistair Popple <apopple@nvidia.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 0/2] mm: Remove pagetable_dtor_free()
Date: Fri, 30 Oct 2026 16:37:58 +0800
Message-ID: <20261030083800.599152-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up cleanup to the page-table teardown fixes [1].

pagetable_free() now invokes pagetable_dtor() for constructed page tables.
This makes pagetable_dtor_free() redundant and leaves explicit destructor
calls immediately before pagetable_free() duplicating lifecycle handling.

Remove pagetable_dtor_free() and convert its callers to pagetable_free(),
then remove the remaining redundant pagetable_dtor() calls. This keeps the
destructor decision in the common free path. No functional change is
intended.

[1] https://lore.kernel.org/r/20261023063428.3658761-1-songmuchun@bytedance.com

Muchun Song (2):
  mm: remove pagetable_dtor_free()
  mm: remove redundant pagetable_dtor() calls

 arch/m68k/include/asm/mcf_pgalloc.h    |  5 ++---
 arch/m68k/mm/motorola.c                |  2 +-
 arch/powerpc/mm/book3s64/mmu_context.c |  1 -
 arch/powerpc/mm/book3s64/pgtable.c     |  1 -
 arch/powerpc/mm/pgtable-frag.c         |  2 --
 arch/s390/include/asm/pgalloc.h        |  4 ----
 arch/s390/mm/pgalloc.c                 |  4 ++--
 arch/sh/mm/pgtable.c                   |  2 +-
 arch/sparc/mm/init_64.c                |  1 -
 arch/x86/mm/pat/set_memory.c           | 10 +---------
 arch/x86/mm/pgtable.c                  |  5 ++---
 include/asm-generic/pgalloc.h          | 12 ++++++------
 include/asm-generic/tlb.h              |  2 +-
 include/linux/mm.h                     |  6 ------
 14 files changed, 16 insertions(+), 41 deletions(-)


base-commit: 9c449f885765cf8d80b2c60b1971e774bba51a3f
-- 
2.54.0

