Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE31E519
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Oct 2024 02:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728353502; cv=none; b=Ll3CxR+S88JL/6JO8gry8FZoZwUyygNTe2MonQhBiPevWldvDbPVpIspDX6El0gIgv2r8Zm6Uq2B4b/YX4kr71kR6ippw8QIKj/WS45px43JcpZgbgnLotsQrpNYYGTdQjrdKgnQioqojhdzLqBI9662M4RlqeFdJSOt7o76r2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728353502; c=relaxed/simple;
	bh=ecuISJm/aWL+tNMQ+twAVlW+4RZvWpoN2srrbXkDB94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhCEKgajySCN0Y/jgrVkesizifjimUeRiy4A6MnGQCxvJyE/ItKcnmF1prqkvkXad1dCuu+O3+YH3JAL9bS6M+IaG9yKvH7Szfuf1zuJPUB+EcmF1gv/rYr5UdKO+xofynmHBc5b8NimrcFXgF8XsMCRqEeXRGLVYJt2b2HrOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuXk/Iv4; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuXk/Iv4"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E20CA4293C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Oct 2024 02:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FF9C4CEDA
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Oct 2024 02:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728353499;
	bh=ecuISJm/aWL+tNMQ+twAVlW+4RZvWpoN2srrbXkDB94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fuXk/Iv4F6g9UIV2dGzz68u/6atTHD+w1WDpX2hdmbU9utl8tjEFGgr9U0bI1/ngJ
	 +S6Ok3D3hniS74qeUmEyQj8lIfscVRkXxu9tVPL4PRLN3mhRlybZYfMccltJ+dpxGw
	 1EFq431u6Z17r4cK2C5Mlw00XnmTrUtdmWGRDURboN0SNgn0rbP95HuHdckSF3JB/k
	 DsAwxdpxlVbED7AlJMZYfwN2vG4X2oQltr6VQF/JzGJUw+So+l3WnKjFWeRlEXRzq1
	 6CiagwHp5Pa12hmwlSLvgIRRjLM5LWjTu0NKS8RobiYaqVySvit6oIjNObmI2l8JoH
	 alVTGovgBIcCQ==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37cdac05af9so4866504f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Oct 2024 19:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYbT3HB+AWp9t2eMyILKXLj+kKuyUNgfEv7r5ztez5XgzUdIsnZr3TgGG4VChqmlwk+pnk5RqHvfRq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyNgjl6bpEHlWgdRHqr3IeA9URKkT7XJmVL8QzjgduGrZTvYw/x
	k/HevCcguAFtkGuAk1CT6YoNfZfa7ruddKsbYGuJ0aSVXSoZYMMxMKsZfbCKw3sPMUVs9DhDvMf
	Uz2rLPudTHk57KB1OLROvyUC3U14=
X-Google-Smtp-Source: AGHT+IG9/HXDQPVy3roiGpnpx5nYoWEmk19PPS8Q+OmkGvZ1j1NxJVVRW61nrohcbFPxLB5t6MVKLRvfuhF1lJEIdu8=
X-Received: by 2002:a5d:6e0a:0:b0:374:ce15:9995 with SMTP id
 ffacd0b85a97d-37d0e78253cmr10508015f8f.34.1728353497103; Mon, 07 Oct 2024
 19:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007062858.44248-1-rppt@kernel.org> <20241007062858.44248-6-rppt@kernel.org>
In-Reply-To: <20241007062858.44248-6-rppt@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 8 Oct 2024 10:11:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
Message-ID: <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] arch: introduce set_direct_map_valid_noflush()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mike,

On Mon, Oct 7, 2024 at 2:30=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Add an API that will allow updates of the direct/linear map for a set of
> physically contiguous pages.
>
> It will be used in the following patches.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/arm64/include/asm/set_memory.h     |  1 +
>  arch/arm64/mm/pageattr.c                | 10 ++++++++++
>  arch/loongarch/include/asm/set_memory.h |  1 +
>  arch/loongarch/mm/pageattr.c            | 21 +++++++++++++++++++++
>  arch/riscv/include/asm/set_memory.h     |  1 +
>  arch/riscv/mm/pageattr.c                | 15 +++++++++++++++
>  arch/s390/include/asm/set_memory.h      |  1 +
>  arch/s390/mm/pageattr.c                 | 11 +++++++++++
>  arch/x86/include/asm/set_memory.h       |  1 +
>  arch/x86/mm/pat/set_memory.c            |  8 ++++++++
>  include/linux/set_memory.h              |  6 ++++++
>  11 files changed, 76 insertions(+)
>
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm=
/set_memory.h
> index 917761feeffd..98088c043606 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -13,6 +13,7 @@ int set_memory_valid(unsigned long addr, int numpages, =
int enable);
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
>
>  #endif /* _ASM_ARM64_SET_MEMORY_H */
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 0e270a1c51e6..01225900293a 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -192,6 +192,16 @@ int set_direct_map_default_noflush(struct page *page=
)
>                                    PAGE_SIZE, change_page_range, &data);
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       unsigned long addr =3D (unsigned long)page_address(page);
> +
> +       if (!can_set_direct_map())
> +               return 0;
> +
> +       return set_memory_valid(addr, nr, valid);
> +}
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/inc=
lude/asm/set_memory.h
> index d70505b6676c..55dfaefd02c8 100644
> --- a/arch/loongarch/include/asm/set_memory.h
> +++ b/arch/loongarch/include/asm/set_memory.h
> @@ -17,5 +17,6 @@ int set_memory_rw(unsigned long addr, int numpages);
>  bool kernel_page_present(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
>  int set_direct_map_invalid_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>
>  #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> index ffd8d76021d4..f14b40c968b4 100644
> --- a/arch/loongarch/mm/pageattr.c
> +++ b/arch/loongarch/mm/pageattr.c
> @@ -216,3 +216,24 @@ int set_direct_map_invalid_noflush(struct page *page=
)
>
>         return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT =
| _PAGE_VALID));
>  }
> +
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       unsigned long addr =3D (unsigned long)page_address(page);
> +       pgprot_t set, clear;
> +
> +       return __set_memory((unsigned long)page_address(page), nr, set, c=
lear);
This line should be removed.

Huacai

> +
> +       if (addr < vm_map_base)
> +               return 0;
> +
> +       if (valid) {
> +               set =3D PAGE_KERNEL;
> +               clear =3D __pgprot(0);
> +       } else {
> +               set =3D __pgprot(0);
> +               clear =3D __pgprot(_PAGE_PRESENT | _PAGE_VALID);
> +       }
> +
> +       return __set_memory(addr, 1, set, clear);
> +}
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm=
/set_memory.h
> index ab92fc84e1fc..ea263d3683ef 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -42,6 +42,7 @@ static inline int set_kernel_memory(char *startp, char =
*endp,
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
>
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 271d01a5ba4d..d815448758a1 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -386,6 +386,21 @@ int set_direct_map_default_noflush(struct page *page=
)
>                             PAGE_KERNEL, __pgprot(_PAGE_EXEC));
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       pgprot_t set, clear;
> +
> +       if (valid) {
> +               set =3D PAGE_KERNEL;
> +               clear =3D __pgprot(_PAGE_EXEC);
> +       } else {
> +               set =3D __pgprot(0);
> +               clear =3D __pgprot(_PAGE_PRESENT);
> +       }
> +
> +       return __set_memory((unsigned long)page_address(page), nr, set, c=
lear);
> +}
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void=
 *data)
>  {
> diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/s=
et_memory.h
> index 06fbabe2f66c..240bcfbdcdce 100644
> --- a/arch/s390/include/asm/set_memory.h
> +++ b/arch/s390/include/asm/set_memory.h
> @@ -62,5 +62,6 @@ __SET_MEMORY_FUNC(set_memory_4k, SET_MEMORY_4K)
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>
>  #endif
> diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
> index 5f805ad42d4c..4c7ee74aa130 100644
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@ -406,6 +406,17 @@ int set_direct_map_default_noflush(struct page *page=
)
>         return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEM=
ORY_DEF);
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       unsigned long flags;
> +
> +       if (valid)
> +               flags =3D SET_MEMORY_DEF;
> +       else
> +               flags =3D SET_MEMORY_INV;
> +
> +       return __set_memory((unsigned long)page_to_virt(page), nr, flags)=
;
> +}
>  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
>
>  static void ipte_range(pte_t *pte, unsigned long address, int nr)
> diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set=
_memory.h
> index 4b2abce2e3e7..cc62ef70ccc0 100644
> --- a/arch/x86/include/asm/set_memory.h
> +++ b/arch/x86/include/asm/set_memory.h
> @@ -89,6 +89,7 @@ int set_pages_rw(struct page *page, int numpages);
>
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid);
>  bool kernel_page_present(struct page *page);
>
>  extern int kernel_set_to_readonly;
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 44f7b2ea6a07..069e421c2247 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2444,6 +2444,14 @@ int set_direct_map_default_noflush(struct page *pa=
ge)
>         return __set_pages_p(page, 1);
>  }
>
> +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool va=
lid)
> +{
> +       if (valid)
> +               return __set_pages_p(page, nr);
> +
> +       return __set_pages_np(page, nr);
> +}
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index e7aec20fb44f..3030d9245f5a 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -34,6 +34,12 @@ static inline int set_direct_map_default_noflush(struc=
t page *page)
>         return 0;
>  }
>
> +static inline int set_direct_map_valid_noflush(struct page *page,
> +                                              unsigned nr, bool valid)
> +{
> +       return 0;
> +}
> +
>  static inline bool kernel_page_present(struct page *page)
>  {
>         return true;
> --
> 2.43.0
>
