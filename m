Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305F0C64ED6
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 09:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjB0JmH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 04:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjB0JmG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 04:42:06 -0500
Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AF3F74D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 01:42:03 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter2.welho.com (Postfix) with ESMTP id 05B4B20510;
        Mon, 27 Feb 2023 11:42:01 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
        by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
        with ESMTP id rg1aJoNqP9uc; Mon, 27 Feb 2023 11:42:00 +0200 (EET)
Received: from [192.168.0.20] (82-181-34-209.bb.dnainternet.fi [82.181.34.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp3.welho.com (Postfix) with ESMTPSA id 729112315;
        Mon, 27 Feb 2023 11:41:54 +0200 (EET)
Message-ID: <50771f3a-938d-299f-b3e5-0de05f2eee09@helsinkinet.fi>
Date:   Mon, 27 Feb 2023 11:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
 <96e0d5c1-6582-10ed-b6e2-d1bbbdf5a2bd@gmail.com>
 <412c63ed-f3dc-91e4-e08b-b52718823943@linux-m68k.org>
 <b9d3446b-7589-2f11-ac8b-668010a83db7@gmail.com>
Content-Language: en-US
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <b9d3446b-7589-2f11-ac8b-668010a83db7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On 27.2.2023 9.19, Michael Schmitz wrote:
> Am 27.02.2023 um 18:55 schrieb Finn Thain:
>> On Mon, 27 Feb 2023, Michael Schmitz wrote:
>>
>>>>
>>>> Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest
>>>> functionality") in v5.17-rc1.  Reverting that on top of latest fixes
>>>> the issue.
>>>
>>> Yes, I'm sorry to say that was the only likely candidate. Can't see why
>>> though - are Macs all configured to have RAM start at address zero, and
>>> possibly contiguous, Finn?
>>>
>>
>> I don't really understand your question. This was not a Mac patch. The
>> issue seems to be about the locations initrd_start and initrd_end in
>> relation to the various memory segments (?)
> 
> I didn't realize that - thanks for pointing this out.
 >
>> This seems to be the same bug that was raised about 6 months ago... I had
>> thought it was a bootloader bug but I'm out of my depth here.
>>
>> https://lists.debian.org/debian-68k/2022/09/msg00047.html
>> https://lists.debian.org/debian-68k/2022/09/msg00051.html
>> https://lists.debian.org/debian-68k/2022/09/msg00055.html
> 
> I had forgotten all about that one... Thanks for jogging my memory!
> 
> In this case though, the bug happens when the ramdisk is loaded in the 
> lowest address memory chunk, at least at a lower address than the one 
> the kernel runs from.

I'm wondering whether this old Atari side boot issue is related at all...

When adding Linux bootinfo support to Hatari emulator (from Aranym 
emulator) few years ago, I noticed that:
"Linux barfs at ST-RAM memory range given after TT-RAM.  However, if 
kernel is loaded to TT-RAM and ST-RAM range is given before TT-RAM 
range, kernel crashes."

=> Only working config was Linux being loaded to ST-RAM, TT-RAM being 
given only after that in bootinfo, and initrd ramdisk after kernel.

Based on mails in archive, this seemed to have been a known Linux/Atari 
issue already in 2013.


> The crashes in the above thread were all from boots where the initrd got 
> loaded at the end of the memory chunk the kernel runs from.
> 
> Time to try using copy_from_kernel_nofault() to copy the ramdisk into 
> its final location? (just kidding)


	- Eero

PS. For people familiar only with Amiga terminology, ST-RAM = chip RAM, 
TT-RAM = fast RAM.
