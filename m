Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E23396E8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921635; cv=none; b=M2jiAfuswPEDjVAcMyY4BQjFwSSzmvkJuyGm/EAhlDWz/0vDTLdC5/LUo4hx9s7zmTMyotzFYpVbtaE2CA1kJFE3IYjASxehwuphiV/QYUJRdnzoPhzbK9yvfYhTCtUSbNxKazWTnfVOTnNyXknY1bSNt5NdIFG3rl8/FoPJSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921635; c=relaxed/simple;
	bh=evujIYGkr1kJpN1ywQp2nMddrvpyUsLbIKybTCZcHWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuRsCVIiwxCS1gPIQmEVCkWe4dg7E8C9ykgO3g6doGbaw2eeUFPKglvr17endqbCpDsxgpGl61vtCHU9peSjaRgwWc4O9QHPS4MyEI71pCe4Q5JHlitRF+8kD4NePT0p4xmdIR4kMbBQsQUajbz6Yy5ll/6AnMNP3xC+yxx0gvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddc7e5Aa; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddc7e5Aa"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-11b6bc976d6so7030451c88.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 13:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765921626; x=1766526426; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIy3H/bKd2uTpJQCAIuCXiDJGQW8etiIRlL1vysNfVk=;
        b=ddc7e5Aa+NfbuTzfY8sGi/QgvvymwuAMg+2vOTkdv9UUGG/d3jbL0E/nr1lEGU99CS
         dHCba0TIDWPxGHB3sWLl5WfQdHHw50pOV6vUN051MV84Rmf88VeJ3vMOQ0D27xKMS5+M
         d4d/f8VzwlSNIVQqXTQNNfi4qJyLiMRXs2xDqT/swU5u2hXE3CpAoolSNg2BxjH6mIaz
         0g7Aukpw9ijyrSI0vABshDPNJIMAfCMdlUjMPsVkuYKtff8HY5Qkjcvk1Rn3RAyW72PJ
         N/6cn28mJLz6YQ9gssDjyUkYAcgh9k+VlcRih7KGB5SPCIqy3toawDCyYMNJcii7h9TL
         1qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921626; x=1766526426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIy3H/bKd2uTpJQCAIuCXiDJGQW8etiIRlL1vysNfVk=;
        b=L5/vGbuLHsmUG+eZ79Z/OuL4Eh/tozRShpkMVl/CtFJImttF4diqL6BmVNXDvp0Pxj
         4g7cCa/Jf581LozT02NFU1XmvNEHxfQ3R4uIe0Fkwmegi8K36LoegfHu/LJl8iMELNUv
         M90TfpDWXIkINL1Ftcm1b3V78XZ2dCp0vB/1z1yJfFvgalrq+R/vRmiTvieQlLPMY3bm
         JSmhOk1rAQ6r0BUKAmTsp+j5Oom0g5Y1A0fBRxFUJDizU/cmpynr4OJz6mBjkjPKlVtz
         GaqUP6I3fl0FXYy8c4u744yvCrb/gWx64q71UoYVDTuYLaaXnBPRwvQHyG6n3MLrkho2
         0Etg==
X-Forwarded-Encrypted: i=1; AJvYcCUwwXsz7Wkcvsu9odcCuzTjtj7jIDR4rWmiK5vPqSy1dkuh/3A5DtYt4LZd9wYXxqMch4G5iuDwqIra@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywbt3gFSQg6vXop48/diAgUONNgDCCDPzzJmrO+BT1YDh9Bt8Ls
	BjPUKPPWkYF4JC1ebqO0CX3KPjd5/KecpO/jfQsuxMF7vAhe/S2yiVtJ
X-Gm-Gg: AY/fxX41/rXlTMG6GU9Rn73fbE/4tBP32KSXxRh6gSwzzYJqWuIOelQA0dSQc8f3CB2
	L3Gh2/OA2Yg6EnZFbD/5ZyvEyrYvINUOWzd07M2rx8Af/JU/8PJJhwsYhEIeS253ow5P/3noBKO
	B1QZ/kT/NM7V7Ljc8ARqU7CEFUMzA0GsCxPz18OhTmzk0LMnomG6zJzmeVGD1g6hYj4ZTsC1i4c
	SVR/7QGfkXo6ewXsaE5meeKS1hPhJquoB9qXrtJ31UEXGWR7w0dRyRv569WfqSKrSVRpdeBCyd3
	lPLhJuUrfO4ce748NjgDjj+AZi3AbN1wOujOYFHXLCmP5kRAyLF+ixrUUVvYbxqfJMdQx9MMrYq
	2WFCVzylmH4dqV4bBWnVplqjtnGK3I+R5LvIBbWDglBf16pPNwup0QtghW6OHvWBJ4RYrhWzZqC
	qef7DvuptvOiPb9LYwCXtUz4WZ
X-Google-Smtp-Source: AGHT+IGhrsRdYnMb20yhHbM5gR2xO5miIHn0uD7KPTf40H+xoJIbXbWWBoGAJMYWVKRHpvd03NKEiQ==
X-Received: by 2002:a05:7022:ea48:10b0:11e:4fc:9b33 with SMTP id a92af1059eb24-11f2ebc751bmr10584670c88.1.1765921625694;
        Tue, 16 Dec 2025 13:47:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43ced319sm24433456c88.9.2025.12.16.13.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:47:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Dec 2025 13:47:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com, Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: Prevent reporting pcp->batch = 0
 [mcf5208evb boot failure]
Message-ID: <42143500-c380-41fe-815c-696c17241506@roeck-us.net>
References: <20251009192933.3756712-1-joshua.hahnjy@gmail.com>
 <20251009192933.3756712-3-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009192933.3756712-3-joshua.hahnjy@gmail.com>

Hi,

On Thu, Oct 09, 2025 at 12:29:31PM -0700, Joshua Hahn wrote:
> zone_batchsize returns the appropriate value that should be used for
> pcp->batch. If it finds a zone with less than 4096 pages or PAGE_SIZE >
> 1M, however, it leads to some incorrect math.
> 
> In the above case, we will get an intermediary value of 1, which is then
> rounded down to the nearest power of two, and 1 is subtracted from it.
> Since 1 is already a power of two, we will get batch = 1-1 = 0:
> 
> 	batch = rounddown_pow_of_two(batch + batch/2) - 1;
> 
> A pcp->batch value of 0 is nonsensical. If this were actually set, then
> functions like drain_zone_pages would become no-ops, since they could
> only free 0 pages at a time.
> 
> Of the two callers of zone_batchsize, the one that is actually used to
> set pcp->batch works around this by setting pcp->batch to the maximum
> of 1 and zone_batchsize. However, the other caller, zone_pcp_init,
> incorrectly prints out the batch size of the zone to be 0.
> 
> This is probably rare in a typical zone, but the DMA zone can often have
> less than 4096 pages, which means it will print out "LIFO batch:0".
> 
> Before: [    0.001216]   DMA zone: 3998 pages, LIFO batch:0
> After:  [    0.001210]   DMA zone: 3998 pages, LIFO batch:1
> 
> Instead of dealing with the error handling and the mismatch between the
> reported and actual zone batchsize, just return 1 if the zone_batchsize
> is 1 page or less before the rounding.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

With this patch in the tree, the qemu 'mcf5208evb' machine fails to boot
with memory errors such as

S01syslogd: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL), nodemask=(null)
CPU: 0 UID: 0 PID: 34 Comm: S01syslogd Not tainted 6.19.0-rc1 #1 NONE
Stack from 407d7ce0:
        407d7ce0 403df960 403df960 00000000 00000001 00000007 40027c60 403df960
        400c06be 00000cc0 00000001 407d7d7e 400bf614 407d7d34 403df3ba 407d7d14
        407d7db8 400c0e5c 00000cc0 00000000 403df3ba 00000007 00000007 00000cc0
        000d8000 00000018 0000006c 00000001 00000000 40fe6640 00000000 40fe81e4
        403ffa40 4085eff4 00000000 00000400 00000000 001008c0 00000000 40854041
        f4fe0000 00004041 f4fe0000 00000000 00010000 403ffa40 4085ed00 4085e800
Call Trace: [<40027c60>] dump_stack+0xc/0x10
 [<400c06be>] warn_alloc+0xdc/0x1bc
 [<400bf614>] get_page_from_freelist+0x0/0xfa6
 [<400c0e5c>] __alloc_frozen_pages_noprof+0x6be/0x8be
 [<400c1358>] get_free_pages_noprof+0x16/0x3e

Reverting this patch fixes the problem.

Bisect log is attached for reference.

Guenter

---
# bad: [416f99c3b16f582a3fc6d64a1f77f39d94b76de5] Merge tag 'driver-core-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
# good: [559e608c46553c107dbba19dae0854af7b219400] Merge tag 'ntfs3_for_6.19' of https://github.com/Paragon-Software-Group/linux-ntfs3
git bisect start '416f99c3b16f' '559e608c4655'
# good: [fa5ef105618ae9b5aaa51b3f09e41d88d4514207] Merge tag 'spi-v6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
git bisect good fa5ef105618ae9b5aaa51b3f09e41d88d4514207
# bad: [399ead3a6d76cbdd29a716660db5c84a314dab70] Merge tag 'uml-for-linux-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
git bisect bad 399ead3a6d76cbdd29a716660db5c84a314dab70
# good: [a3ebb59eee2e558e8f8f27fc3f75cd367f17cd8e] Merge tag 'vfio-v6.19-rc1' of https://github.com/awilliam/linux-vfio
git bisect good a3ebb59eee2e558e8f8f27fc3f75cd367f17cd8e
# bad: [faf3c923523e5c8fc3baaa413d62e913774ae52f] mm: fix vma_start_write_killable() signal handling
git bisect bad faf3c923523e5c8fc3baaa413d62e913774ae52f
# bad: [915a2453d824a9b6bf724e3f970d86ae1d092a61] mm/damon/tests/core-kunit: handle alloc failure on damon_test_set_attrs()
git bisect bad 915a2453d824a9b6bf724e3f970d86ae1d092a61
# bad: [c707a68f9468e4ef4a3546b636a9dd088fe7b7f1] mm: abstract io_remap_pfn_range() based on PFN
git bisect bad c707a68f9468e4ef4a3546b636a9dd088fe7b7f1
# bad: [ca30ac479e6cf7a210dcad32fa2ee99ca0357e91] mm/page_owner: simplify zone iteration logic in init_early_allocated_pages()
git bisect bad ca30ac479e6cf7a210dcad32fa2ee99ca0357e91
# good: [138336d674d2e51f1e5699d2a30af1e9aa1352b4] mm/zswap: remove unnecessary dlen writes for incompressible pages
git bisect good 138336d674d2e51f1e5699d2a30af1e9aa1352b4
# good: [0de9a442eeba4a6435af74120822b10b12ab8449] mm/page_owner: update Documentation with 'show_handles' and 'show_stacks_handles'
git bisect good 0de9a442eeba4a6435af74120822b10b12ab8449
# bad: [95b34d66480bbc9bc31e78c26b1d5be47358ffc0] mm: always call rmap_walk() on locked folios
git bisect bad 95b34d66480bbc9bc31e78c26b1d5be47358ffc0
# bad: [2783088ef24e32df9d70eb2a24f70de28b476a05] mm/page_alloc: prevent reporting pcp->batch = 0
git bisect bad 2783088ef24e32df9d70eb2a24f70de28b476a05
# good: [4dcf65bf5be22e32d389628b0e655731f97f525e] mm/page_alloc: clarify batch tuning in zone_batchsize
git bisect good 4dcf65bf5be22e32d389628b0e655731f97f525e
# first bad commit: [2783088ef24e32df9d70eb2a24f70de28b476a05] mm/page_alloc: prevent reporting pcp->batch = 0
