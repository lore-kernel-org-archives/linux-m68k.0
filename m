From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: add Sysam AMCORE open board support
Date: Tue, 13 Dec 2016 14:19:54 +0100
Message-ID: <308c539c-bf61-f395-186b-742efebc88cd@sysam.it>
References: <1475103520-25311-1-git-send-email-angelo@sysam.it>
 <CAMuHMdXpEp=2NZM7b7RqYZszO3Tq-Am1ZVqe8XbfB4=j1rqNsw@mail.gmail.com>
 <70227e89-7d57-0d66-67f6-df6d87a93f0a@sysam.it>
 <CAMuHMdW-V-jbwUnX5LLzWdrObgb34+3zGmqMBvcfR2SomF_bTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:59513 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932312AbcLMN0i (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 13 Dec 2016 08:26:38 -0500
In-Reply-To: <CAMuHMdW-V-jbwUnX5LLzWdrObgb34+3zGmqMBvcfR2SomF_bTg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>



On 13/12/2016 14:13, Geert Uytterhoeven wrote:
> Hi Angeo,
>
> On Tue, Dec 13, 2016 at 2:09 PM, Angelo Dureghello <angelo@sysam.it> wrote:
>> On 13/12/2016 12:31, Geert Uytterhoeven wrote:
>>> On Thu, Sep 29, 2016 at 12:58 AM, Angelo Dureghello <angelo@sysam.it>
>>> wrote:
>>>> Add support for Sysam AMCORE board, an open hardware embedded Linux
>>>> board, see http://sysam.it/openzone/projects/amcore/amcore.html for
>>>> any info.
>>>
>>> Just entered mainlne, already 404 :-(
>>>
>>> Is http://sysam.it/cff_amcore.html the new (and future) URL?
>>
>> thanks for the info :)
>>
>> yes, that's the board, i reorganized a bit the site, but i just set
>> now a Redirect rule, so old link now works as well.
>
> Thanks for resurrecting the link!
>
>> About the board, i mainly
>> - fixed coldfire big endian <-> dm9000 little endian (hw bus bytes swap),
>> - reduced the size,
>> - powering now from micro USB,
>> - set SDRAM and FLASH in the other side, to reduce size,
>> - also used magnetics inside ethernet rj45 connector.
>>
>> Features are the same of amcore 1.00.
>>
>> The board works really fine until now.
>
> Cool!
>
> I really enjoyed your presentation at ELCE. Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert


many thanks, really, i hope there will be chances to meet us again.

I am working now on a "stmark2" board, mcf54415 based, quite all BGA.
In first prototype soldered here (infrared) BDM works fine,
i can debug some initial code from SRAM in a very responsive way.
Unfortunately for now i am stuck with P&E / CodeWarrior tools,
but will look for a better open way once things works.

Best regards,
Angelo Dureghello

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
