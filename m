Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0045DC11F64
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 20:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEE3461CCE
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 20:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237489AbhF1Uyn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 16:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235419AbhF1Uym (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 16:54:42 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A682C061574
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 13:52:15 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m2so16518794pgk.7
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=x5Zi7dAtXUvnZ3x6wu7H8NNO4M9lBujT87aea9ISBC4=;
        b=Jumg9GmvEA5DoBs+ObcGI98AWiz/mT4LU73xINK9Rg2YoR5oYTDfyxOPjwxJq6ZJfm
         8eKroqqeD9K7puQyVAh5x/dG4o0/0eM4S23EZcAQBakiUFfdy61CMcAYmltXxWtL+X/O
         lPwvouteKJ4QZPwafl6W5Fs3fphn5hage5bOFoOD7JExi1jFg5+n8KqAr832WYnEjiJE
         3DkfMdjiuOHThbn8YXEVNUDZ+yH50gVD8ShND9Q3viE9d3b5bYTkQtsFem7++KBAXGwm
         fZK7Vnk7rFmqtybw54GmmwYU5WJ2c/VjXL2eTEIlqdRrZjMZ8CBbf1zi6ln7qY0ZYQgG
         TwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=x5Zi7dAtXUvnZ3x6wu7H8NNO4M9lBujT87aea9ISBC4=;
        b=EDAnVtg4cWWUMVqShUruCz/WrHvGR8G+cB0TCxoGMAx6YN+0/g95lOQ+U/hseNjoUh
         RiSI/8+L341mBV1tnzUA3u2DEEUPqFrjFI/AR81i+kkHzpOHXfLybR91D3gyFnxqmwxk
         oOv9GfEsfL7S5vsyIEqctkPs/kS8KqIEIluwQLHZZ+GPQoynq4cSMH9zgyI1RfW3uqru
         dLq0soTosPQ4B5qZ2DSxyKEBdl9ptwL2AD2dNp66noGXW6F7K2lwe76uP3aJiaA/cAvd
         iW9C01bhNt4TIlS10Zycjq/8nWG0UfkLjGFmJTLylwNxT17quo0amO+B4Q99e8LcAhF8
         sENw==
X-Gm-Message-State: AOAM5302wQTbAHzw0EPPHTnM8tcfE6HxThEuqs41tz45E85/iEQ5Uogx
        8zntB8v/TjJE2MUjl4kzSedUB+4FvNnjGA==
X-Google-Smtp-Source: ABdhPJw+71a0K3+BDvmyG3l5c/R7ySI9H1sOQdSRufDuzD5sB29Upy/B8w2uEZadyxYsjj2MO/J16A==
X-Received: by 2002:a63:f914:: with SMTP id h20mr786846pgi.209.1624913535208;
        Mon, 28 Jun 2021 13:52:15 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:1c9b:7d7f:b312:1fae? ([2001:df0:0:200c:1c9b:7d7f:b312:1fae])
        by smtp.gmail.com with ESMTPSA id g141sm14983090pfb.210.2021.06.28.13.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 13:52:14 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] m68k/kernel - wire up syscall_trace_enter/leave
 for m68k
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
 <1624495560-6351-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWoX=6Yf7MZXR92Q3APYixY5MDM6MW_UUf0DO2+oDkHAQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <26739f56-603d-68ce-43eb-d1dc3b122323@gmail.com>
Date:   Tue, 29 Jun 2021 08:52:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWoX=6Yf7MZXR92Q3APYixY5MDM6MW_UUf0DO2+oDkHAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 28/06/21 7:25 pm, Geert Uytterhoeven wrote:
> On Thu, Jun 24, 2021 at 2:46 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> m68k (other than Coldfire) uses syscall_trace for both trace entry
>> and trace exit. Seccomp support requires separate entry points for
>> trace entry and exit which are already provided for Coldfire.
>>
>> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
>> in preparation for seccomp support. Check return code of
>> syscall_trace_enter(), and skip syscall if -1. Return code will be
>> left at what had been set by ptrace or seccomp (in regs->d0).
>>
>> No regression seen in testing with strace on ARAnyM.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Thanks for your patch!
>
>>   arch/m68k/kernel/entry.S  |  8 +++++---
> We need similar changes to arch/m68k/68000/entry.S and
> arch/m68k/coldfire/entry.S
>
Ouch - I misparsed the #endif right above ENTRY(syscall) and thought the 
syscall trace entry code was common for all.

Will fix ... but that will have to be tested by someone else!

Cheers,

     Michael

>>   arch/m68k/kernel/ptrace.c | 17 -----------------
>>   2 files changed, 5 insertions(+), 20 deletions(-)
> Gr{oetje,eeting}s,
>
>                          Geert
>
