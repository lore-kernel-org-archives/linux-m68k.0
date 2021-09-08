Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F9EC433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Sep 2021 08:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10AB360234
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Sep 2021 08:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348341AbhIHI5F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Sep 2021 04:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348212AbhIHI5F (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2021 04:57:05 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724B6C061575
        for <linux-m68k@vger.kernel.org>; Wed,  8 Sep 2021 01:55:57 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id u18so1931465pgf.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Sep 2021 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=SvPD7YI2RZJtzO5OlWB/l9yv4Agywlhw5ddSjUs4zNU=;
        b=W53AO+Spn4er9he46ns8BPYGpB+tY1PcjNWBstA/g8z9jOwWQ0pyp31HD5qYn+sLuL
         sJvwZBs4gRj0ryYIKf9OnFW0CiYJcqAwkTfzLdLu0ePit4XqejaQ/SZnOQ1I98uq5G2r
         Is4Ay5fcGrRdJzZGZTQb6cAaopHbb/w7HB4pFjzcb74q/zlu9FExz8xvwi6D3A0zUCzw
         gninAEAvZfY8e+CH5/HsaUUnKSfaAlAXtPH5Tu6l+1rBHcMPQDRbDeMU0CcwT9wYOadW
         ElIoS0HyJ/LRXbQogY+qxk0S/Up534i34MJ5gPzeqBgBIEZEjOhZpDr2Oi7KWUPTlKH9
         Z18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=SvPD7YI2RZJtzO5OlWB/l9yv4Agywlhw5ddSjUs4zNU=;
        b=Rr1wYeWlj5KXph4KlcTnwEUnu8wsFJADrABQZutapKeqT1a0q5CtQFhs4eYDhH2ZOz
         ftk/3Ma4dAxkArG+zkJ7Hv2XhLuIA1veD5zt6ofS7w+yochokmWU3oZIdw7i0Jih4RwK
         YWIP2AW7WTK9MkGXTIIQXjMD1DIXZQHkZOkbMbpA2gDGUujS9f/nSGEgkjKzZ25Ldk4B
         RsK1fzfgoRmJ26gjGqceezaKPWJJegUUdpdigTikt3pJL4yfaIkcFZITgtDD5PrQkWR6
         eMoyY4Ns/ftVa6LTIn3Y85b+ch1Iq5hk/LhQSLOBAGD9UPyYEs1i+5wwmPuWwykhx9GH
         SDMQ==
X-Gm-Message-State: AOAM533IwnIAon48qg+jL81WowgEgPLWgeEGCwcObGgkHib/xOGOrh/U
        Ds1sbpdfoHwKmiHyn02NKR9Zduxe+OM=
X-Google-Smtp-Source: ABdhPJyNTmTPiz4jCROXw6g5n9OhZ4DE7frFd06qgXrBj/llyp7DyPbPgQOSCGlDM0WITLk2S9THlA==
X-Received: by 2002:a05:6a00:80f:b0:416:1ddf:3ed7 with SMTP id m15-20020a056a00080f00b004161ddf3ed7mr2600441pfk.79.1631091356556;
        Wed, 08 Sep 2021 01:55:56 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id p5sm1631928pfp.218.2021.09.08.01.55.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Sep 2021 01:55:55 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org>
 <20210816075155.GA29187@lst.de>
 <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com>
 <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org>
 <dc594142-e459-533e-cac2-c7a213cec464@gmail.com>
 <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com>
 <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com>
 <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
 <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
Date:   Wed, 8 Sep 2021 20:54:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 08/09/21 11:50, Finn Thain wrote:
> On Tue, 7 Sep 2021, Michael Schmitz wrote:
>
>>> Does anyone know what causes this?
>>
>> Our practice to run interrupt handlers at the IPL of the current
>> interrupt under service, instead of disabling local interrupts for the
>> duration of the handler?
>>
>
> Lock contention will happen anyway.
>
> If using spin_trylock() outside of "atomic" context was a bug (really?)
> then it can't be used here.

add_interrupt_randomness() relies on interrupts being disabled in 
__handle_irq_event_percpu(), so this check assumes atomic context.

Our definition of irqs_disabled() invalidates that assumption.

> Perhaps add_interrupt_randomness() should use the lock in irq mode, like
> the rest of drivers/char/random.c does.

That might deadlock on SMP when a task reading from the random pool 
holding the lock executes on the same CPU as the interrupt.

In the UP case, the spinlock is optimized away, and other users taking 
the lock also disable interrupts as you said. That ought to protect 
against re-entering _mix_pool_bytes(), unless we're re-entering from 
another, higher priority interrupt. We either need to disable interrupts 
before entering _mix_pool_bytes() on UP, or treat this spin_trylock() as 
real lock operation (not optimized away).

I think this is something that should be discussed with Ted Ts'o.


In a related case, I've managed to swap my 'resume_userspace' format 
error for a nice 'illegal instruction' format error apparently caused by 
an invalid function pointer in __handle_irq_event_percpu(), just by 
disabling all interrupts upon entering the auto_inthandler and 
user_inthandler exception handlers. This bug is quite readily reproduced 
by running your kernel_coverage.sh script in a loop (panics on the first 
stress test on the second pass):

Stress run 2
Logging to stress-ng-20210908-0838.log
./kernel-coverage.sh: line 272: lcov: command not found
running --fork 1 --fork-vm -t 60 --timestamp --no-rand-seed --times
stress-ng: 08:40:08.70 info:  [1914] setting to a 60 second run per stressor
stress-ng: 08:40:08.82 info:  [1914] dispatching hogs: 1 fork
packet_write_wait: Connection to 10.1.1.4 port 22: Broken pipe

Why disabling interrupts during interrupt processing would make matters 
worse doesn't make any sense to me...

Cheers,

	Michael
