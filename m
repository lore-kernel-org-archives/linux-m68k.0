Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F48C433B4
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 10:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2AE46100C
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 10:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhEJKRo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 May 2021 06:17:44 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:36575 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhEJKRa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 May 2021 06:17:30 -0400
Received: by mail-vs1-f52.google.com with SMTP id d13so1302937vso.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 May 2021 03:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sVvVN78+/ymEH+RZL6HvoVCZVksTZw7UVoQH006DAA8=;
        b=FJE4y8Zk+S2npu8pZtlcnPdpjLuPv9G7hEq2dDoFv+XliBSfTB3i3la5dZX1xUpLvh
         hWIhSTLQNYZuOD1Y4Ft0xZcdpv5RzmUP3CkXqD62UdqmR9NPHYot5SJ4s9x4Qq2qZ7B2
         5jPGxEI7Xb5p0B8BVNT9L0Bo2injU7xqNP4H8GCey2nI5NvtI7JSSz5gmtGa3LGjD2Mt
         1hZfzfBCDTovHeKYYPanwAQMxAY6YxseQtMFVD3MnZwI9JDk3bOn84xcE9JzTO2o/L6i
         hEQpBfQntz1JJtRXxY38lPZhiuH3NEagYIt1ni2YaRRhD+LZK3teDDlbhtTbN7EK6F4m
         lHnA==
X-Gm-Message-State: AOAM531+iDJwFfB528UznvJFQyAo/XhL5eRHAooNp+1R68MB3eP45mIS
        fKDCwTinsVad64O5N8rH71A6Ekl82gNlocy8EtQ=
X-Google-Smtp-Source: ABdhPJwCjZFq7knTQzQamMPg7B/M6YwpWZB1FCmai2ATFOyJJM+uqtP/4aHsoLXiIPOmyugP+gy2CWFKz8LbQiDSA/c=
X-Received: by 2002:a67:8745:: with SMTP id j66mr19115560vsd.18.1620641784321;
 Mon, 10 May 2021 03:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210507220813.365382-1-arnd@kernel.org> <20210507220813.365382-2-arnd@kernel.org>
In-Reply-To: <20210507220813.365382-2-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 May 2021 12:16:13 +0200
Message-ID: <CAMuHMdV1=mJzbr1cLwo-zUnThh9J8BmdW870dJCvp_Kft8kM2w@mail.gmail.com>
Subject: Re: [RFC 01/12] asm-generic: use asm-generic/unaligned.h for most architectures
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Michal Simek <monstr@monstr.eu>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Sat, May 8, 2021 at 12:09 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> There are several architectures that just duplicate the contents
> of asm-generic/unaligned.h, so change those over to use the
> file directly, to make future modifications easier.
>
> The exceptions are:
>
> - arm32 sets HAVE_EFFICIENT_UNALIGNED_ACCESS, but wants the
>   unaligned-struct version
>
> - ppc64le disables HAVE_EFFICIENT_UNALIGNED_ACCESS but includes
>   the access-ok version
>
> - m68k (non-dragonball) also uses the access-ok version without
>   setting HAVE_EFFICIENT_UNALIGNED_ACCESS.

This not only applies to dragonball, which has the CPU32 core, but also
to plain 68000, and any SoCs including the 68EC000 core.

It also applies to early Coldfire, but AFAIK Linux doesn't support these
(see dfe1d26d4a90287e ("m68knommu: Allow ColdFire CPUs to use unaligned
 accesses")).

 > - sh4a has a custom inline asm version
>
> - openrisc is the only one using the memmove version that
>   generally leads to worse code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/include/asm/unaligned.h       |  9 +-------

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
