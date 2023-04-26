Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4E7C7618E
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 09:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239943AbjDZJK7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 05:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239384AbjDZJK6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 05:10:58 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3BD40D1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Apr 2023 02:10:57 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a68f2345c5so54330025ad.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Apr 2023 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682500256; x=1685092256;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nT46aJZkT08k/tVuVWzUK3DttbnAcpTzAhLDDk7NDb8=;
        b=rdNcw1I6rVW03DqiRp6QyaBi2ZpxZU8hR5aqzEqF+Q+e5NprVGX+x4dRC2qy+Yz5Ws
         vPSk5ayA2fmtIBbLSrh1wL0eP9DL0Bzrv8mb/RuADmJoyOpTFgG/WBcy1gP67Y+uC2SE
         eFNkdXZS+7LVpLrsjtmwEiy4oB4NffJxi8YzTGL0Ra6xP0vIJjS82ODWpaIkshnYK3wo
         SOL2FlIZsfVQyMJ1b1El57ZLOS+m+VncJOBaROqaDWHblhRjuWy29l7IkbUTfng/VnwV
         wormOYs/Q+AJWR5+/a77v2YhAkWi6jVOHASBP6415zGjAteq7J/BaG5w+MWul4T7V9Ii
         gXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682500256; x=1685092256;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nT46aJZkT08k/tVuVWzUK3DttbnAcpTzAhLDDk7NDb8=;
        b=a6VJpqgChm7C8A8RemE8USfoRHkz3qi7qRyBwJbtDAV9K76zoBU0JyWP6GiNgzF5u3
         FJjzasvrLJz1q42ilqudeUpskLPe4UlzfFOa+Aqin6j/XJo2DEXT1OQA+DfQnqUskNqx
         KTzFkV5Cp7U/uzCZFCwvhJJENBVOnTV29QpdkVaODDiQfhULkMBmPCllx/S7a3e8dlGA
         Vj3UMGoXdcq+VWlp5fBXbFssaykaaBDdFucG0UUp1RXIhyHc/4u40Iagu+4ng45P28oc
         pAAAYfRg9e66NwITkfkMq2zES7MaxM+Xj7Su2F725yCN9w0oqr+vVSUINLkLbZ/8ruR8
         LLFw==
X-Gm-Message-State: AAQBX9eG0LVwMT4BFDRkqxqbi/+8zzBv3e/lIRj+03EvX/GGbOIr/Bqv
        PjmQxGkZ0hGerbggJxG6NWSwNOQFFMI=
X-Google-Smtp-Source: AKy350bVqMOi/wmcKR506EjGD5uuV1xpvgPVXTaUDR5z++ioMFcj+r6rU3u8VpkOu2GgJ2HJkoD7Lg==
X-Received: by 2002:a17:902:e885:b0:1a9:5d19:f5d1 with SMTP id w5-20020a170902e88500b001a95d19f5d1mr17456810plg.5.1682500256144;
        Wed, 26 Apr 2023 02:10:56 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902b28100b0019a87ede846sm9487232plr.285.2023.04.26.02.10.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2023 02:10:55 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com>
 <f408a661-06d5-be01-e3b5-931647cd8617@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <51b8464a-bb05-144b-949f-b92720b1227c@gmail.com>
Date:   Wed, 26 Apr 2023 21:10:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <f408a661-06d5-be01-e3b5-931647cd8617@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 26.04.2023 um 16:42 schrieb Finn Thain:
> If the long format frame was corrupted while on the user stack, the
> partially completed MOVEM won't be resumed correctly. That's why I was
> concerned about a bug in sys_sigreturn.

Yes, it turns out I hadn't read mangle_kernel_stack() carefully enough. 
I thought the exception frame had remained on the kernel stack to be 
restored, but I'd missed that it is actually being restored from the 
user stack copy to the kernel stack.

Need to go back and check whether the sigmask (located after uc_filler 
in rt sigframes) ever got clobbered.

>>> Wouldn't that depend on the exception frame format? Perhaps it is
>>> unsafe to treat any format 0xB exception frame in the way we do. If
>>> so, what do we do about address error exceptions, which are to produce
>>> SIGBUS? The Programmers Reference Manual says "a long bus fault stack
>>> frame may be generated" in this case.
>>
>> We don't handle access errors (beyond terminating the offending

Meant to say 'address errors' there. These are misaligned instruction 
accesses only, and we take them to indicate corruption of the binary or 
stack, so abort the process.

>> process).
>>
>
> SIGBUS could be caught and handled, perhaps followed by a setcontext() or
> siglongjmp() rather than return. So I don't think we get to disallow frame
> format 0xB.

Yes, we may still need to take these signals. But we don't have to 
deliver the signals to the user process while exception processing is 
still in progress. For bus faults mid-instruction, it isn't enough to 
map in a page so writes can succeed, we also need to resume the 
instruction to carry out the write.

Come to think of it, the same argument applies for faults taken at an 
instruction boundary. These need to be resumed as well, they just take 
less information to load back into the processor.

Now I just wonder why 040 bus errors (exception restart instead of 
resume) aren't a problem. Pending writebacks are handled during signal 
return there, too. But the format 7 frame is only 15 longwords, the 
format b one is 23 longwords. We know increasing the apparent length of 
the signal frame helps ...

Anyway, Andreas' patch addresses the issue without incurring too much 
delay in signal processing. If we find out what causes corruption of the 
exception frame, Andreas' patch can be dropped once a fix is in place.

Cheers,

	Michael
