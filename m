From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] SUN3: Fix intruction faults
Date: Wed, 14 Nov 2012 08:46:08 +0100
Message-ID: <CAMuHMdUQ6VCPWZHrHKorTjrtMHFkrTReHOmh7V2rStO14gBufQ@mail.gmail.com>
References: <20121111122837.1955C1DBC3@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20121111122837.1955C1DBC3@solo.franken.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-m68k@lists.linux-m68k.org, sammy@sammy.net

On Sun, Nov 11, 2012 at 1:28 PM, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> We need to bring in the page where the instruction fault happened.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks, will queue for 3.8.

> ---
>
>  arch/m68k/kernel/traps.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> index 388e5cc..cbc624a 100644
> --- a/arch/m68k/kernel/traps.c
> +++ b/arch/m68k/kernel/traps.c
> @@ -506,7 +506,7 @@ static inline void bus_error030 (struct frame *fp)
>                 addr -= 2;
>
>         if (buserr_type & SUN3_BUSERR_INVALID) {
> -               if (!mmu_emu_handle_fault (fp->un.fmtb.daddr, 1, 0))
> +               if (!mmu_emu_handle_fault(addr, 1, 0))
>                         do_page_fault (&fp->ptregs, addr, 0);
>         } else {
>  #ifdef DEBUG

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
