From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: m68k-queue
Date: Tue, 14 May 2013 20:56:44 +1200
Message-ID: <5191FC4C.8010707@biophys.uni-duesseldorf.de>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:35057 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757236Ab3ENI44 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 May 2013 04:56:56 -0400
Received: by mail-pd0-f180.google.com with SMTP id t10so245359pdi.39
        for <linux-m68k@vger.kernel.org>; Tue, 14 May 2013 01:56:55 -0700 (PDT)
In-Reply-To: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,
> m68k-queue is at a historical low:
>
> $ git cherry -v v3.10-rc1 m68k-queue | wc -l
> 11
> $
>
> and of course I want to keep that, and improve it!
>
>   - m68k/irq: Add handle_polled_irq() for timer based soft interrupts
>     Still no response from tglx :-(
>   - m68k/atari: use polled interrupt handler for timer D interrupts
>     Depends on above
>   - m68k/atari: EtherNAT - ethernet support (smc91x)
>     m68k/atari: EtherNEC - ethernet support (ne)
>     Michael will submit
>   
Yep, that's the plan. (I'm having DSL stability issues at home ATM, 
right smack bang during the times when I can usually work on kernel 
hacking :-(  Line alive for 20 seconds, then dead for 60 seconds. Using 
a serial modem would work better).
>   - m68k/atari: USB - add ISP1160 USB host controller support
>     Michael WIP?
>   
I'll have to submit that for comments as-is, I really don't want to mess 
with the mm code.
>   - m68k/atari: Update defconfigs for new features
>     m68k/mac: Update defconfig
>     I'm working on the defconfigs
>   - fs/fat: Revert "msdos fs: remove unsettable atari option"
>     fs/fat: Atari FAT updates
>     fs/fat: Use correct logical sector size for Atari GEMDOS FAT
>     Who dares to stand in front of the fat maintainer and will submit these?
>     Michael, too?
>   
Funny that - I left out these by accident, and still could mount my GEM 
FAT partition used to store kernel images. All I had to do was omit the 
'atari=no' option.

I'll have to verify that this also works with floppy, but my gut feeling 
is whenever you create a partition that requires special handling by the 
'atari' option, you end up with a partition that has cluster size larger 
than mm block size which means the filesystem is unusable since Linux 
2.6 anyway.

That needs someone to look into who understands the GEM FAT format - I 
might just have been setting the wrong combination of filesystem size, 
FAT size and cluster size that forced this error.

Seeing as I don't speak enough FAT, I hardly qualify to submit that ...
>   - mac: ADB raw packets
>     I guess this can be dropped?
>   
I'd guess so - I struggle to recall what this was for. Perhaps to talk 
to the clock chip on some Macs. Anyone?

Cheers,

    Michael

> Thanks!
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
