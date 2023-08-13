Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80382C001B0
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 22:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjHMWz2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 18:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjHMWzC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 18:55:02 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C5AE62
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 15:55:00 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bc7e65ea44so25046505ad.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691967300; x=1692572100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cqiqimPUubsuJblzNyyOwaYTUkNxymCHjOG5XyIvcC8=;
        b=FVajQfio1+c/vYDSaRNGrzAFkl8rqMZXkSZ4Qfpli8LBA1iyz9LrHq1sflPWoNZMEN
         V8x4THrEMd6HSl3sVNp9YwmlJxVblqhZzvJbRRunTh8jkyQkIbaTBOCaB9/LlsuxORY4
         wk2StgZRODOA0SIDnuu0+5wDDzDwkg9lHplYrfLSCA4oIPW1XspN4/l3K1N9J0hXKRXs
         fkJjniYPct9hcdsppeCvh8zzgFo+eTAYGCn1AWOJ2+bEwX3dcnRRng9udAg3Fj8IDxcP
         YafgI59KicEOrvTV9v+2j5+Soef6nbLQuLmOFTQ0BaXDLDpJovu+Zrx51FfDXaQ0wMbe
         +hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691967300; x=1692572100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cqiqimPUubsuJblzNyyOwaYTUkNxymCHjOG5XyIvcC8=;
        b=E90mY7MIzQfT9L0GThz4ZHQ+3gp4nVC2kaN8gve99bart1w68JWmOkMJvZz/T66ZTL
         AAF1554CXCsN+ZLl9QO5VDZhiMq7GlD8rUAz7J7D1Ae6awTYK7kW+4YYMZd0SO6boBk/
         Yk1tXYQHs8WJ/LdRscQ3Dj80t4mG92/JaO3TFvUogQwHV7bBzRbmt+uVosc77yPrCWZu
         NJvQxJGn96qX+5imXaF1smgelepjOoZWbNwiiXr5BNq8K5bZ9b2pzWIIfUpnwqUOQ/I+
         tloMMm0mvlFWbawZZrEj+fr9PM11ZVZpM0KK0EL2n8XoQLWKC6ODWOKfDBzK5EBOdTLi
         rWbg==
X-Gm-Message-State: AOJu0YywlISKb7RZsiWLkrenzcVw11kyH8IaL5MYo8FhJDr0SiD+TqxN
        mWWkYXLKFWgs8UQP4wsTJfM/Ld6DwTM=
X-Google-Smtp-Source: AGHT+IHa1OGzBEsZ97Y/Wop/4fBpynAXAvRi2rm7ImfawIlj3t2ff/vU1l6/AQSveKZWNxYwc+9tKw==
X-Received: by 2002:a17:902:ec87:b0:1bc:1e17:6d70 with SMTP id x7-20020a170902ec8700b001bc1e176d70mr10589295plg.24.1691967299570;
        Sun, 13 Aug 2023 15:54:59 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b18f:24ea:a609:d728? ([2001:df0:0:200c:b18f:24ea:a609:d728])
        by smtp.gmail.com with ESMTPSA id d19-20020a170902729300b001b8b0ac2258sm7905456pll.174.2023.08.13.15.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 15:54:58 -0700 (PDT)
Message-ID: <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
Date:   Mon, 14 Aug 2023 10:54:54 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     William R Sowerbutts <will@sowerbutts.com>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
References: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZNlYFCVubNgzmUfc@sowerbutts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi William,

thanks for running these tests!

On 14/08/23 10:24, William R Sowerbutts wrote:
> Hello
>
> Thank you for your interest and patience!
>
> Sorry for the delay in providing more information.  The only method I had to
> transfer test kernels onto the Q40 was painfully slow and involved swapping
> ISA cards which is itself problematic as the pins in one of the ISA slots are
> breaking.
>
> In the end I decided my best option was to dispose of the standard operating
> system (SMSQ/E) and write a new boot ROM for the machine with support for
> FAT32 filesystems on an IDE disk and TFTP transfers using an NE2000 card.
> It's still in development but is now working well enough to use. The source
> code is at https://github.com/willsowerbutts/q40boot
>
> During the process I learned a bit more about the Q40 hardware, and
> transferring a kernel now takes 7 seconds instead of over 20 minutes.
>
> I've run the various tests as requested;
>
> * 5.13.19 -- IDE works (but the data on disk is byte-swapped, see below)
>
> * 5.13.19+44b1fbc0f5f30e66a56d29575349f0b1ebe2b0ee -- IDE fails (crash)
>
> * 5.14.21 -- IDE fails (crash)
>
> * 6.4.10 + Michael's RFC patch -- IDE fails (no crash, but "Bad IO access")

That might be fixed by my second RFC patch, just gone out today.

This one still byte-swaps the data from disk though. I understood that 
was always the case for Q40, but I may have been mistaken there.

>
> * 6.4.10 + my patch -- IDE works, data on disk is NOT byte-swapped
>
> Copies of the boot output for each kernel are attached to this email.
>
> I've also attached the patch I am currently using on my Q40 kernel. It's
> based in part on Michael's patch. It bodges up "ioport_map" to apply the
> offset required to convert raw ISA address into "cookies" and thus allow the
> IDE to work without "Bad IO" complaints. To be crystal clear I am NOT
> proposing this as a solution, it's obviously a hack job, but I wanted to
> illustrate at least one way that *does* work on the Q40.
Yep, my patch is also just meant to find a way to make the driver work 
at all, and then do it again properly (perhaps using 
CONFIG_HAS_IOPORT_MAP).
>
> I think one proper solution might involve enabling CONFIG_HAS_IOPORT_MAP but
> I've not yet looked properly into the implications of doing so. I'm very open
> to alternative solutions too.
>
> As a side note, the NE2000 driver, which is also using 8- and 16-bit ISA I/O,
> works correctly with both 5.13 and 6.4. If one allows it to auto-probe the
> card's interrupt it locks up the machine due to limitations of the interrupt
> controller, but I understand this was always the case; I've made a tiny patch
> to ne.c to prevent it trying this.
I've had autoprobe lockups (rather, interrupts coming in before 
interrupt handling was set up) with ne.c and the ROM port adapter, which 
does not use interrupts. Might be easier to load this driver as a 
module. This may not be an option if you boot the kernel from the 
network card.
>
>
> On Tue, Jul 25, 2023 at 08:26:28AM +1200, Michael Schmitz wrote:
>> Note that this also means that the address hardcoded for IDE may be
>> incorrect (AFAIR, IDE cards could have their IO base reassigned by
>> firmware).
> The W83757 on my ISA IO card, and the W83787IF on the ISA IO card that
> shipped with the machine, are configurable only using jumpers. They can only
> use the two standard base addresses (0x1F0 or 0x170).
>
>
> On Fri, Jul 28, 2023 at 9:52 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Yes, but Q40 and Falcon are impossible to support any other way, and
>> byte swapping the IDE interface in hardware was never repeated anywhere
>> else, fortunately. We will have to keep pata_falcon around for that
>> cause in any event.
> I wonder if this is a misunderstanding about Q40 IDE.
>
> The Q40 does not have an on-board IDE controller.  IDE is accessed via a
> common ISA PC Super-IO card.  When you do a 16-bit transfer from the ISA I/O
> address the data comes out backwards and the CPU needs to byteswap it.
>
> I found it interesting and quite unexpected that 5.13 read data from the IDE
> drive byte-swapped.  I had prepared a drive for the machine with an MBR
> partition table and an ext4 filesystem but the kernel did not recognise
> either.  After a while I realised I had to byte swap the entire drive with
> 'dd conv=swab', and then it worked.
>
> For my 6.4 patch I enabled byte swapping in the pata_falcon_data_xfer()
> function -- this allows me to use an IDE drive with everything in the
> normal/compatible byte ordering, which makes life much easier. I assume this
> is the intended behaviour.
That would be the sane behaviour, but the designers of both the Falcon 
and apparently the TiVo decided otherwise, wired up the IDE data bus 
byte-swapped and saved the byteswap operations in the driver. I'm unsure 
how this was intended to work on Q40.
> I wonder if any existing Q40 users are actually storing all the data on their
> drives byte-swapped just to avoid the overhead of byte-swapping on every
> read/write. I suppose this would work just fine until you need to connect
> that drive to another machine.

Yes, it does work just fine with that little inconvenience. (When I had 
to fix a corrupted partition table an FAT, I had to hook the Falcon disk 
up to a PC and run ARAnyM on it to get byte-swapped access to the data.)

Now the question is how data on legacy Q40 IDE disks have been stored. 
If it's byte-swapped, we'd better keep that byte order in the current 
driver (meaning your changes to pata_falcon_data_xfer() won't be needed, 
but you would have to swap back data on your disk). If it's always been 
in PC compatible byte order, all data (not just the identify data) must 
be swapped.

I'd like to have Richard's opinion on this (or hear from any other 
former Q40 user).

>
> For my Q40boot ROM I wrote an IDE driver. It just treats the IDE interface as
> a regular legacy PC style IDE interface (which is exactly what it is!) plus
> byte swapping of 16-bit transfers. See the functions q40_ide_read_sector_data
> and q40_ide_write_sector_data in the IDE driver (q40ide.c, q40isa.h in the
> q40boot github repository linked above).
>
> I am going to look at the pata_legacy driver and see if it might be usable on
> the Q40 instead of pata_falcon.
>
> As a long term fix I think I need to read up on CONFIG_HAS_IOPORT_MAP to try
> and understand how I might enable this.  I expect enabling it will have
> implications for all M68K machines, so maybe someone with more experience
> should be making that decision.
>
> I would be very happy to run further tests or to rewrite my hacky patch in
> response to pointers on how to improve it.

If you test my RFC v2 patch, do remember to change 
pata_falcon_data_xfer() to swap all data. I'll have a look at your patch 
to see whether there's anything else I missed or misunderstood.

If you want to handle patch submission yourself, please by all means do 
so. I cannot test any of the Q40 changes, only make sure none of the 
changes modify driver behaviour on Falcon.

Cheers,

     Michael


>
> Thanks
>
> Will
>
>
>
> On Sun, Aug 13, 2023 at 05:38:00PM +1000, Finn Thain wrote:
>> Michael, William,
>>
>> On Sun, 13 Aug 2023, Michael Schmitz wrote:
>>
>>> Am 28.07.23 um 11:47 schrieb Finn Thain:
>>>> On Thu, 27 Jul 2023, Michael Schmitz wrote:
>>>>
>>>>>>> And yes, I'm painfully aware the m68k low level IO code is becoming
>>>>>>> a bit of a maintainance legacy, in no small part due to my hacks
>>>>>>> around Atari EtherNEC.
>>>>>>>
>>>>>> I guess you and I both can share the blame for 44b1fbc0f5f30e66...
>>>>>>
>>>>>> Anyway, you make a good point about on-going maintenance. Do you
>>>>>> think that by supporting standard ISA drivers we might actually
>>>>>> reduce the ideosyncracies in m68k IO code?
>>>>> You and DaveM ought to have a chat about that - abstracting the
>>>>> legacy drivers from the ISA constraints was his preferred option when
>>>>> I last attempted to get the Gayle network driver patches merged. When
>>>>> I say 'preferred', I'm probably understating a little.
>>>>>
>>>> A discussion with maintainers probably won't get far without working
>>>> code to look at. Perhaps William will send an RFC patch to illustrate
>>>> his approach.
>>> Haven't seen anything yet, so I've just sent a patch switching
>>> pata_falcon.c to use the IO resources instead of the memory resources.
>> Thanks for sending that.
>>
>>> Survived compile and ARAnyM boot tests only so far. I've checked and
>>> confirmed the entire 0xffxxxxx range is mapped transparent in head.S for
>>> Q40 so I don't see what else might be missing.
>>>
>> In the message that Geert originally forwarded, William was quoted as
>> saying it was necessary to "fix up the pata_falcon_data_xfer function". He
>> also said that using the IO port resources "causes the ioread8/iowrite8
>> functions to complain loudly".
>> https://lore.kernel.org/linux-m68k/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com/
>>
>> I think your patch is taking the same approach and may run into the same
>> issues... I guess we shall see when William tests it.
>>
>>> Please have a look and test if possible. Haven't yet bothered
>>> linux-block or linux-ide... the patch still needs a Fixes: and other
>>> trimmings so isn't ready for submission anyway.
>>>
>> Right. You'll want to run checkpatch.pl on it at some stage.
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>           main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>           (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>
