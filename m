Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904C5C41513
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 00:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjHNAeD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 20:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjHNAd4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 20:33:56 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605E318C
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 17:33:55 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6bd0a0a6766so3068426a34.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691973234; x=1692578034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/snqTnR/Zi+DsOgN4cXTtpzXlIiyMtxXSkcBxec9guo=;
        b=ZIEiRSusAl/qkMicdNPGq3kNQft36C7YoDffUnMeLPK79xevgvuWGJzHIxgriC1F+A
         gvDYM91TlUooTh+jeqkFBORqc3xbcAfc37aiHL2hCD7EJrJymyDyrJy5sLiY/iMCUbvW
         BQh9ir2Xu63dAwrZuLWt6opPWnihe6eKyFjufNkGfI/ZszZrSQO5z2wBdt5yxWv2YkGZ
         LsspScWgyOTtYSQ/KzQy4t9KpPGXORqu2VTujft6v+Xej4qqKuIl2FDUQYf7xncS4kQB
         HLXRqYbhEa3ur/zbm6sGeMYk1RpTt2qn2orXPIKNXB1lDmD2T6DhqZ1DuzcQz6l0hUKe
         I5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691973234; x=1692578034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/snqTnR/Zi+DsOgN4cXTtpzXlIiyMtxXSkcBxec9guo=;
        b=L2OR94+6r9idNdPoUWt1ViQRWkjxf4ct94k3WV6NiuFh/bc/g5rViIjoemKIZTd6TT
         ocETb59+chUxdpDDiQsKIwd95S0P3m9E/J+dod7jf+dm4RjN+O1p70xgsr/mkKvcbQmu
         ouj6gE5niVAowK+rcot+1edI0G0Eeeb6DPx1TcmFPT/PvYMTGh/XTOnfhtfqvAlb3uIr
         FjiQi1wFHFkXsjN2M2T3Cu39nKmMoPHXKx5no2Y0juzeLIAsK+v+dEzYw+oE1ER+VcSf
         kbg+918GMlmmvsVl4mDqj4q8HKJlxl1zraZqJaY5h4fdo1m7lZffAOD6FfE8KzUARxfd
         LQQA==
X-Gm-Message-State: AOJu0YwwlRBHNjQquHIt+Sey/TqAu4N70vzkRW8Ij47WrMP3Qyl+/t0u
        mV9RVU5g9uJKr4t1ezQZqY4=
X-Google-Smtp-Source: AGHT+IF8uQAJtEuzdIIMZu9bai3YoMCSfwPBQcA4rU3WAhbEk7kjrYOviMCqqU8npH32/fdhlkYdRQ==
X-Received: by 2002:a9d:6850:0:b0:6b9:cb9f:915d with SMTP id c16-20020a9d6850000000b006b9cb9f915dmr7408104oto.33.1691973233758;
        Sun, 13 Aug 2023 17:33:53 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b18f:24ea:a609:d728? ([2001:df0:0:200c:b18f:24ea:a609:d728])
        by smtp.gmail.com with ESMTPSA id c23-20020aa78e17000000b006883561b421sm1119230pfr.162.2023.08.13.17.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 17:33:53 -0700 (PDT)
Message-ID: <1403a5b1-7d89-9ae7-e47b-168feb148454@gmail.com>
Date:   Mon, 14 Aug 2023 12:33:48 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <a1ffc79b-eb37-5ed6-6984-a0a3674662b1@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <a1ffc79b-eb37-5ed6-6984-a0a3674662b1@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 14/08/23 11:37, Finn Thain wrote:
>
>>> The Q40 does not have an on-board IDE controller.  IDE is accessed via
>>> a common ISA PC Super-IO card.  When you do a 16-bit transfer from the
>>> ISA I/O address the data comes out backwards and the CPU needs to
>>> byteswap it.
>>>
>>> I found it interesting and quite unexpected that 5.13 read data from
>>> the IDE drive byte-swapped.  I had prepared a drive for the machine
>>> with an MBR partition table and an ext4 filesystem but the kernel did
>>> not recognise either.  After a while I realised I had to byte swap the
>>> entire drive with 'dd conv=swab', and then it worked.
>>>
>>> For my 6.4 patch I enabled byte swapping in the
>>> pata_falcon_data_xfer() function -- this allows me to use an IDE drive
>>> with everything in the normal/compatible byte ordering, which makes
>>> life much easier. I assume this is the intended behaviour.
>> That would be the sane behaviour, but the designers of both the Falcon
>> and apparently the TiVo decided otherwise, wired up the IDE data bus
>> byte-swapped and saved the byteswap operations in the driver. I'm unsure
>> how this was intended to work on Q40.
> Why did Atari do that? Was it because they wanted to interoperate with
> exotic filesystems (i.e. Microsoft) without paying a byte swapping tax in
> software? (Despite the 68000 instructions for that purpose.)

Interoperability cannot have been a concern - otherwise they would have 
made sure the on-disk format was compatible. Saving a byte swap 
operation for each word transferred must have seemed worth it.

They just took what was available in terms of hard drive interfaces 
(SCSI as well as IDE). IDE was 16 bytes wide, and the drive identify 
data were ending up in the 'wrong' byte order, so they just swapped 
those data.

As far as I know, neither floppy nor disk FAT formats are 100% identical 
to the PC ones, just somewhat compatible.

>
>>> I wonder if any existing Q40 users are actually storing all the data
>>> on their drives byte-swapped just to avoid the overhead of
>>> byte-swapping on every read/write. I suppose this would work just fine
>>> until you need to connect that drive to another machine.
>> Yes, it does work just fine with that little inconvenience. (When I had
>> to fix a corrupted partition table an FAT, I had to hook the Falcon disk
>> up to a PC and run ARAnyM on it to get byte-swapped access to the data.)
>>
>> Now the question is how data on legacy Q40 IDE disks have been stored.
>> If it's byte-swapped, we'd better keep that byte order in the current
>> driver (meaning your changes to pata_falcon_data_xfer() won't be needed,
>> but you would have to swap back data on your disk). If it's always been
>> in PC compatible byte order, all data (not just the identify data) must
>> be swapped.
>>
>> I'd like to have Richard's opinion on this (or hear from any other
>> former Q40 user).
>>
> Yes.
>
> If the Linux port for Q40 could use pata_legacy unmodified, that has to be
> more maintainable. However, I could imagine a scenario where the standard
> Q40 firmware, bootloader and/or vendor operating system would cease to
> interoperate with Linux if Linux has no byteswapping IDE driver. If true,
> would it matter?

I use the Atari TOS partition that the Falcon boots into to run the boot 
loader from, and I transfer kernels to that partition from Linux using 
the vfat file system (after copying them to the Linux partition over 
ethernet). That would all break without a byte swapping IDE driver.

Something similar may be true for Q40 users, but there can't be many of 
these left, otherwise I'd have expected to hear about the broken 
pata_falcon issue a lot sooner.

> Unix has a long tradition of pushing the byteswapping problem onto
> userland for those who need to migrate data. Hence tools like cpio and dd
> which are able to do byteswapping. One has to wonder whether drivers and
> peripherals are the wrong places for that.

Probably not - in that regard, not caring about the on-disk format might 
even be the Right Thing to do.

I suspect there's a way to do byte swapping on the fly using a loopback 
device and some dm magic, so disks with the 'wrong' byte order could be 
accessed on non-native systems. I just have never been bothered enough 
about the issue to find out.

Most other Falcon users might use SCSI (and SCSI-SD adapters) to 
transport data between systems. Not an option for Q40.

Cheers,

     Michael


