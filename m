Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684CDC7618E
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 19:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjDZTpa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 15:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjDZTp0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 15:45:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EAC2701
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Apr 2023 12:45:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-24986c7cf2dso6553212a91.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Apr 2023 12:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682538318; x=1685130318;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CdqdLt4hH/GEG/u0wTiqkt3XHfJI2CjVVKuZw9KvLds=;
        b=qXX5SRnipEG028hTpygjg84TCzNPUkdNcJXR04due3lo5AGD/LZiZ53I3Jt+UOjJAn
         UWDRg55mNrrhOnGKwWYNSkmCr5gKfslZldgdaTTpWg+R+TDPucnxniqeHMoZh+aLGKis
         hQ+6qYpDtHe3QPBGDZH66Tfw+GU1oHdCdkhjf8HIuA5ECfbXCu17HaKHzhWT+jlZXg19
         Uv5KTWaKykA947A64F/ojKTN/gXwqgiuMEcNPS3AtevkvTh6wk+wZ4F6RIDS75o8Vo8s
         SBw9UqzpbVP899ffF3koud+bd5sf86NqL5uRTSTmXhHf/09ZStwxcLI3RYpZLDUUh91T
         3HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682538318; x=1685130318;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdqdLt4hH/GEG/u0wTiqkt3XHfJI2CjVVKuZw9KvLds=;
        b=Pr2nj7J5qO7MhIL9UdiIrsoY4IDreJ5AKay0GyK5tJw/V2DM03qmMYeea9B7NNepP8
         HMKuY+e7Wj7rHv+IpF0nrNhtUJi7MwqT+VcYU2zfUE+ju3c/TvsoAqjQOi946mU97M+m
         wKlK1GJASfoXx7GcH2ZjqgFik71WBgXrpS5mlowht6bUS8j4JjkrGKwNii5kRpLQtmk2
         1l98GPXOeItO8H5VtKxDxGrzVTS/ItlQRQmwTLLMNiDxTMeC5AsxLA5xkKzN07c1v/aj
         i1IbyJpf1QhMeqz2nxdBglqeNK/Pbn3b5mLSVSLROe1QTLRI/2qJ98XrmaGboA7jkp8r
         mO7g==
X-Gm-Message-State: AAQBX9frJx4+AHI5LqA7lv9JRgD2f9PvILa4Wg7mC5x4+DRH7LzbbQii
        X0ARTmZ4NppDFuz3fbL4k94=
X-Google-Smtp-Source: AKy350ZWmdoTYXJhocEQCWi5e7+d5AzOJHyNKqmpIBN/47BAg7OAp7AVHAp50Ws4FTMzjqELht3Tmg==
X-Received: by 2002:a17:90a:d102:b0:24b:68da:1420 with SMTP id l2-20020a17090ad10200b0024b68da1420mr18141484pju.38.1682538317977;
        Wed, 26 Apr 2023 12:45:17 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:c87:2b65:e92a:c391? ([2001:df0:0:200c:c87:2b65:e92a:c391])
        by smtp.gmail.com with ESMTPSA id gm5-20020a17090b100500b002479c36b10esm11912699pjb.23.2023.04.26.12.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 12:45:17 -0700 (PDT)
Message-ID: <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com>
Date:   Thu, 27 Apr 2023 07:45:13 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: signal delivery, was Re: reliable reproducer
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
 <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
 <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org>
 <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
In-Reply-To: <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 25/04/23 14:32, Michael Schmitz wrote:
> Hi Finn,
>
> Am 25.04.2023 um 13:55 schrieb Finn Thain:
>> On Tue, 25 Apr 2023, Finn Thain wrote:
>>
>>> On Tue, 25 Apr 2023, Michael Schmitz wrote:
>>>
>>>> As to a cause for the corruption: all the calculations in setup_frame
>>>> and sys_sigreturn use fsize, but get_sigframe() masks off the result
>>>> of usp - sizeof(sigframe) - fsize to place the entire frame at a
>>>> quadword boundary.
>>> ...
>>>
>>> I wonder if we are seeing some fallout from the issue described in
>>> do_page_fault() i.e. usp is unreliable.
>>>
>>>                 /* Accessing the stack below usp is always a bug.  The
>>>                    "+ 256" is there due to some instructions doing
>>>                    pre-decrement on the stack and that doesn't show up
>>>                    until later.  */
>>>                 if (address + 256 < rdusp())
>>>                         goto map_err;
>>>
Minimal gap that avoids the corruption for me (in your patch below) is 
20 bytes. Still can't explain that (and I won't have time to throw more 
confusion into the discussion until maybe the weekend).

Cheers,

     Michael


>>> Maybe we should try modifying get_sigframe() to increase the gap 
>>> between
>>> the signal and exception frames from 0-1 long words up to 64-65 long
>>> words.
>>>
>>
>> It turns out that doing so (patch below) does make the problem go away.
>> Was the exception frame getting clobbered?
>
> Might happen, if the frame gap isn't actually equal to the exception 
> frame extra size anymore? Aligning the start of the signal frame to 
> the next lower quadword boundary increases the gap size.
>
> When setting up the sigframe, the extra is copied to the correct 
> location (right past struct sigframe, or into uc_filler). When moving 
> that exception frame into place, the assumption is that the gap is the 
> extra size, not more.
>
> I'll try dropping the quadword alignment constraint - the return 
> trampoline still ought to remain longword aligned.
>
> Cheers,
>
>     Michael
>
>
>>
>> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
>> index b9f6908a31bc..94104699f5a8 100644
>> --- a/arch/m68k/kernel/signal.c
>> +++ b/arch/m68k/kernel/signal.c
>> @@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t 
>> frame_size)
>>  {
>>      unsigned long usp = sigsp(rdusp(), ksig);
>>
>> -    return (void __user *)((usp - frame_size) & -8UL);
>> +    return (void __user *)((usp - 256 - frame_size) & -8UL);
>>  }
>>
>>  static int setup_frame(struct ksignal *ksig, sigset_t *set,
>>
