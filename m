From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: skip futex_atomic_cmpxchg_inatomic() test
Date: Wed, 5 Mar 2014 20:01:39 +0100
Message-ID: <CAMuHMdU-5dw9mzJTf-29FAo1NBOnUnqCDv9GPfYRTvuRCS+9Xw@mail.gmail.com>
References: <alpine.LNX.2.00.1403041740580.17377@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1403041740580.17377@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 4, 2014 at 8:28 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> The futex_atomic_cmpxchg_inatomic() test in futex_init() causes a fatal
> exception on 68030 (and presumably 68020 also).

Thanks!

> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
>
> Ingo Molnar has committed Heiko Carstens' patch to the -tip repo:

You mean Thomas Gleixner? ;-)

> http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?id=03b8c7b623c80af264c4c8d6111e5c6289933666
>
> I downloaded that patch and tested it along with the patch below, and
> together these fix the boot crash.
>
> What's the best way to merge this? Perhaps it should be sent on to the
> -tip maintainers?

Yes, please.

And when it's in Linus' tree, we'll have to invoke -stable.

> Index: linux-m68k/arch/m68k/Kconfig
> ===================================================================
> --- linux-m68k.orig/arch/m68k/Kconfig
> +++ linux-m68k/arch/m68k/Kconfig
> @@ -17,6 +17,7 @@ config M68K
>         select FPU if MMU
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
> +       select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
>         select HAVE_MOD_ARCH_SPECIFIC
>         select MODULES_USE_ELF_REL
>         select MODULES_USE_ELF_RELA

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
