From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 12 Aug 2019 17:01:09 +0200
Message-ID: <26447daa-b183-1121-b2a8-c295d7e3468d@samsung.com>
References: <20190811153643.12029-1-max@enpas.org>
        <CGME20190811192838epcas1p16ec0d26fc6282e92da6aa82cdea330a5@epcas1p1.samsung.com>
        <d9fa8aca-62a4-5d4a-b63f-bdd628e6b304@enpas.org>
        <4729c030-549e-8797-f947-1620cd61d516@samsung.com>
        <27f3bb2f-e4b8-cfc9-26da-d0984f1bf37b@enpas.org>
        <da84c857-2c2d-29ec-5e72-e719277faa2d@samsung.com>
        <94b4ef23-282d-44e4-d21e-60c8a33c342c@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <94b4ef23-282d-44e4-d21e-60c8a33c342c@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org


On 8/12/19 4:26 PM, Max Staudt wrote:
> On 08/12/2019 02:15 PM, Bartlomiej Zolnierkiewicz wrote:
>>> What's a good way to do that, given that we now have module_exit()> defined and an exit function is void?
>>
>> What about something like this:
>>
>> static bool xsurf_present;
>> ...
>> static int __init pata_buddha_late_init(void)
>> ...
>> 		if (pata_buddha_probe(z, &xsurf_ent) == 0 &&
>> 		    xsurf_present == false)
>> 			xsurf_present = true;
>> ...
>> static void __exit pata_buddha_exit(void)
>> ...
>> 	if (xsurf_present)
>> 		return -EBUSY;
>> ...
>>
>> ?
> 
> Okay, so we're talking about the same idea. Great!
> 
> Unfortunately, pata_buddha_exit() is void, and thus can't fail. According to Documentation/kernel-hacking/hacking.rst this is by design.

You are of course right and the example code is broken
(+ I need more caffeine).

> Any other ideas? We could also continue to disallow unloading completely until MFD support comes along.
Yes, this would also be OK.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
