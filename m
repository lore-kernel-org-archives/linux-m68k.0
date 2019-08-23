From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v6] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Fri, 23 Aug 2019 12:47:59 +0200
Message-ID: <cc15fb71-0e83-5b53-eb5f-f276f8718a4e@enpas.org>
References: <CGME20190820165731epcas2p340cc3421251987896b857da4ec42038e@epcas2p3.samsung.com>
 <20190820165715.15185-1-max@enpas.org>
 <7d3c4379-23bd-ef3a-e725-86516097850a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7d3c4379-23bd-ef3a-e725-86516097850a@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

On 08/23/2019 12:42 PM, Bartlomiej Zolnierkiewicz wrote:
>> +static struct zorro_driver pata_buddha_driver = {
>> +	.name           = "pata_buddha",
>> +	.id_table       = pata_buddha_zorro_tbl,
>> +	.probe          = pata_buddha_probe,
>> +	.remove         = pata_buddha_remove,
>> +	.driver  = {
>> +		.suppress_bind_attrs = true,
> 
> I thought that we had agreed that this is not needed?

You're right, that slipped in. Thanks for catching it!

I'll send a v7 i two minutes, and would be grateful if you could ACK it.


Max
