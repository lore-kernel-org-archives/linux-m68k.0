Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01ACC48BE5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Jun 2021 20:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 979F360FF4
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Jun 2021 20:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhFOUee (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Jun 2021 16:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhFOUed (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Jun 2021 16:34:33 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BAFC061574
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 13:32:28 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o10-20020a17090aac0ab029016e92770073so379316pjq.5
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 13:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xr1gtyZL/EgY9wTBg6sa6pg67DseK46iyA3CpSMuDXc=;
        b=Nbpt/URstAtUCgrepdqGr2vEALHbeMvCJ2p3xQvkNCSNtlIW10YivLJl54Jvj0mkds
         5kVSZfn9UwvQFQyUJKM6F8EWhECfiL8/Veb9PFQFauaBXvMa86zRFO79b8lT4RJHzO6n
         VC8dOxGuDEsEMM/nFv/xDAypnpRjjOcgp9i29zhKvTMW1CCD31mxWLZUCNxR+70rKr4Z
         0IUr6kzSsmC7RRCdZPjEuJfNOBb/c0Hkk1M1MmX+qbDggnEOsh0SP9VLGUxlAJ+D53oP
         05l/dFv1XT6h2IEYUBG51t56uOHRmc2FwZs/r9drY1M8EX/wr932NgrLULOAroGA6i4l
         63Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xr1gtyZL/EgY9wTBg6sa6pg67DseK46iyA3CpSMuDXc=;
        b=XbHgQxpx5rllMgBF5QfzRFJMRj2DxIio9UNnWjouBUUiaOlE6HFrv0MFik2jDa0649
         Vo2vgsoxGk8AOvLk2oudS7vpG3uvM1Y33NJKAB/sU7KpXFBPxX2mUPwklt+42EVs6PrY
         Om811hv/qODXhloX8iXl2K85euGvVIgn8eyXdNNGrgOEDVE580ux9qDiOoqHyBTSNJ2V
         fc3rToZOihZKSZaRF9ST0Ku8fjqnu7HMlBpYZb+yp+V6+BJ+88rYqKcmHMowGOrh8VI/
         XABhOBKawKCSvod7Cr8drxpKLNgNgz7cvoH7KYhsIMy/2JhukIY/QEYnzZ7EFfEEkfCv
         oyIA==
X-Gm-Message-State: AOAM532jmBJ5irpIAA4tCZrCNRTmVDgmRNUrWSrjrlBQUh0tDMQFXpVn
        hKG1YptpoqgDcOrpcY/tLac+JgBj/y1SWw==
X-Google-Smtp-Source: ABdhPJx+7sYLeCBOTw6abAt5uUwr966ADJ9kbwRBL016vMVw0AKFGQibVVwvCtqEUsYVVQ6+HOzlPg==
X-Received: by 2002:a17:90a:aa05:: with SMTP id k5mr6754657pjq.117.1623789147616;
        Tue, 15 Jun 2021 13:32:27 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a550:e6ef:8525:d5e0? ([2001:df0:0:200c:a550:e6ef:8525:d5e0])
        by smtp.gmail.com with ESMTPSA id a66sm43129pfb.162.2021.06.15.13.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 13:32:27 -0700 (PDT)
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
 <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
 <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
 <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
 <76e2f396-ec94-2615-4fea-0f33f6564f19@gmail.com>
 <67009443-6963-c66d-9c3d-0a4d79664b71@physik.fu-berlin.de>
 <2dd5ced6-ed01-c029-be5c-4dbfee2d9d05@gmail.com>
 <CAMuHMdXU3gNS69p_C8gSx6s6M2R18QazYFxC8n11OL_Vny76aQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c9ef2f65-152f-e173-2347-f7cb574ac507@gmail.com>
Date:   Wed, 16 Jun 2021 08:32:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXU3gNS69p_C8gSx6s6M2R18QazYFxC8n11OL_Vny76aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 15/06/21 7:51 pm, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Tue, Jun 15, 2021 at 1:14 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 15/06/21 11:04 am, John Paul Adrian Glaubitz wrote:
>>> On 6/15/21 12:11 AM, Michael Schmitz wrote:
>>>> working on entry.S recently, I was reminded of this one. It's never been applied, and I can't find a trace of it in my tree.
>>>>
>>>> Not sure how far Adrian got with seccomp support testing, so I'm uncertain this is still of interest ...
>>> I still have a fork of libseccomp with m68k support and my SH support patch
>>> was merged upstream.
>>>
>>> So, if you guys can get the kernel bits in place, I can take care of libseccomp.
>> Thanks - what (aside from my old patch) is still missing on the kernel
>> side?
> IIRC, it wasn't working well yet.  Reading the archives, due to some incorrect
> return value somewhere?

As I recall it, it wasn't clear what the correct return value should be. 
Seccomp uses -1 to signal syscall abort, but there is considerable 
variation among architectures about what signals a syscall abort. I've 
seen tests for return code > NR_syscalls, != 0, or == -1. Some 
architectures allow the return code to be used as the new syscall number 
(no idea how that works, with the argument list unchanged?).

But  no matter - I'll change the test and resubmit.

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
