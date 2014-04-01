From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 01 Apr 2014 21:12:43 +1300
Message-ID: <533A74FB.606@biophys.uni-duesseldorf.de>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>	<8761mvl3jb.fsf@igel.home>	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>	<87a9c63x1c.fsf@igel.home>	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>	<CAMuHMdWrg6dwwdY3WsMUqFG8V6s_PWguT6W5wkSPJrkORstvOw@mail.gmail.com>	<533A6D43.30403@biophys.uni-duesseldorf.de> <CAMuHMdX4erc4mAQAOiyL3D-CYoLCembqq_zmcLK7LuUT7hxAcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:46951 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbaDAIMx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 04:12:53 -0400
Received: by mail-pb0-f41.google.com with SMTP id jt11so9472160pbb.14
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 01:12:52 -0700 (PDT)
In-Reply-To: <CAMuHMdX4erc4mAQAOiyL3D-CYoLCembqq_zmcLK7LuUT7hxAcg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Geert,
> Hi Michael,
>
> On Tue, Apr 1, 2014 at 9:39 AM, schmitz
> <schmitz@biophys.uni-duesseldorf.de> wrote:
>   
>>> On Mon, Mar 31, 2014 at 11:24 PM, Michael Schmitz <schmitzmic@gmail.com>
>>> wrote:
>>>       
>>>> do we know the size of the first memory chunk early enough in head.S?
>>>> Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
>>>> we know that there's more than 4 MB in the first memchunk ...
>>>>         
>>> "get_bi_record BI_MEMCHUNK" will return a pointer to the first mem_info
>>> struct.
>>>       
>> Yep, that's as far as I got - if I read bootinfo.h right, this will need to
>> have an offset of 12 bytes added to get to the size member, correct?
>>     
>
> Nope, only 4. A0 points to the bootinfo record payload, which is of
> type struct mem_info * in this case:
>   

Right - should have read on to find the get_bi_record defs.

While poking around in head.S, I came across a comment that stated the 
second page at the start of the kernel is used for the kernel page dir - 
that is the second page of virtual address space (FastRAM, in the case 
we care about here), not physcial address space, right?

Still wondering why the kernel in FastRAM won't reboot cleanly...

Cheers,

    Michael
