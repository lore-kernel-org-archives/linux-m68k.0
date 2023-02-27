Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19850C64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 09:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjB0Jwa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 04:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjB0JwZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 04:52:25 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604C81A4B6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 01:52:23 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id kb15so5521642pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 01:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8jEFkpwO2HJMVDWxzNSWpISVrVYC/UHxFluoUErqaw=;
        b=EwOA1LbPi0HVK0p22qbEdRP8sC6EBsUCQtEhL8ZNsAtu1ErdRBpofdLBsS+Uns8RsF
         5N6I34adkMmsrFXJbpQ/Ku1x4UKlQibO/jCMh4N/aBFpfyFcJpuzWOIKrSSysKxgoK3J
         LdV0Q1JsSh6nPLNMIkH2al1ShMVJfn1ICNjXond501XHSHPzB0jjffStnTtdFXx+ZbSp
         wS1PHyQUshz8USYvgE2kiR/JSkZu6ze5IauWvTRcMuPhJsPke96wtTestqg3qIqZfyKH
         +1wcW4qohmmPbacczR5MK8ub4cV4BMBw9XfW3c01fd5Mo6up9DcMSj0XXK5IblsXVA4T
         /E+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N8jEFkpwO2HJMVDWxzNSWpISVrVYC/UHxFluoUErqaw=;
        b=6HKlx9Uoy3Z54Ikle9L1dHOX8TMKh7Zhqd5+qhx0iBc11OiUEjspkb20gL4MOOEWU5
         UYKX2Egzy3uqaCQdJXPTa5XwX1sKFYgoG9NgJCjqBMNlwpsdNbu0lrU1W4vZvnoQ6uMH
         uGNI6wGr6759hjFtCtYc7X3l9y14VkF83LciBja14/ExVS9M5fSHGi+FwpW1koaRxOHy
         EuLWniWY/pPwUrSfuo9IcpynqFvhF0MbSsl7WkrZxjNMew3n7OXRWbBEY17gLUstSp1Q
         w4P7HoThrAlejzHThaY02LXMHoJht3x2ekBc/Jl89LTTiCNqRcH+JRhRpODii78y9+YH
         CLZA==
X-Gm-Message-State: AO0yUKWhstmlCOLg4D5mpWFfHc/LtCDrvjxG43GCYx+FEOsHzr5yFGiT
        YNzQZjHwBC43DMO+ItAjp3smdNf50o4=
X-Google-Smtp-Source: AK7set+U/s5Co8rmBziFQfNo/FhK2i7JSXIVQL3fubJr0dfjTTnQ/Xm0yUw025xjVxb/p79lRcx1SA==
X-Received: by 2002:a05:6a20:2a1d:b0:c6:bf1d:9dc9 with SMTP id e29-20020a056a202a1d00b000c6bf1d9dc9mr14191961pzh.56.1677491542652;
        Mon, 27 Feb 2023 01:52:22 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id t20-20020a62ea14000000b005a91d570972sm3853806pfh.41.2023.02.27.01.52.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Feb 2023 01:52:22 -0800 (PST)
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <fthain@linux-m68k.org>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
 <96e0d5c1-6582-10ed-b6e2-d1bbbdf5a2bd@gmail.com>
 <412c63ed-f3dc-91e4-e08b-b52718823943@linux-m68k.org>
 <b9d3446b-7589-2f11-ac8b-668010a83db7@gmail.com>
 <50771f3a-938d-299f-b3e5-0de05f2eee09@helsinkinet.fi>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6de5bc70-b6d4-d514-6b86-d5bb5a9274cf@gmail.com>
Date:   Mon, 27 Feb 2023 22:52:16 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <50771f3a-938d-299f-b3e5-0de05f2eee09@helsinkinet.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Eero,

that issue (kernel running from TT-RAM) was fixed quite a few years ago 
(but maybe not in 2013), in the sense that ST-RAM could be used for 
drivers (SCSI, atafb). Using ST-RAM as normal VM should have been made a 
lot easier by changing to memblock, but AFAIR there are still some bits 
missing.

RAM must be listed in bootinfo with the chunk holding the kernel first, 
_not_ in ascending address order, so that second option is expected to 
crash.

This isn't related to the current issue for all I can see.

Cheers,

	Michael

Am 27.02.2023 um 22:41 schrieb Eero Tamminen:
> Hi,
>
> On 27.2.2023 9.19, Michael Schmitz wrote:
>> Am 27.02.2023 um 18:55 schrieb Finn Thain:
>>> On Mon, 27 Feb 2023, Michael Schmitz wrote:
>>>
>>>>>
>>>>> Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest
>>>>> functionality") in v5.17-rc1.  Reverting that on top of latest fixes
>>>>> the issue.
>>>>
>>>> Yes, I'm sorry to say that was the only likely candidate. Can't see why
>>>> though - are Macs all configured to have RAM start at address zero, and
>>>> possibly contiguous, Finn?
>>>>
>>>
>>> I don't really understand your question. This was not a Mac patch. The
>>> issue seems to be about the locations initrd_start and initrd_end in
>>> relation to the various memory segments (?)
>>
>> I didn't realize that - thanks for pointing this out.
>>
>>> This seems to be the same bug that was raised about 6 months ago... I
>>> had
>>> thought it was a bootloader bug but I'm out of my depth here.
>>>
>>> https://lists.debian.org/debian-68k/2022/09/msg00047.html
>>> https://lists.debian.org/debian-68k/2022/09/msg00051.html
>>> https://lists.debian.org/debian-68k/2022/09/msg00055.html
>>
>> I had forgotten all about that one... Thanks for jogging my memory!
>>
>> In this case though, the bug happens when the ramdisk is loaded in the
>> lowest address memory chunk, at least at a lower address than the one
>> the kernel runs from.
>
> I'm wondering whether this old Atari side boot issue is related at all...
>
> When adding Linux bootinfo support to Hatari emulator (from Aranym
> emulator) few years ago, I noticed that:
> "Linux barfs at ST-RAM memory range given after TT-RAM.  However, if
> kernel is loaded to TT-RAM and ST-RAM range is given before TT-RAM
> range, kernel crashes."
>
> => Only working config was Linux being loaded to ST-RAM, TT-RAM being
> given only after that in bootinfo, and initrd ramdisk after kernel.
>
> Based on mails in archive, this seemed to have been a known Linux/Atari
> issue already in 2013.
>
>
>> The crashes in the above thread were all from boots where the initrd
>> got loaded at the end of the memory chunk the kernel runs from.
>>
>> Time to try using copy_from_kernel_nofault() to copy the ramdisk into
>> its final location? (just kidding)
>
>
>     - Eero
>
> PS. For people familiar only with Amiga terminology, ST-RAM = chip RAM,
> TT-RAM = fast RAM.
