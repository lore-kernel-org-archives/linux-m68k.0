From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] USB: isp116x: Fix EtherNAT if !CONFIG_ATARI_ROM_ISA
Date: Tue, 30 Sep 2014 01:08:47 +1300
Message-ID: <54294BCF.4070304@gmail.com>
References: <1410687560-10169-1-git-send-email-geert@linux-m68k.org> <CAMuHMdWNQvB9QfidZBnHZznF-UH3Sgsr79YdhkW_H-W9P5Ni8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:43981 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbaI2MJC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Sep 2014 08:09:02 -0400
Received: by mail-pd0-f177.google.com with SMTP id v10so15259562pde.22
        for <linux-m68k@vger.kernel.org>; Mon, 29 Sep 2014 05:09:01 -0700 (PDT)
In-Reply-To: <CAMuHMdWNQvB9QfidZBnHZznF-UH3Sgsr79YdhkW_H-W9P5Ni8A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

HI Geert,
> On Sun, Sep 14, 2014 at 11:39 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>   
>> Commit eece8a651c96a2a3 ("USB: isp116x: isa_rom_*() calls should depend
>> on CONFIG_ATARI_ROM_ISA") broke USB on EtherNAT if CONFIG_ATARI_ROM_ISA
>> is not set, as USB on EtherNAT requires byte-swapped I/O accessors.
>>
>> Add a separate #elif section for Atari without ROM port ISA to fix this.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> To be folded into "m68k/atari: USB - add ISP1160 USB host controller
>> support"
>>     
>
> Applied to master, folded on m68k-queue.
>   

Thanks, I'll get the EtherNAT driver tested in a month ot two hopefully, 
so this can finally be all merged upstream.

Cheers,

    Michael
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
>   
