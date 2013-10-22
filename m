From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Tue, 22 Oct 2013 20:31:56 +1300
Message-ID: <335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet> <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de> <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:60905 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751178Ab3JVHcr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 Oct 2013 03:32:47 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so9345904pad.19
        for <linux-m68k@vger.kernel.org>; Tue, 22 Oct 2013 00:32:47 -0700 (PDT)
In-Reply-To: <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, =?ISO-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>, tuomas.vainikka@kopteri.net

Geert,

>>
>> To pinpoint where in sd_completed_bytes this happens, I'd need the 
>> sd_mod
>> module and the module symbol map.
>
>                 /* be careful ... don't want any overflows */
>                 u64 factor = scmd->device->sector_size / 512;
>                 do_div(start_lba, factor);
>                 do_div(end_lba, factor);
>
> scmd->device->sector_size should be 512, so factor should be 1.
>
> Let's try a bit harder with a fresher mind and a cup of coffee and
> a mini-twix:
>
>>> [77568.320000] PC: [<0484c33a>] sd_completed_bytes+0x90/0xe8 [sd_mod]
>>> [77568.330000] SR: 2000  SP: 00277e58  a2: 0027e2e4
>>> [77568.340000] d0: 00000000    d1: 007735a0    d2: 00000000    d3: 
>>> 00000001
>>> [77568.350000] d4: 00000000    d5: 007735a8    a0: 024dd000    a1: 
>>> 024a0ea0
>
>>> [77569.190000] Code: 4a80 6704 4c42 0001 2c01 2207 4c42 1406 <2c00> 
>>> 2e01
>>> 2004 2204 6704 4c42 0001 2801 2205 4c42 1404 2800 2a01 202e fff8 222e
>
> "4c42" is a division. It's the second one of the four divisions:
>
>    0: 4a80           tstl %d0
>
> d0 is zero, so the first division is skipped.
>
>    2: 6704           beqs 0x8
>    4: 4c42 0001       divull %d2,%d1,%d0
>    8: 2c01           movel %d1,%d6
>    a: 2207           movel %d7,%d1
>    c: 4c42 1406       divul %d2,%d6,%d1
>
> It's dividing by d2, which is zero. So scmd->device->sector_size must 
> be
> smaller than 512 (probably zero).
>

Thanks for parsing the dump - now I'll have to find out how on earth 
sector_size got overwritten in the first place ... and whether anyrhing 
in scmd-> device still makes any sense at all.

Cheers,

	Michael
