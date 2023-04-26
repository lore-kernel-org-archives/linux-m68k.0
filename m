Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AEDC77B7C
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 01:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239189AbjDZByU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 21:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239323AbjDZByR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 21:54:17 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D8417DCB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 18:54:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a686260adcso69747325ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 18:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682474056; x=1685066056;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmAIfb/QUzIWRLrkw8v2CoxrDm21jopE64YHBr9bn2o=;
        b=fja3FBrXKq7w3xTsXR8HY9DyLTAtwSS67lZMHo6orGRPQa9YiagMetuOQ054a3ePZu
         W4gpByn1emZ6u/wK9uxBM1lxj4kKiAJDiI7nqdhtjKZEcH2yQsQoaY9WolHPNPzvGTS/
         0ZntNseG6+ZZyvfOsN8xTPpAgl6hMsO1vVcn9p/9IfzSMN6/tHu+HYNW1pDCbwcOF9Sf
         KzeUr5wK9X2rMmXS50dki+mdhTFBwu2jWMlc+0zfqa1NJntt+NyAxl8P3vEYgsJ93fXN
         Rx66QhIWNPE+PXsOFyQarvPlqfZSpgyqYypeizCM2Vlveio7oyEjO7gK03/jM2NrvgP4
         hsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682474056; x=1685066056;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmAIfb/QUzIWRLrkw8v2CoxrDm21jopE64YHBr9bn2o=;
        b=dU03wMvOn4iFaoCmYo8lUNd8NSIValhphThdE/JEOJBY0xw/Fs3YvcSr740NpHcldw
         o6o9izhZuicz/8jJ9mZJyfgQEausMbhaMLpb9VkgGmiLJY+o1V8WusC+IqlBlQvQoDU3
         yJx1xtO5sJBWFUDfTxws/HQ4hbHEgwKbdzXEbtPMMYRlbJmtG9g9mkQXN1cUe6sOCTVY
         vO9R8hHqN5I8In5X6a5LRR6GC+y4ZTk0nx4WLL6/f1j05LfemjtFtru3pCLLmTDEIYFg
         6JL3k7E8PkccJgDRenYc9TcOzXEoQIjylRBfSmOKuCleSrRtRzGA7fC+7e2qibAcY1EH
         s2Ng==
X-Gm-Message-State: AAQBX9cFGUBBeuQTPhyhJN1tahA0qotuR0XVGeIu1JRLgFs6wcOfglwC
        JNYCNm1j2Pq6IcdfuY7k59g=
X-Google-Smtp-Source: AKy350anA/q3R5B4Rki0fhrzH58OsoY73ZgX1bT68m656EBAy94/Hbxwir18Ai65Y6QWpif3roghxQ==
X-Received: by 2002:a17:903:22ce:b0:1a6:74ce:9bed with SMTP id y14-20020a17090322ce00b001a674ce9bedmr25536642plg.46.1682474055980;
        Tue, 25 Apr 2023 18:54:15 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:2171:65c9:cfd9:944a? ([2001:df0:0:200c:2171:65c9:cfd9:944a])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001a280c04528sm8829731plc.248.2023.04.25.18.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 18:54:15 -0700 (PDT)
Message-ID: <6dac9c08-ebc1-03d2-4762-fdff937edf2d@gmail.com>
Date:   Wed, 26 Apr 2023 13:54:10 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: signal delivery, was Re: reliable reproducer
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <87y1mgryp1.fsf@igel.home> <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
In-Reply-To: <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 26/04/23 07:46, Michael Schmitz wrote:
> Hi Andreas,
>
> On 25/04/23 23:25, Andreas Schwab wrote:
>> On Apr 25 2023, Finn Thain wrote:
>>
>>> It turns out that doing so (patch below) does make the problem go away.
>>> Was the exception frame getting clobbered?
>>>
>>> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
>>> index b9f6908a31bc..94104699f5a8 100644
>>> --- a/arch/m68k/kernel/signal.c
>>> +++ b/arch/m68k/kernel/signal.c
>>> @@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t 
>>> frame_size)
>>>   {
>>>       unsigned long usp = sigsp(rdusp(), ksig);
>>>   -    return (void __user *)((usp - frame_size) & -8UL);
>>> +    return (void __user *)((usp - 256 - frame_size) & -8UL);
>> Probably the issue is that a bus error exception should never start
>> signal delivery when returning to user space.  On the 030 returning from
>> a bus error resumes the execution of the faulting insn (unlike the
>> 040/060 which restart it), and the saved USP may have the original value
>> from before the insn started (modified registers may not be updated
>> until the insn is complete or just before the final bus cycle). Signal
>> delivery should only ever happen at insn boundaries.
>
> Thanks - we had seen evidence that a bus error generated 
> mid-instruction did leave the USP at the address where the bus fault 
> happened (not before the instruction started, neither what it would 
> have been once the instruction completed), and the operation did not 
> complete normally after the bus error (at least the value/address seen 
> in the exception frame not stored). Finn had also demonstrated that 
> skipping signal delivery on bus errors abolishes the stack 
> corruption.  Your patch achieves the same objective in a different 
> way, so I'm sure this will work as well.
>
> I had thought the 030 could resume the interrupted instruction using 
> the information from the exception frame - and that does appear to 
> work in all other cases except where signal delivery gets in the way, 
> and it also works if moving the exception frame a little bit further 
> down the stack. So our treatment of the bus error exception frame 
> during signal delivery appears to be incorrect. Wouldn't you agree?

Inspection of the format b frame placed in the signal frame in both rt 
and non-rt cases (at the time the signal handler runs) shows the 
expected contents in the data output buffer, data fault address and ssw. 
At that time, returning to user space with rte would correctly resume 
the instruction execution.  I had previously confirmed that the register 
contents saved in the rt signal frame is correct also.

That is with a kernel patched similar to above patch by Finn (using an 
offset of 128 or 64 instead of  256).

Cheers,

     Michael


