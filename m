From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: eliminate -pipe from kernel compile
Date: Mon, 11 May 2009 08:02:16 +0200
Message-ID: <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com>
References: <20090511015831.GB15777@luminet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20090511015831.GB15777@luminet.net>
Sender: linux-kbuild-owner@vger.kernel.org
To: lancetag@luminet.net, linux-m68k@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Added linux-kbuild

On Mon, May 11, 2009 at 03:58, Lance Tagliapietra <lancetag@luminet.net=
> wrote:
> I was noticing that kernel compiling is set up to have gcc pipe data =
from one pass to another, instead of using
> temporary files. =C2=A0On a memory constrained environment, this may =
not be the best idea (or at least I'd like to
> explore that idea). =C2=A0Instead of loading the assember, and having=
 immediately being swapped out while the cc1 pass
> runs, it may make more sense to have the temp files being written, in=
stead of the swap in and out, when compiling
> the various objects of the kernel.
>
> So, simply pulling out the -pipe from the compiler flag list didn't s=
ee to have the desired effect. =C2=A0I'm afraid I'm
> still missing something. =C2=A0I'm still observing the assembler bein=
g loaded.
>
> Thoughts?

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
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
