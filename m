From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: remove unneeded linux/miscdevice.h include
Date: Thu, 9 Feb 2017 14:23:20 +0100
Message-ID: <CAMuHMdWJWqnLPFqm3-+W2XW47294_gr6YtBVerYFTRpP26zqcg@mail.gmail.com>
References: <20161215150208.30752-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20161215150208.30752-1-clabbe.montjoie@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Joshua Thompson <funaho@jurai.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 15, 2016 at 4:02 PM, Corentin Labbe
<clabbe.montjoie@gmail.com> wrote:
> arch/m68k/mac/misc.c does not use any miscdevice so the
> inclusion of linux/miscdevice.h is unnecessary.
> This patch remove this unnecessary include.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks, applied and queued for v4.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
