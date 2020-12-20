Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9467C4361B
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Dec 2020 14:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A193F22D58
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Dec 2020 14:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgLTO3K (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Dec 2020 09:29:10 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:35866 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbgLTO3J (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 20 Dec 2020 09:29:09 -0500
Received: by mail-ot1-f43.google.com with SMTP id d20so6599738otl.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 20 Dec 2020 06:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KF5+wP+7KlD78JIfhqBLESbVDiU8JmERcp1ag/IZslk=;
        b=obnw6J07lKhVY4TzyN2Bp55dAFgFBJNGBiVoyi2192+lFf9LqJ9C9uENKVh0UhsCmH
         cV08tFhxEOMV76r/+aE6E/NcXmqIWJlGaWvZZaQPlSaqlOQYvEkyAJMbHQ9Q3jzBAQoh
         +MvSWEPlwOHe0IS9INih2wYLFLUBBd9OSUvpbjiHDZIMDTfePQOguVGtKX2WXy0sm8FG
         /HdLeVtpSVsa3fdgUC/6SWiNXoKK0XJlccz76XVjVQmuDUWD3IC6sVCqMJMjcDfOf640
         6s8kFa1wTv8XxO6zIpJyah3/ARAkN5Yhnnx6lsOYCReHMlgOamovFibuvuoaljbW+k8C
         ThQQ==
X-Gm-Message-State: AOAM532oWOTRoESaPYx/Rq9Fdc4C4q9mPhp3uNDct8Rtftda+tXGq+R4
        tLSPE18DBUWLk/WWoy7xuyt9117/PGgJubN1SM4=
X-Google-Smtp-Source: ABdhPJzMK1uiaAN7IbtSoE6qYewgu28eYIxsdob3rWrrC4BIV5Q5HiKpvdwVtEf4WT6Q17Ycwzsh+IL/FcdurzDUWSQ=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr9021505ota.107.1608474508291;
 Sun, 20 Dec 2020 06:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20201220085141.1573113-1-geert@linux-m68k.org> <49a17a22-c657-8e26-6c84-36ef01264c5d@physik.fu-berlin.de>
In-Reply-To: <49a17a22-c657-8e26-6c84-36ef01264c5d@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 20 Dec 2020 15:28:17 +0100
Message-ID: <CAMuHMdUY5OY2s63AJE-EUVLGTM_z9st3iupQv_pWTt84tvN1hQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable seccomp architecture tracking
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Sun, Dec 20, 2020 at 12:24 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 12/20/20 9:51 AM, Geert Uytterhoeven wrote:
> > To enable seccomp constant action bitmaps, we need to have a static
> > mapping to the audit architecture and system call table size.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Needed for CONFIG_SECCOMP_CACHE_DEBUG.
> > Note that upstream doesn't have m68k seccomp support yet.
>
> Have we added SECCOMP support for m68k to the kernel yet?

No, but I have applied locally the patches floating on the list...

> It's actually something I was hoping to do over the holidays ;-).

Happy to hear that!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
