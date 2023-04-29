Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6515AC7618E
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 06:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjD2GBK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 02:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjD2GBJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 02:01:09 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC5E1BEE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 23:01:08 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a92513abebso7422985ad.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 23:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682748067; x=1685340067;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXXZ8cArn1FCgSNZx6aCSr9D6UrYqEdz4jp6rRGDXyc=;
        b=KxLTQ2OL2HMkvnmBK9OaVsiQO70qbyKoMot3F1udj21IPL2n+t1OgkwhXonZtxNvaJ
         TSORanKooIsg9fOpkjQbSThKptCwIJD0YQdtp15d/r9rbXuUTeJ+WnTPJWSmIptS5xqu
         9+KHefJ3idL/1vjuRI4DTYxMVSq5/lDd9g8kA72C6RH6E//pZ+RQ9kFdH1f9TWEUaWrE
         ZVM4XhDV4nc1hgZXaumVb+l9BUD2e3T0MtWzXnnTX1Sx5kSh03FjfY65IeDjkSRw4rXd
         KHvqFKRO+r6l3fO4T1yC+/akC3IdV3uREfCOi5w73Z8BzWLcl8cgvQ5J9Kn+SLRumjjZ
         V3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682748067; x=1685340067;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cXXZ8cArn1FCgSNZx6aCSr9D6UrYqEdz4jp6rRGDXyc=;
        b=L4N2mkLSzh+MAS6L0L/Ql6n3CUGkrjh9HvvDWsspzYCzTlLuHoOU//B1NJK93CXkSp
         i7ZGFD26KdjXX3c9x1KgHxnq5UdlsXPoZZeXbF4THXmOPVaGBh7AGQg23m46Mfba0eVh
         eU4rE/ff/mcHDy6S1mZgvzeY3sVnclr0Zd7kDeLUzfQLeBJE3ODx+tIhK0CTYcC7hOuT
         IMDMvQ9w7amwGdEVm1pQm2JkxW4tQiTt+QHNw+jRaMCMaRzpymiZcmn8xBhnb4v3XVpE
         rH3b6MJO9rNxdOd+nKwXY71bPLCTFWEiXXVW0u9XP5qV27TpqvvPvzyr9v/eI4UBrK6v
         K3Kw==
X-Gm-Message-State: AC+VfDzrHbYoeg2Tfec+GUe5VCzENws89Vs4O4/2hwiFA/7LhAM5Ikve
        LkEBq33tzsAwOD+zlUat/sd6vHnp4hQ=
X-Google-Smtp-Source: ACHHUZ6cBjZWxQMB8Yx3rGxtYd+kQDHpFqgMe9V8qd5LKiSzYLSKiBedcTGWFyVmEVGIRQil+fhWjA==
X-Received: by 2002:a17:902:e74e:b0:1a5:5e7:a1cc with SMTP id p14-20020a170902e74e00b001a505e7a1ccmr9658868plf.58.1682748067108;
        Fri, 28 Apr 2023 23:01:07 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ab8500b001991f3d85acsm14054392plr.299.2023.04.28.23.01.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Apr 2023 23:01:06 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
 <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com>
 <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org>
 <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com>
 <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com>
 <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com>
 <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org>
 <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org>
 <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com>
 <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com>
 <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
 <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com>
 <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <585e64e3-d3e1-b4dc-5fa6-627f21a28792@gmail.com>
Date:   Sat, 29 Apr 2023 18:01:02 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 29.04.2023 um 17:03 schrieb Finn Thain:
> On Sat, 29 Apr 2023, Michael Schmitz wrote:
>
>> Am 29.04.2023 um 12:28 schrieb Finn Thain:
>>>
>>> Right. If we fix this in the signal handling code, we take care of
>>> address errors as well, which was my concern with Andreas' patch. We
>>> can do what do_page_fault() does and assume the worst (256 bytes?).
>>
>> Well, we could do that if we could be certain this does not cause a
>> memory leak in some way. The reason I bring this up is that I've just
>> seen the kernel that I'd used to run the latest test cases (which
>> inserts a 20 byte gap only!) run amok terminating pretty much my entire
>> user space because it ran out of memory. Never seen the like of that.
>>
>
> If the test program ran out of stack space it would not trigger the OOM
> killer. So that incident probably has something to do with upgrading your
> kernel (?)

Might be, but this has all been on m68k v6.3-rc7, and I hadn't seen the 
memory squeeze before there. I'll have to run a few hundred of the test 
case on an unpatched v6.3-rc7 and on the one with the minimal frame gap 
to be sure though.

> Anyway, I agree that stkadj would need to account for the gap, as you
> pointed out earlier.

Not sure about that anymore - mangle_kernel_stack() does not even use 
stkadj to shift contents on the kernel stack (after restoring the 
exception frame from the signal stack, but it uses the start address of 
the frame for that copy operation, and uses a local buffer to move it 
from user space to kernel space). It uses the extra frame size from the 
exception frame directly.

stkadj is the offset of the replacement exception frame on the kernel 
stack. The replacement frame gets us into the user space signal handler 
instead of completing the exception right away. stkadj is used to skip 
that replacement exception frame used for the signal handler on the 
final rte (after a trip through sys_sigreturn to copy the original 
exception frame back on the kernel stack).

The offset we use for he signal stack on the user stack does not matter 
here at all.

Or so my limited understanding...

>
>>> I believe we can use USP to get a worst case estimate for the future
>>> extent of the user stack. ...
>>
>> What is the most data a moveml <...>,sp@- can take? If that's not too
>> much, a constant offset for the signal stack in case of format b frames
>> on 020/030 might be easiest.
>>
>
> I think it's 64 bytes (16 registers). But we also have to consider all of
> the other instructions that may write to the stack. There's probably a
> reason why do_page_fault() picked a 256 byte gap (?)

That's not used as a gap, just to catch any user access below the user 
stack pointer.

>
>> But we need to find something that works in the general case (and then
>> analyze the performance impact it might have in stack and signal heavy
>> applications - I might have mentioned that before, but your equivalent
>> to Andreas' patch seemed quite a bit slower in the test case than when
>> signals were allowed after format b bus faults. Interrupt latency, most
>> likely).
>>
>
> The alternative is to use more stack memory, which means marginally more
> paging. Choose your poison...

Yes - I'll have to run a few benchmarks to see which I'd prefer.

In the meantime, I'll send what I have at present as RFC.

Cheers,

	Michael
