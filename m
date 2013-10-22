From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Wed, 23 Oct 2013 09:38:08 +1300
Message-ID: <9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet> <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de> <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com> <335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:44402 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754357Ab3JVUiT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 Oct 2013 16:38:19 -0400
Received: by mail-pb0-f46.google.com with SMTP id un1so2601939pbc.5
        for <linux-m68k@vger.kernel.org>; Tue, 22 Oct 2013 13:38:19 -0700 (PDT)
In-Reply-To: <335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, tuomas.vainikka@kopteri.net, =?ISO-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Geert,

>>> To pinpoint where in sd_completed_bytes this happens, I'd need the 
>>> sd_mod
>>> module and the module symbol map.
>>
>>                 /* be careful ... don't want any overflows */
>>                 u64 factor = scmd->device->sector_size / 512;
>>                 do_div(start_lba, factor);
>>                 do_div(end_lba, factor);
>>
>> scmd->device->sector_size should be 512, so factor should be 1.

Looking at a bit of context right above what you quote here, we can be 
reasonably certain that scmd->device->sector_size is greater or equal 
512.

Ingo - could you add

if (scmd->device->sector_size > 2048)
	sdev_printk(KERN_ERR, scmd->device, "Whoa - large secor size %d\n", 
scmd->device->sector_size);

before the do_div calls, and see what that reports?

Cheers,

	Michael

>>
>> Let's try a bit harder with a fresher mind and a cup of coffee and
>> a mini-twix:
>>
>>>> [77568.320000] PC: [<0484c33a>] sd_completed_bytes+0x90/0xe8 
>>>> [sd_mod]
>>>> [77568.330000] SR: 2000  SP: 00277e58  a2: 0027e2e4
>>>> [77568.340000] d0: 00000000    d1: 007735a0    d2: 00000000    d3: 
>>>> 00000001
>>>> [77568.350000] d4: 00000000    d5: 007735a8    a0: 024dd000    a1: 
>>>> 024a0ea0
>>
>>>> [77569.190000] Code: 4a80 6704 4c42 0001 2c01 2207 4c42 1406 <2c00> 
>>>> 2e01
>>>> 2004 2204 6704 4c42 0001 2801 2205 4c42 1404 2800 2a01 202e fff8 
>>>> 222e
>>
>> "4c42" is a division. It's the second one of the four divisions:
>>
>>    0: 4a80           tstl %d0
>>
>> d0 is zero, so the first division is skipped.
>>
>>    2: 6704           beqs 0x8
>>    4: 4c42 0001       divull %d2,%d1,%d0
>>    8: 2c01           movel %d1,%d6
>>    a: 2207           movel %d7,%d1
>>    c: 4c42 1406       divul %d2,%d6,%d1
>>
>> It's dividing by d2, which is zero. So scmd->device->sector_size must 
>> be
>> smaller than 512 (probably zero).
>>
>
> Thanks for parsing the dump - now I'll have to find out how on earth 
> sector_size got overwritten in the first place ... and whether 
> anyrhing in scmd-> device still makes any sense at all.
>
> Cheers,
>
> 	Michael
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
