From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 09:50:24 +0200
Message-ID: <CAMuHMdWJBUntS15SCXAoaL-y3cSuEvRcxiFob7PQVGSjDpn1gA@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
	<87txae2dt4.fsf@igel.home>
	<20140331235216.GA2109@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
	<533A6EA0.9030808@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:59879 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbaDAHuZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 03:50:25 -0400
Received: by mail-pb0-f48.google.com with SMTP id md12so9415344pbc.21
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 00:50:25 -0700 (PDT)
In-Reply-To: <533A6EA0.9030808@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Tue, Apr 1, 2014 at 9:45 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>>>> do we know the size of the first memory chunk early enough in head.S?
>>>>> Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
>>>>> we know that there's more than 4 MB in the first memchunk ...
>>>>
>>>> How do you know?  You would have to reimplement the check paging_init
>>>> does.
>>>
>>> I see - as a heuristic, we can probably assume that the first memchunk is
>>> the relevant one, and especially in the case of FastRAM, also the larger
>>> one.
>>> Does this hold for Amiga/Mac/VME as well?
>>
>> People want to run the kernel in the fastest memory chunk, which is
>> typically
>> also the largest (slow Amiga mainboard memory may be 2 - 16 MiB for
>> Linux-capable machines, accelerator memory may be larger).
>
> And the chunk the kernel runs from would always be the first chunk listed in
> bootinfo, since that's the one mapped at virtual address zero?

The kernel always runs in the first chunk.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
