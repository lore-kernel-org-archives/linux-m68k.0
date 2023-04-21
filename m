Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5DCC7618E
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 01:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbjDUBpl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 21:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbjDUBpj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 21:45:39 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C689C1724
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 18:45:38 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a667067275so15526575ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 18:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682041538; x=1684633538;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GleC4j9uiQCq+vAD1FtWe7wiIw//hcZ/ooMSmKDdE1s=;
        b=a/4/Tfq57q1HlpIXC6KBskfcJVK09CDD8c+Cy6mWMpzWt2otH+TnmHS/1b4T9sx7Q6
         eIJs7pUgH0iGJ31luCZv76U0m4+Cq8qUTH3qMBHDgo52JDYDNLmrWS/1kP84gnijhqRQ
         EbBZVgstxU7vu9RePZ4GORw6CTeB7aQv4JmZraYZUBzlBFknoQUJsT3WtnqIZx87JFIJ
         gfEie+2zXPtY+QkxBEK6re5qglMRcBHZZ1aoF0BVyfTwK7rA1Q12Hn9AWGqZovxj+Tve
         nLeoYZwLD99D7aT7ld5Tr+vtCmTaQhgao9Z7MntOY6nRGCaUk3aBkjzrZKWFR8xjzZgq
         wCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682041538; x=1684633538;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GleC4j9uiQCq+vAD1FtWe7wiIw//hcZ/ooMSmKDdE1s=;
        b=V9baRoecPp6e/ICs98vBG1u8L0Qr2HrFJEA9ArXjou90B1BqLF6LZnUu8W595yabHk
         uLBHEjM22qMNQ3aFFvPe0tbYhHNcxjKBiB7U7ubkjE4bFDXeZkqcKiTF+eLoVfaVP4wp
         WV4JCOvreq1X/cAkjUQJEEowOmC/PJGKGOPvrIAx2wkH3wsQE/VHyDK0ylJNPZ/tued5
         5oyjslCPSS1xPnkz7CNSjIZUOncUnAUTsfx93jGowXCG/M2frNBpZOVzc07tbO0NjGDD
         0Jv33VXr/kz3ex5vpkJEpfTLi1bjotTfFQgZtbHBSNmKRXsEoLngQ49/j/x77j22+YXv
         x1Gw==
X-Gm-Message-State: AAQBX9cMn+SYS/68MXARV3NKNul30jUuE3C4CQVjry3/eu5HTaAm67Jm
        cpEzd0raXKGf1qv5vaJWZzs=
X-Google-Smtp-Source: AKy350Z51LrRBqpKPXs02w/TwoycMH9uAfEyGdwipJQBEKGXbv71cktLoF1wQ+0CqpTdwJa5FlCN2Q==
X-Received: by 2002:a17:903:234a:b0:1a6:413c:4a47 with SMTP id c10-20020a170903234a00b001a6413c4a47mr4976897plh.1.1682041538112;
        Thu, 20 Apr 2023 18:45:38 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:852f:30a1:4dd:b24b? ([2001:df0:0:200c:852f:30a1:4dd:b24b])
        by smtp.gmail.com with ESMTPSA id jn15-20020a170903050f00b001a945e7147asm199858plb.231.2023.04.20.18.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 18:45:37 -0700 (PDT)
Message-ID: <1e1a9bde-75a8-267a-8a48-266be55c36a8@gmail.com>
Date:   Fri, 21 Apr 2023 13:45:33 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: reliable reproducer, was Re: core dump analysis
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org,
        Stan Johnson <userm57@yahoo.com>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
In-Reply-To: <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

one more datapoint: using sigaltstack() to set up a separate signal 
stack in main() (code lifted straight from the sigaltstack man page) 
does avoid the stack corruption.

That might be useful as a workaround for dash, while we're analyzing 
this bug.

I wonder whether recursively growing the stack while taking signals on 
the same stack is meant to be safe. Need to look at usp inside the 
signal frame (i.e. at the time the program was preempted for signal 
delivery) and usp at the lowest recursion depth at the time of the 
signal handler running ...

Cheers,

     Michael


On 21/04/23 09:58, Michael Schmitz wrote:
> Hi Finn,
>
> On 20/04/23 20:55, Finn Thain wrote:
>>
>>> But in any case, it looks like we can eliminate the bus error code. 
>>> Same
>>> fault on both 030 and 040 with very different bus error handlers is
>>> highly unlikely.
>>>
>> There's no failure on '040. QEMU and Motorola '040 gave the same result.
>
> Sorry, my fault - I interpreted your mail as saying 030 and 040 gave 
> the same result.
>
> Back to the drawing board ... I've got kernel images back to 2.4.30 
> and 2.6.37 to try and test. I'm also trying with rt signals and 
> alternate signal stack (rt signals show the same behaviour).
>
> Cheers,
>
>     Michael
>
>
>
>
