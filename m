Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE442C4743C
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 08:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C80E361164
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 08:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhFWIgU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 04:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhFWIgS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 04:36:18 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A493FC061574
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 01:34:00 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id a2so1155114pgi.6
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=L/3a8CLXh2oRWkaeQA/G8ySraa+QGGoy4OWmTjpkSkc=;
        b=FYa/tn9orNW/ss61r8y3qmaz+wTWW9aACAmWita3VDQZJ4tUuEcPPuZw4OSNG8pwcn
         ecm0EYk+iKHMIjFDNd1A1Nx/1QaWc1/FgSwQDZ3n2+vNMh6rwt3Hy99jZxHUCvuL4Yw9
         rRUABJnvR05xTuazBk+khjs/7hD2F/fr/8a5c+Ixiv7NtAcdaixsAjp3vmrycfS9Kmf9
         Pezlk76aefnQr8h1LwT7sjo3dB+PhRfN5KrqE/mmSDy88M3FNsSpUUccVXEKu/e8CjNs
         x+CmPufgad9BynIIWPar3Hx+ZJqeQq6pjlfRMF7KDgZUWSBV4+vreUSKcmb+jCZ9MEdq
         C7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=L/3a8CLXh2oRWkaeQA/G8ySraa+QGGoy4OWmTjpkSkc=;
        b=lzvaWI8St7+350bpUdsfXy9lWvSPepiLCb1C7qH+ZW9Z2B8X35G/dMCCzQin7a8gJ1
         Y4yw6cj6j000jsE0YMZNqdD/RgqnzA19QS2tar5MqY82+R6ZKATgmSX8oxaqsDE2OWG2
         Xc9dRu5/cJ+eNE4ltK7VodmgFd3zItASYOx9CQrL2PtoN8uCb4nYBo7xm+h8RJc8oni6
         4O4mrPytHq80i3oqYH0gV/SXqHeV68zglrvyxUgCuDQL1ZSTwpa84YcWbURDK52rpkFH
         DzfYZFqsk+GByqOEKOZpNRSM3OHa9KDC4VfaL1AATP5clt9XkdJFkrt7wXMURgeItTKg
         oCsQ==
X-Gm-Message-State: AOAM533lQzbLiEjDzbdTSIc44WFegGGjovAEGWTFk8r/RvAysmBaXsZ9
        yT1qvqBW4pXK5v3q9fJFhMtEy45HBoAASQ==
X-Google-Smtp-Source: ABdhPJwg71sbNV3MspOQChwNHYuozlgJy0oUnT+gVaS4678D3MFWkywwW7VxISB0jw6DRqvmyDcIZA==
X-Received: by 2002:a63:4842:: with SMTP id x2mr2930874pgk.288.1624437240210;
        Wed, 23 Jun 2021 01:34:00 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id m16sm1667818pfk.192.2021.06.23.01.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jun 2021 01:33:59 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdV+CCcUWYTOs3J+wKsgXD=G0u3_5aP1RcPz1p2tviKreA@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4d470df2-b84f-7b32-ecfe-f4628092caed@gmail.com>
Date:   Wed, 23 Jun 2021 20:33:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV+CCcUWYTOs3J+wKsgXD=G0u3_5aP1RcPz1p2tviKreA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

thanks for reviewing this!

Am 23.06.2021 um 19:26 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Thu, Jun 17, 2021 at 7:39 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add secure_computing() call to syscall_trace_enter to actually
>> filter system calls.
>>
>> Add necessary arch Kconfig options, define TIF_SECCOMP trace
>> flag and provide basic seccomp filter support in asm/syscall.h
>>
>> syscall_get_nr currently uses the syscall nr stored in orig_d0
>> because we change d0 to a default return code before starting a
>> syscall trace. This may be inconsistent with syscall_rollback
>> copying orig_d0 to d0 (which we never check upon return from
>> trace). We use d0 for the return code from syscall_trace_enter
>> in entry.S currently, and could perhaps expand that to store
>> a new syscall number returned by the seccomp filter before
>> executing the syscall. This clearly needs some discussion.
>>
>> Compiles (for Atari) and boots on ARAnyM, otherwise untested.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Thanks for your patch!
>
>> --- a/arch/m68k/include/asm/syscall.h
>> +++ b/arch/m68k/include/asm/syscall.h
>> @@ -4,6 +4,39 @@
>>
>>  #include <uapi/linux/audit.h>
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
>> +       memcpy(args, &regs->d0 + 1, 5 * sizeof(args[0]));
>
> This doesn't look right to me: "&regs->d0 + 1" is "&regs->orig_d0"
> again, and there are no registers after that.
> Perhaps you meant "&regs->d1"?

Well spotted - that's a copy&paste error I didn't catch.

I'll look at the patch you referenced in the other mail later - Adrian 
was going to test my patch with his libseccomp version. If I can build a 
simple test case myself, all the better.

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
