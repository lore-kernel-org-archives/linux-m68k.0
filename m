Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC7FC77B61
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 19:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbjDYTqo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 15:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236122AbjDYTqn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 15:46:43 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7007687
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 12:46:42 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a9253d4551so49837515ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682452001; x=1685044001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wem1EK5CEssvQ9NdOyn7DA5sMmS8+9OhIJ0bVYRjA8=;
        b=mlVPvD+sqWTG3o/8Q3C9oTUGknl3QfJ+2oMPeNm/3P2ZnCNQdRf2lxFGNOwD/2NVhW
         YRHUHPLMfD5mxDPdyUHbR5zh5TUvbbeEhz+Ggd4NbCSvZLcYmX+uFMBVXKqpC9S1V5X5
         3dNztomVtxALdbNFHZcWw2r/uwPjEp+LUL5ci+b3j7qotlH0BvLVCHxmsX1iwLVEMb6u
         eKC1aow5A6B/vVwgDsPz/fiqITF035X3ZkLwO6Nt0GRcs/2YIE3uIUHv5YeeSucKfbm9
         TH1JEtdFj05dZ4l6scJF39VS/8gWvj6H9BbWqMJXKOjwrl66NIuCAA4Konac+ypWYTqg
         8r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682452001; x=1685044001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wem1EK5CEssvQ9NdOyn7DA5sMmS8+9OhIJ0bVYRjA8=;
        b=TrSW0G7aTkB77Y3Na7b2lYBqvDygq3xiqSn92/cTxF4yBPNtYEZ01bzi8mI3v6FI51
         nr0MOjC0FIQAhqxrYpZkuin6tOW63fbYby+qpalXjFmDjG+CPu6hdBk3CalPxZziJG7q
         q3SkWdgp8ZwFEGMaWEUYOrEiqzXZoIfLhtW82DiTq8tw3jCziJP3yM9fi11311EWh3vF
         E+UVpqD0EGkXex/lgSmd19eWMrtGG+tA8ztBGg+kqFKU8c21gX7s0DfrR89rJZfaD8Bi
         +8sfTzJ/76ckLnN06J5IjlFhUf0pwuONgFkLN0Xm3hn9K6OASJHpm7iDjjgoebrv8+0K
         hkpw==
X-Gm-Message-State: AAQBX9cqDB//HiK+4QpwTXUJPH1jUJdawqoekxyZHNz9+a7/HEBwLvme
        CP3nxdkwy5EO4D5W01VnzMs=
X-Google-Smtp-Source: AKy350YM/Igmez6FFxWKj5Z23y3/Rog7krMoWWzPRUngfdpemNUXalEiBOiCX7mAZa5EOffQimgGIg==
X-Received: by 2002:a17:903:4112:b0:19e:ad18:da5c with SMTP id r18-20020a170903411200b0019ead18da5cmr17323826pld.37.1682452001394;
        Tue, 25 Apr 2023 12:46:41 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:2171:65c9:cfd9:944a? ([2001:df0:0:200c:2171:65c9:cfd9:944a])
        by smtp.gmail.com with ESMTPSA id w14-20020a1709029a8e00b00183c6784704sm8611876plp.291.2023.04.25.12.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 12:46:40 -0700 (PDT)
Message-ID: <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
Date:   Wed, 26 Apr 2023 07:46:36 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: signal delivery, was Re: reliable reproducer
Content-Language: en-US
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
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
 <87y1mgryp1.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <87y1mgryp1.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 25/04/23 23:25, Andreas Schwab wrote:
> On Apr 25 2023, Finn Thain wrote:
>
>> It turns out that doing so (patch below) does make the problem go away.
>> Was the exception frame getting clobbered?
>>
>> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
>> index b9f6908a31bc..94104699f5a8 100644
>> --- a/arch/m68k/kernel/signal.c
>> +++ b/arch/m68k/kernel/signal.c
>> @@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t frame_size)
>>   {
>>   	unsigned long usp = sigsp(rdusp(), ksig);
>>   
>> -	return (void __user *)((usp - frame_size) & -8UL);
>> +	return (void __user *)((usp - 256 - frame_size) & -8UL);
> Probably the issue is that a bus error exception should never start
> signal delivery when returning to user space.  On the 030 returning from
> a bus error resumes the execution of the faulting insn (unlike the
> 040/060 which restart it), and the saved USP may have the original value
> from before the insn started (modified registers may not be updated
> until the insn is complete or just before the final bus cycle).  Signal
> delivery should only ever happen at insn boundaries.

Thanks - we had seen evidence that a bus error generated mid-instruction 
did leave the USP at the address where the bus fault happened (not 
before the instruction started, neither what it would have been once the 
instruction completed), and the operation did not complete normally 
after the bus error (at least the value/address seen in the exception 
frame not stored). Finn had also demonstrated that skipping signal 
delivery on bus errors abolishes the stack corruption.  Your patch 
achieves the same objective in a different way, so I'm sure this will 
work as well.

I had thought the 030 could resume the interrupted instruction using the 
information from the exception frame - and that does appear to work in 
all other cases except where signal delivery gets in the way, and it 
also works if moving the exception frame a little bit further down the 
stack. So our treatment of the bus error exception frame during signal 
delivery appears to be incorrect. Wouldn't you agree?

Cheers,

     Michael


