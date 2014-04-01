From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 09:49:18 +0200
Message-ID: <CAMuHMdX4erc4mAQAOiyL3D-CYoLCembqq_zmcLK7LuUT7hxAcg@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
	<CAMuHMdWrg6dwwdY3WsMUqFG8V6s_PWguT6W5wkSPJrkORstvOw@mail.gmail.com>
	<533A6D43.30403@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:38246 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbaDAHtT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 03:49:19 -0400
Received: by mail-pa0-f54.google.com with SMTP id lf10so9406393pab.41
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 00:49:18 -0700 (PDT)
In-Reply-To: <533A6D43.30403@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Tue, Apr 1, 2014 at 9:39 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> On Mon, Mar 31, 2014 at 11:24 PM, Michael Schmitz <schmitzmic@gmail.com>
>> wrote:
>>> do we know the size of the first memory chunk early enough in head.S?
>>> Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
>>> we know that there's more than 4 MB in the first memchunk ...
>>
>> "get_bi_record BI_MEMCHUNK" will return a pointer to the first mem_info
>> struct.
>
> Yep, that's as far as I got - if I read bootinfo.h right, this will need to
> have an offset of 12 bytes added to get to the size member, correct?

Nope, only 4. A0 points to the bootinfo record payload, which is of
type struct mem_info * in this case:

        movew   %a0@(BIR_SIZE),%d0
        lea     %a0@(BIR_DATA),%a0

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
