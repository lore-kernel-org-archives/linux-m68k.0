From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix "bad page state" oops on ColdFire boot
Date: Mon, 18 Jun 2018 08:58:11 +0200
Message-ID: <CAMuHMdXSaGtremvLCRzKm68s_dUEigL-VCmM-ar=T4PPJrECLw@mail.gmail.com>
References: <20180618060426.24497-1-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618060426.24497-1-gerg@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Matthew Wilcox <mawilcox@microsoft.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Jun 18, 2018 at 8:06 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> Booting a ColdFire m68k core with MMU enabled causes a "bad page state"
> oops since commit 1d40a5ea01d5 ("mm: mark pages in use for page tables"):
>
>  BUG: Bad page state in process sh  pfn:01ce2
>  page:004fefc8 count:0 mapcount:-1024 mapping:00000000 index:0x0
>  flags: 0x0()
>  raw: 00000000 00000000 00000000 fffffbff 00000000 00000100 00000200 00000000
>  raw: 039c4000
>  page dumped because: nonzero mapcount
>  Modules linked in:
>  CPU: 0 PID: 22 Comm: sh Not tainted 4.17.0-07461-g1d40a5ea01d5 #13
>
> Fix by calling pgtable_page_dtor() in our __pte_free_tlb() code path,
> so that the PG_table flag is cleared before we free the pte page.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> CC: Matthew Wilcox <mawilcox@microsoft.com>
> ---
>  arch/m68k/include/asm/mcf_pgalloc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> Matthew: I came across this thread at https://lkml.org/lkml/2018/6/17/163
>          about a similar problem with openrisc. Based on that I came up
>          with this fix for m68k/ColdFire. Fixes the issue for me.
>
> diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
> index 8b707c249026..8c441eb57b80 100644
> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -44,6 +44,7 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t page,
>                                   unsigned long address)
>  {
> +       pgtable_page_dtor(page);
>         __free_page(page);
>  }

Do you need a call to pgtable_page_dtor() in pte_free(), too?
On x86 (and motorola_pgalloc.h and sun3_pgalloc.h FWIW), both functions
call pgtable_page_dtor().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
