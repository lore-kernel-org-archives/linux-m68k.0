From: Max <max@enpas.org>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 29 Jul 2019 17:38:45 +0200
Message-ID: <7a6f887f-b674-4db7-a09a-a028219ebce0@enpas.org>
References: <20190725180825.31508-1-max@enpas.org>
 <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
 <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
 <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com>
 <b7473bd6-650d-f0b6-0d30-99e3b6b942b5@enpas.org>
 <CAMuHMdXVzX6cm4uTe7OipAuR4viye32yKuHWJBzuLpR_wqyRhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXVzX6cm4uTe7OipAuR4viye32yKuHWJBzuLpR_wqyRhQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 07/29/2019 05:26 PM, Geert Uytterhoeven wrote:
>> We *could* also temporarily split off a pata_buddha_xsurf driver: pata_buddha would be auto-probed by the new framework, and pata_buddha_xsurf would do the old module_init() dance.
>> That is, until the MFD conversion happens.
> 
> Or add temporarily a late_initcall() to find all X-Surf boards using
> zorro_find_device(), create fake zorro_device_id entries, and pass both
> to pata_buddha_probe()?  A big ugly, but that should work.

Sounds good, and it replaces modile_init() at the same time. I'll implement this.


>>> Your single Buddha should be sufficient to convert pata_buddha.c from
>>> a plain Zorro driver to an MFD cell driver, and test it.
>>> I expect the buddha-mfd.c MFD driver from my zorro-mfd branch to
>>> work as-is, or with very minor changes.
>>>
>>> However, to keep X-Surf working, this needs to be synchronized with
>>> a Zorro MFD conversion of the zorro8390 driver, too.
>>
>> Yeah, this second part is where I get caught up. I'd really like to test this with a real X-Surf, or have someone test it, before sending it upstream.
> 
> Of course it should be tested ;-)
> Converting zorro8390.c from a zorro driver to an MFD cell driver should
> not require that many changes, most bugs should be caught by code review.
> I already have a skeleton 8390-cell.c driver in my zorro-mfd branch.

Honestly, at this point I'd rather do the hack above and keep the MFD stuff for later. Let's take it step by step. I'd prefer not to touch 8390 for now, unless I can get my hands on an X-Surf. I'd like to help with the MFD stuff as a way to enable the clockport and my SilverSurfer on it, but for the moment I'd rather move that further down the road.


>>> Yes, the clockport could be added as an extra MFD cell.  Later, drivers can
>>> be written to bind against the clockport cell.
>>
>> Yes, but how can we assign specific drivers to specific clockports? As they are non-enumerable (are they?), we can't auto-probe them.
> 
> That's something the user has to configure.
> The Buddha MFD driver registers an "a1200-clockport" cell, which is
> really a separate platform device.
> The user writes the name of the actual driver to use to the device's
> driver_override file in sysfs, after which the driver is bound
> automatically.  See Documentation/ABI/testing/sysfs-bus-platform,

That sounds just like what I was hoping for, thanks.


> The alternative would be to have multiple drivers matching against
> "a1200-clockport", and the user modprobe'ing the correct one to use.
> But that won't work with http://wiki.icomp.de/wiki/A500/A1000_clockport
> and plugging in two different clock port boards.

Eeeek no, that way one can't have multiple clockports and different/no devices on some of them. I think the sysfs solution above is perfect, given the nature of the clockport.


Thanks!
Max
