From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of initcall
Date: Mon, 29 Jul 2019 17:26:41 +0200
Message-ID: <CAMuHMdXVzX6cm4uTe7OipAuR4viye32yKuHWJBzuLpR_wqyRhQ@mail.gmail.com>
References: <20190725180825.31508-1-max@enpas.org> <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
 <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org> <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com>
 <b7473bd6-650d-f0b6-0d30-99e3b6b942b5@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b7473bd6-650d-f0b6-0d30-99e3b6b942b5@enpas.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Max,

On Mon, Jul 29, 2019 at 4:31 PM Max Staudt <max@enpas.org> wrote:
> On 07/29/2019 01:30 PM, Geert Uytterhoeven wrote:
> >> What shall I do? Maybe as a stop-gap measure, we could hard-code a
> >> module_init() again, just for X-Surf? It's been good enough until a
> >> few weeks ago, so what could go wrong ;)
> >
> > In the short run: keep on using drivers/ide/buddha.c?
>
> See Bartlomiej's reply to your email: It suffers from the same problem. Building it in will result in the Buddha not being recognised, as the IDE driver scans for it before Zorro si initialised.

Thanks for the confirmation.

> @Bartlomiej: You're not missing anything, the problem has gone unnoticed for ages ;)
> However, using ide/buddha would work exactly as it has before: When loaded as a module after Zorro has been initialised, it works just fine.
>
> We *could* also temporarily split off a pata_buddha_xsurf driver: pata_buddha would be auto-probed by the new framework, and pata_buddha_xsurf would do the old module_init() dance.
> That is, until the MFD conversion happens.

Or add temporarily a late_initcall() to find all X-Surf boards using
zorro_find_device(), create fake zorro_device_id entries, and pass both
to pata_buddha_probe()?  A big ugly, but that should work.

> > Your single Buddha should be sufficient to convert pata_buddha.c from
> > a plain Zorro driver to an MFD cell driver, and test it.
> > I expect the buddha-mfd.c MFD driver from my zorro-mfd branch to
> > work as-is, or with very minor changes.
> >
> > However, to keep X-Surf working, this needs to be synchronized with
> > a Zorro MFD conversion of the zorro8390 driver, too.
>
> Yeah, this second part is where I get caught up. I'd really like to test this with a real X-Surf, or have someone test it, before sending it upstream.

Of course it should be tested ;-)
Converting zorro8390.c from a zorro driver to an MFD cell driver should
not require that many changes, most bugs should be caught by code review.
I already have a skeleton 8390-cell.c driver in my zorro-mfd branch.

> > Yes, the clockport could be added as an extra MFD cell.  Later, drivers can
> > be written to bind against the clockport cell.
>
> Yes, but how can we assign specific drivers to specific clockports? As they are non-enumerable (are they?), we can't auto-probe them.

That's something the user has to configure.
The Buddha MFD driver registers an "a1200-clockport" cell, which is
really a separate platform device.
The user writes the name of the actual driver to use to the device's
driver_override file in sysfs, after which the driver is bound
automatically.  See Documentation/ABI/testing/sysfs-bus-platform,

The alternative would be to have multiple drivers matching against
"a1200-clockport", and the user modprobe'ing the correct one to use.
But that won't work with http://wiki.icomp.de/wiki/A500/A1000_clockport
and plugging in two different clock port boards.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
