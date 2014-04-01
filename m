From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 01 Apr 2014 20:39:47 +1300
Message-ID: <533A6D43.30403@biophys.uni-duesseldorf.de>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>	<8761mvl3jb.fsf@igel.home>	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>	<87a9c63x1c.fsf@igel.home>	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com> <CAMuHMdWrg6dwwdY3WsMUqFG8V6s_PWguT6W5wkSPJrkORstvOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52094 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbaDAHkL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 03:40:11 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so9407333pbb.19
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 00:40:10 -0700 (PDT)
In-Reply-To: <CAMuHMdWrg6dwwdY3WsMUqFG8V6s_PWguT6W5wkSPJrkORstvOw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Geert
> Hi Michael,
>
> On Mon, Mar 31, 2014 at 11:24 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>   
>> do we know the size of the first memory chunk early enough in head.S?
>> Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
>> we know that there's more than 4 MB in the first memchunk ...
>>     
>
> "get_bi_record BI_MEMCHUNK" will return a pointer to the first mem_info
> struct.
>   

Yep, that's as far as I got - if I read bootinfo.h right, this will need 
to have an offset of 12 bytes added to get to the size member, correct?

> If the first chunk is at least 8 MiB it should be not that intrusive.
> If it isn't, and you have to use multiple chunks, it becomes more complicated.
>   

My reasoning exactly - if the first chunk is the smaller one, the page 
tables shouldn't get too big anyway. If it's the larger one, multiple 
chunks are not possible anyway (at least on Atari) due to the 
discontigmem constraint. Either way, 8 MB should be safe if present.

What size FastRAM did precipitate that bug for you, Andreas?

Cheers,

    Michael
