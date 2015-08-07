From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 03/31] arch/m68k/bootinfo: use kmemdup rather than
 duplicating its implementation
Date: Fri, 7 Aug 2015 12:23:20 +0200
Message-ID: <CAMuHMdUiTkteqpdVuW06L=fbuyscwuRN+fZ8cR3zR=nujimS=Q@mail.gmail.com>
References: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
	<1438934377-4922-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1438934377-4922-4-git-send-email-a.hajda@samsung.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Fri, Aug 7, 2015 at 9:59 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> The patch was generated using fixed coccinelle semantic patch
> scripts/coccinelle/api/memdup.cocci [1].
>
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2014320
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Thanks, will apply and queue for v4.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
