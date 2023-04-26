Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D45EC77B60
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 03:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239355AbjDZD4P (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 23:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbjDZD4P (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 23:56:15 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2698C170B
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 20:56:14 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b60365f53so8160906b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 20:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682481373; x=1685073373;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9avIjPA8qb45m50EfET4hH8X4nQCeCRL5+UdOLp3KM=;
        b=FK3+P5mdUQELz3zctm88thJytR2aDmj/tZUv4Th72EDcoVNxddWxhS3IL54z67/d6J
         1YV0hCdctW/VPONeEge+k216lzbg6ChTCCkNViAf59fcSeWotLAfFQPn9bk0ewhFLjM+
         wN+l6hBJDc6H9aldkIFN+65nebRJxqaRDLmJvK+4EGy7BSC5V88FFx5PXT8NiOOAn9NI
         KRMX/cLzJvljwcL8fgzrARkMMxxrRkxB4etvlC21GCp9mnKsaVRBz1izodpPa+17wf/A
         aMjghfqqsxznNgfCT/JyVXmFaUxaBk2jJ4VhS1SRMGT/4LMVw0GIJSsywxOAYyV3g1g/
         cF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682481373; x=1685073373;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e9avIjPA8qb45m50EfET4hH8X4nQCeCRL5+UdOLp3KM=;
        b=h5Mnmlz12k8+GqC8m9nCt7eGzUXsOTZVokIwJ59MXo7u03yBatvS3gChBUMrAiMDpz
         VST6js5Z/Y/MLb1GNZcTikS2GzWeYBoRjZwy/QiBnEahBJ6AKBILzwxviTfDmaEhFKRd
         AxrTO/OgqNG3C1AUi107MBGAEa7Z1mP85epoPTq3dN3RY10S0ki8yVyKz60uSGnz2wHg
         0bAFqyEe9ZkdMmq6m5PQyvzl/8X7Ys3sFoMprA2Y2jpgQAiS4DrJu4FRV4oTcH3G91Ld
         Rp/uQvXiKnxYG+DpzV/XnPjlHUORS/VQg73pfkDV6z24JiMJICPSHefZ+xnvA3lES4dK
         DXCg==
X-Gm-Message-State: AAQBX9d+nx7XvCSb5BcKisgyIsKEWQizK5JFkVI2mFAizPivhaA3+RFp
        sUMA/RFUOizgH8wjUXc8+Yc+fRkOjG8=
X-Google-Smtp-Source: AKy350Z2rc231hHtefKmJ2olITMObOEo4LDbal1TtKMaaF2hFWjPxTBTUwSDddaqEEkR+LYPgdFXJw==
X-Received: by 2002:a05:6a00:843:b0:63d:3a21:b774 with SMTP id q3-20020a056a00084300b0063d3a21b774mr27920587pfk.27.1682481373090;
        Tue, 25 Apr 2023 20:56:13 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id e9-20020a056a001a8900b00640e14330d8sm2978015pfv.28.2023.04.25.20.56.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2023 20:56:12 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <6dac9c08-ebc1-03d2-4762-fdff937edf2d@gmail.com>
 <5c0ba5e6-8f3d-0712-99db-3b8191cfe684@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <bc28131a-e3eb-dae5-3731-d69a422ccac1@gmail.com>
Date:   Wed, 26 Apr 2023 15:56:07 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <5c0ba5e6-8f3d-0712-99db-3b8191cfe684@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 26.04.2023 um 15:27 schrieb Finn Thain:
> On Wed, 26 Apr 2023, Michael Schmitz wrote:
>
>> On 26/04/23 07:46, Michael Schmitz wrote:
>>>
>>> I had thought the 030 could resume the interrupted instruction using
>>> the information from the exception frame - and that does appear to
>>> work in all other cases except where signal delivery gets in the way,
>>> and it also works if moving the exception frame a little bit further
>>> down the stack. So our treatment of the bus error exception frame
>>> during signal delivery appears to be incorrect. Wouldn't you agree?
>>
>> Inspection of the format b frame placed in the signal frame in both rt
>> and non-rt cases (at the time the signal handler runs) shows the
>> expected contents in the data output buffer, data fault address and ssw.
>> At that time, returning to user space with rte would correctly resume
>> the instruction execution.  I had previously confirmed that the register
>> contents saved in the rt signal frame is correct also.
>>
>> That is with a kernel patched similar to above patch by Finn (using an
>> offset of 128 or 64 instead of 256).
>
> That means things go awry during sys_sigreturn or sys_rt_sigreturn. I'm
> not sure what happens to the exception frame:
>
> 1:
>         | stack contents now:
>         |   [original pt_regs address] [original switch_stack address]
>         |   [unused part of the gap] [moved switch_stack] [moved pt_regs]
>         |   [replacement exception frame]
>         | return value of do_{rt_,}sigreturn() points to moved switch_stack.
>
>         movel   %d0,%sp                         | discard the leftover junk
>         RESTORE_SWITCH_STACK
>         | stack contents now is just [syscall return address] [pt_regs] [frame]
>         | return pt_regs.d0
>         movel   %sp@(PT_OFF_D0+4),%d0
>         rts
>
> ... but I noticed that the sys_rt_sigreturn entry point does
> SAVE_SWITCH_STACK while the sys_sigreturn entry point does not. Yet both
> jump to label 1 above, so both syscalls do RESTORE_SWITCH_STACK. Hmmm.

In my copy of entry.S, sys_sigreturn has SAVE_SWITCH_STACK, just as 
sys_rt_sigreturn does.

Cheers,

	Michael


> .macro SAVE_SWITCH_STACK
>         moveml  %a3-%a6/%d6-%d7,%sp@-
> .endm
>
> .macro RESTORE_SWITCH_STACK
>         moveml  %sp@+,%a3-%a6/%d6-%d7
> .endm
>
> Well, that has to corrupt %a3, right?
>
