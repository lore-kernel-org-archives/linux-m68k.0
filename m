Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D838E5FA
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Feb 2026 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012056; cv=none; b=D9QZvXfyjWQbRGLs2UgsqvebNArji1UpdTlpg+fj3WET0zssejNJodNLg+YB73jq06ej8Guyu1amzZk1Ug75ufRFnDqB/FYau44Nk4ihnpC1v/Eid5OoTBL5hYYVY2yguprBeGs3H1SBABjo0TOTX4NS/aDuX3fFRMU6mcxnuHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012056; c=relaxed/simple;
	bh=EChnaz/wNdUCH/LaAhkqduGVIV85xoH+0j8ZN2XBYUg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=fy2dHCbEm+KegI8hVjZhr2aHqWLiwtkodXZPo3oEY4FkQxhtAFS25D4Y4I59eLmT2S+21XThV2ugGyunBwMwtWty3r+/sre+SiOtzQH5wddXC5bpAdWO+6Zl3ImiQSkvtSo040LUYm+bUqH40onB7mdPX2Iws1/aYzd1JDM2D08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzK3HY5s; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzK3HY5s"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e266a3572so2257017a12.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Feb 2026 01:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772012054; x=1772616854; darn=lists.linux-m68k.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxnsaOQZey5wMq56BxN2EdEuMBW71mGq+RSuzcss/8M=;
        b=CzK3HY5swk8EvGaFxWk6IJBRFM3oCeHMF9eZVHkn4qhOyuv1+hsjdsfMmRc94aHuxY
         +PdTC8AI/iA9ZJw3xWREoLCYDW0hgmLy1EZVHt+lfDVOIZmW9zbtD5lZ6z8hgD64Ir0E
         KsJ7+s+AmrMYTz+CDzGkcRhWOQhatmC2i49azv0OHUvSl6fOGDHaJ0CzGnOG6CMKVm0V
         9yDyv9P4/8wTqiuTWLb7btaEUxm8ZLAc/SMDtTiZ+MHtHtos5HHT0x7Gcsy8N5GWr1G8
         Scp3fyCdWIvg5TvFh4T8hUy4L7ThNViljrGSql/q1BDhXMyBQRcqzO0ztEw5ofMWR5E/
         rjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772012054; x=1772616854;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxnsaOQZey5wMq56BxN2EdEuMBW71mGq+RSuzcss/8M=;
        b=N7ELjTBHnl2HlEKgp3NQ/aehlWwZyL/x6+ulH8cuJoWXprwmg1JElnuo/SvxT9jnyE
         OPcY2MDEK2DiExQOX3pHt0EfeyX0lW5icxppuQ6tXuOF13FiEsqaRRJZqvJSFSOHWuVM
         /rz7dk4f/bxbhh9d4UCu4Y44UFPsTTw6MJmGkUPlTNVL+5ILVGhEkN07he6HlPDrwgXc
         snF8E2XO5bJDyG5GR+Vfo6zxu6Hb+Ac2OS+QN1XK/zv++Edk2fiHK0AXHbFP69KIaSmS
         kKyFCi24Hc/E1Brdcqx81jDyhDGMyY97kRZ/M5PJR39XsYniS8xHYM+kSKMM1iAZtkry
         I69Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuPRCoXhQ/opGp+ls4hEpOdPEEW0PJtH03n7M6uoQIqS0fZUkqZcWHWPYuI2+GtKIt/R+98pD8D7T0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy+MNuBqlOBIpXYABJUH9opXEWg6rfDRU5FlSiRvSpflhD7eQ3G
	zkDk6Kt7pi+l1rOLlLQSUgloCAUqQwnQNZK6rG+oi1oHYEo5aIYO7q5M
X-Gm-Gg: ATEYQzxgapQv2g7/ST+/Mf0k3FmeVdlVOHjUs/4X4pHgS6z/MWhICDzdsPlHorHqnxn
	mSg1LNR4OeK7UTnYB4HaA+44EA8qW4JUcIbxJcBtv4h9EKcwXkc7mZVVpcFUyk8rdGo0KEsRbiw
	8GsIScmETK1HHKRIwy7exKZnZYFoEsFpioaarpzZmjHyTdTAs0Oy0qI29bObhC5whsAWTbsjmTq
	eGnLvd3x903GjFxBO4JrKSGcr2swlXxbDPuy3kWa1fas+fmq/qKHTdrh8oJjlQFOSCHz4uUWb05
	IU3s6Tzm3JtNLU2dHdkYdt8VRuZYIkutN+PHw038eRrlLA4B+YKI3VrvCA404TMQNMfBGrfAaDz
	X4TNqtQMAXqnA6aGwzwXnRYy+3FLCWkfEGk9AjPx+ec+mClNcLAaOqR91dNvktD6dpBnhgSwGB7
	e/iG50KzNYS2kq7naSOw==
X-Received: by 2002:a17:90b:3dcc:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-358ae7c6ca9mr13087754a91.6.1772012054135;
        Wed, 25 Feb 2026 01:34:14 -0800 (PST)
Received: from dw-tp ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590188126esm2256635a91.6.2026.02.25.01.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:34:13 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 24/29] arch, mm: consolidate initialization of SPARSE memory model
In-Reply-To: <20260111082105.290734-25-rppt@kernel.org>
Date: Wed, 25 Feb 2026 09:00:35 +0530
Message-ID: <87tsv5h544.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-25-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Every architecture calls sparse_init() during setup_arch() although the
> data structures created by sparse_init() are not used until the
> initialization of the core MM.
>
> Beside the code duplication, calling sparse_init() from architecture
> specific code causes ordering differences of vmemmap and HVO initialization
> on different architectures.
>
> Move the call to sparse_init() from architecture specific code to
> free_area_init() to ensure that vmemmap and HVO initialization order is
> always the same.
>

Hello Mike,

[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] WARNING: arch/powerpc/include/asm/io.h:879 at virt_to_phys+0x44/0x1b8, CPU#0: swapper/0
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-12139-gc57b1c00145a #31 PREEMPT
[    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
[    0.000000][    T0] NIP:  c000000000601584 LR: c000000004075de4 CTR: c000000000601548
[    0.000000][    T0] REGS: c000000004d1f870 TRAP: 0700   Not tainted  (6.19.0-12139-gc57b1c00145a)
[    0.000000][    T0] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 48022448  XER: 20040000
[    0.000000][    T0] CFAR: c0000000006016c4 IRQMASK: 1
[    0.000000][    T0] GPR00: c000000004075dd4 c000000004d1fb10 c00000000304bb00 c000000180000000
[    0.000000][    T0] GPR04: 0000000000000009 0000000000000009 c000000004ec94a0 0000000000000000
[    0.000000][    T0] GPR08: 0000000000018000 0000000000000001 c000000004921280 0000000048022448
[    0.000000][    T0] GPR12: c000000000601548 c000000004fe0000 0000000000000004 0000000000000004
[    0.000000][    T0] GPR16: 000000000287fb08 0000000000000060 0000000000000002 0000000002831750
[    0.000000][    T0] GPR20: 0000000002831778 fffffffffffffffd c000000004d78050 00000000051cbb00
[    0.000000][    T0] GPR24: 0000000005a40008 c000000000000000 c000000000400000 0000000000000100
[    0.000000][    T0] GPR28: c000000004d78050 0000000000000000 c000000004ecd4a8 0000000000000001
[    0.000000][    T0] NIP [c000000000601584] virt_to_phys+0x44/0x1b8
[    0.000000][    T0] LR [c000000004075de4] alloc_bootmem+0x144/0x1a8
[    0.000000][    T0] Call Trace:
[    0.000000][    T0] [c000000004d1fb50] [c000000004075dd4] alloc_bootmem+0x134/0x1a8
[    0.000000][    T0] [c000000004d1fba0] [c000000004075fac] __alloc_bootmem_huge_page+0x164/0x230
[    0.000000][    T0] [c000000004d1fbe0] [c000000004030bc4] alloc_bootmem_huge_page+0x44/0x138
[    0.000000][    T0] [c000000004d1fc10] [c000000004076e48] hugetlb_hstate_alloc_pages+0x350/0x5ac
[    0.000000][    T0] [c000000004d1fd30] [c0000000040782f0] hugetlb_bootmem_alloc+0x15c/0x19c
[    0.000000][    T0] [c000000004d1fd70] [c00000000406d7b4] mm_core_init_early+0x7c/0xdf4
[    0.000000][    T0] [c000000004d1ff30] [c000000004011d84] start_kernel+0xac/0xc58
[    0.000000][    T0] [c000000004d1ffe0] [c00000000000e99c] start_here_common+0x1c/0x20
[    0.000000][    T0] Code: 6129ffff 792907c6 6529ffff 6129ffff 7c234840 40810018 3d2201e8 3929a7a8 e9290000 7c291840 41810044 3be00001 <0b1f0000> 3d20bfff 6129ffff 792907c6


I think this is happening because, now in mm_core_early_init(), the
order of initialization between hugetlb_bootmem_alloc() and
free_area_init() is reversed. Since free_area_init() -> sparse_init()
is responsible for setting SECTIONS and vmemmap area. 

Then in alloc_bootmem() (from hugetlb_bootmem_alloc() path), it uses virt_to_phys(m)...

			/*
			 * For pre-HVO to work correctly, pages need to be on
			 * the list for the node they were actually allocated
			 * from. That node may be different in the case of
			 * fallback by memblock_alloc_try_nid_raw. So,
			 * extract the actual node first.
			 */
			if (m)
				listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));


... virt_to_phys on powerpc uses:

static inline unsigned long virt_to_phys(const volatile void * address)
{
	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && !virt_addr_valid(address));

	return __pa((unsigned long)address);
}

#define virt_addr_valid(vaddr)	({					\
	unsigned long _addr = (unsigned long)vaddr;			\
	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
	pfn_valid(virt_to_pfn((void *)_addr));				\
})


I think the above warning in dmesg gets printed from above WARN_ON, i.e.
because pfn_valid() is false, since we haven't done sparse_init() yet.

So, what I wanted to check was - do you think instead of virt_to_phys(), we
could directly use __pa() here() in mm/hugetlb.c, since these are
memblock alloc addresses? i.e.: 

// alloc_bootmem():
-   listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
+   listnode = early_pfn_to_nid(PHYS_PFN(__pa(m)));

// __alloc_bootmem_huge_page():
-   memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
+   memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),


Thoughts?

-ritesh
