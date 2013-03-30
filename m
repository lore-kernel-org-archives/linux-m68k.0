From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Sat, 30 Mar 2013 14:37:29 +1300
Message-ID: <515641D9.5090503@gmail.com>
References: <5152996E.50800@gmail.com> <20130328211747.GA10917@chumley.earth.sol> <5154C5E0.3040608@gmail.com> <20130328231039.GA14587@chumley.earth.sol> <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com> <20130329080629.GB14587@chumley.earth.sol> <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com> <5155E1A3.7060307@gmail.com> <20130329193323.GD14587@chumley.earth.sol> <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org> <20130329224731.GA22830@chumley.earth.sol> <5156229B.7030606@gmail.com> <670fbbcf44fecccc2e7c66ebfcdb4d19@muaddib.hro.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:45657 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757266Ab3C3Bhq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 21:37:46 -0400
Received: by mail-pd0-f179.google.com with SMTP id x11so455769pdj.24
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 18:37:46 -0700 (PDT)
In-Reply-To: <670fbbcf44fecccc2e7c66ebfcdb4d19@muaddib.hro.localnet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?B?SW5nbyBKw7xyZ2Vuc21hbm4=?= <ij@2012.bluespice.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org

Ingo,

>> Generic questions first - what is the best strategy to make Zorro
>> boards work with platform device utilizing drivers?
>> Should I go and add code to amiga/platform.c to enumerate all Zorro
>> devices and add platform devices for those,
>> or revert to looking up Zorro device data in the SCSI driver probe
>> function? Geert?
>> I've seen the following output on elgar:
>> schmitz@elgar:~$ cat /proc/bus/zorro/devices
>> 00    21400c00    00e90000    00010000    d1
>> 01    0877c900    00ea0000    00010000    c1
>> The 21400c00 is product code I presume - what's the d1?  Which of the
>> two is the SCSI board?
>
> That's easy to answer:
>
> elgar:~# lszorro -vv
> 00: Phase 5 Blizzard 1220/CyberStorm [Accelerator and SCSI Host Adapter]
>         Type: Zorro II
>         Address: 00e90000 (00010000 bytes)
>         Serial number: 00000000
>         Slot address: 00e9
>         Slot size: 0001
>
Thanks - I forgot about lszorro :-)

Slot address is just the top two bytes of the base address - the d1 and 
c1 part of the proc output is meaningless?

>> If you do - what SCSI board does crest use? Can you test kernels or
>> possibly just modules there for me?
>
> Crest is using the same card as Elgar, IIRC: Cyberstorm Mk1
> Christian, please correct me if I'm wrong.
>

So we have cyberstorm, cyberstormII and blz2060 drivers to port? What is 
the difference between the cyberstorm ones?
DMA setup looks fairly similar to me (blz2060 is a bit different there). 
Looks to me as though we should be able to get
away with a single ESP front end driver, perhaps set the DMA functions 
different based on the model?

Cheers,

    Michael
