From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: add Sysam AMCORE open board support
Date: Tue, 13 Dec 2016 14:13:06 +0100
Message-ID: <CAMuHMdW-V-jbwUnX5LLzWdrObgb34+3zGmqMBvcfR2SomF_bTg@mail.gmail.com>
References: <1475103520-25311-1-git-send-email-angelo@sysam.it>
 <CAMuHMdXpEp=2NZM7b7RqYZszO3Tq-Am1ZVqe8XbfB4=j1rqNsw@mail.gmail.com> <70227e89-7d57-0d66-67f6-df6d87a93f0a@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36810 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932580AbcLMNNI (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Dec 2016 08:13:08 -0500
Received: by mail-io0-f195.google.com with SMTP id b194so28394760ioa.3
        for <linux-m68k@vger.kernel.org>; Tue, 13 Dec 2016 05:13:07 -0800 (PST)
In-Reply-To: <70227e89-7d57-0d66-67f6-df6d87a93f0a@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angeo,

On Tue, Dec 13, 2016 at 2:09 PM, Angelo Dureghello <angelo@sysam.it> wrote:
> On 13/12/2016 12:31, Geert Uytterhoeven wrote:
>> On Thu, Sep 29, 2016 at 12:58 AM, Angelo Dureghello <angelo@sysam.it>
>> wrote:
>>> Add support for Sysam AMCORE board, an open hardware embedded Linux
>>> board, see http://sysam.it/openzone/projects/amcore/amcore.html for
>>> any info.
>>
>> Just entered mainlne, already 404 :-(
>>
>> Is http://sysam.it/cff_amcore.html the new (and future) URL?
>
> thanks for the info :)
>
> yes, that's the board, i reorganized a bit the site, but i just set
> now a Redirect rule, so old link now works as well.

Thanks for resurrecting the link!

> About the board, i mainly
> - fixed coldfire big endian <-> dm9000 little endian (hw bus bytes swap),
> - reduced the size,
> - powering now from micro USB,
> - set SDRAM and FLASH in the other side, to reduce size,
> - also used magnetics inside ethernet rj45 connector.
>
> Features are the same of amcore 1.00.
>
> The board works really fine until now.

Cool!

I really enjoyed your presentation at ELCE. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
