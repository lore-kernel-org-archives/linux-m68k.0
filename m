From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Mon, 31 Mar 2014 20:54:38 +1300
Message-ID: <53391F3E.1090005@gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org> <CAMuHMdV_6e0qsrP6H6mguJ53inndFR--0MYG9KM9iso=F3X0Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:35825 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752572AbaCaHyx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 03:54:53 -0400
Received: by mail-pa0-f47.google.com with SMTP id lj1so7834764pab.34
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 00:54:52 -0700 (PDT)
In-Reply-To: <CAMuHMdV_6e0qsrP6H6mguJ53inndFR--0MYG9KM9iso=F3X0Rg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert,


> Hi Michael,
>
> On Sun, Mar 30, 2014 at 1:01 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> see the following patch series for the hopefully final word on
>> the 'make ST-RAM pool accessible for kernels running from FastRAM'
>> story.
> When submitting a "take three", please annotate the individual patches
> with "[PATCH v3 x/y]".

Will follow shortly.

> It would also have been nice to CC the block resp. SCSI maintainers to
> get their acks for patches 3 and 4, but I'm gonna take them through the
> m68k tree anyway.

I'll do that anyway - not that I've got much hope to elicit a response 
from either. Still waiting for feedback from the last SCSI patches sent 
there.

(Not that I'm any better - still haven't given Finn's patches a try...)

Cheers,

     Michael



>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
