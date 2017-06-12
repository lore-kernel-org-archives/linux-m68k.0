From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 14/27] m68k: move generic-y of exported headers to uapi/asm/Kbuild
Date: Mon, 12 Jun 2017 14:10:50 +0200
Message-ID: <CAMuHMdXoZxwVRTtvbOt+QRiHCb0_S2YDpxm8=KZUJhimTnTMoQ__3478.92971844903$1497269467$gmane$org@mail.gmail.com>
References: <1497238041-7011-1-git-send-email-yamada.masahiro@socionext.com> <1497238041-7011-15-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1497238041-7011-15-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 12, 2017 at 5:27 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Since commit fcc8487d477a ("uapi: export all headers under uapi
> directories"), all (and only) headers under uapi directories are
> exported, but asm-generic wrappers are still exceptions.
>
> scripts/Makefile.headersinst still need to deal with old-kbuild-file
> for headers listed in arch/*/include/asm/Kbuild, but actually exported.
>
> As the last work to finish de-coupling the uapi from kernel headers,
> move generic-y of exported headers to uapi/asm/Kbuild.
>
> For m68k, "generic-y += termios.h" is doubled in asm/Kbuild and
> uapi/asm/Kbuild.  So, the one in the former can be simply removed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
