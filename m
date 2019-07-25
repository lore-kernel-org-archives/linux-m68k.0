From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v2] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Thu, 25 Jul 2019 19:33:44 +0200
Message-ID: <a81d7a5f-c773-9769-cddd-95d2fe47d32e@enpas.org>
References: <20190725102211.8526-1-max@enpas.org>
 <CGME20190725170359eucas1p271187268f749869088f60bf961194169@eucas1p2.samsung.com>
 <01cfe282-6ce6-ff40-9e85-e23724f9d50f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <01cfe282-6ce6-ff40-9e85-e23724f9d50f@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

On 07/25/2019 07:03 PM, Bartlomiej Zolnierkiewicz wrote:
>> +err_ata_host_alloc:
>> +	switch (type) {
>> +	case BOARD_BUDDHA:
>> +	case BOARD_CATWEASEL:
>> +	default:
>> +		devm_release_mem_region(&z->dev,
>> +					board + BUDDHA_BASE1,
>> +					0x800);
> 
> Could you please explain why this is needed now?
> 
> [ The whole idea of using devm_* helpers is to not have to release
>   resources explicitly. ]

My mistake. Thanks, I'll fix it.


>> +static void pata_buddha_remove(struct zorro_dev *zdev)
>> +{
>> +	/* NOT IMPLEMENTED */
>> +
>> +	WARN_ONCE(1, "pata_buddha: Attempted to remove driver. This is not implemented yet.\n");
> 
> Please try to implement it, should be as simple as:
> 
> static void pata_buddha_remove(struct zorro_dev *zdev)
> {
> 	struct ata_host *host = dev_get_drvdata(&zdev->dev);
> 
> 	ata_host_detach(host);
> }
> 
> [ ata_host_alloc() in pata_buddha_probe() sets drvdata to host ]

Seeing as the driver is almost 1:1 the same as pata_gayle, I see no reason against this.

Do you need me to test module removal on the real machine, or is it okay to take your suggestion as-is, given that it is already accepted in pata_gayle?


> The rest of the patch looks fine, thanks for working on this driver.

Thanks for reviewing it, and thanks for porting buddha to libata!


> PS Next time please also use scripts/get_maintainer.pl script to get
>    the list of people that should be added to Cc:, i.e.:
> 
> $ ./scripts/get_maintainer.pl -f drivers/ata/pata_buddha.c
> Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com> (maintainer:LIBATA PATA DRIVERS)
> Jens Axboe <axboe@kernel.dk> (maintainer:LIBATA PATA DRIVERS)
> linux-ide@vger.kernel.org (open list:LIBATA PATA DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> [ I've also added John, Michael & Geert to Cc: (as they were all
>   involved in the development of the initial driver version). ]

Oops, thanks for fixing this.


Max
