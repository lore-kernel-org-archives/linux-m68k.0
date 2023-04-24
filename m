Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5458CC7618E
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Apr 2023 05:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjDXFq2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 01:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjDXFq1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 01:46:27 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19E692
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 22:46:25 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b4bf2d74aso3264611b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 22:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682315185; x=1684907185;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoW08s27aI7stP8mdK9tGL6ivtPkbMqg9wKWW7ul5mk=;
        b=D46Ok8/qNxmD+6RaFdOcc3eVb6TYznF01oJgN5/jjUN4VolL3lozMv/27jnqpVNsXM
         efTKYNInqcB3JT2hHxrqnBa4/ofo8ogPPXMcKVxwZZwVW8VwhdAVyKsz72izF9xSBTnN
         B2CBRMLN7PwooEUHNSCvje6p8GoXGWvf3zA+4C642u9dpTa2x0QSMeipjrEePWgj8bcF
         rIKXt9B0Kxb0FeTLc6vxBxzvGBOyvMKzq1YtUqDRcffkduJ6J+E4qzdYpOR2fAIRI95p
         vNCM0C/VVWdynH9s+jwXQYr0/To7u9n7dhfLXbD5dDoE8Mud9Iiy0flz0pL+YRCtpSgN
         +xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682315185; x=1684907185;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QoW08s27aI7stP8mdK9tGL6ivtPkbMqg9wKWW7ul5mk=;
        b=iO82wQBWw55S4lvySGvx0dimesEcNj9K2va3R/j3+bBdtRJ867QJzBU23maXWosqLy
         Q8EYptLSZZe299GDWoo388hLsL94cssrmgL+Btx+I2SbOJFMgseCXeVmUScmhe8h3vmS
         6JUdmVf7ZdRAW76QFq9FNjKv2sHoXsgwrrA4z0eVqhdn6lIVIcGFrg9aWrbjgnCvqNrk
         j+jMLb28su3zZ6IGRomC7yJ7CLXz52LAw57GJuZO8q3Pjegl4wUU3pKk/cjmJNFl/0pz
         yDXbSbVw7dWzYGXuJcGMK3V9Imcvj5aH8Lj1JfoPd6xIz/boBlzzGblu/8GlDMeSHmO2
         VGRQ==
X-Gm-Message-State: AAQBX9cSm2hDWptzW4NvdT/XXFea/AOfyQL+KzgJHXdOEKG4A+9emi6B
        f6RJ3Q7dvUj2Vr+YVuWls6GintmkoSo=
X-Google-Smtp-Source: AKy350bnZ1Um/OBsrugXPR9/BML1YyzYp56mBP7S2dSrC3lR71AgPUY5ZdluvsapOi4Jf8La3B99dQ==
X-Received: by 2002:a05:6a00:9a1:b0:63b:3e:cbee with SMTP id u33-20020a056a0009a100b0063b003ecbeemr18371132pfg.32.1682315184757;
        Sun, 23 Apr 2023 22:46:24 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id k24-20020a6568d8000000b00520b677c645sm5779176pgt.41.2023.04.23.22.46.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Apr 2023 22:46:24 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <87y1mj0zxd.fsf@linux-m68k.org>
 <53153bec-90a9-a617-d3af-fe98d8d54632@gmail.com> <87v8hmw9re.fsf@igel.home>
 <ee8b7118-2197-0ea2-485f-a87c462384e2@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d7e1cd80-c976-1abf-a03a-c61aa851d8b3@gmail.com>
Date:   Mon, 24 Apr 2023 17:46:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ee8b7118-2197-0ea2-485f-a87c462384e2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 24.04.2023 um 15:51 schrieb Michael Schmitz:
> Hi Andreas,
>
> On 24/04/23 09:48, Andreas Schwab wrote:
>> On Apr 24 2023, Michael Schmitz wrote:
>>
>>> Not sure what third argument you referred to in another mail.
>> See struct sigframe and struct rt_sigframe.  The non-rt signal handler
>> gets signal number, vector number and sigcontext*.  The rt signal
>> handler gets signal number, siginfo* and ucontext*.
>
> Thanks, I see now. Got confused by the sigaction man page (despite
> working out that it's all there on the stack before...). Might need a
> comment in the code (or an update to the man pages).
>
> I've rewritten my test program to make the non-rt handler take three
> arguments, just to simplify things. Also fixed the end of signal frame
> calculation for the non-rt case where the exception places additional
> data on the stack.
>
> Running with the non-rt handler, the crash appears to happen right at
> the end of the recursion (or at least, I take no further SIGCHLD on the
> way back up the stack). With the rt handler, I see the stack depth
> decreased on the last signal taken before the crash.
>
> When I enable dumping the extra exception frame contents (which will
> show prior stack contents when the exception only used a four-word
> frame) in the rt handler case, I only see saved register data placed
> there at the very end. That's different from previous tests where I saw
> the saved register patterns all the time. (but might have had the
> offsets wrong).
>
> I'll see what peeking at the registers shows (now that I can be
> confident I have got the offsets correct).

Last two signals received before core dump below:

stack depth : 197952
retn. depth : 200000
parent usp  : 0xef933eb8
signal stack overwrote parent usp!
frame end   : 0xef933f1c
frame start : 0xef933bf8
handler usp : 0xef933be0
signal usp  : 0xef933ea8
signal pc   : 0xc009f37a

signal stack: 0x80004050
signal usp  : 0xef933ea8
signal pc   : 0xc009f37a
signal f.d1 : 0x0
signal f.d2 : 0x0
signal f.d3 : 0x0
signal f.d4 : 0x0
signal f.d5 : 0x0
signal f.a0 : 0x0
signal f.a1 : 0x0
signal f.a2 : 0x0
signal f.d0 : 0x0
signal f.od0: 0x0
signal f.sad: 0x0
signal f.sr : 0x0
signal f.pc : 0x0
signal fmtv : 0x80
signal a2   : 0x91929394
signal a3   : 0xa1a2a3a4
signal a4   : 0xb1b2b3b4
signal a5   : 0xc0104e0c
signal d2   : 0xd1d2d3d4
signal d3   : 0xe1e2e3e4
signal d4   : 0xf1f2f3f4

stack depth : 200000
retn. depth : 193942
parent usp  : 0xef921edc
signal stack overwrote parent usp!
frame end   : 0xef95733c
frame start : 0xef957018
handler usp : 0xef957000
signal usp  : 0xef9572c4
signal pc   : 0x8000073a

signal stack: 0x80004050
signal usp  : 0xef9572c4
signal pc   : 0x8000073a
signal f.d1 : 0xa1a2a3a4
signal f.d2 : 0xb1b2b3b4
signal f.d3 : 0xc1c2c3c4
signal f.d4 : 0xef957250
signal f.d5 : 0x80000722
signal f.a0 : 0xd1d2d3d4
signal f.a1 : 0xe1e2e3e4
signal f.a2 : 0xf1f2f3f4
signal f.d0 : 0x91929394
signal f.od0: 0xa1a2a3a4
signal f.sad: 0xb1b2b3b4
signal f.sr : 0xc1c2c3c4
signal f.pc : 0xef957274
signal fmtv : 0x114
signal a2   : 0x91929394
signal a3   : 0xa1a2a3a4
signal a4   : 0xb1b2b3b4
signal a5   : 0xc1c2c3c4
signal d2   : 0xd1d2d3d4
signal d3   : 0xe1e2e3e4
signal d4   : 0xf1f2f3f4

Illegal instruction (core dumped)

What I thought would hold the copies of pt_regs and switch_stack remains 
empty while on the way down the stack, and is filled with saved 
registers when on the way back up.

The registers as saved on exception, and copied to the mcontext struct, 
are correct in all cases, except for a5 which often contains 0xc0104e0c. 
Whenever that happens, a trap exception did get us into kernel mode. On 
both page faults and interrupts, a5 is as stored there (0xc1c2c3c4).

usp stored in the signal frame (i.e. usp when the signal was taken) is 
0x10 below that saved at the start of rec(). That's not enough to store 
7 registers plus return pc...

I still seem to have the sigframe end address wrong - it's larger than 
both parent usp and usp stored in the sigframe.

Still baffled.

Cheers,

	Michael
