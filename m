Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FDBC43216
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Jul 2021 11:54:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01C9F60EE6
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Jul 2021 11:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238222AbhG3LyM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 30 Jul 2021 07:54:12 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:46070 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238729AbhG3LyJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 30 Jul 2021 07:54:09 -0400
Received: by mail-vs1-f47.google.com with SMTP id u11so2818329vst.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Jul 2021 04:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10AbK6xK8RHobfuB2T0I9ydjpvpHcTKY9gPukwHCGGA=;
        b=kIsoeUxAhwKVttKLf4J9HDv6wcnCoN3OhxyWkI3KM217WQY6ZiFtOPB1l3EqlwbfR+
         zaIzQB6BAHwzEbq46rrAvO5IIDyWCnXf3lbPTHJ1J73JkMQtaOsI2ajcK1Cae4GEDeLA
         oVx7DE5ITf24onk3HDB28VmxPs6be2hy1E3iCzlyAHq9SLdL8TMT5+CTevsljCil/NyS
         l+HUVWCvGfaJ5w15bKzCmdeiPWvAbMjBAGwgIjuazim9aC9O7Pt1H/7Vx3q/StNrwDO5
         IOuJeG+MmkWVx9zuwAdrsTRPymZHRZcDkexzDlf+PuCkM80GzXjy5h0+/hoROz3Vudws
         Ouig==
X-Gm-Message-State: AOAM531TyZjwGgj85GrrQfGbcuK6DsYhdKBmFjji5PegV1cpTZue0U7/
        YntdzKkqfCELsJdOvB4xhaV4aeg+1XU2Efo8KZg=
X-Google-Smtp-Source: ABdhPJz4vdafBihdMrOKEMxBFoPjbpJQjxu69DET98mge7/3K8Au1C7Ct04O+Z9CWQAOZ0tklY4nnHzuyfbZq+wo9hQ=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr1030174vsf.40.1627646043462;
 Fri, 30 Jul 2021 04:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Jul 2021 13:53:52 +0200
Message-ID: <CAMuHMdXt4tYHcgPNUZ0ZQ9iKhmZ_dC=ub=Ha35xDy+jR2-CroQ@mail.gmail.com>
Subject: Re: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Randy Dunlap <rdunlap@infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 28, 2021 at 8:21 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
> supported.
>
> As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
> ("ide: remove the legacy ide driver"), there is no need to mention
> HAVE_IDE in all those arch-specific Kconfig files.
>
> The issue was identified with ./scripts/checkkconfigsymbols.py.
>
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

>  arch/m68k/Kconfig             | 1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
