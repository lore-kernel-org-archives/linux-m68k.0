From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] microblaze: Remove architecture heart beat code
Date: Mon, 11 Jun 2018 10:52:04 +0200
Message-ID: <CAMuHMdVfYWrhvhDDgHanMq6LpnruBiRZYRdAbMj5WiJJKvJ+Tw@mail.gmail.com>
References: <84075652e978661247d71f84de46efd827869948.1528697370.git.michal.simek@xilinx.com>
 <CACRpkdb=Vfs6R+576+Wjh1cOh8ti-8jkGhj7Pw8zXdOxvHKOCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb=Vfs6R+576+Wjh1cOh8ti-8jkGhj7Pw8zXdOxvHKOCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Neil Armstrong <narmstrong@baylibre.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

On Mon, Jun 11, 2018 at 10:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jun 11, 2018 at 8:09 AM, Michal Simek <michal.simek@xilinx.com> wrote:
> > There is no reason to keep this gpio based code in architecture. Use
> > ledtrig-heartbeat.c instead which is much more flexible then this
> > ancient code.
> >
> > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Maybe the arch maintainers will complain that the corresponding
> new heartbeat code is not put in place in the same patch, but I
> think the change is so much overdue that I don't see why they
> can't do that themselves if they have interest in it.
>
> BTW: m68k has the same kind of luggage, in the middle of it
> timekeeping code:
> arch/m68k/kernel/time.c

Fixing that means converting m68k to GPIO first, which would take lots of
heartbeats ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
