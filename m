Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86682C77B60
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 20:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjDWUTW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 16:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjDWUTW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 16:19:22 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284FCE6F
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 13:19:21 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a6c5acf6ccso29690805ad.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682281160; x=1684873160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5SSEeGFE1RmrJQOIaPTqZRkcsjSMA0BjtFlJYkpjIE=;
        b=HdFDYuCKY6CEleqJpCNtUWy9wTZXxNuCUMeMf6b9EPVtl7v7dM/Xkwn/0Iv5hc9e5x
         I0kcWaYoxL2tb4oYFZsswROj8suvI4zOptGMsGMs3SOue1c5E+LzwU45sqjCdfwPhIEZ
         lXuOS8M5lZCffYRYr6/Vpu/ygAHy0DPrqRxmu5PR99IZh+tUxHe6NayW4e3gVlx0E+jW
         dJwybr9qbkQHY71jXyAiM3SUsCkZUselZwcnUxDcDT4MhqoltiyyX/oP9oSXop67ZCXE
         udhjnHf1n/pdJNpj2VY3JFAQzhN2fbrwXz58vjyLBuIPQEG/wgiyYjxQQmsMmYWyVi53
         ACoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682281160; x=1684873160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5SSEeGFE1RmrJQOIaPTqZRkcsjSMA0BjtFlJYkpjIE=;
        b=iXtQvBkYjcT2ZR7P8UtrGJoNV6o5q30ktQjPuiKQHFTwZb2xj8ITzPq+nrVt3EepqB
         Ow8WV07p+U1/4Aggv4soee2zpZ0nnkJ6m9ogtYZ3DMV9AuPjhPYKnNuL9YDg+dMboWiY
         fCCvfZ5k/y9a8l4lHC8a3CEl1AHUv6m5dHNEIiQT+zux56V62NFPw5SXO9Gw5YLVhKn0
         g692bTiRj5fB4ZG1kG7TZSNbsPD0KZfGuy1ihrxRaDhp15w3VCwlXYylyw/CEUN57rD1
         0T9WnPCXjR1RCpXc4NgeYPHv+Esq60vOyVDYzNTf8lPBTgeuEK6hNAX7b3MKn6+gdSY8
         9Bmw==
X-Gm-Message-State: AAQBX9es6B4AG7968RnmmRuEK7uLaWGBPIb2yR1Wmj9dFnReI570AeD1
        lZfQmBTRCjVnPR5vNVcku4I=
X-Google-Smtp-Source: AKy350ah/PRjhFgrK9o+xZZNAg3GxGqDQURU54IEvhQuKf3o/8/B+QwXATlGRb0FogBV/7SHLdrnrQ==
X-Received: by 2002:a17:903:1112:b0:1a5:1e7:86d7 with SMTP id n18-20020a170903111200b001a501e786d7mr14351835plh.52.1682281160556;
        Sun, 23 Apr 2023 13:19:20 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:7d4f:891d:86e0:1e1c? ([2001:df0:0:200c:7d4f:891d:86e0:1e1c])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902b20400b001a96496f250sm1758594plr.34.2023.04.23.13.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 13:19:20 -0700 (PDT)
Message-ID: <53153bec-90a9-a617-d3af-fe98d8d54632@gmail.com>
Date:   Mon, 24 Apr 2023 08:19:15 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: reliable reproducer, was Re: core dump analysis
Content-Language: en-US
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
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
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <87y1mj0zxd.fsf@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 23/04/23 20:23, Andreas Schwab wrote:
> On Apr 23 2023, Michael Schmitz wrote:
>
>> Wasn't too hard actually. The signo parameter passed to the handler turns
>> out to be passed by reference, and signo is located 4 bytes into the
>> kernel sigframe.
> That's not "passed by reference".  Function arguments are always passed
> on the stack.

You're right of course, I should have phrased that different.

signo is passed by value as the first argument on the stack, but I can 
take a reference to signo to find it's address on the stack. That in 
turn will tell me the address of the complete signal frame on the stack.

This works because at the time the handler is entered, the stack points 
to the return address which has been set up by setup_frame, and that's 
the first longword in struct sigframe (frame.pretcode; points to 
frame.retcode which holds the trampoline code that will call 
sys_sigreturn upon exit from the handler). This in turn works because 
usp is loaded with the address of the sigframe right before calling the 
handler.

In effect, at least indirectly the signal handler receives all two 
arguments that matter (signo and sigcontext) even though sigcontext is 
not explicitly passed on the stack (the third longword is frame.code 
which holds the vector number AFAICS). Not sure what third argument you 
referred to in another mail.

With the rt_sigframe, pointers to siginfo and ucontext are stored after 
signo so no stack arithmetics is needed there to access all three 
arguments.

Anyway, the whole point of the exercise was to see whether I can peek at 
the registers in the signal frame and their saved copies on the stack, 
to perhaps spot when the stack corruption begins to happen. I know - 
should have used a debugger in the first place instead instrumenting a 
test case.

Cheers,

     Michael



