From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/sun3: Fix virtual addresses of clock and interrupt register
Date: Fri, 25 Sep 2015 09:21:34 +0200
Message-ID: <CAMuHMdU-ZjWPw8D2KYjBgMdRM_k+BTfhKC81RcSkB_s8Mzjmwg@mail.gmail.com>
References: <1442223611-30175-1-git-send-email-kuleshovmail@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1442223611-30175-1-git-send-email-kuleshovmail@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Kuleshov <kuleshovmail@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Alexander,

On Mon, Sep 14, 2015 at 11:40 AM, Alexander Kuleshov
<kuleshovmail@gmail.com> wrote:
> The MMU base is 32 bits size - 0xfe000000, seems that we missed
> one zero in the definition of the clock and interrupt register
> addresses.

Thanks for your patch!

Have you tested this?

This means enabling/disabling interrupts never worked on Sun 3, which
I find a bit difficult to believe.
There are other 0x0f?????? addresses in arch/m68k/sun3/mmu_emu.c.

> Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>
> ---
>  arch/m68k/sun3/config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
> index a8b942b..c9c388f 100644
> --- a/arch/m68k/sun3/config.c
> +++ b/arch/m68k/sun3/config.c
> @@ -61,8 +61,8 @@ void __init sun3_init(void)
>         m68k_cputype = CPU_68020;
>         m68k_fputype = FPU_68881; /* mc68881 actually */
>         m68k_mmutype = MMU_SUN3;
> -       clock_va    =          (char *) 0xfe06000;      /* dark  */
> -       sun3_intreg = (unsigned char *) 0xfe0a000;      /* magic */
> +       clock_va    =          (char *) 0xfe006000;     /* dark  */
> +       sun3_intreg = (unsigned char *) 0xfe00a000;     /* magic */
>         sun3_disable_interrupts();

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
