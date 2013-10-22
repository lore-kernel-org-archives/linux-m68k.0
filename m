From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Kernel sections loosing attributes
Date: Tue, 22 Oct 2013 11:55:04 +0200
Message-ID: <CAMuHMdU2_pjLTTEfxteZBQ=TzpyX_BTgyjpOeJ7ja3yJHGbfFg@mail.gmail.com>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Oct 21, 2013 at 9:55 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> However, just disabling CONFIG_XZ_DEC on one of my defconfigs
> still gave a working kernel. So there must be a deeper issue.

Just disabling CONFIG_XZ_DEC is not enough as there's also
a MODULE_VERSION() in net/ipv4/tcp_cubic.c.
So you also have to disable CONFIG_TCP_CONG_CUBIC.

 __start___modver and __stop___modver are equal, so the __modver
section has no entries, but it's size is non-zero:

  4 __modver      000005a0  00185a60  00185a60  00185a60  2**0
                  ALLOC

BTW, so far it didn't crash on ARAnyM, but if there's memory corruption,
it still may go undetected depending on what is corrupted.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
