Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88270C77B60
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 04:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjDZEAu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 00:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjDZEAs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 00:00:48 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB761737
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 21:00:47 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so5499188b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 21:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682481646; x=1685073646;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mndOOZQStUX6R1FY0ol0lOGb5hwJVOIIC8cWa4elg0=;
        b=BmYKeCGZ/BRu3pLFHutq82xvZTif9z7fRqdwY0ec0wh1dx+KZ1/AiqSVqrQ7Sdv+5q
         vVqIhMWVZMu8F77RgrOlb8sj9pUb7Cfv5hFOICuy+w0xiSRLQv/c66qPHDc5qbKTeOaz
         j5D94thhXSMTD11DxqZcoE/F8JboMgUxc12i5NRLoEWkCpRjNYSfMocBY3AJ6qv+zo2D
         e8bTSaXg0VnDLq1fcEWeC2hJTWBcTbCYxI2LdTMJ82g4vGD96ybEDtYe9i/11oyRYv07
         O4UqWDnWCKmYvgBbG5Wzl1VfZhuOCrbZ2fX6vOVMpHGQT2hpbh58US1p0bhYaQh0A83+
         hZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682481646; x=1685073646;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mndOOZQStUX6R1FY0ol0lOGb5hwJVOIIC8cWa4elg0=;
        b=efmvLTqlreH3/rg8QrwIDgm76qBeC0BiMXc1KISwIL4TZZoyx9+GvMibL+bBlSwqpN
         VDHHcSLYMTmn6cRAor/Wt1K09gP9VeMq6wkZE/sNVbqSpZndskCeiLWIm8n7G/ykjxGJ
         PImnKMONuG31UB7iLNfmJilx6ROEI+nv8uWv177vqop+WPfoTnQQxuhwH3ZXoSuMHwIW
         0+B0wP4YMAkq2a/b9bzi9KXQy0tTUZDPlZEQfjN59WPIHiMeOeHgpEfC47zp1cdhwyIv
         3AaDtJM89NdClo2RVbp0X3BAr9PSH1ZzehOy8Yb7SKcx/r0LjQgUTHW3p/vbk3o548Uk
         I1rw==
X-Gm-Message-State: AAQBX9cb820VSr4CCvWFb4l7grEEZCF9Tq7661X7eb88aWKJsbRRoa1E
        8QmxeXHheK4reHorUvLcA2+OSl7vaig=
X-Google-Smtp-Source: AKy350aAo6/VzEVP7s3pm4JRQiGxJ2m6o7wdCKJoHJQCosD6KbSQIMfbyFyZ0vny0Wn9kzYKmpQ6VQ==
X-Received: by 2002:a05:6a20:8e10:b0:f2:cc6a:932 with SMTP id y16-20020a056a208e1000b000f2cc6a0932mr18750856pzj.49.1682481646511;
        Tue, 25 Apr 2023 21:00:46 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id b21-20020a62a115000000b0063b64f1d6e9sm9011619pff.33.2023.04.25.21.00.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2023 21:00:46 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <87fs8sz6e9.fsf@igel.home> <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com>
 <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com>
 <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com>
 <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
 <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
 <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org>
 <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <87y1mgryp1.fsf@igel.home> <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
 <a72de14b-2e3a-60c3-0aba-81e36d2a68ae@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com>
Date:   Wed, 26 Apr 2023 16:00:40 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <a72de14b-2e3a-60c3-0aba-81e36d2a68ae@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 26.04.2023 um 14:02 schrieb Finn Thain:
> On Wed, 26 Apr 2023, Michael Schmitz wrote:
>
>> Thanks - we had seen evidence that a bus error generated mid-instruction
>> did leave the USP at the address where the bus fault happened (not
>> before the instruction started, neither what it would have been once the
>> instruction completed), and the operation did not complete normally
>> after the bus error (at least the value/address seen in the exception
>> frame not stored).
>
> I'm afraid I still don't fully understand how and why the user stack
> (rather than the supervisor stack) gets used for processing the exception
> frame.

The kernel stack would not be accessible to the signal handler which 
must run in process context (i.e. user space).

The exception frame is copied to the signal frame for informational 
purposes only (such as examination of processor state when the signal 
was taken - not too useful for SIGCHLD but could be used to interpret 
SIGSEGV).

>
>> Finn had also demonstrated that skipping signal delivery on bus errors
>> abolishes the stack corruption.  Your patch achieves the same objective
>> in a different way, so I'm sure this will work as well.
>>
>> I had thought the 030 could resume the interrupted instruction using the
>> information from the exception frame - and that does appear to work in
>> all other cases except where signal delivery gets in the way, and it
>> also works if moving the exception frame a little bit further down the
>> stack. So our treatment of the bus error exception frame during signal
>> delivery appears to be incorrect.

It seems I got confused about user and kernel stack there myself. And 
managed to confuse almost everyone else about this bug. Apologies for 
the incessant noise.

What matters for the return from exception is an intact frame on the 
kernel stack. Anything we do on the user stack (mucking around with the 
offset the sigframe is set up at, copying siginfo, ucontext or 
sigcontext plus exception frame extra) does not change the kernel stack 
one whit.

The mangle_kernel_stack stuff is needed because sys_sigreturn will place 
another exception frame on the kernel stack (a four word frame) that 
needs to be replaced by the bus error exception frame (or any other 
frame that caused the kernel mode entry prior to signal delivery) before 
finally returning from the bus error exception.

Only at that time will the movel instruction that took the bus fault 
resume (and complete its writes correctly, I hope).

Our problem may be that, if we take the signal too late and our main 
process inspects the stack that has been left partially saved only (due 
to the bus error processing still in-flight), we appear to be in 
trouble. After completing sys_sigreturn, everything will be OK.

I can see this cause the stack error in the test case. Not sure it also 
applies to the dash case ...

> Wouldn't that depend on the exception frame format? Perhaps it is unsafe
> to treat any format 0xB exception frame in the way we do. If so, what do
> we do about address error exceptions, which are to produce SIGBUS? The
> Programmers Reference Manual says "a long bus fault stack frame may be
> generated" in this case.

We don't handle access errors (beyond terminating the offending process).

I hope this makes a little more sense now...

Cheers,

	Michael
