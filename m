From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v5 00/26] Re-use nvram module
Date: Sun, 16 Aug 2015 11:15:25 +0200
Message-ID: <CAMuHMdWUQsSG8cZmKX8tHMN1=87Og-xboAFzhP1vWyQF+A3_eg@mail.gmail.com>
References: <20150725074559.543547894@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150725074559.543547894@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-m68k@vger.kernel.org

Hi Finn,

On Sat, Jul 25, 2015 at 9:45 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> The generic NVRAM module, drivers/char/generic_nvram, implements a
> /dev/nvram misc device. It is used only by 32-bit PowerPC platforms and
> isn't generic enough to be more widely used.

[...]

Thanks!

You can add my
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
to patches 03, 04, 11, 19, 23, 24, 25, 26.

BTW, checkpatch reported a few newly-introduced whitespace errors in patches
03, 05, 16, 24, and 25.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
