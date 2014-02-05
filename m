From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] m68k: Switch to asm-generic/barrier.h
Date: Wed, 5 Feb 2014 08:47:01 +0100
Message-ID: <CAMuHMdWdNtGaOAxhpBEJdb7VspRmd1bd_GwD8af1nzAuu7VfHA@mail.gmail.com>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org>
	<1391544954-7422-2-git-send-email-geert@linux-m68k.org>
	<alpine.LNX.2.00.1402051145390.2188@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1402051145390.2188@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Finn,

On Wed, Feb 5, 2014 at 2:03 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Tue, 4 Feb 2014, Geert Uytterhoeven wrote:
>> The generic nop() implementation is fine for m68k.
>
> If the barrier in the old nop() implementation isn't needed anymore,
> perhaps we should also remove the nop() instances in macfb.c? One comment
> from this file says, "the nop's are there to order writes". (I don't know
> whether there is any timing issue here. Seeing the way nop() was sprinkled
> through macfb.c, I doubt that there is.) Is the volatile casting in
> nubus_writeb() aka raw_outb() aka out_8() equivalent to the old barrier?

barrier() does:

#define barrier() __asm__ __volatile__("": : :"memory")

I.e. it prevents gcc from:
  1. Reordering instructions due to the volatile,
  2. Caching data in registers due to the "memory".

nop() still has the former, while the volatile casting in the I/O macros
should have the same effect as the latter.

So yes, I think they can be removed. Can you test that, please?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
