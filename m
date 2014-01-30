From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Thu, 30 Jan 2014 09:27:19 +0100
Message-ID: <CAMuHMdXxJcCRundWF-yB_19HnVU2gzahO6Pva2QWmPqsO1U7GA@mail.gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de>
	<70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de>
	<52D1F299.7080909@gmail.com>
	<201401122100.28877.arnd@arndb.de>
	<52E61895.6000007@gmail.com>
	<CAMuHMdWM=MXZveRHMQPbBvg88MFABViVueVfo0mT4esXZuvfsg@mail.gmail.com>
	<52EA0874.7070302@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:36756 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaA3I1T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 03:27:19 -0500
Received: by mail-pa0-f41.google.com with SMTP id fa1so2854824pad.28
        for <linux-m68k@vger.kernel.org>; Thu, 30 Jan 2014 00:27:19 -0800 (PST)
In-Reply-To: <52EA0874.7070302@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux//m68k <linux-m68k@vger.kernel.org>

On Thu, Jan 30, 2014 at 9:08 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>> While working on the driver, I noticed my Falcon ran into a memory
>>> squeeze
>>> once a day, resulting in oom-killing processes and rendering the system
>>> unusable. Most likely culprit to trigger this is the daily updatedb run.
>>> This sort of trouble started pretty much with my work on the SCSI driver,
>>> based on commit aa5311c454ed0ff959adca29c65be2157f52a84c (3.13-rc7). Do
>>> you
>>> know of any memory leak affecting m68k, introduced between last November
>>> and
>>> 3.13-rc7?
>>
>> How much RAM and swap do you have?
>
> 14 MB ST-RAM, 512 MB FastRAM, 2GB swap.
>
>> Modern kernels just require more memory...
>
> Surely not that much more, I hope?

512 MB should be plenty ;-)
My poor m68k box has 500 MB less...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
