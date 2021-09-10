Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10413C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Sep 2021 00:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB0C2610C8
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Sep 2021 00:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbhIJAF7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Sep 2021 20:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhIJAF6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Sep 2021 20:05:58 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB36C061574
        for <linux-m68k@vger.kernel.org>; Thu,  9 Sep 2021 17:04:48 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso204023pjq.4
        for <linux-m68k@vger.kernel.org>; Thu, 09 Sep 2021 17:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=54g6Yuw2LRwN3qZuK4pZ4jWZY0olPiSXUlSUWCWuLp4=;
        b=TLvAPcuqWEzjvz5r41bVU6iRkRHm5WWglZxF3lCoydKr+ZZwNZIEGTSOYqTMzeC/sV
         dWvigicd9DK8AJp9nr9amPKqkJIIYQtuUSulWzbl3it9UQkSQ9qLU27B6z2Tm9GCDEzF
         Ejat5LwKEfC44/nh4dSPCUUUnj+4S7bPdBGPHZq5XYSUMSMM7pFuvErIxTtiZKfIc/5I
         An79VWo31ShndRT24SSAJbfRVYYCCKo6eka/UotzKh8THbjv0UYYRIb42AQ4hnZRs6+2
         QccK67/8q7HIKnopQ3npcKH8uwmGh/LzGcV0pPF4SuZtn3E8sL2ry6YwEHT/bk/fI7+S
         +vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=54g6Yuw2LRwN3qZuK4pZ4jWZY0olPiSXUlSUWCWuLp4=;
        b=GMqLC7r4eSmx1SRdKwZgL012vOT5aNjJ4Q5kBYazvIA0pgUuyoLEQMhTgfdMxORZjl
         zs43OiSXO08U468ZHF/I3fu4kB3t6QH6vEeVA2KSHaCBW8sPPKHoCNVNmTOkm+dl2r8T
         UB49mTjB3Wg+voyQ//yj3vwcU9yTVq9NcpsehRgSVh9f8R7uYBSzERqKCXxCWFVLvE3t
         k9SiHV0QpKkA3uunbnVkMCEDIM8sIXSIF0b8+9CenNeHE956/XUkrg9cd2+msodx+9jz
         VWDrh1vHF8RBR2rpyit5g8ytrgwNtSM+AWMuUxj+otKd7NKmqxcutSeikXHK170HsGoD
         ruDQ==
X-Gm-Message-State: AOAM5318AUaWTX0o0ZVyvabMLuxcx7EVAwOoaieJKwnoodZ0aBU/1Buo
        wFo2eDqky3ag6Yd3bbo0IHo8q6icaVI=
X-Google-Smtp-Source: ABdhPJwtiZG0SVAUFOV4n1Mqa1LUL12YeL8J2WagGL9Az4uXHf+tv2y3oU3KjbRLnRZLTjgRVYDSNQ==
X-Received: by 2002:a17:90a:6507:: with SMTP id i7mr6393698pjj.205.1631232287961;
        Thu, 09 Sep 2021 17:04:47 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id r5sm2998287pjd.13.2021.09.09.17.04.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Sep 2021 17:04:47 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org>
 <20210816075155.GA29187@lst.de>
 <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com>
 <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org>
 <dc594142-e459-533e-cac2-c7a213cec464@gmail.com>
 <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com>
 <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com>
 <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
 <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
 <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
Date:   Fri, 10 Sep 2021 12:03:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 10/09/21 10:51, Finn Thain wrote:
> On Wed, 8 Sep 2021, Michael Schmitz wrote:
>
>>
>> In a related case, I've managed to swap my 'resume_userspace' format
>> error for a nice 'illegal instruction' format error apparently caused by
>> an invalid function pointer in __handle_irq_event_percpu(), just by
>> disabling all interrupts upon entering the auto_inthandler and
>> user_inthandler exception handlers. This bug is quite readily reproduced
>> by running your kernel_coverage.sh script in a loop (panics on the first
>> stress test on the second pass):
>>
>> Stress run 2
>> Logging to stress-ng-20210908-0838.log
>> ./kernel-coverage.sh: line 272: lcov: command not found
>> running --fork 1 --fork-vm -t 60 --timestamp --no-rand-seed --times
>> stress-ng: 08:40:08.70 info:  [1914] setting to a 60 second run per stressor
>> stress-ng: 08:40:08.82 info:  [1914] dispatching hogs: 1 fork
>> packet_write_wait: Connection to 10.1.1.4 port 22: Broken pipe
>>
>> Why disabling interrupts during interrupt processing would make matters
>> worse doesn't make any sense to me...
>>
>
> Are you able to reproduce that with a stock mainline build?

I still need to try that. The kernel panic went away when adding 
additional local_irq_save()/local_irq_restore() in do_IRQ(), which 
should done have nothing except slightly increase code size. Now trying 
to find out whether interrupts are reenabled any time during interrupt 
processing ...

Cheers,

	Michael


