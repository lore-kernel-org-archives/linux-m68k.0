From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use PTR_RET rather than if(IS_ERR(.. [1]
Date: Sat, 18 Aug 2012 15:20:11 +0200
Message-ID: <CAMuHMdV-BMC5WSeU8RH0X17Hp32gyP1NWQJgnhDUCehniY+Rxw__39383.864918682$1345296353$gmane$org@mail.gmail.com>
References: <1344275476.14513.98.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1344275476.14513.98.camel@localhost.localdomain>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Meyer <thomas@m3y3r.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Thanks, applied and queued for 3.7.

On Mon, Aug 6, 2012 at 7:51 PM, Thomas Meyer <thomas@m3y3r.de> wrote:
> The semantic patch that makes this change is available
> in scripts/coccinelle/api/ptr_ret.cocci.
>
> More information about semantic patching is available at
> http://coccinelle.lip6.fr/
>
> Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
> ---
>
> diff -u -p a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
> --- a/arch/m68k/kernel/time.c
> +++ b/arch/m68k/kernel/time.c
> @@ -100,10 +100,7 @@ static int __init rtc_init(void)
>                 return -ENODEV;
>
>         pdev = platform_device_register_simple("rtc-generic", -1, NULL, 0);
> -       if (IS_ERR(pdev))
> -               return PTR_ERR(pdev);
> -
> -       return 0;
> +       return PTR_RET(pdev);
>  }
>
>  module_init(rtc_init);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
