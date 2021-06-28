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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8826CC11F64
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 22:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 698F261CA3
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 22:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbhF1WSg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 18:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbhF1WSc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 18:18:32 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4F3C061574
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 15:16:05 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cx9-20020a17090afd89b0290170a3e085edso1111540pjb.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KRIrgvuAXO/IG0grXiv1+a2lZ0EsIhj2Su/BshphfTE=;
        b=A0UTEK8ODfeUc3qhDk07dZhlU8aWHcOWm6cANOSLd2ynQ4i86INaZMm7R5wjX5CFGI
         SEXucHIVmAJGLTFFQZEyl3a6Xxa3zas9UK18UQrZvSZy1+gE97iuMA8zdDy9bamzbSVZ
         1iH6c8+pAoGP4T1/m9hmvwiGVJdCg2/8jSxsdJPksQjxolZ5bP5HI1Ac3i531iVRkoTN
         s9Pe5FwM4YKQAVIWKBUKD4KLDNaMFymUeWvwnFmNI5SwWSQU9Lue/KnWSrf2Igd2+PMG
         SSzKXZNmOD20XSVt0dSFF3Lg9ycaW6TbjseIg7JfbcldEvNH3ymQ9xjW0SVGiTXoODcy
         lGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KRIrgvuAXO/IG0grXiv1+a2lZ0EsIhj2Su/BshphfTE=;
        b=oWTVqn+v9KLgAnjz3rdtl979opBxyBIjB2cFR1uA52oI+QTnEjjv6c7tfgdsKYBV/X
         o7SdfLI4iGj1D5RZXfn3QL0KIe6+/QM4HFTpBFYN+lCqEIkQVLYnOkT4oHk6yHRD+roD
         c+Hcjh0sq6rFG0uRGJchdmrL19Uo2nIeSW6DebpBY0sy0MJk8gYF+F04tGwlm5+52J8v
         06bb+uJH8yNVPpJqeBh/cnz8NovvqC8yKOGQkdIWfZtW1iVzI4c8Lgy2ATTqjjA6FGe5
         K6EsAdFv4n6RZMXYdc+eYln43XpTl+95VpiRjnWifeEVjPNWJwXJ/zxsPV0oiZEJ0CIO
         N0UQ==
X-Gm-Message-State: AOAM531kcpk0yMeqXGmRFpt9HBTLhJHlvetYkecOPwePRObvwTa8FoWu
        OgMmqB1K9ofPfG3AYusMFCT8vkHB2nj0aA==
X-Google-Smtp-Source: ABdhPJzpKWb2LCHLh8RkMMIk1jN3oi2zZNWZ3wpCUCQpV+ONo7Zd5JDP2OS8MP4snXrB/q2rVNm3ew==
X-Received: by 2002:a17:902:ed82:b029:ef:48c8:128e with SMTP id e2-20020a170902ed82b02900ef48c8128emr24860386plj.72.1624918565313;
        Mon, 28 Jun 2021 15:16:05 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:1c9b:7d7f:b312:1fae? ([2001:df0:0:200c:1c9b:7d7f:b312:1fae])
        by smtp.gmail.com with ESMTPSA id m21sm529846pjz.57.2021.06.28.15.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 15:16:04 -0700 (PDT)
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
Message-ID: <aeac601a-a6ff-678b-83dc-48dacb430ec3@gmail.com>
Date:   Tue, 29 Jun 2021 10:16:00 +1200
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
> b
> Thanks for your patch!
>
>>   arch/m68k/kernel/entry.S  |  8 +++++---
> We need similar changes to arch/m68k/68000/entry.S and
> arch/m68k/coldfire/entry.S

Do you have a current defconfig for 68000? I've test compiled my patch 
with two coldfire defconfigs, but could not find one for m68kclassic ...

Cheers,

     Michael


>
>>   arch/m68k/kernel/ptrace.c | 17 -----------------
>>   2 files changed, 5 insertions(+), 20 deletions(-)
> Gr{oetje,eeting}s,
>
>                          Geert
>
