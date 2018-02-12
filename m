From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH net v4 01/13] net/8390: Remove redundant make dependencies
Date: Mon, 12 Feb 2018 09:16:43 +0100
Message-ID: <CAMuHMdVVu4CZ3sj0fJ4NS0Qn5wJmpVM1Z32_B2bgs5FyQXK8mw@mail.gmail.com>
References: <cover.1518397634.git.fthain@telegraphics.com.au> <46988f8227bd3ad617b5c7dd0ce8f159b75ffdb2.1518397634.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46988f8227bd3ad617b5c7dd0ce8f159b75ffdb2.1518397634.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "David S. Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Feb 12, 2018 at 4:08 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> The hydra, zorro8390 and mcf8390 drivers all #include "lib8390.c" and
> have no need for 8390.o. modinfo confirms no dependency on 8390.ko.
> Drop the redundant dependency from the Makefile. objdump confirms
> that this has no effect on the module binaries.
>
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

The superfluous additions of 8390.o were introduced in commit
644570b830266ff3 ("8390: Move the 8390 related drivers").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
