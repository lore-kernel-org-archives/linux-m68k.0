From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 29 Jul 2019 16:31:36 +0200
Message-ID: <b7473bd6-650d-f0b6-0d30-99e3b6b942b5@enpas.org>
References: <20190725180825.31508-1-max@enpas.org>
 <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
 <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
 <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUGsfzQg8xy2OqWfuo09MxwZ5OJz=t5CARJp+A1ZVtqaA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 07/29/2019 01:30 PM, Geert Uytterhoeven wrote:
>> What shall I do? Maybe as a stop-gap measure, we could hard-code a
>> module_init() again, just for X-Surf? It's been good enough until a
>> few weeks ago, so what could go wrong ;)
> 
> In the short run: keep on using drivers/ide/buddha.c?

See Bartlomiej's reply to your email: It suffers from the same problem. Building it in will result in the Buddha not being recognised, as the IDE driver scans for it before Zorro si initialised.

@Bartlomiej: You're not missing anything, the problem has gone unnoticed for ages ;)
However, using ide/buddha would work exactly as it has before: When loaded as a module after Zorro has been initialised, it works just fine.

We *could* also temporarily split off a pata_buddha_xsurf driver: pata_buddha would be auto-probed by the new framework, and pata_buddha_xsurf would do the old module_init() dance.
That is, until the MFD conversion happens.


> Your single Buddha should be sufficient to convert pata_buddha.c from
> a plain Zorro driver to an MFD cell driver, and test it.
> I expect the buddha-mfd.c MFD driver from my zorro-mfd branch to
> work as-is, or with very minor changes.
> 
> However, to keep X-Surf working, this needs to be synchronized with
> a Zorro MFD conversion of the zorro8390 driver, too.

Yeah, this second part is where I get caught up. I'd really like to test this with a real X-Surf, or have someone test it, before sending it upstream.


> Yes, the clockport could be added as an extra MFD cell.  Later, drivers can
> be written to bind against the clockport cell.

Yes, but how can we assign specific drivers to specific clockports? As they are non-enumerable (are they?), we can't auto-probe them.



Max
