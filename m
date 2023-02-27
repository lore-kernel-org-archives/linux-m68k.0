Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303BEC64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 09:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjB0Jmp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 04:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjB0Jmn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 04:42:43 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB90F779
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 01:42:42 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id z2so6052720plf.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 01:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffEcYTgqPWZlzubtsq/czq4jTfwVJUAydDVwKzdVwuc=;
        b=awlWS8eIch/1EIadyHxsnBN+o+H44ume9gMlnotVWzcPayw9EMgaVF5x19L6WBVj2t
         0o7y4GTWW0jeth3plhocGmy6LpdPrfKn02TlQHmRwJpK95GZU5Y26Ni+7UPLm6iUsiWk
         URJG52N/gcbxbbHc74zaRr8t69gPHsqMZLLEbLdBvohXXfci2RCMAnukVxI2hzxZ50fy
         HDJ+5P+1QOA0BQc4NSqqjuZ29lzbm/LNRRL1b1IuBQYurzVSWwtsnYTTbKmFxSMXB9z4
         Z+nnTfozpyntu3XKCXXmuIrA/mN7gSgeu3lw4Gl8Bx3RC2KABbdUB6AOIQosngWXKqqJ
         wg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ffEcYTgqPWZlzubtsq/czq4jTfwVJUAydDVwKzdVwuc=;
        b=Wj7mj0aa/kP+gtxvsCcoFHklVEj3QCTkjKfxdk0wk3o9B48Bk0Pmqg/S2iE9+OP5Vg
         tpAhJcGq3FQvsHq/nZvTX4QznSDpy8kTd2Fg20muIl26/HfGOLgY9D0GXkRDYQnhPMX+
         hubFb0o868NA+Ow9AZvbvbANWqlzY7L7ZfJqO2WCnzNhLu/HrgDZFG6N1+bgWYoxGPsr
         XA9R1jZObkM527gtKUpH3PZIflsfJjFtUMI3s40vcUaPCOlCTrkWGzxg9xrdc2TNzmtx
         mJRio09v8kqIIgxx9Tiwv+kRqZdKW82S1F+3c1QkrqlOImoWalXvpU7UJJXFxN4C15NE
         0yxw==
X-Gm-Message-State: AO0yUKUYSqoqtZWzL6+Mq/dUVimvYPvmGEiB16ovaN051pSS4ceeW1CK
        1Z98uc5cLm1L/z1V3BurYkU=
X-Google-Smtp-Source: AK7set92h7U4+WpKFfyyN4cOXyffWyzzbJZQPgrlCWdkc8wrb4zFudREqILX0q6hM9Nv0LFME9NDVQ==
X-Received: by 2002:a17:903:42c5:b0:19c:ac96:1f5b with SMTP id jy5-20020a17090342c500b0019cac961f5bmr14624065plb.69.1677490961446;
        Mon, 27 Feb 2023 01:42:41 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902bc4800b00199025284b3sm4121806plz.151.2023.02.27.01.42.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Feb 2023 01:42:40 -0800 (PST)
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
 <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com>
 <30ad3b65-c43c-4389-e8af-b53705833146@linux-m68k.org>
 <CAMuHMdV47vKvJyYV1fw9R66piT-73Q5=CiUwZ-RWa_XAgsJH+g@mail.gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org,
        Mike Rapoport <rppt@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2159d5c6-ee10-06e6-8085-831914ceccce@gmail.com>
Date:   Mon, 27 Feb 2023 22:42:34 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV47vKvJyYV1fw9R66piT-73Q5=CiUwZ-RWa_XAgsJH+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

adding Mike Rapoport to the recipient list who would know whether 
memblock_reserve() relies on paging_init() having run.

Cheers,

	Michael

Am 27.02.2023 um 21:26 schrieb Geert Uytterhoeven:
> Hi Finn,
>
> FTR, here is the diff of the dmesg between good and bad:
>
>     +initrd: 07f61166 - 08000000
>
> This is wrong (note the 6 trailing zeros), as phys_to_virt() is not
> working correctly yet (module_fixup() is called from paging_init()).
>
>      Zone ranges:
>        DMA      [mem 0x0000000007400000-0x0000007fffffffff]
>        Normal   empty
>      Movable zone start for each node
>      Early memory node ranges
>        node   0: [mem 0x0000000007400000-0x0000000007ffffff]
>      Initmem setup node 0 [mem 0x0000000007400000-0x0000000007ffffff]
>     -initrd: 00b61166 - 00c00000
>
> This is correct (note the 5 trailing zeros).
>
>     -pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
>     -pcpu-alloc: [0] 0
>      [...]
>     +Unable to handle kernel access at virtual address (ptrval)
>     +Oops: 00000000
>     +Modules linked in:
>     +PC: [<002c11be>] memcmp+0x2c/0x5c
>     +SR: 2700  SP: (ptrval)  a2: 003bd560
>     +d0: 0035eb83    d1: 07fffff8    d2: 002c1192    d3: 000000e6
>     +d4: 000684e8    d5: 00447000    a0: 0000000c    a1: 07fffff4
>     +Process swapper (pid: 0, task=(ptrval))
>     +Frame format=7 eff addr=003bbfbc ssw=0505 faddr=07fffff4
>     +wb 1 stat/addr/data: 0005 00447000 07401000
>     +wb 2 stat/addr/data: 0005 000000e6 000684e8
>     +wb 3 stat/addr/data: 0005 003bbfb4 002c1192
>     +push data: 07401000 002c7d82 07401000 074a2cf4
>     +Stack from 003bbfb4:
>     +002c1192 000000e6 002c7d82 00428eda 07fffff4 0035eb7f 0000000c 00447000
>     +000000e6 000684e8 00447000 07401000 074bec08 07401000 074a2cf4 07fffff0
>     +00440406 00000000 00428322
>     +Call Trace: [<002c1192>] memcmp+0x0/0x5c
>     +[<002c7d82>] _printk+0x0/0x18
>     +[<00428eda>] start_kernel+0x80/0x5b0
>     +[<000684e8>] pcpu_alloc+0x88/0x3b4
>     +[<00428322>] _sinittext+0x322/0x9b0
>
> On Mon, Feb 27, 2023 at 7:30 AM Finn Thain <fthain@linux-m68k.org> wrote:
>> On Mon, 27 Feb 2023, Michael Schmitz wrote:
>>> I wonder whether Finn's memtest patch merely exposed another MM bug
>>
>> A kernel patch may be easier than a bootloader patch (even if this is a
>> bootloader bug) particularly if it affects multiple platforms.
>>
>> A partial revert of my patch (below) will probably avoid the issue, but
>> with the side effect that use of memtest will clobber the initrd.
>
> Which we can avoid, by moving the ramdisk handling inside paging_init().
>
>> The initrd and memtest features aren't usually needed together. At the
>> time when I needed the memtest feature I did not have confidence in the
>> hardeare. An initrd wasn't very useful at that point.
>>
>> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
>> index 3a2bb2e8fdad..92f1b9268dff 100644
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -326,6 +326,8 @@ void __init setup_arch(char **cmdline_p)
>>                 panic("No configuration setup");
>>         }
>>
>> +       paging_init();
>> +
>>  #ifdef CONFIG_BLK_DEV_INITRD
>>         if (m68k_ramdisk.size) {
>>                 memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
>
> Presumably something in memblock_reserve() relies on having
> called paging_init() before?
>
> I'll do some more debugging later today...
>
>> @@ -335,8 +337,6 @@ void __init setup_arch(char **cmdline_p)
>>         }
>>  #endif
>>
>> -       paging_init();
>> -
>>  #ifdef CONFIG_NATFEAT
>>         nf_init();
>>  #endif
>>
>
>
