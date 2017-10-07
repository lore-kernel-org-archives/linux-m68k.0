From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Re: mcf54415, spi nor and SD drivers
Date: Sat, 7 Oct 2017 09:56:08 +0200
Message-ID: <CAMuHMdV1LU=YJ8=NV3bCnZ6L7-fFw3-MLovwAtPKQoVnfX-XGA@mail.gmail.com>
References: <461bb3c3-822b-98d7-45cf-268cb2a764d5@sysam.it> <cde25488-6241-51df-702f-82a8988d8397@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:48711 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbdJGH4K (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Oct 2017 03:56:10 -0400
Received: by mail-wm0-f49.google.com with SMTP id i124so11493428wmf.3
        for <linux-m68k@vger.kernel.org>; Sat, 07 Oct 2017 00:56:09 -0700 (PDT)
In-Reply-To: <cde25488-6241-51df-702f-82a8988d8397@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On Sat, Oct 7, 2017 at 12:27 AM, Angelo Dureghello <angelo@sysam.it> wrote:
> On 06/10/2017 06:04, Greg Ungerer wrote:
>> On 06/10/17 09:06, Angelo Dureghello wrote:
>>> Changes to spi-fsl-dspi.c driver is minimal, just mainly had to
>>> get some few settings from board c file.
>>>
>>> Now the issue is how to proceed, likely, spi-list gouys would complain
>>> i add board/platform support to the driver.
>>>
>>> Is it better i send a patch for this stmark2 board.c before ?
>>
>>
>> Sure, start with that. I don't mind if you send spi changes relevant to
>> the 54411 here either for review.
>>
>
> well, to post the stmark2 patch there is only one issue btw:
> stmark2.c contains a dspi-patch reference.
>
> #include <linux/spi/spi-fsl-dspi.h>
>
> The above is a new file of few lines i created for the dspi
> board.c support.
>
> So, maybe i should start posting the dspi patch. I attach the patches for
> your review, the patch n2 (spi-nor.c) is already under testing, so you can
> ignore it.

Just wondering, have you considered adding DT support?
Then you don't need to add platform data support to spi-fsl-dspi (and possibly
a bunch of other drivers).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
