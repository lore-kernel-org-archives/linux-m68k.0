From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2] m68k: fix "bad page state" oops on ColdFire boot
Date: Tue, 19 Jun 2018 08:53:32 +0200
Message-ID: <CAMuHMdWtKzHbzDKkV-AtCd+hgHy0jNx=beQLDHL+vQfHQOxf8Q@mail.gmail.com>
References: <20180619004659.19864-1-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619004659.19864-1-gerg@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Matthew Wilcox <willy@infradead.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Jun 19, 2018 at 2:47 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
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
> Note that I had to change the type of pte_free() to be static from
> extern. Otherwise you get a lot of warnings like this:
>
> ./arch/m68k/include/asm/mcf_pgalloc.h:80:2: warning: ‘pgtable_page_dtor’ is static but used in inline function ‘pte_free’ which is not static
>   pgtable_page_dtor(page);
>   ^
>
> And making it static is consistent with our use of this in the other
> m68k pgalloc definitions of pte_free().
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> CC: Matthew Wilcox <mawilcox@microsoft.com>

CC: Matthew Wilcox <willy@infradead.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
