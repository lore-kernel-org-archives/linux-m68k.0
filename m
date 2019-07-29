From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 29 Jul 2019 13:09:58 +0200
Message-ID: <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
References: <20190725180825.31508-1-max@enpas.org>
 <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Geert,

On 07/29/2019 11:05 AM, Geert Uytterhoeven wrote:
>> --- a/drivers/ata/pata_buddha.c
>> +++ b/drivers/ata/pata_buddha.c
> 
>> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },
> 
> drivers/net/ethernet/8390/zorro8390.c also matches against
> ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, while only
> a single zorro_driver can bind to it.  Hence you can no longer use both
> IDE and Ethernet on X-Surf :-(
> Before, this worked, as the IDE driver just walked the list of devices.

Okay, now this gets dirty.

The reason why I've submitted this patch is to allow pata_buddha to be built into the kernel at all. Without this patch, its initcall would be called before the Zorro structures are initialised, hence not finding any boards.

That means that not only would the previous driver only make sense as a module that is manually ensured to be loaded after Zorro has started, but the X-Surf IDE support was a really ugly hack to begin with.


> I think the proper solution is to create MFD devices for Zorro boards
> with multiple functions, and bind against the individual MFD cells.
> That would also get rid of the nr_ports loop in the IDE driver, as each
> instance would have its own cell.
> 
> I played with this a long time ago, but never finished it.
> It worked fine for my Ariadne Ethernet card.
> Last state at
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd
> 
> Oh, seems I wrote up most of this before in
> https://lore.kernel.org/lkml/CAMuHMdVe1KgQWYZ_BfBkSo3zr0c+TenLMEw3T=BLEQNoZ6ex7A@mail.gmail.com/

This looks great!

Unfortunately, I don't have any MFD hardware other than a single Buddha to test this with. I especially don't have an X-Surf, hence no good way of testing this other than the two IDE channels on my Buddha. WinUAE doesn't seem to emulate the IDE controller either.

What shall I do? Maybe as a stop-gap measure, we could hard-code a module_init() again, just for X-Surf? It's been good enough until a few weeks ago, so what could go wrong ;)


On another note: Maybe your MFD idea could be used to expose the clockports on the Buddhas as well? That wouldn't solve the issue of clockport *expansions* being fundamentally non-enumerable, but maybe you can think of a reasonable way to attach a driver?


Thanks for your feedback,
Max
