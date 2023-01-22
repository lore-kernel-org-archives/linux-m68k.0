Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D654DC38142
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 18:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjAVSML (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 13:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjAVSMK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2023 13:12:10 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35561C668
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 10:12:05 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id jm10so9406077plb.13
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 10:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKHgkRxZoDD0S3NaY1Ne/O4BEK/KhfsWRugv7WLGsec=;
        b=EHRkt1lsW/qaCaAg/j4LcAGKsQMguk2Xb+67e2vNFlaiNA650X6ZdYuI/QZuyItveB
         8Udl1SxWW6Xxo6R5F5DOmI+MpXIZtCYyzjcyP29j0bSv2/TlzsuzwWAgW7k5OLTxicAr
         eEumJL5q9t14kK6doJJ6B5B9axBnTIeorU+sHWxpvJfYjqC6h8jA4Nhn8asrpHNVyogv
         2p4an+0ffys/3bPn+luhVTHZqv1wYJy43c/TawvDvSVcLzAphrYx7SWwaXrWpa5YpIWr
         W7LJWE1Q3YX0fEGUeSNz84+O8wj4AmmPVQvhkDCWW2u4vsd+Dzr3KfgrEXuQi9iKYYHv
         o+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKHgkRxZoDD0S3NaY1Ne/O4BEK/KhfsWRugv7WLGsec=;
        b=Sz4g0hclGCtyPKYnEwsd9k5xCugJvJWJVJddq+XpC11ni481q606jJMlHWMW+7F9/1
         Mv671SDWXmqPUwxRt19OioLzIFQmv1Tac809x6y41JlBTa4HScr+ixMsIow8NqXd9VgN
         Dc7rZy/gKTQbpgxo3ssCfQHDdvRNYcr/kR3iueNmbCEJX3AChGNEfu32R7M2JCqBwm2n
         pY8gAl27acWlAksg/dDJx9NkoLWl78tqAB1XNgICwxhOUvPje9fgpbrulTmxGyi90Vgc
         dNwJW0V1WH2NMtWUm8O7U64UUMtytC50byj+4nFcEJ5Jq7t1xeJ5j0KkN4KXJ6q+uzsn
         1L5A==
X-Gm-Message-State: AFqh2kqkmICQVVPgZOD2kANnvIsspU4UJxHuv9xsRwu4BJBlRZTRiFrV
        R9WQiBzOQ9pCnc20dafvg4s9k14whds=
X-Google-Smtp-Source: AMrXdXvV42avTmJA4MltACMRgApeub1d9GGHaUpCATIh+0MVjZRYcNFOsLzIH4W1/zbMEsuQ98883Q==
X-Received: by 2002:a17:902:8486:b0:189:e3d0:2682 with SMTP id c6-20020a170902848600b00189e3d02682mr22809106plo.30.1674411124632;
        Sun, 22 Jan 2023 10:12:04 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:34d5:35c:640e:fbac? ([2001:df0:0:200c:34d5:35c:640e:fbac])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm18207493pll.25.2023.01.22.10.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 10:12:04 -0800 (PST)
Message-ID: <27f3da39-ed14-33ac-ebba-4e8291b23d7e@gmail.com>
Date:   Mon, 23 Jan 2023 07:11:59 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v13 2/3] m68k: add kernel seccomp support
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, glaubitz@physik.fu-berlin.de
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <20230112035529.13521-3-schmitzmic@gmail.com>
 <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks Geert,

On 23/01/23 05:37, Geert Uytterhoeven wrote:
> On Thu, Jan 12, 2023 at 4:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
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
>> seccomp_bpf self test on ARAnyM passes 63 out of 89 tests.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.3 branch.
>
>> --- a/arch/m68k/include/asm/syscall.h
>> +++ b/arch/m68k/include/asm/syscall.h
>> +static inline void syscall_set_return_value(struct task_struct *task,
>> +                                           struct pt_regs *regs,
>> +                                           int error, long val)
>> +{
>> +       regs->d0 = (long) error ? error : val;
> I'll change this to "(long)error ?: val" while applying.

Sure - could you also update the commit message that I forgot to change? 
It's 81 out of 94 tests now.

Many thanks also to Adrian for his libseccomp port work!

Cheers,

     Michael


>> +}
>> +
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
