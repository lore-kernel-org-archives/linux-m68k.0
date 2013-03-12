From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] mtd: remove dead map drivers
Date: Tue, 12 Mar 2013 12:21:19 +0100
Message-ID: <CAMuHMdWT1DXrOjpqXbLWqh982qHD8vAy-dwXGcUn4HoTMEZVxQ@mail.gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, linux-pcmcia@lists.infradead.org, linux-m68k@lists.linux-m68k.org

On Tue, Mar 12, 2013 at 12:14 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> This patch-set removes a bunch of dean MTD map drivers. The way I judged
> whether a driver is dead or not was looking at driver's dependencies in the
> Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
> not defined anywhere, I treated the driver as dead.
>
> The motivation for this patch-set is to clean up the MTD subsystem a little and
> lessen the maintenance burden. Indeed, the less drivers we have, the easier it
> is to do MTD framework refactoring.

Most of these are PPC boards, not m68k.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
