Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBBCC77B7E
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 06:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjD2Gn6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 02:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjD2Gn5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 02:43:57 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09545F5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 23:43:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aad6f2be8eso1843605ad.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682750636; x=1685342636;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3Y0YwpogWnAMpoL+9WD4myXes24sILiPLb2g6GEE1k=;
        b=G5qwJlTu8hMecNe3juH+qhFHz6CWNo4OTM2adgPEbUDssltgRYiYDj2Z0ULHr4uap1
         7fVT9/boBaMr7Sw93nR8sVr8FYwMZ684/Tv4lTsbUPVXYAPlIgXNoJvW7FcJHMUk/Ys9
         HK23PXPT7bVmOnG3L2H9jpfQD2esyvgWuqwsq+ILvalP12Nc4WC9In1hQtLawrRbPuZz
         Xe+9Mt7ghFGTm9NFmHrsxsymOxjlxlXLHbPReYb5tf2bs5ylt7eVYetAF2UYotlN1yu4
         pz+MEt3ZqlwB4YgRml7yEGSLZX1WjbwbcPaG0pjcB31yQg9MACwCCh+sP++naiFiIwQh
         ST5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682750636; x=1685342636;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3Y0YwpogWnAMpoL+9WD4myXes24sILiPLb2g6GEE1k=;
        b=QGEs4KUnJalSOHyWXKpn+YlGMTzO/OVmWEYZMk3FoqtAZ769C8n+TTyix434Rjh1cY
         0hI/q1ncktyKazoT7wn4MmZF8fnzzCcrGrLE+qGQiNlchxELGzvn/xMmuDm8HiLJyt/K
         yT8tAH4Qo/4ekLF4FSTbY6ltcFLW+jnjNSfHKFu/gFLDKkXhJXxVurapo6pFlEwJmu2i
         5SXwYRsdWsJz9xb4CWUE6KKBoghRXql1IotxA+85XC+Rbt+XvdzKbgq7PBd1Pg/WS0GX
         CV6qG/W58HPHDXgrwFBn0iY1cmxs2g3/KBWugdLmkD9+bzvfJUoH4FInRSjYzch/7xs4
         GUIQ==
X-Gm-Message-State: AC+VfDxRjG43rqI6mHr38q49WaeBoB+6nmEuAzYiNLk7Mv5sZrIIEvV6
        Exf5Opg1yTOsd76yGDo8hCtMxMilLzE=
X-Google-Smtp-Source: ACHHUZ6X5WAdWIroYxQHLW2Z0QvUhhsMWVGeyfsJr7nNzEr84kfE99U3Xv38AKUuUqKh2UX8ZP9TCA==
X-Received: by 2002:a17:903:234c:b0:1a6:b247:4316 with SMTP id c12-20020a170903234c00b001a6b2474316mr9270516plh.62.1682750636016;
        Fri, 28 Apr 2023 23:43:56 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id k23-20020a170902761700b001a9581d3ef5sm11458748pll.97.2023.04.28.23.43.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Apr 2023 23:43:55 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <585e64e3-d3e1-b4dc-5fa6-627f21a28792@gmail.com>
 <22152b78-45d2-d23f-8d49-f57922e6bdf8@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <cd581e90-44e3-4827-3fda-9d776da25498@gmail.com>
Date:   Sat, 29 Apr 2023 18:43:51 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <22152b78-45d2-d23f-8d49-f57922e6bdf8@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 29.04.2023 um 18:13 schrieb Finn Thain:
> On Sat, 29 Apr 2023, Michael Schmitz wrote:
>
>>
>> Might be, but this has all been on m68k v6.3-rc7, and I hadn't seen the
>> memory squeeze before there. I'll have to run a few hundred of the test
>> case on an unpatched v6.3-rc7 and on the one with the minimal frame gap
>> to be sure though.
>>
>
> You could use a stable kernel for this.
>
>>> Anyway, I agree that stkadj would need to account for the gap, as you
>>> pointed out earlier.
>>
>> Not sure about that anymore - mangle_kernel_stack() does not even use
>> stkadj to shift contents on the kernel stack (after restoring the
>> exception frame from the signal stack, but it uses the start address of
>> the frame for that copy operation, and uses a local buffer to move it
>> from user space to kernel space). It uses the extra frame size from the
>> exception frame directly.
>>
>> stkadj is the offset of the replacement exception frame on the kernel
>> stack. The replacement frame gets us into the user space signal handler
>> instead of completing the exception right away. stkadj is used to skip
>> that replacement exception frame used for the signal handler on the
>> final rte (after a trip through sys_sigreturn to copy the original
>> exception frame back on the kernel stack).
>>
>> The offset we use for he signal stack on the user stack does not matter
>> here at all.
>>
>> Or so my limited understanding...
>
> Thanks for passing it on. I sure wish this stuff was documented somewhere.

I hope this one works:

https://lore.kernel.org/r/YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk

Al Viro's patch series fixing our signal code - as I recall, he 
explained the principles behind the code in the discussion on that series.

>
>>
>>>
>>>>> I believe we can use USP to get a worst case estimate for the future
>>>>> extent of the user stack. ...
>>>>
>>>> What is the most data a moveml <...>,sp@- can take? If that's not too
>>>> much, a constant offset for the signal stack in case of format b
>>>> frames on 020/030 might be easiest.
>>>
>>> I think it's 64 bytes (16 registers). But we also have to consider all
>>> of the other instructions that may write to the stack. There's
>>> probably a reason why do_page_fault() picked a 256 byte gap (?)
>>
>> That's not used as a gap, just to catch any user access below the user
>> stack pointer.
>>
>
> MOVEM _is_ accessing the stack below the stack pointer. That's why the 256
> is relevant here.

Indirectly, as far as I can see (we should not expect do_page_fault() to 
fix up a mapping if we try to access an unmapped page that's 256 bytes 
below USP). Might need to add that constraint to my patch.

But it's not reserving memory below USP, or shifting something we want 
placed just below USP a little further down.

I'm making not much sense here, I fear ...

Cheers,

	Michael
