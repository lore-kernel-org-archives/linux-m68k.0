From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] Add support to M54xx DMA FEC Driver
Date: Wed, 5 Sep 2012 13:25:35 +0200
Message-ID: <CAMuHMdWwSe8-DHUiRF89P2Vf99U4C1tsFaqjswdOEk5TuKJXaQ__2080.83290276608$1346844787$gmane$org@mail.gmail.com>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com>
	<1345551531-15348-3-git-send-email-stany.marcel@novasys-ingenierie.com>
	<503C5C5C.8000901@snapgear.com>
	<20120905091426.GA16015@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120905091426.GA16015@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Greg Ungerer <gerg@snapgear.com>, Stany MARCEL <stany.marcel@novasys-ingenierie.com>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Wed, Sep 5, 2012 at 11:14 AM, Philippe De Muyter <phdm@macqel.be> wrote:
> and I am now at :
>     464 WARNING: line over 80 characters
>      90 WARNING: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
>
> Many "volatile" warnings are about such definitions :
>
> #define FEC_FECFRST(x)                 (*(volatile unsigned int *)(x + 0x1C4))
> which are afterwards used with
>
> +       FEC_FECFRST(base_addr) |= FEC_SW_RST;
> +       FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
> +               FEC_FECFRST(base_addr) |= FEC_SW_RST;
> +               FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
> +       FEC_FECFRST(base_addr) |= FEC_SW_RST | FEC_RST_CTL;
> +       FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
>
> Any advice about those ones ?
>
> while many "80 characters" ones are about :
> #4014: FILE: arch/m68k/platform/coldfire/MCD_tasks.c:2406:
> +       0x6000000b, /* 0098(:1560):      DRD2A: EU0=0 EU1=0 EU2=0 EU3=11 EXT ini
> t=0 WS=0 RS=0 */
>
> I would like to keep those lines intact because the comment seems to actually
> be the assembler source of the hex value at left, which seems to be a
> microcode, and it makes sense to me to keep that on one line.  What do
> you think about that ?

Just ignore these 2 warnings (for this particular case).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
