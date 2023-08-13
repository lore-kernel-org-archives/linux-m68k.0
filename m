Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D058EB64DD
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 21:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjHMVUR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 17:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjHMVUP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 17:20:15 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B590610D0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 14:20:16 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc8045e09dso22734605ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691961616; x=1692566416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOqe8WxvZvPmvSl1bE9JoZA9yOUpzv6/FEpOlyhet8c=;
        b=om79k6ueLY0hOyCIn++KCMEFPqPjc5/IeoNlUL8rqTYX+VRvuV9TTuHtNyMLAo8KUI
         uXWk6Z+mpEdUuMwJmG783UepKfwjshpbLMt7mrsPdjDCFcgEigsxFNVcu7IeMZKbjuTP
         9NDB7nJWOHh2JC7SrjrB9ql+TqnCLKMQW9dgGlOWymuMq3HCB813d+yoCm9jZ5tWmo7b
         oO24C3YSeWE1nRDjWY5e7uNyeXu3KId5ACx23zKJ/+v+vFt4eoS2aAx2OofDuyKfjVXI
         r6VNpKs5Exymg0+hAOr97hoQ5s244YmMCw9j5WuQo2ePpdi1YB9mK0lp6KGIU5+uha3i
         SdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961616; x=1692566416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOqe8WxvZvPmvSl1bE9JoZA9yOUpzv6/FEpOlyhet8c=;
        b=iRi88E3WDK5W4O/KE0BaISL08zX+Actcr5HxDCToq1IdpI/Ni4Er6QU6pxnQ8AlhsD
         /doQqrSBXkVXFFg3uoz2k3MPqqzp8sy3CEHIgJQvGIEEi0e0jxTG/N6Fj1jLOuUam7N3
         a9KUF2krSjyzSvdExOMgLmMW/fiQoPZLn0YqTLhr/h2qie2oOicQLYHyJlvQ070Da7kW
         WSdcCYelFjKophJ98h6vfuOnb44lxsIQZID13C6gzluop8FCmxWZh9BPnrXNR6uvWNpf
         EP1HJ8WifYdCeiNNy0mpWFXCDcDg8Dcz62vv/bC2lHH4mUIx+8iHLkrfVJPpOfc+AhCQ
         dtqQ==
X-Gm-Message-State: AOJu0Yzdyy1EXHWYly+P1ALQgjotl/9Bv5NSUIA+m4tUq920D7jCEd3l
        JAQD6LOhtXzmvNoF52rW4yY=
X-Google-Smtp-Source: AGHT+IGvqOByuAfnCC0DDZS5T45k+iTb64H2nifGuqJRlr5diMGcFae6VKrieuYeXeZNjjjX9bE7Gw==
X-Received: by 2002:a17:903:11d0:b0:1bb:ee1b:3cdf with SMTP id q16-20020a17090311d000b001bbee1b3cdfmr6079932plh.67.1691961616050;
        Sun, 13 Aug 2023 14:20:16 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b18f:24ea:a609:d728? ([2001:df0:0:200c:b18f:24ea:a609:d728])
        by smtp.gmail.com with ESMTPSA id g14-20020a170902868e00b001b9dab0397bsm7806044plo.29.2023.08.13.14.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 14:20:15 -0700 (PDT)
Message-ID: <c7e196d9-56ba-1b3a-e0a0-0b358bba248e@gmail.com>
Date:   Mon, 14 Aug 2023 09:20:10 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>,
        William R Sowerbutts <will@sowerbutts.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 13/08/23 19:38, Finn Thain wrote:
>
>> Haven't seen anything yet, so I've just sent a patch switching
>> pata_falcon.c to use the IO resources instead of the memory resources.
> Thanks for sending that.
>
>> Survived compile and ARAnyM boot tests only so far. I've checked and
>> confirmed the entire 0xffxxxxx range is mapped transparent in head.S for
>> Q40 so I don't see what else might be missing.
>>
> In the message that Geert originally forwarded, William was quoted as
> saying it was necessary to "fix up the pata_falcon_data_xfer function". He
> also said that using the IO port resources "causes the ioread8/iowrite8
> functions to complain loudly".
> https://lore.kernel.org/linux-m68k/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com/
>
> I think your patch is taking the same approach and may run into the same
> issues... I guess we shall see when William tests it.

Not having seen William's patch, I can only speculate.

My patch differs from what William reported as changes, in that I'm not 
using ata_sff_std_ports(). I thought to have sidestepped the iomap issue 
that way, but perhaps not. I'll send a new version.

>
>> Please have a look and test if possible. Haven't yet bothered
>> linux-block or linux-ide... the patch still needs a Fixes: and other
>> trimmings so isn't ready for submission anyway.
>>
> Right. You'll want to run checkpatch.pl on it at some stage.

Sure.

Cheers,

     Michael



