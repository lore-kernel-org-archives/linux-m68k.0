From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v4] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 12 Aug 2019 17:39:45 +0200
Message-ID: <9c92e927-9f15-de8a-5c2c-0675c5a27ded@enpas.org>
References: <20190811153643.12029-1-max@enpas.org>
 <CGME20190811192838epcas1p16ec0d26fc6282e92da6aa82cdea330a5@epcas1p1.samsung.com>
 <d9fa8aca-62a4-5d4a-b63f-bdd628e6b304@enpas.org>
 <4729c030-549e-8797-f947-1620cd61d516@samsung.com>
 <27f3bb2f-e4b8-cfc9-26da-d0984f1bf37b@enpas.org>
 <da84c857-2c2d-29ec-5e72-e719277faa2d@samsung.com>
 <94b4ef23-282d-44e4-d21e-60c8a33c342c@enpas.org>
 <26447daa-b183-1121-b2a8-c295d7e3468d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26447daa-b183-1121-b2a8-c295d7e3468d@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

On 08/12/2019 05:01 PM, Bartlomiej Zolnierkiewicz wrote:
>> Unfortunately, pata_buddha_exit() is void, and thus can't fail. According to Documentation/kernel-hacking/hacking.rst this is by design.
> 
> You are of course right and the example code is broken
> (+ I need more caffeine).

Hey! That's usually my line to say!

I'm just glad I didn't miss something obvious here...


>> Any other ideas? We could also continue to disallow unloading completely until MFD support comes along.
> Yes, this would also be OK.

Okay, I will refresh the patch accordingly.

Thanks for your help!
Max
