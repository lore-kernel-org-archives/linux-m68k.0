Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9C0C64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 07:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjB0HUK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 02:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjB0HUJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 02:20:09 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16213C664
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 23:20:05 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so9139088pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 23:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChBXzot6AmK+axDstgd0ygxnNV80nYRhjmtn+eP4sOI=;
        b=l/bTQx0u09kVMkv0Qg7DG6fKX0s3KTc/+Sxuz6R3Q6n6Hrq50eZc2reuTNb7apvif3
         sn0I/5EErOr4WpaToTVNlOPxGizPzqkByc+H2VXhW0wZ5ioKwYRxJugllX0ctbB1lpcV
         STb4vBD0PxVcuAjF3zzZsAdBiq7UPs6Q9v1tV0KNd1SCPJFIczRuM9K/z7YwrK8yerqs
         EHzm8qMwR129qg3xnziLcvh8lUqp5Fy0Doy6p4W3WppUNTJFtj2nN4B6zCyxDddU2urM
         iG4CMstXcGaoMHhmikouMEGYB8BHYmGiEJTsRopSdpt2WeyxYztbdNQy5TP3AYh5+jr2
         t/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ChBXzot6AmK+axDstgd0ygxnNV80nYRhjmtn+eP4sOI=;
        b=GXAo4lP3j8Zl/h5sX7njdeG2XBjMfUBZ8RmjA50HNao4lXB91GX87/NT41P8YVs/jV
         5C7DNqAyLPENA8SpuWoTqyejD/nDI6DtNPrHR+npAxcegzs6KjtGIm1i+ss+r6tXVrhJ
         0XFzz+lxrrUNrB54+ApKQo06dkFe7EE69BeE0FNTtC/E5cg+bTBRbFtXhCTpR3Zd6e2p
         v8FO2IG6coa0ZCFOglmmbjwt9tOqp2LXG7P6rE3q49DkYHR7nVm+UwSl9UOcnhYz5Hf0
         LkljmifDQIlpDkOzHcrUm/Y9nG/ClFvyQ+P9vU5LlWyMqGsth4opr2EFYKkCvky0aeIB
         90tA==
X-Gm-Message-State: AO0yUKXYTdesDJ1t/gWc38mXHFXLaHBzUnIvlFM55cHC8O17za9rx+RB
        Jm4wn84bJLIoVRKKaU9r1ms=
X-Google-Smtp-Source: AK7set+Yv5urdkDNgTxKOfEH4Tl0mKLFsrivZdTbiYKR1Nmv95om6NC7SmHCD6B0brMov9FvjIM/fg==
X-Received: by 2002:a17:903:68e:b0:19d:90f:6c7f with SMTP id ki14-20020a170903068e00b0019d090f6c7fmr3065738plb.43.1677482404508;
        Sun, 26 Feb 2023 23:20:04 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902aa8d00b00198d7b52eefsm3770736plr.257.2023.02.26.23.20.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Feb 2023 23:20:04 -0800 (PST)
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Finn Thain <fthain@linux-m68k.org>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
 <96e0d5c1-6582-10ed-b6e2-d1bbbdf5a2bd@gmail.com>
 <412c63ed-f3dc-91e4-e08b-b52718823943@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b9d3446b-7589-2f11-ac8b-668010a83db7@gmail.com>
Date:   Mon, 27 Feb 2023 20:19:58 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <412c63ed-f3dc-91e4-e08b-b52718823943@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 27.02.2023 um 18:55 schrieb Finn Thain:
> On Mon, 27 Feb 2023, Michael Schmitz wrote:
>
>>>
>>> Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest
>>> functionality") in v5.17-rc1.  Reverting that on top of latest fixes
>>> the issue.
>>
>> Yes, I'm sorry to say that was the only likely candidate. Can't see why
>> though - are Macs all configured to have RAM start at address zero, and
>> possibly contiguous, Finn?
>>
>
> I don't really understand your question. This was not a Mac patch. The
> issue seems to be about the locations initrd_start and initrd_end in
> relation to the various memory segments (?)

I didn't realize that - thanks for pointing this out.

>
> This seems to be the same bug that was raised about 6 months ago... I had
> thought it was a bootloader bug but I'm out of my depth here.
>
> https://lists.debian.org/debian-68k/2022/09/msg00047.html
> https://lists.debian.org/debian-68k/2022/09/msg00051.html
> https://lists.debian.org/debian-68k/2022/09/msg00055.html

I had forgotten all about that one... Thanks for jogging my memory!

In this case though, the bug happens when the ramdisk is loaded in the 
lowest address memory chunk, at least at a lower address than the one 
the kernel runs from.

The crashes in the above thread were all from boots where the initrd got 
loaded at the end of the memory chunk the kernel runs from.

Time to try using copy_from_kernel_nofault() to copy the ramdisk into 
its final location? (just kidding)

Cheers,

	Michael



