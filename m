Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD526C77B60
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 20:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjDWUnI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 16:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjDWUnH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 16:43:07 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A10110C9
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 13:43:06 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-24986c7cf2dso3367832a91.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 13:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682282585; x=1684874585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAXki05qpGQiLVoEwrMk83Mycpqpp2edFtYdxscDNiI=;
        b=NMHkWKN9vS95tlxKrC9pdBG7raAWUnQK+4P00TD+W0Px+AdICcjOctW16Q1/wWScXy
         dWWqHTSd4ytyPmFTLGgcKalvXVzmAqzKxqpEkk8M9tc2SsCk8IL0HlZHQho5mvSXFe3Y
         bVMGsTmavWXo388mHN9UqPOo0woloThaKQ1LcRRYjUkChWGN7IxS0eboXAZEaRQxIp1u
         9GdqaovcZ5HO1MFzqoicUnlUSuEiMF5yp7kAlSjrHOJFT5yEqfoq3iDHC8ncf8GCf84s
         8N5hocXEGKtgW5EuwryC3UEh3RwcgPoAv2ohcalxZQHPxiDO1PXqx30H/5F388XUYahM
         Z6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682282585; x=1684874585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAXki05qpGQiLVoEwrMk83Mycpqpp2edFtYdxscDNiI=;
        b=RKgMd8Gkzg8wpScwX0JVf1SZNQJ7p8Ztume9+dnVTEYtdfziZHvKQ0ZSAQN7X1Lq9D
         xnlqh+uqGhuQdAP4ACncYZMvqE+imdZZk6ISKQMNRlXVmhI8zFkoAD3acAfdyX2z/LVc
         GjC+1hKuAbKf9wnUojgjCnD292/f2W1gSbs5unMmkGhCDTxxhoahXZnpGJyerSkfJ3VX
         mT/jEkPAUpipMIRQ7rF1JbLX48+ccOO1x/nd815BjHBZLvQTwovZfYIN+JY1hM/maOt8
         PQAMFH9R1uO2Bw27SajB7YCVuqK8SUyigXIIp3/tYVxDNvFXwmtdCRc+qyuGg4ADL0aL
         GfSQ==
X-Gm-Message-State: AAQBX9f9z2fInA8HuD7z5Rc7KOH6/Cl8KwUBUVFBVqPXLRB2DuOVNUES
        6c9p2Hap1Kl9ysDLvInUOz4=
X-Google-Smtp-Source: AKy350b9TIwgojOXOBPbaSrE/WIQltkiryD+F4Ohan8ipsarkOGUtk8zirVVj/3FBNKr05lsuthFZg==
X-Received: by 2002:a17:90a:98e:b0:247:26da:5de2 with SMTP id 14-20020a17090a098e00b0024726da5de2mr12011266pjo.20.1682282585345;
        Sun, 23 Apr 2023 13:43:05 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:7d4f:891d:86e0:1e1c? ([2001:df0:0:200c:7d4f:891d:86e0:1e1c])
        by smtp.gmail.com with ESMTPSA id om12-20020a17090b3a8c00b002405d3bbe42sm7189170pjb.0.2023.04.23.13.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 13:43:04 -0700 (PDT)
Message-ID: <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
Date:   Mon, 24 Apr 2023 08:43:00 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: reliable reproducer, was Re: core dump analysis
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 23/04/23 21:23, Finn Thain wrote:
> On Sun, 23 Apr 2023, Michael Schmitz wrote:
>
>> Am 23.04.2023 um 13:41 schrieb Michael Schmitz:
>>
>> Though the question remains - is this expected behaviour for programs
>> that do deep recursion on the stack while taking signals (and the reason
>> for the option to run signal handlers on an alternate stack)?
>>
> I don't understand how "deep recursion" can be used to explain this. We've
> seen crashes with only 1.8 MB of stack usage.
OK, it's not really deep (though I've managed to get the test case 
aborted by the oom killer once on my rather puny RAM). But it's putting 
lots of frames on the stack in a short span while also utilizing the 
stack for signal delivery.
> The best reason I can think of for having a signal stack would be that it
> may be better for signal delivery to fail than for the target process to
> fail. But I've no idea whether the kernel makes that kind of defensive
> programming possible (?)

I don't think there's any provision for signal delivery to fail - the 
signal handler is started from the return-to-userspace code in entry.S, 
and upon return from the handler, a sigreturn syscall is automatically 
executed to clean up the stack. As long as the handler returns, all's fine.

Not sure what happens if the process context that the handler runs in is 
killed by the kernel - I suppose the entire process is killed and the 
context removed, so the issue of parent process survival is moot. But 
I'm sure we can place an illegal instruction in the handler as soon as a 
stack overflow is spotted, get a dump and look at that.

>> And why does this almost always appear to happen after bus error exceptions
>> (frame format b)? The extra exception stack information isn't even accounted
>> for in the above frame end address!
>>
>> Result with sa_sigaction handler:
>>
>> parent usp  : 0xef969e28
>> handler tos : 0xef969e6c
>> handler stack overwrote usp!
>> frame end   : 0xef969e7c
>> frame start : 0xef969b58
>> handler usp : 0xef969b40
>> signal usp  : 0xef969e04
>> signal pc   : 0x80000696
>> signal fmtv : 0x114
>>
>> parent usp  : 0xef955008
>> handler tos : 0xef955064
>> handler stack overwrote usp!
>> frame end   : 0xef955074
>> frame start : 0xef954d50
>> handler usp : 0xef954d38
>> signal usp  : 0xef954ffc
>> signal pc   : 0x80000680
>> signal fmtv : 0xb008
>>
>> parent usp  : 0xef945eb8
>> handler tos : 0xef945f0c
>> handler stack overwrote usp!
>> frame end   : 0xef945f1c
>> frame start : 0xef945bf8
>> handler usp : 0xef945be0
>> signal usp  : 0xef945ea8
>> signal pc   : 0xc009f37a
>> signal fmtv : 0x80
>>
>> parent usp  : 0xef933eb8
>> handler tos : 0xef933f0c
>> handler stack overwrote usp!
>> frame end   : 0xef933f1c
>> frame start : 0xef933bf8
>> handler usp : 0xef933be0
>> signal usp  : 0xef933ea8
>> signal pc   : 0xc009f37a
>> signal fmtv : 0x80
>>
>> parent usp  : 0xef921edc
>> handler tos : 0xef9aaca4
>> handler stack overwrote usp!
>> frame end   : 0xef9aacb4
>> frame start : 0xef9aa990
>> handler usp : 0xef9aa978
>> signal usp  : 0xef9aac40
>> signal pc   : 0x80000782
>> signal fmtv : 0x114
>>
>> Illegal instruction (core dumped)
>>
> I don't understand these results. If usp was really overwritten, the
> program would have crashed early, no?
I think we're still at the point where rec() is called recursively, 
before any returns.
>> Exception right before crash was an interrupt in this case (only seen
>> that once in this context, though I've seen lots of those in the course
>> of the test runs). Frame start calculated from siginfo pointer value in
>> this case.
>>
> I didn't realize that you could get a crash from a signal delivered
> following an interrupt. I'll try to modify the kernel such that signals
> are not delivered after page faults.

Yes, that was news to me, too. I've got swap enabled and probably see a 
lot more disk I/O than on your machines.

Delaying signal return until the next syscall or interrupt after page 
fault ought not be too hard - just replace the 'jra ret_from_exception' 
by 'RESTORE_ALL' (though that would also defer rescheduling until the 
next interrupt). For a proper solution, replicate exit_work without a 
call to do_signal_return ...

Cheers,

     Michael

