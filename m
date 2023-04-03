Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F30C761A6
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Apr 2023 08:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjDCI0k (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Apr 2023 04:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjDCI0j (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Apr 2023 04:26:39 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DD718E
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Apr 2023 01:26:38 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id r7-20020a17090b050700b002404be7920aso27697569pjz.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Apr 2023 01:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680510398;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWuzjuCY35iLtql8Ujx0RIG+sIJIkYDGkKTiv5Fq8HA=;
        b=OTLYWjAYDTQzLkKzs0fyqcH27wjHXflPT6MhM/8Thz0mFRc66ck0OR0j6dwIaIjIjp
         SzbUtaTHf8fsWi/GZHuERHkNNDVR3K+Sm1T4a5kQDY6yOKcxKPkYuXTC4I1aQ4pReGQv
         G2bb0hQiriEVUGCKsRL6Fi0jIKdkbIZ2t/prPJ2T2XOVRSQqrPtr3OKU6xQCtB96xAmi
         q/6Gfh3NXQ5/kPoTxggOA20euSEdqmWbK1C6ro5rM6ru67fvMsx+FewuWajqZBAN7vWK
         vaBRJKbjDzWHTwF82O6L+JKTophhy0RzJk+KbD/oVd+dT+8cousF5InQt4l7CqYULP/X
         VVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680510398;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWuzjuCY35iLtql8Ujx0RIG+sIJIkYDGkKTiv5Fq8HA=;
        b=7M1N3pKKurEoQpfn+hbk8bpa3Cx0sj4MZqsTdQ5UE9bYEvNWs7Son8pAPu4AvUzioB
         sKBmbg8Y2MZoUXb6JLZx3Am+wKkff2iJ0+P59+O2nN15IfsWyF8zLbhl9qr+EW/kCLSl
         9pBuW7WeymjD08I8XhlPB0ceMCplWrmu9a/2V+XeHe1xNHFQt7yJhNfK0kGMGCZkuYjI
         l0EZduK6p6KMhANku8IOZrF3M7hvac7oR0+jNDuejmH/nZkLVIUMtohfLcrEJPKyvEQc
         16HDshbwcI51rDUQg3B6STp9aBV+Rtspzw+zYXINyjiLD303aWMfG10GazN3WJjINSeA
         pEsQ==
X-Gm-Message-State: AAQBX9cFVRPaHF8PnKrVtqxPWUQ2GSFG0wRd8bt+UHFQ8ergivYz8LvF
        L7sbWHQkaIRXDKQosFqtin5a69USipc=
X-Google-Smtp-Source: AKy350ZTxwhctcynWtNGb3wyCHMGNV8ckJSWb/47ptFJ+M5+6rq42GD7aFFlqwIFQsIvUagOUpeJQg==
X-Received: by 2002:a17:90b:4ac1:b0:23b:35f6:4ee6 with SMTP id mh1-20020a17090b4ac100b0023b35f64ee6mr38562580pjb.3.1680510397772;
        Mon, 03 Apr 2023 01:26:37 -0700 (PDT)
Received: from [10.1.1.24] (222-152-221-232-adsl.sparkbb.co.nz. [222.152.221.232])
        by smtp.gmail.com with ESMTPSA id i19-20020a17090acf9300b0023d1b9e17e2sm5742369pju.31.2023.04.03.01.26.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Apr 2023 01:26:37 -0700 (PDT)
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com>
 <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com>
 <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com>
 <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org>
 <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org>
 <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com>
 <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com>
 <44c29a26-a470-c03a-da55-0a9f6d347edd@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d6bdf882-9470-4d05-bd3c-36a1f3410fc1@gmail.com>
Date:   Mon, 3 Apr 2023 20:26:32 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <44c29a26-a470-c03a-da55-0a9f6d347edd@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 02.04.2023 um 21:31 schrieb Finn Thain:
> On Sun, 2 Apr 2023, Michael Schmitz wrote:
>
>> Saved registers are restored from the stack before return from
>> __GI___wait4_time64 but we don't know which of the two wait4 call sites
>> was used, do we?
>>
>> What registers does __m68k_read_tp@plt clobber?
>>
>
> But that won't matter to the caller, __wait3, right?

Not if they are properly restored ... best not go there.

> I did check that %a3 was saved on entry, before any wait4 syscall or
> __m68k_read_tp call etc. I also looked at the rts and %a3 did get restored
> there. Is it worth the effort to trace every branch, in case there's some
> way to reach an rts without having first restored the saved registers?

No, I dont think that's possible - from inspection, I now see 
__GI___wait4_time64 does not allow that, and I think the same is true 
for wait3 (haven't spent quite long enough on that).

>
>>
>> Maybe an interaction between (multiple?) signals and syscall return...
>
> When running dash from gdb in QEMU, there's only one signal (SIGCHLD) and
> it gets handled before __wait3() returns. (Of course, the "stack smashing
> detected" failure never shows up in QEMU.)

Might be a clue that we need multiple signals to force the stack 
smashing error. And we might not get that in QEMU, due to the faster 
execution in emulating on a modern processor.

Thinking a bit more about interactions between signal delivery and 
syscall return, it turns out that we don't check for pending signals 
when returning from a syscall. That's OK on SMP systems, because we 
don't have another process running while we execute the syscall (and we 
_do_ run signal handling when scheduling, i.e. when wait4 sleeps or is 
woken up)?

Seems we can forget about that interaction then.

>
>> depends on how long we sleep in wait4, and whether a signal happens just
>> during that time.
>>
>
> I agree, there seems to be a race condition there. (And dash's waitproc()
> seems to take pains to reap the child and handle the signal in any order.)

Yes, it makes sure the SIGCHLD is seen no matter in what order the 
signals are delivered ...

> I wouldn't be surprised if this race somehow makes the failure rare.
>
> I don't want to recompile any userland binaries at this stage, so it would
> be nice if we could modify the kernel to keep track of exactly how that
> race gets won and lost. Or perhaps there's an easy way to rig the outcome
> one way or the other.

A race between syscall return due to child exit and signal delivery 
seems unlikely, but maybe there is a race between syscall return due to 
a timer firing and signal delivery. Are there any timers set to 
periodically interrupt wait3?

>
>> %a3 is the first register saved to the switch stack BTW.
>>
>> That kernel does contain Al Viro's patch that corrected our switch stack
>> handling in the signal return path? I wonder whether there's a potential
>> race lurking in there?
>>
>
> I'm not sure which patch you're referring to, but I think Al's signal
> handling work appeared in v5.15-rc4. I have reproduced the "stack smashing

I have it in 5.15-rc2 in my tree but that's probably from my running 
tests on that patch series.

> detected" failure with v5.14.0 and with recent mainline (62bad54b26db from
> March 30th).

OK, so it's not related (or the patch did not fix all the problems with 
multiple signals, but a) that's unlikely and b) signals during wait4 
should not matter, see above).

So the fact that %a3 is involved here is probably just coincidence.

>
>> And I just notice that we had had trouble with a copy_to_user in
>> setup_frame() earlier (reason for my buserr handler patch). I wonder
>> whether something's gone wrong there. Do you get a segfault instead of
>> the abort signal if you drop my patch?
>>
>
> Are you referring to e36a82bebbf7? I doubt that it's related. I believe
> that copy_to_user is not involved here for the reason already given i.e.
> wait3(status, flags, NULL) means wait4 gets a NULL pointer for the struct
> rusage * parameter. Also, Stan first reported this failure in December
> with v6.0.9.

Can't be related then.

Still no nearer to a solution - something smashes the stack near %sp, 
causes the %a3 register restore after __GI___wait4_time64 to return a 
wrong pointer to the stack canary, and triggers a stack smashing warning 
in this indirect way. But what??

Cheers,

	Michael

