From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 11/12] m68k/atari: USB - add platform devices for
 EtherNAT/NetUSBee ISP1160 HCD
Date: Wed, 4 Sep 2013 14:26:43 +0200
Message-ID: <CAOmrzkKWGtADq8oMK3wREw8icZL0dkhwvpDD7psY3sHH3SZVJw@mail.gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
	<1365208006-16227-12-git-send-email-schmitz@debian.org>
	<CAMuHMdUK_bc1Kodws0gbHJnpXuxm6eCsE1HRteWYGD4Zto2rdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:63541 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934624Ab3IDM0p (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Sep 2013 08:26:45 -0400
Received: by mail-oa0-f42.google.com with SMTP id n12so260448oag.1
        for <linux-m68k@vger.kernel.org>; Wed, 04 Sep 2013 05:26:43 -0700 (PDT)
In-Reply-To: <CAMuHMdUK_bc1Kodws0gbHJnpXuxm6eCsE1HRteWYGD4Zto2rdg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Michael Schmitz <schmitz@debian.org>

Hello Geert,

I believe the ISP116x driver checks for IORESOURCE_MEM resources
explicitly, that is why they are defined that way. I may have that
wrong or confuse this with the EtherNAT ethernet driver though.

The 0x3xx address is for the NetUSBee case - the EtherNAT USB will be
in the 0x80000xx ballpark, does that matter with IO resources?

Cheers,

    Michael


On Mon, Aug 26, 2013 at 12:18 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Sat, Apr 6, 2013 at 2:26 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> --- a/arch/m68k/atari/config.c
>> +++ b/arch/m68k/atari/config.c
>
>> +static struct resource isp1160_resources[] = {
>> +       [0] = {
>> +               .name   = "isp1160-data",
>> +               .start  = ATARI_USB_PHYS_ADDR,
>> +               .end    = ATARI_USB_PHYS_ADDR + 0x1,
>> +               .flags  = IORESOURCE_MEM,
>
> Shouldn't this be IORESOURCE_IO?
>
>> +       },
>> +       [1] = {
>> +               .name   = "isp1160-regs",
>> +               .start  = ATARI_USB_PHYS_ADDR + 0x4,
>> +               .end    = ATARI_USB_PHYS_ADDR + 0x5,
>> +               .flags  = IORESOURCE_MEM,
>
> Ditto.
>
>> +       },
>
> I have in /proc/iomem:
>
> 00000340-00000341 : isp1160-data
> 00000360-00000361 : isp1160-regs
> 00684000-00783fff : ST-RAM Pool
>   00684000-006cffff : atafb
>   006d0000-006d3fff : ataflop
>   006d4000-006d4fff : SCSI
> fff00000-fff0003f : falconide
>
> and in /proc/ioports:
>
> 00000300-0000031f : rtl8019-regs
>
> Sorry for not noticing before.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
