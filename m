Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8B2C433B4
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 07:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9CE560FF0
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 07:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbhDLHo7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:44:59 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:44990 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236808AbhDLHo7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Apr 2021 03:44:59 -0400
Received: by mail-ua1-f41.google.com with SMTP id q18so3939601uas.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Apr 2021 00:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JXZ2evZ1HlMgd5dQiMnzV28T68ypmIxoPU4uM5YLJDY=;
        b=FM4k9Rrs4QzjwggIpRGo0zGO9FJid6n/0mDTKA2wymoDZErWVmvIIwwzd5e3l7eMCB
         mHb4gf2oDxzGtTUBj9w6Re6BocKBurq9lfaSq79eVs3RaQVsjX7X1FMzpGpcsFlETLyJ
         FpzIRJY47UQwQZXbb5F4OyqJ70HlrNO4JlBR/D95hbLM3TSeAwCihUt5AyXIFnuahCLs
         CyAPGCaqET8/QT1AMgvGubl884HsihYRZ3sx2xyG6NQVy9rUciTCDIuGIAKbilAxRlqK
         2PDUnjqgn8hk/hGfuh/Eo/NWP61Io2nEhOBpFdTKNGeRJpDvA2Euey8/ErhCzgMXua2D
         9eHQ==
X-Gm-Message-State: AOAM531THZsJ3H9cLwX51vMxbhEWVQ9VOxKlQqkhzT+2u3Lz3lDev968
        C/4ydvD2yTG+bEanb4hbflBkeHy4HKSlXpL3qIE=
X-Google-Smtp-Source: ABdhPJx+WwlU+f/sxyzlKoozSp4V5pjbJlg2tOYyn632dPGmXpWO0oMiT+z+uxKe9nNXFSbUevs6IBKhAohcjgM8HOo=
X-Received: by 2002:a9f:262c:: with SMTP id 41mr8642842uag.4.1618213481107;
 Mon, 12 Apr 2021 00:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org>
In-Reply-To: <20210411135532.219797-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 09:44:29 +0200
Message-ID: <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use ?= to assign CROSS_COMPILE by arch-Makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@synopsys.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Yamada-san,

On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> when CROSS_COMPILE is undefined.
>
> This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> conditional.
>
> This slightly changes the behavior; the arch-Makefile previously
> overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> via an environment variable as in 'export CROSS_COMPILE='.
>
> With this commit, arch-Makefle will respect the user's environment
> set-up, which seems to be a more correct behavior.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for your patch!

> ---
>
>  arch/arc/Makefile    | 4 +---
>  arch/h8300/Makefile  | 4 +---
>  arch/m68k/Makefile   | 4 +---
>  arch/mips/Makefile   | 4 +---
>  arch/parisc/Makefile | 6 ++----
>  arch/sh/Makefile     | 4 +---

What about arch/xtensa/Makefile?

> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -17,10 +17,8 @@
>  KBUILD_DEFCONFIG := multi_defconfig
>
>  ifneq ($(SUBARCH),$(ARCH))
> -       ifeq ($(CROSS_COMPILE),)
> -               CROSS_COMPILE := $(call cc-cross-prefix, \
> +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
>                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> -       endif
>  endif

This does not seem to work as expected: my standard build scripts
(using "make ARCH=m68k") no longer pick up the cross-compiler,
but fall back to the native compiler, thus breaking the build.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
