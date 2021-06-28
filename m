Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D59BC11F64
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 20:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D14A361CCA
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 20:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbhF1UTy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 16:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbhF1UTx (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 16:19:53 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31EBC061574
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 13:17:27 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ce18-20020a17090aff12b0290170a3e3eb07so866757pjb.1
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nmQtlWPuX6vPzCmaAp0QXLNnsKe8ZNEDuDsbhPHNTN8=;
        b=O2PB/Pcfr+EFaVoP6EK2RZOx4HRzDgSXpFuAazlu7Au5Apc8AYDWh8rTMJlW3joaQW
         TF1BpvbVMiVqEdv1l8XK+Jl3uHGRRNOiwzDcv/imtQ54IbliNxyHC1T4tvKlBbjdU/Sw
         pOra7ZyzOjcMMK21BNIFd45wPQFeh2oA8qiAS8QYktOepTLKOArrNGemY4WN3dXdxcrO
         Jnl7imjUBhjJLGMGVZdhXgRqkeam8eqwu9TkR+Lz5HrZBL8HZP3KVe5ztKROHhpFVIjQ
         tLMkmEoJAJWoiBAhQg1Kpa1GFYhEcwEhDB7lDixmPo6W1EllbDJfDbmuNKHv18yRc1kL
         qYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nmQtlWPuX6vPzCmaAp0QXLNnsKe8ZNEDuDsbhPHNTN8=;
        b=HlzmUwU7R1Y9scWPuMZOPnxbZwxgCYxYqn+P+/Wc/1k8p5oeOaHKjKo9RabXyjCaDy
         vLwz/5T4VKiUF5wluM1oR6Fv8eMuT2JSqkqMY5pGTm+1uUdz3wsgwqsfKPDGrB3XeHf8
         IyvXTdWca9axVgzS1X+lhaTfRh6sGcsXaf7EtetfA7NuiUl5WMux4uXYcX8vrFBU280e
         CSOY2lrfDEc2Q4nv1GkujJjW1eiorTWyq8KUcCuQxk1gLbi5duUiP2QE+ViftCLqShCX
         CPnkBk00TNuJsYxQ4TUG4FM7cv5q982026XcWh+ubHQe7vPQm60kfMoVGO5E+2Ujrqct
         sJaQ==
X-Gm-Message-State: AOAM530GaN6G+mMKT+3VAkuXnVA59CkKU6w3o1jPdb8aZ/3pLTbA1eRU
        gw/gSZe7hIOCyR5GikOJqsE7KAwKjtp+cw==
X-Google-Smtp-Source: ABdhPJx3LusZjSx+jBBt7DWroNTl/9q1X0kxgSG68LeIk+pdg82rN8DcnFYA2bZGYCvC+xEUuWPAGg==
X-Received: by 2002:a17:90a:8c4:: with SMTP id 4mr38819896pjn.82.1624911447422;
        Mon, 28 Jun 2021 13:17:27 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:1c9b:7d7f:b312:1fae? ([2001:df0:0:200c:1c9b:7d7f:b312:1fae])
        by smtp.gmail.com with ESMTPSA id w8sm16584921pgf.81.2021.06.28.13.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 13:17:26 -0700 (PDT)
Subject: Re: [PATCH v6 2/2] m68k: add kernel seccomp support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
 <1624495560-6351-3-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWC9sLUdDpscdHAr--iWxKN=qm7Qq9Zu5VOOR9JTrvo0A@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <bc56cc50-3270-53d1-d40f-8f69fe1700d7@gmail.com>
Date:   Tue, 29 Jun 2021 08:17:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWC9sLUdDpscdHAr--iWxKN=qm7Qq9Zu5VOOR9JTrvo0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 28/06/21 7:23 pm, Geert Uytterhoeven wrote:
>
>> --- a/arch/m68k/include/asm/syscall.h
>> +++ b/arch/m68k/include/asm/syscall.h
>> @@ -4,6 +4,39 @@
>>
>>   #include <uapi/linux/audit.h>
>>
>> +#include <asm/unistd.h>
>> +
>> +extern const unsigned long sys_call_table[];
>> +
>> +static inline int syscall_get_nr(struct task_struct *task,
>> +                                struct pt_regs *regs)
>> +{
>> +       return regs->orig_d0;
>> +}
>> +
>> +static inline void syscall_rollback(struct task_struct *task,
>> +                                   struct pt_regs *regs)
>> +{
>> +       regs->d0 = regs->orig_d0;
>> +}
>> +
>> +static inline void syscall_set_return_value(struct task_struct *task,
>> +                                           struct pt_regs *regs,
>> +                                           int error, long val)
>> +{
>> +       regs->d0 = (long) error ? error : val;
>> +}
>> +
>> +static inline void syscall_get_arguments(struct task_struct *task,
>> +                                        struct pt_regs *regs,
>> +                                        unsigned long *args)
>> +{
>> +       args[0] = regs->orig_d0;
>> +       args++;
>> +
>> +       memcpy(args, &regs->d1, 5 * sizeof(args[0]));
>> +}
>> +
>>   static inline int syscall_get_arch(struct task_struct *task)
>>   {
>>          return AUDIT_ARCH_M68K;
> Comparing this to what I had before, I noticed syscall_get_return_value()
> is missing.
Yes - I only added the bare minimum I needed to compile.
> Upon closer look, we don't need it (yet), as we don't select any
> of GENERIC_ENTRY, HAVE_ARCH_TRACEHOOK, or HAVE_SYSCALL_TRACEPOINTS,
> but why not add it while we're at it?

I can do that - the trouble with this entire series is that I can't 
meaningfully test anything. But syscall_get_return_value() isn't that 
difficult.

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
