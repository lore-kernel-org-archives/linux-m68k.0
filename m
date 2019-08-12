From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 12 Aug 2019 14:15:05 +0200
Message-ID: <da84c857-2c2d-29ec-5e72-e719277faa2d@samsung.com>
References: <20190811153643.12029-1-max@enpas.org>
        <CGME20190811192838epcas1p16ec0d26fc6282e92da6aa82cdea330a5@epcas1p1.samsung.com>
        <d9fa8aca-62a4-5d4a-b63f-bdd628e6b304@enpas.org>
        <4729c030-549e-8797-f947-1620cd61d516@samsung.com>
        <27f3bb2f-e4b8-cfc9-26da-d0984f1bf37b@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27f3bb2f-e4b8-cfc9-26da-d0984f1bf37b@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org


On 8/12/19 12:55 PM, Max Staudt wrote:
> Hi Bartlomiej,
> 
> Thanks for your feedback!

Hi Max,

> On 08/12/2019 12:42 PM, Bartlomiej Zolnierkiewicz wrote:
>>
>> ide/buddha driver cannot be unloaded currently (it lacks module_exit()).
>>
>> [... snip ...]
>>
>> It should work exactly like the old code in case of X-Surf,
>> what do we need to release?
> 
> 
> So what shall I do? Once an X-Surf has been detected, we refuse to
> unload, and therefore we never have to release X-Surf resources?
> That would simplify things a lot.

Yes, it seems to be a simplest solution.

> What's a good way to do that, given that we now have module_exit()> defined and an exit function is void?

What about something like this:

static bool xsurf_present;
...
static int __init pata_buddha_late_init(void)
...
		if (pata_buddha_probe(z, &xsurf_ent) == 0 &&
		    xsurf_present == false)
			xsurf_present = true;
...
static void __exit pata_buddha_exit(void)
...
	if (xsurf_present)
		return -EBUSY;
...

?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
