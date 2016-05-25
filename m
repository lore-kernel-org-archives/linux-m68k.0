From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08v2/10] m68k: Add <asm/archhash.h>
Date: Wed, 25 May 2016 10:48:34 +0200
Message-ID: <CAMuHMdWncJ30REHVSBz0zOPkg5G1m_z6rWHpfD-2ZRxLLkS5QA__21524.1121979945$1464166140$gmane$org@mail.gmail.com>
References: <CAMuHMdU51iHeG6rhDmGRK90ZrxfrdDifxt2gome7BWn+ciumMw@mail.gmail.com>
	<20160525082401.7249.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160525082401.7249.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: Greg Ungerer <gerg@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

On Wed, May 25, 2016 at 10:24 AM, George Spelvin
<linux@sciencehorizons.net> wrote:
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -40,6 +40,7 @@ config M68000
>         select CPU_HAS_NO_MULDIV64
>         select CPU_HAS_NO_UNALIGNED
>         select GENERIC_CSUM
> +       select HAVE_ARCH_HASH
>         help
>           The Freescale (was Motorola) 68000 CPU is the first generation of
>           the well known M68K family of processors. The CPU core as well as
> diff --git a/arch/m68k/include/asm/archhash.h b/arch/m68k/include/asm/archhash.h
> new file mode 100644
> index 00000000..2532cf92
> --- /dev/null
> +++ b/arch/m68k/include/asm/archhash.h
> @@ -0,0 +1,58 @@
> +#ifndef _ASM_ARCHHASH_H
> +#define _ASM_ARCHHASH_H
> +
> +/*
> + * The only 68k processors that lack MULU.L and so need this workaround
> + * are the original 68000 and 68010.
> + */
> +#if defined(CONFIG_M68000) || defined(CONFIG_M68010)

As I said before, I don't think you need this check, given HAVE_ARCH_HASH is
selected by M68000, and M68010 doesn't exist.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
