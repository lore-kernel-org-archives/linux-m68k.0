From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v2] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Thu, 25 Jul 2019 19:59:35 +0200
Message-ID: <ac754751-0f51-c733-e367-a85f8cb7dbf5@enpas.org>
References: <20190725102211.8526-1-max@enpas.org>
 <CGME20190725170359eucas1p271187268f749869088f60bf961194169@eucas1p2.samsung.com>
 <01cfe282-6ce6-ff40-9e85-e23724f9d50f@samsung.com>
 <a81d7a5f-c773-9769-cddd-95d2fe47d32e@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a81d7a5f-c773-9769-cddd-95d2fe47d32e@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

On 07/25/2019 07:33 PM, Max Staudt wrote:
> On 07/25/2019 07:03 PM, Bartlomiej Zolnierkiewicz wrote:
>> Please try to implement it, should be as simple as:
>>
>> static void pata_buddha_remove(struct zorro_dev *zdev)
>> {
>> 	struct ata_host *host = dev_get_drvdata(&zdev->dev);
>>
>> 	ata_host_detach(host);
>> }
>>
>> [ ata_host_alloc() in pata_buddha_probe() sets drvdata to host ]
> 
> Seeing as the driver is almost 1:1 the same as pata_gayle, I see no reason against this.
> 
> Do you need me to test module removal on the real machine, or is it okay to take your suggestion as-is, given that it is already accepted in pata_gayle?

Nevermind, I found a way to test it somewhat quickly. I can confirm that it works. Thanks for your suggestion!


Max
