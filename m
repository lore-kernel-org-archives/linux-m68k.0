From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v5] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Tue, 20 Aug 2019 18:54:16 +0200
Message-ID: <75af4479-da1c-9f5f-cff1-1428065ea4ad@samsung.com>
References: <CGME20190812164840epcas2p4b88d3ebaf313f0c99ccb693047bce04c@epcas2p4.samsung.com>
        <20190812164830.16244-1-max@enpas.org>
        <9966f79c-278b-5ec9-3c4b-e1de55af55f0@samsung.com>
        <89894d50-0e3c-4d43-37b2-ff5be407e58c@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <89894d50-0e3c-4d43-37b2-ff5be407e58c@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org


On 8/20/19 5:59 PM, Max Staudt wrote:
> Hi Bartlomiej,
> 
> Thank you very much for your review!
> 
> Question below.
> 
> 
> On 08/20/2019 02:06 PM, Bartlomiej Zolnierkiewicz wrote:
>>> +	/* Workaround for X-Surf: Save drvdata in case zorro8390 has set it */
>>> +	old_drvdata = dev_get_drvdata(&z->dev);
>>
>> This should be done only for type == BOARD_XSURF.
> 
> Agreed, as I want to keep unloading functional for Buddha/Catweasel - see below.
> 
> 
>>> +static struct zorro_driver pata_buddha_driver = {
>>> +	.name           = "pata_buddha",
>>> +	.id_table       = pata_buddha_zorro_tbl,
>>> +	.probe          = pata_buddha_probe,
>>> +	.remove         = pata_buddha_remove,
>>
>> I think that we should also add:
>>
>> 	.driver  = {
>> 		.suppress_bind_attrs = true,
>> 	},
>>
>> to prevent the device from being unbinded (and thus ->remove called)
>> from the driver using sysfs interface.
> 
> Interesting idea - here's my question now:
> 
> My intention is to allow remove() for boards where we support IDE only (Buddha, Catweasel) - these are autoprobed via zorro_register_driver().
> This shouldn't affect the X-Surf case, as it's not autoprobed in this way anyway - and thus pata_buddha_driver isn't even used.
> 
> Am I missing something? We want to inhibit module unloading (hence no module_exit()), but driver unbinding for Buddha/Catweasel should be fine to remain, right?

Indeed, pata_buddha_driver is not even used for X-Surf so this is not
an issue (please disregard my comment about suppress_bind_attrs).

>> Please also always check your patches with scripts/checkpatch.pl and
>> fix the reported issues:
> 
> Apologies, must've been something in my coffee. I will.
> 
> 
> Thanks for the review, I'll send a new patch once my question above is resolved.
> 
> Max
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
