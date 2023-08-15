Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A373C0015E
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 20:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjHOUNp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 16:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbjHOUNm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 16:13:42 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2291BE5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 13:13:40 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc7e65ea44so39442975ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692130420; x=1692735220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JEfck4p3Z2a3gor97HfwDMixnF0sYqGx5jJ0+RkHlM=;
        b=XEWVY0se8TUXYCoORyY49fq9PMMeJoquBCiLUn0jlYhYyXaXqDXnapkURhfugivztq
         etmUw1bK6HWJtclPS2f5Yz+Xkbfqr4ph9TbmfN/ltKoWr/vWNbqSWJPl6k7NAXy14tDC
         pUNVMyVO4pSlgLJfU2JkIXdnjXhjn3xHiN+ZlN6FrR7VOngLZO2DOSfx9lhk+DIVKDkP
         ILhB0AvN38gekaDUnBux9qo6zRmKyPOmFl0YvoX8QTEw1UjPF9WRJ6ewLkpIwKpnELF3
         Dgd0jMQ2BmoVj7D9VLaei09JDySc+3ABMww1em9+0AHo2ZSw/H99qVWHxLDYsviZ25oR
         VFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692130420; x=1692735220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JEfck4p3Z2a3gor97HfwDMixnF0sYqGx5jJ0+RkHlM=;
        b=c9i0DFh3yK9b043sLHTVxcu6BE8yHze1kx+tHEXhE/PC0K9vs19g4zr+RmpXhwphEM
         tRwHtdTP8ERhoGlSz71Mip5p2XvDocWo+AespSe++JwhX20rfV7nhuPrHVn8daQ5I4tu
         5Tl3GyJPtvjpr7FjaY5X5KUBubP/CyCUp4wfPwxLLYL6WxTZkXkmDhMKJJl0sTWuy+fF
         xN+9CeEX/fbo3z0psdRhGFmDXXaTPTYH3r7b8fNHy0I7cFgnztG7KIh1blIGWEJD4/Ot
         V4JTN9o3a2otvP31Kh22OEQBBjFEBBSimwouAXkxkHQJIUg5MsrpO/w+b8QUojcL9pfw
         7lJA==
X-Gm-Message-State: AOJu0YwEhtgm5rAHEXuZ9bbCPrER8zOQUGT21TK6ATZKFfStB9+ilxRD
        jDz1JU8cQjZLjIYtu4pKqAKyi5JulCo=
X-Google-Smtp-Source: AGHT+IGJ5qEV+R3Iu9pnOdGwusfTknJqfs9wZrbeVFWF4g8/NdDbm1EzOT3Z7NtCNttGrurHbBRogw==
X-Received: by 2002:a17:903:2446:b0:1bd:dbec:8673 with SMTP id l6-20020a170903244600b001bddbec8673mr3981468pls.11.1692130419894;
        Tue, 15 Aug 2023 13:13:39 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:4938:8f81:4e3b:b829? ([2001:df0:0:200c:4938:8f81:4e3b:b829])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902bd9700b001b03f208323sm11437314pls.64.2023.08.15.13.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 13:13:39 -0700 (PDT)
Message-ID: <18f82a4d-5bd2-5b7a-53a2-8c61215267af@gmail.com>
Date:   Wed, 16 Aug 2023 08:13:35 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <ZNoNlC5fhztMFBAk@sowerbutts.com>
 <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
 <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
 <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
 <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
 <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com>
 <ZNtKGaIgs4Dy2/6b@sowerbutts.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZNtKGaIgs4Dy2/6b@sowerbutts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi William,

On 15/08/23 21:49, William R Sowerbutts wrote:
>> We need to fix pata_falcon for Q40, and with data on William's disk in
>> little endian order, but data on other users' disks in big endian order, we
>> need to come up with a way to support both for now.
> I don't mind if you break my disk -- I can always byte-swap it if required,
> or patch my kernel to use my preferred byte ordering.
>
> Valid points have been made about needing to keep existing disks working.
>
> For the kernel driver to switch byte order after some specific version seems
> unexpected.
>
> On the other hand, having disks compatible with other systems is important,
> and as a naive new user the byte-swapped disk format was quite unexpected to
> me.
>
> It seems there are reasonable arguments for both sides.
>
> I had a cursory look through other drivers and could not find any that make
> byte ordering a user-selectable option.  Is there any precedent for this?  It
> would be interesting to learn how they exposed the option to the user.
As Geert explained, it was agreed by the IDE maintainers that any data 
byte order fixup needed would be handled in the block layer, and 
existing byte swapping options were removed as a result (as far as I 
recall, that was only ever necessary for Falcon and Q40).
> I'm not clear if pata_falcon on Atari records data on disk in normal or
> swapped byte order.  Can I take a drive from my Atari Falcon Linux machine
> and connect it to a PC without needing to byte swap it?
No, such a disk can only be read on a PC when running ARAnyM (where the 
m68k Linux kernel then handles the necessary fixup). Data are in the 
wrong byte order when hooking up a Falcon IDE disk to a PC.
>
> I want to float some potential solutions for discussion;
>
>   * Add a kernel configuration option to choose between legacy and compatible
>     byte ordering on Q40 at compile time (affecting all disks)
That's easiest ...
>   * Add a pata_falcon driver option to choose which of the connected disks
>     should use legacy or compatible byte ordering at run time
I'm trying to do that at present. I don't expect that to fly with the 
IDE or block maintainers though (for afore mentioned reasons).
>   * Extend pata_falcon to examine the connected disk's contents, looking for
>     some marker that reliably indicates a legacy byte order disk is connected.
>     Default to compatible byte ordering if this mark is not found.  Maybe it
>     would be cleaner for some optional module atop the driver to do this.
Your only hope for this is to get such autodetection into the Atari 
partition table code. It has no place in a device driver. As far as the 
device driver is concerned, a disk is just a bag of bytes, no structure. 
You'd then have to communicate the result back to user space. If you 
have enough RAM to first boot into an initrd that can then sort out what 
byte order to use for the root filesystem, this may work. I've only got 
14 MB, so won't be able to test such a scheme.
>   * Assuming pata_legacy can be made to work well: Have pata_falcon retain
>     legacy byte ordering, while pata_legacy drives the same hardware in
>     compatible byte ordering mode.  User chooses the driver to choose byte
>     ordering.
That could be a way out, but this applies to both disk either way. You 
can't have one driver handle drive 1, the other drive 2.
>   * Switch pata_falcon to compatible byte order, document for any legacy disk
>     users how they can either do a one-time migration of their data to
>     compatible format, or setup the block layer to do byte swapping
>     on-the-fly.

'compatible byte order' would have to be the byte order used by the 
native OS here. Meaning we pretty much do nothing, just use my latest 
RFC patch.

As Geert also pointed out, the block layer mechanism to effect byte 
swapping an entire disk or any partition appears to have been lost. This 
has to be revived before we can think about compatibility schemes.

Cheers,

     Michael


>
> Thanks
>
> Will
>
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>           main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>           (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>
