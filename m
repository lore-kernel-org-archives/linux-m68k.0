From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 29 Jul 2019 13:52:29 +0200
Message-ID: <3fb686e0-1f60-b7c3-5b88-83f63e56a563@samsung.com>
References: <20190725180825.31508-1-max@enpas.org>
        <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
        <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
        <CGME20190729113035epcas2p213400dfb13ca10b4f24cedf856cf2187@epcas2p2.samsung.com>
        <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Max Staudt <max@enpas.org>
Cc: Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org


Hi,

On 7/29/19 1:30 PM, Geert Uytterhoeven wrote:
> Hi Max,
> 
> On Mon, Jul 29, 2019 at 1:10 PM Max Staudt <max@enpas.org> wrote:
>> On 07/29/2019 11:05 AM, Geert Uytterhoeven wrote:
>>>> --- a/drivers/ata/pata_buddha.c
>>>> +++ b/drivers/ata/pata_buddha.c
>>>
>>>> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
>>>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
>>>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
>>>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },
>>>
>>> drivers/net/ethernet/8390/zorro8390.c also matches against
>>> ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, while only
>>> a single zorro_driver can bind to it.  Hence you can no longer use both
>>> IDE and Ethernet on X-Surf :-(
>>> Before, this worked, as the IDE driver just walked the list of devices.
>>
>> Okay, now this gets dirty.
>>
>> The reason why I've submitted this patch is to allow pata_buddha to be built into the kernel at all. Without this patch, its initcall would be called before the Zorro structures are initialised, hence not finding any boards.
> 
> IC. I wasn't aware of the new pata_buddha.c driver not working at all
> when builtin.

Isn't the same true also for old buddha.c driver?
(please see below)

>> That means that not only would the previous driver only make sense as a module that is manually ensured to be loaded after Zorro has started, but the X-Surf IDE support was a really ugly hack to begin with.
> 
> Right. Please note that most drivers for Zorro boards predate the device
> driver framework, and thus all started life using zorro_find_device().
> But this did have the advantage of supporting multi-function cards
> out-of-the-box.
> Later, several drivers were converted to the new driver framework.
> but not all of them, due to multi-function cards.
> 
>>> I think the proper solution is to create MFD devices for Zorro boards
>>> with multiple functions, and bind against the individual MFD cells.
>>> That would also get rid of the nr_ports loop in the IDE driver, as each
>>> instance would have its own cell.
>>>
>>> I played with this a long time ago, but never finished it.
>>> It worked fine for my Ariadne Ethernet card.
>>> Last state at
>>> https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd
>>>
>>> Oh, seems I wrote up most of this before in
>>> https://lore.kernel.org/lkml/CAMuHMdVe1KgQWYZ_BfBkSo3zr0c+TenLMEw3T=BLEQNoZ6ex7A@mail.gmail.com/
>>
>> This looks great!
>>
>> Unfortunately, I don't have any MFD hardware other than a single
>> Buddha to test this with. I especially don't have an X-Surf, hence no
>> good way of testing this other than the two IDE channels on my Buddha.
>> WinUAE doesn't seem to emulate the IDE controller either.
>>
>> What shall I do? Maybe as a stop-gap measure, we could hard-code a
>> module_init() again, just for X-Surf? It's been good enough until a
>> few weeks ago, so what could go wrong ;)
> 
> In the short run: keep on using drivers/ide/buddha.c?

IDE subsystem is initialized even before libata so I cannot see how
this would help?

drivers/Makefile:
...
obj-$(CONFIG_IDE)               += ide/
obj-y                           += scsi/
obj-y                           += nvme/
obj-$(CONFIG_ATA)               += ata/
...
obj-$(CONFIG_ZORRO)             += zorro/
...

What am I missing?

> Your single Buddha should be sufficient to convert pata_buddha.c from
> a plain Zorro driver to an MFD cell driver, and test it.
> I expect the buddha-mfd.c MFD driver from my zorro-mfd branch to
> work as-is, or with very minor changes.
> 
> However, to keep X-Surf working, this needs to be synchronized with
> a Zorro MFD conversion of the zorro8390 driver, too.
> 
>> On another note: Maybe your MFD idea could be used to expose the
>> clockports on the Buddhas as well? That wouldn't solve the issue of
>> clockport *expansions* being fundamentally non-enumerable, but maybe
>> you can think of a reasonable way to attach a driver?
> 
> Yes, the clockport could be added as an extra MFD cell.  Later, drivers can
> be written to bind against the clockport cell.
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
