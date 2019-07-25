From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Thu, 25 Jul 2019 20:01:58 +0200
Message-ID: <2b06709b-67d7-f799-7412-6488fbb31821@physik.fu-berlin.de>
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
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Max Staudt <max@enpas.org>
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi Bartlomiej!

On 7/25/19 7:03 PM, Bartlomiej Zolnierkiewicz wrote:
> [ I've also added John, Michael & Geert to Cc: (as they were all
>   involved in the development of the initial driver version). ]

Thanks a lot for your review, much appreciated!

FWIW, me, Michael and Geert are all on the linux-m68k list, so we are already
in the loop. I also happened to talk with Max before regarding the driver!

We can test the driver on the test Amiga 4000 we have again which has
a Buddha controller installed. Usually Michael builds the kernel for
used for testing, but in case he's not around I can do that, too.

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
