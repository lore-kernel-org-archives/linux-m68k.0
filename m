Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B1AC25B4E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 16:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjAVQha (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 11:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjAVQh3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2023 11:37:29 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0838010249
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:37:29 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id x5so7988179qti.3
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30m9wXkH4G30lpZSOxEeIa4vd08y5AgMs/zFnqEB7ZA=;
        b=w/SH0filEbdR+L3mJiKH1BHGaaInDcykOfzfFhMLyVDM46CN5CNUfWeaaplCSHp8F2
         LCGMg94axSKOyktFVV98BrvtkhFV1q5J3188lY87KtipPsKJk61XJsnbqbtDnda7j7uk
         E1J/H+ZodHjWW/8lZ1av2gPvCgJp9XulLOY4+TL3oqyTfsga8EHVJP7LzDezP6IeOChF
         lKnHjjpuCR5TSEmD8WqL3VVMVvX7PTO1Uxk4CebefSjohzxebXY/zYWNsyzUZaEik97J
         kAEoU+6ZJScs6eZrKgfe9y/pbJx40FsaCZuvmAIoQ4qNvcJlPNkmw3Nkj3Z8UeUsbkCu
         qs9Q==
X-Gm-Message-State: AFqh2kr1lB2df83xgDQT7vfGxX5gGVIsn6ItuZlKaKoB2qTsv9yIWyno
        zL9nV9VBXSAbgNedMPxWz/NOAcLaj6QAzw==
X-Google-Smtp-Source: AMrXdXvtqNehyeHG4aZOU3yP0uB5g6ziydlMw5dkQ/NWufpGOA43GM9jGfqVogPkzxLDEkrmhZlUKw==
X-Received: by 2002:ac8:5ed6:0:b0:3ab:9974:3a06 with SMTP id s22-20020ac85ed6000000b003ab99743a06mr29145737qtx.38.1674405448029;
        Sun, 22 Jan 2023 08:37:28 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id b24-20020ac86798000000b0039cc944ebdasm23550385qtp.54.2023.01.22.08.37.27
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 08:37:27 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 123so12171525ybv.6
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:37:27 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr1711020ybo.543.1674405447482; Sun, 22
 Jan 2023 08:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20230112035529.13521-1-schmitzmic@gmail.com> <20230112035529.13521-3-schmitzmic@gmail.com>
In-Reply-To: <20230112035529.13521-3-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 22 Jan 2023 17:37:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com>
Message-ID: <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/3] m68k: add kernel seccomp support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 12, 2023 at 4:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add secure_computing() call to syscall_trace_enter to actually
> filter system calls.
>
> Add necessary arch Kconfig options, define TIF_SECCOMP trace
> flag and provide basic seccomp filter support in asm/syscall.h
>
> syscall_get_nr currently uses the syscall nr stored in orig_d0
> because we change d0 to a default return code before starting a
> syscall trace. This may be inconsistent with syscall_rollback
> copying orig_d0 to d0 (which we never check upon return from
> trace). We use d0 for the return code from syscall_trace_enter
> in entry.S currently, and could perhaps expand that to store
> a new syscall number returned by the seccomp filter before
> executing the syscall. This clearly needs some discussion.
>
> seccomp_bpf self test on ARAnyM passes 63 out of 89 tests.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.3 branch.

> --- a/arch/m68k/include/asm/syscall.h
> +++ b/arch/m68k/include/asm/syscall.h

> +static inline void syscall_set_return_value(struct task_struct *task,
> +                                           struct pt_regs *regs,
> +                                           int error, long val)
> +{
> +       regs->d0 = (long) error ? error : val;

I'll change this to "(long)error ?: val" while applying.

> +}
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
