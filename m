From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] m68k: Declare __pfn_to_phys() for nommu case to fix
 build errors
Date: Sun, 10 Jan 2016 10:54:34 +0100
Message-ID: <CAMuHMdWRZrQawxLXSkXri7XpLArsj6Vgwv9gnEmwCc8+7NMgvw@mail.gmail.com>
References: <1452375482-23994-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1452375482-23994-1-git-send-email-linux@roeck-us.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>

Hi G=C3=BCnther,

Thanks for reporting!

On Sat, Jan 9, 2016 at 10:38 PM, Guenter Roeck <linux@roeck-us.net> wro=
te:
> __pfn_to_phys() was introduced with commit 8b79eb6f5b53e ("libnvdimm,=
 pfn,

Was it?

> pmem: allocate memmap array in persistent memory") but not declared f=
or
> m68k in nommu configurations. This results in the following build err=
or.

It used to fail on m68k with mmu, too, cfr. (badly-described) commit
7a6101c076fa6ae6 ("m68k: fix build failure").

> mm/page_alloc.c: In function 'memmap_init_zone':
> mm/page_alloc.c:4610:9: error: implicit declaration of function '__pf=
n_to_phys'
>
> Fixes: 8b79eb6f5b53e ("libnvdimm, pfn, pmem: allocate memmap array in=
 persistent memory")
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/m68k/include/asm/page_no.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/=
page_no.h
> index fa7f32d9836b..f389f575b93f 100644
> --- a/arch/m68k/include/asm/page_no.h
> +++ b/arch/m68k/include/asm/page_no.h
> @@ -19,6 +19,8 @@ extern unsigned long memory_end;
>  #define __pa(vaddr)            ((unsigned long)(vaddr))
>  #define __va(paddr)            ((void *)(paddr))
>
> +#define __pfn_to_phys(pfn)     PFN_PHYS(pfn)
> +
>  #define virt_to_pfn(kaddr)     (__pa(kaddr) >> PAGE_SHIFT)
>  #define pfn_to_virt(pfn)       __va((pfn) << PAGE_SHIFT)

To avoid adding the same line(s) to page_mm.h and page_no.h, I'm gonna
apply Sudip's patch to page.h instead of page_mm.h.

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
