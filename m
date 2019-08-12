From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v4] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 12 Aug 2019 12:55:05 +0200
Message-ID: <27f3bb2f-e4b8-cfc9-26da-d0984f1bf37b@enpas.org>
References: <20190811153643.12029-1-max@enpas.org>
 <CGME20190811192838epcas1p16ec0d26fc6282e92da6aa82cdea330a5@epcas1p1.samsung.com>
 <d9fa8aca-62a4-5d4a-b63f-bdd628e6b304@enpas.org>
 <4729c030-549e-8797-f947-1620cd61d516@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4729c030-549e-8797-f947-1620cd61d516@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

Hi Bartlomiej,

Thanks for your feedback!


On 08/12/2019 12:42 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> ide/buddha driver cannot be unloaded currently (it lacks module_exit()).
> 
> [... snip ...]
> 
> It should work exactly like the old code in case of X-Surf,
> what do we need to release?


So what shall I do? Once an X-Surf has been detected, we refuse to unload, and therefore we never have to release X-Surf resources? That would simplify things a lot.

What's a good way to do that, given that we now have module_exit() defined and an exit function is void?


Thanks,
Max
