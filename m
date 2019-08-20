From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v5] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Tue, 20 Aug 2019 18:42:42 +0200
Message-ID: <b91ccdbd-c955-9ff2-502d-e8e80e181b52@enpas.org>
References: <CGME20190812164840epcas2p4b88d3ebaf313f0c99ccb693047bce04c@epcas2p4.samsung.com>
 <20190812164830.16244-1-max@enpas.org>
 <9966f79c-278b-5ec9-3c4b-e1de55af55f0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9966f79c-278b-5ec9-3c4b-e1de55af55f0@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

Hi Bartlomiej,

On 08/20/2019 02:06 PM, Bartlomiej Zolnierkiewicz wrote:
> WARNING: line over 80 characters
> #354: FILE: drivers/ata/pata_buddha.c:287:
> +        while ((z = zorro_find_device(ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, z))) {

I see no good way to shorten this one. I think it's obvious enough to allow overflowing by a few chars - do you agree?


Max
