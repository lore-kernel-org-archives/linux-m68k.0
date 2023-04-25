Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0792CC7618E
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 02:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjDYCcI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 22:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjDYCcH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 22:32:07 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E77519AB
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 19:32:07 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b7b54642cso3881915b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 19:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682389926; x=1684981926;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ86YqEdf8mCPG7au+zEvmsqf/ESCQ0Im+lzxSLocag=;
        b=lop7PCB3aYaU70JKmlpaH2YIniOs7NESrZto/tv14gEJ2yv0QB76HZ9/jUwgtFNd4Y
         wEWyalXNRXGs81vV55Lh857AFhQ2CP4AooUdMQqmYKyqgYfZtaSGL0L8nOuVfJYyWqEn
         4C4RCFuNmqizm5q823eblUE7s6ig0YzZP5vJkmoRbQWZXdLFbYsKgdVQ8MTot2t5ztva
         UN6l89k2f92s3uE7kYjocz47EnDvR/rpObi3VkfVINIbOtBbeadz8ZWRABv8wBUxo7W4
         x+i23cCrr9K3hNw8mqhrlwqYdK90UkOWdR19B4Pe4Dyvkp9EGCL/abXWWI+BxV4l4IPL
         nIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682389926; x=1684981926;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJ86YqEdf8mCPG7au+zEvmsqf/ESCQ0Im+lzxSLocag=;
        b=QM6AsmDOZjtTro6SsTMHv4rO2FAN6BFYrGhtiAtxkN45qvTl5PvlBmlfodzWTgo16D
         S2TdBjaeJvpUFI9vkKeJ3BoMYpcunU+WlnNYumg8VcPcszi9WijpRAU0JUE4fhVP/jhv
         wtTAVZV/lCnXezNKKn0dcwcyKO6RLmYC1Bv4WBVVReWCxfzoEgWTLLFZxoz5FGj/aXR9
         G0/iiKRnj2J6Rmv4IGZo7Gw3GXygC2gtCT3YAmCxUg0J5JlyFvQd74Y/qPuBWihIq2jf
         6kDjzXVlaz8cWp1iUn/3ejAG3W9W/NeGoplgKg/VLMTE3GOpg39Xx2f5XVWOjXyOOU5d
         NUVg==
X-Gm-Message-State: AAQBX9da6Q3JwBWUo8hfAMD0X4gwxdw74ppBC+RUl6qvxqsYkUBNhMTM
        IgaapHaCHz1lezStUAP5qQDISWNcG04=
X-Google-Smtp-Source: AKy350YDa3YVuc99rvwyyoP9JOsXnHdEwumgdT7dtH3vnsoFMJJNTg3jBkHmV2z1mV1NqZ67bI6pxQ==
X-Received: by 2002:a05:6a20:9387:b0:f5:8681:14d9 with SMTP id x7-20020a056a20938700b000f5868114d9mr5323950pzh.39.1682389926022;
        Mon, 24 Apr 2023 19:32:06 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id z5-20020a62d105000000b00640ddad2e0dsm1765781pfg.47.2023.04.24.19.32.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 19:32:05 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
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
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
Date:   Tue, 25 Apr 2023 14:32:00 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 25.04.2023 um 13:55 schrieb Finn Thain:
> On Tue, 25 Apr 2023, Finn Thain wrote:
>
>> On Tue, 25 Apr 2023, Michael Schmitz wrote:
>>
>>> As to a cause for the corruption: all the calculations in setup_frame
>>> and sys_sigreturn use fsize, but get_sigframe() masks off the result
>>> of usp - sizeof(sigframe) - fsize to place the entire frame at a
>>> quadword boundary.
>> ...
>>
>> I wonder if we are seeing some fallout from the issue described in
>> do_page_fault() i.e. usp is unreliable.
>>
>>                 /* Accessing the stack below usp is always a bug.  The
>>                    "+ 256" is there due to some instructions doing
>>                    pre-decrement on the stack and that doesn't show up
>>                    until later.  */
>>                 if (address + 256 < rdusp())
>>                         goto map_err;
>>
>> Maybe we should try modifying get_sigframe() to increase the gap between
>> the signal and exception frames from 0-1 long words up to 64-65 long
>> words.
>>
>
> It turns out that doing so (patch below) does make the problem go away.
> Was the exception frame getting clobbered?

Might happen, if the frame gap isn't actually equal to the exception 
frame extra size anymore? Aligning the start of the signal frame to the 
next lower quadword boundary increases the gap size.

When setting up the sigframe, the extra is copied to the correct 
location (right past struct sigframe, or into uc_filler). When moving 
that exception frame into place, the assumption is that the gap is the 
extra size, not more.

I'll try dropping the quadword alignment constraint - the return 
trampoline still ought to remain longword aligned.

Cheers,

	Michael


>
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index b9f6908a31bc..94104699f5a8 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -862,7 +862,7 @@ get_sigframe(struct ksignal *ksig, size_t frame_size)
>  {
>  	unsigned long usp = sigsp(rdusp(), ksig);
>
> -	return (void __user *)((usp - frame_size) & -8UL);
> +	return (void __user *)((usp - 256 - frame_size) & -8UL);
>  }
>
>  static int setup_frame(struct ksignal *ksig, sigset_t *set,
>
