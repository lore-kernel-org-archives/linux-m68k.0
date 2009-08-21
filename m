From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix compilation
Date: Fri, 21 Aug 2009 22:13:35 +0200
Message-ID: <10f740e80908211313j3a6eb4daodea398e60e187ad7@mail.gmail.com>
References: <20090709130838.GA32685@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f196.google.com ([209.85.216.196]:59572 "EHLO
	mail-px0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932390AbZHUUNd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Aug 2009 16:13:33 -0400
Received: by pxi34 with SMTP id 34so4189764pxi.4
        for <linux-m68k@vger.kernel.org>; Fri, 21 Aug 2009 13:13:35 -0700 (PDT)
In-Reply-To: <20090709130838.GA32685@x200.localdomain>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: zippel@linux-m68k.org, linux-m68k@vger.kernel.org

On Thu, Jul 9, 2009 at 15:08, Alexey Dobriyan<adobriyan@gmail.com> wrot=
e:
> * pgprot_noncached() should be defined _before_ including asm-generic=
/pgtable.h

Thanks, applied!

> * kunmap() wants struct page *, not pte

=46or this part, I took the solution from Andrew Morton.

> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>
> =C2=A0arch/m68k/include/asm/motorola_pgalloc.h | =C2=A0 =C2=A02 +-
> =C2=A0arch/m68k/include/asm/pgtable_mm.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A03 +--
> =C2=A02 files changed, 2 insertions(+), 3 deletions(-)
>
> commit 85dc40e8bc39f106fdf926739acfd23c2a574d9a
> Author: Alexey <adobriyan@gmail.com>
> Date: =C2=A0 Thu Jul 9 07:41:54 2009 +0400
>
> =C2=A0 =C2=A0m68k fix
>
> --- a/arch/m68k/include/asm/motorola_pgalloc.h
> +++ b/arch/m68k/include/asm/motorola_pgalloc.h
> @@ -41,7 +41,7 @@ static inline pgtable_t pte_alloc_one(struct mm_str=
uct *mm, unsigned long addres
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flush_tlb_kern=
el_page(pte);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nocache_page(p=
te);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 kunmap(pte);
> + =C2=A0 =C2=A0 =C2=A0 kunmap(page);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pgtable_page_ctor(page);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return page;
> =C2=A0}
> --- a/arch/m68k/include/asm/pgtable_mm.h
> +++ b/arch/m68k/include/asm/pgtable_mm.h
> @@ -135,8 +135,6 @@ static inline void update_mmu_cache(struct vm_are=
a_struct *vma,
> =C2=A0#endif
>
> =C2=A0#ifndef __ASSEMBLY__
> -#include <asm-generic/pgtable.h>
> -
> =C2=A0/*
> =C2=A0* Macro to mark a page protection value as "uncacheable".
> =C2=A0*/
> @@ -154,6 +152,7 @@ static inline void update_mmu_cache(struct vm_are=
a_struct *vma,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? (__pgprot((pgprot_val(prot=
) & _CACHEMASK040) | _PAGE_NOCACHE_S)) =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: (prot)))
>
> +#include <asm-generic/pgtable.h>
> =C2=A0#endif /* !__ASSEMBLY__ */
>
> =C2=A0/*

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
