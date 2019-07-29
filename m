From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of initcall
Date: Mon, 29 Jul 2019 13:58:48 +0200
Message-ID: <CAMuHMdXJc9RJx-Ntb9KCcJKoWPMDAsvqJMYLUOLvwEhVt8KBJg@mail.gmail.com>
References: <20190725180825.31508-1-max@enpas.org> <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
 <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org> <CGME20190729113035epcas2p213400dfb13ca10b4f24cedf856cf2187@epcas2p2.samsung.com>
 <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com> <3fb686e0-1f60-b7c3-5b88-83f63e56a563@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3fb686e0-1f60-b7c3-5b88-83f63e56a563@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Max Staudt <max@enpas.org>, Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Bartlomiej,

On Mon, Jul 29, 2019 at 1:52 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 7/29/19 1:30 PM, Geert Uytterhoeven wrote:
> > On Mon, Jul 29, 2019 at 1:10 PM Max Staudt <max@enpas.org> wrote:
> >> On 07/29/2019 11:05 AM, Geert Uytterhoeven wrote:
> >>>> --- a/drivers/ata/pata_buddha.c
> >>>> +++ b/drivers/ata/pata_buddha.c
> >>>
> >>>> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
> >>>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
> >>>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
> >>>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },
> >>>
> >>> drivers/net/ethernet/8390/zorro8390.c also matches against
> >>> ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, while only
> >>> a single zorro_driver can bind to it.  Hence you can no longer use both
> >>> IDE and Ethernet on X-Surf :-(
> >>> Before, this worked, as the IDE driver just walked the list of devices.
> >>
> >> Okay, now this gets dirty.
> >>
> >> The reason why I've submitted this patch is to allow pata_buddha to be built into the kernel at all. Without this patch, its initcall would be called before the Zorro structures are initialised, hence not finding any boards.
> >
> > IC. I wasn't aware of the new pata_buddha.c driver not working at all
> > when builtin.
>
> Isn't the same true also for old buddha.c driver?
> (please see below)

> >> What shall I do? Maybe as a stop-gap measure, we could hard-code a
> >> module_init() again, just for X-Surf? It's been good enough until a
> >> few weeks ago, so what could go wrong ;)
> >
> > In the short run: keep on using drivers/ide/buddha.c?
>
> IDE subsystem is initialized even before libata so I cannot see how
> this would help?
>
> drivers/Makefile:
> ...
> obj-$(CONFIG_IDE)               += ide/
> obj-y                           += scsi/
> obj-y                           += nvme/
> obj-$(CONFIG_ATA)               += ata/
> ...
> obj-$(CONFIG_ZORRO)             += zorro/
> ...
>
> What am I missing?

Oops, that might be an incorrect assumption on my side...
(note to myself: never assume existing code is actually working as
expected ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
