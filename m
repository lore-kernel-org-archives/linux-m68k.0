From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: Wed, 25 May 2016 10:07:19 +0200
Message-ID: <CAMuHMdU51iHeG6rhDmGRK90ZrxfrdDifxt2gome7BWn+ciumMw@mail.gmail.com>
References: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com>
	<20160525073455.5709.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160525073455.5709.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: Greg Ungerer <gerg@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>

Hi George,

On Wed, May 25, 2016 at 9:34 AM, George Spelvin
<linux@sciencehorizons.net> wrote:
> This provides a multiply by constant GOLDEN_RATIO_32 = 0x61C88647
> for the original mc68000, which lacks a 32x32-bit multiply instruction.
>
> Yes, the amount of optimization effort put in is excessive. :-)
>
> Addition chains found by Yevgen Voronenko's Hcub algorithm at
> http://spiral.ece.cmu.edu/mcm/gen.html
>
> Signed-off-by: George Spelvin <linux@sciencehorizons.net>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> ---
>  arch/m68k/Kconfig                |  1 +
>  arch/m68k/include/asm/archhash.h | 67 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 arch/m68k/include/asm/archhash.h
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 498b567f..95197d5e 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -23,6 +23,7 @@ config M68K
>         select MODULES_USE_ELF_RELA
>         select OLD_SIGSUSPEND3
>         select OLD_SIGACTION
> +       select HAVE_ARCH_HASH

"select HAVE_ARCH_HASH if M68000"?

Or better, move the select to the M68000 section in arch/m68k/Kconfig.cpu.

> --- /dev/null
> +++ b/arch/m68k/include/asm/archhash.h
> @@ -0,0 +1,67 @@
> +#ifndef _ASM_ARCHHASH_H
> +#define _ASM_ARCHHASH_H
> +
> +/*
> + * The only 68k processors that lack MULU.L and so need this workaround
> + * are the original 68000 and 68010.
> + *
> + * Annoyingly, GCC defines __mc68000 for all processors in the family;
> + * the only way to identify an mc68000 is by the *absence* of other
> + * symbols; __mcpu32, __mcoldfire__, __mc68020, etc.
> + */
> +#if ! (defined(__mc68020) || \
> +       defined(__mc68030) || \
> +       defined(__mc68040) || \
> +       defined(__mc68060) || \
> +       defined(__mcpu32)  || \
> +       defined(__mcoldfire))

With my comment above, you wouldn't need this, but I'm gonna comment anyway.

We don't use special GCCs to target specific CPU variants. Hence inside the
kernel, you should check the config symbols, to see if support for 68000 or
68010 (which isn't supported by the kernel yet) is enabled.

Hence the check should be:

    #if defined(CONFIG_M68000) || defined(CONFIG_M68010)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
