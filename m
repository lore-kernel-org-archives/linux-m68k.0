Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A93C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 22:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 285B5610D1
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 22:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241020AbhIPWcG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 18:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240826AbhIPWcF (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 16 Sep 2021 18:32:05 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CA7C061764
        for <linux-m68k@vger.kernel.org>; Thu, 16 Sep 2021 15:30:45 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id k24so7626952pgh.8
        for <linux-m68k@vger.kernel.org>; Thu, 16 Sep 2021 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=n2lHu+BbDohODZPGuiSGi4Pl07jwCZakxIHQ4ES6DLY=;
        b=nOr+UWzzUSc6SgKo+gadssrg21F2UDA/cUDMAzEjgcCfEwRNh/Wd3I0vNeo3rK9+bF
         pdg7HopS1vdj8nFdSYQ3uHwbgkWZ8bnk1kDTA6VP5R+6zUo8t6ONKA0WGH1Whjz1UEjp
         3yRvXetfsGOpo4cpkLOXyAWxl7I/K7/5CyTOhd4MWf0rXXkvUUOdbyd5gqCgwhDYCbST
         ADmy9ktWKCRXw+eesZI2eod9vLl1C463rU1hPz+7AyMhqoy2qLUjv2TnG18WNVw4+g6C
         bmqywKNnbPKJmJQk0Fx6lTW1Z3cZW9o0BoqARs5xsXwJfNaut6UyU6aoCAR9M8KAErWM
         4IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=n2lHu+BbDohODZPGuiSGi4Pl07jwCZakxIHQ4ES6DLY=;
        b=CdDJSFUyDZWXDZzYN05CzBO2sBBAyxTfHXhfPG+t3CHzt54Bav7Ox/Vh+r7HbGy55k
         QKEeGASUSAdQO+bTFDp8mhNpL/G8uW0y0z4fgIbbDgw8yzHOmMLwD1dwjBiy7NCeYL2L
         cSBCuAxglz4um2RQvffILjmmK0L2ZVLat5zacKF2MmPHKUNeOapiXptz4hcM69njCNcU
         ewpI0Sb/pQNFEwRbCWOywbvPxC/apOEeq1mGD/n40BlDM/xyl878AkzC5j4zwemrTON1
         5XroQluisJOgrkV5DIEqqel9TgLKeq0tINNdfIQ7m6UD8G38le4zNXTnckUs3tnKPWq2
         n5hA==
X-Gm-Message-State: AOAM530OEoN0JwLmycYlT/l6EZhB366MiDicmO+U8ZXfRf99zldj6k+H
        CIf6hB1iegImaS/XuNW10HMNNqOrleA=
X-Google-Smtp-Source: ABdhPJzjI+1M44tGAlpYQhVWJB20/qolX33nQ7K63+fRiq3V0vOBhkuHc5yhhhwXJNAvRK+OriZXGg==
X-Received: by 2002:a05:6a00:174a:b0:433:9589:bdb5 with SMTP id j10-20020a056a00174a00b004339589bdb5mr7463087pfc.5.1631831443986;
        Thu, 16 Sep 2021 15:30:43 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id g16sm4254722pfj.19.2021.09.16.15.30.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Sep 2021 15:30:43 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
 <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
 <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
 <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
 <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
 <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
 <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org>
 <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com>
 <4564a46-2115-9058-2a9-2d77736291c@linux-m68k.org>
 <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com>
 <189062a2-2b82-8185-2a5b-75a9282dca79@linux-m68k.org>
 <c5ee66a3-5227-b49a-c9d7-c8f69a8aca97@gmail.com>
 <19f1bb6c-5ac5-e7d-c7f4-f89b5e6c8ec6@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f2094795-c683-b7b2-76e9-dc33e1610c96@gmail.com>
Date:   Fri, 17 Sep 2021 10:28:56 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <19f1bb6c-5ac5-e7d-c7f4-f89b5e6c8ec6@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 16/09/21 21:04, Finn Thain wrote:
> On Wed, 15 Sep 2021, Michael Schmitz wrote:
>
>> On 15/09/21 13:38, Finn Thain wrote:
>>> On Mon, 13 Sep 2021, Michael Schmitz wrote:
>>>
>>>>>> Incidentally - have you ever checked whether Al Viro's signal
>>>>>> handling fixes have an impact on these bugs?
>>>>>
>>>>> I will try that patch series if you think it is related.
>>>>
>>>> Initial tests look promising (but I've said that before).
>>>
>>> Here's what I found in recent tests on my Quadra 630.
>>>
>>> The usual stress-ng panic can happen without list corruption, even
>>> with local_irq_save/restore() added to do_IRQ().
>>>
>>> The panic did not show up at all during stress tests with Al's signal
>>> handling patch series.
>>>
>>> I think my results are consistent with yours.
>>
>> Thanks - that's encouraging to hear. My tests with Christoph's patches
>> on top of Al's haven't shown any further errors either, but I'll give
>> that combination some more workout.
>
> Further stress testing here using Al's patches did eventually result in
> the same panic that I see using mainline (below).

That's bad - there's another bug lurking in the exception return code, 
it seems. Not a regression though.

>
>>
>> Would you care to add your tested-by for Al's patches?
>
> Sure. I haven't seen any regression, so
> Tested-by: Finn Thain <fthain@linux-m68k.org>
>
> ---
> running --mmap -1 --mmap-osync --mmap-bytes 100% -t 60 --timestamp --no-rand-seed --times
> stress-ng: 22:52:11.63 info:  [5491] setting to a 60 second run per stressor
> stress-ng: 22:52:11.64 info:  [5491] dispatching hogs: 1 mmap
> [ 9858.090000] Kernel panic - not syncing: Aiee, killing interrupt handler!

That one's from do_exit(), right at the start. Can you instrument that 
to print the hardirq and softirq counts separate?

> [ 9858.090000] CPU: 0 PID: 5493 Comm: stress-ng Not tainted 5.14.0-multi-00003-gb2406d5d331a #7
> [ 9858.090000] Stack from 00b4bde4:
> [ 9858.090000]         00b4bde4 00488d5f 00488d5f 00040000 00b4be00 003f3630 00488d5f 00b4be20
> [ 9858.090000]         003f2636 00040000 418004fc 00b4a000 009f8540 00b4a000 00a07440 00b4be5c
> [ 9858.090000]         0003171e 00480965 00000009 418004fc 00b4a000 00000000 073f8000 00000009
> [ 9858.090000]         00000008 00b4bf38 00a07440 00000006 00000000 00000001 00b4be6c 000318d4
> [ 9858.090000]         00000009 01438f30 00b4beb8 0003ac18 00000009 0000000f 0000000e c043c000
> [ 9858.090000]         00000000 073f8000 00000003 00b4bf98 eff82944 eff818a8 00039a22 00b4a000
> [ 9858.090000] Call Trace: [<00040000>] rcu_free_pwq+0x1c/0x1e
> [ 9858.090000]  [<003f3630>] dump_stack+0x10/0x16
> [ 9858.090000]  [<003f2636>] panic+0xba/0x2bc
> [ 9858.090000]  [<00040000>] rcu_free_pwq+0x1c/0x1e
> [ 9858.090000]  [<0003171e>] do_exit+0x87e/0x9d6

That offset into do_exit() does not make sense to me - in my version, 
that's beyond the end of do_exit(). Does this correspond to the 
in_interrupt() test in do_exit() in your image?

> [ 9858.090000]  [<000318d4>] do_group_exit+0x28/0xb6
> [ 9858.090000]  [<0003ac18>] get_signal+0x126/0x720
> [ 9858.090000]  [<00039a22>] send_signal+0xde/0x16e
> [ 9858.090000]  [<00004f0c>] do_notify_resume+0x38/0x5dc
> [ 9858.090000]  [<0003aad2>] force_sig_fault_to_task+0x36/0x3a
> [ 9858.090000]  [<0003aaee>] force_sig_fault+0x18/0x1c
> [ 9858.090000]  [<00007450>] send_fault_sig+0x44/0xc6
> [ 9858.090000]  [<000069be>] buserr_c+0x2c8/0x6a2
> [ 9858.090000]  [<00002cd8>] do_signal_return+0x10/0x1a

RESTORE_SWITCH_STACK in my version. We don't get there in interrupt 
context unless it's the only interrupt on the kernel stack.

This is after do_notify_resume() which would have called setup_frame() 
in case there was a signal pending (which we can pretty much assume 
here, unless you're tracing stress-ng).

I can't see anything in do_signal() and its call chain that would cause 
our stack pointer to change upon return from do_notify_resume() ...

Could you add code to do_notify_resume() that compares the 'regs' 
argument upon entry and return, and prints both if there is a mismatch?

I know, grasping at straws again ...

Cheers,

	Michael


> [ 9858.090000]  [<0018800e>] ext4_htree_fill_tree+0x154/0x32a
> [ 9858.090000]  [<0010800a>] d_path+0x86/0x114
> [ 9858.090000]
> [ 9858.090000] ---[ end Kernel panic - not syncing: Aiee, killing interrupt handler! ]---
>
