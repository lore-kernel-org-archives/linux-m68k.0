From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 01 Apr 2014 20:45:36 +1300
Message-ID: <533A6EA0.9030808@biophys.uni-duesseldorf.de>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>	<8761mvl3jb.fsf@igel.home>	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>	<87a9c63x1c.fsf@igel.home>	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>	<87txae2dt4.fsf@igel.home>	<20140331235216.GA2109@mail.biophys.uni-duesseldorf.de> <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:43081 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497AbaDAHpp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 03:45:45 -0400
Received: by mail-pb0-f43.google.com with SMTP id um1so9460646pbc.30
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 00:45:44 -0700 (PDT)
In-Reply-To: <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Geert,
>
>>>> do we know the size of the first memory chunk early enough in head.S?
>>>> Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
>>>> we know that there's more than 4 MB in the first memchunk ...
>>>>         
>>> How do you know?  You would have to reimplement the check paging_init
>>> does.
>>>       
>> I see - as a heuristic, we can probably assume that the first memchunk is
>> the relevant one, and especially in the case of FastRAM, also the larger
>> one.
>> Does this hold for Amiga/Mac/VME as well?
>>     
>
> People want to run the kernel in the fastest memory chunk, which is typically
> also the largest (slow Amiga mainboard memory may be 2 - 16 MiB for
> Linux-capable machines, accelerator memory may be larger).
>   

And the chunk the kernel runs from would always be the first chunk 
listed in bootinfo, since that's the one mapped at virtual address zero?

> Don't know about Mac, but I have some memories of interleaved banks
> and such...
>   

Not sure I've ever seen accelerators or memory upgrades on the Macs that 
I hacked on. 4 MB was sort of plenty in those days.

Cheers,

    Michael
