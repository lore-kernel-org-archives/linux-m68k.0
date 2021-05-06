Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF90C433ED
	for <linux-m68k@archiver.kernel.org>; Thu,  6 May 2021 07:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF6B60232
	for <linux-m68k@archiver.kernel.org>; Thu,  6 May 2021 07:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbhEFHUz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 6 May 2021 03:20:55 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:45819 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhEFHUy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 6 May 2021 03:20:54 -0400
Received: by mail-vs1-f48.google.com with SMTP id r18so2416531vso.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 May 2021 00:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNhCIMMz7EzD3Z1FLPhhrJxU/Pgtk8lSDeyYeHyvjnk=;
        b=MaUevxLFd+RXbKVabHoyQJbXGy3gyNDlGfugDAzAjb8A9Y+QMLr0mPdEgc6tU9j3Rg
         5/VE2oDGyMwbfkYjhhmA9Xl/uFOgpVDHq3FJsTprbhnqGXGKKEySKaeJhnPrPdyqe7kF
         tM4WcC75HE2SvMEyDV9i9uMtF5K3lX3MSkdYjNjesjYboV+HQDmIL4vrJ/CflxxswWsJ
         tXJUrf8VFs7gyfPX8dhzpGXG6Wn3cG8g/q+lpKwAN499i+AWfaiOv9pTi9gasnJditxZ
         idR4xKVpeMssh+VgIPY342b/YfNYu7BnBzlQyFukb0ohXObtaez4ERgjoYR1zIETcXBb
         32tg==
X-Gm-Message-State: AOAM533u6P82Dl6A8RtykzX6e1QE3y3b2YfqtcmWfj0tmpHGM1ZKLYSw
        ILT7n1n5XrI5zv/GMffUDPLn7Z0hk+punfy39Xc=
X-Google-Smtp-Source: ABdhPJzTeKFGFQqvUEjFf5Vbfbp5PKOUppqjU6DRC6fr+Pd7kUthXHrPr+geHxvbYr1zsn8WsIfhFueF7awWQJmholI=
X-Received: by 2002:a67:f25a:: with SMTP id y26mr2273655vsm.40.1620285596056;
 Thu, 06 May 2021 00:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <baa95d7235921dff23bed6320518f3fa90396603.1612681353.git.fthain@telegraphics.com.au>
In-Reply-To: <baa95d7235921dff23bed6320518f3fa90396603.1612681353.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 May 2021 09:19:44 +0200
Message-ID: <CAMuHMdVurQcwHcP7QnOrxLVuqUAnokJ-2R+11FOyG-htS9Fu9w@mail.gmail.com>
Subject: Re: [PATCH] m68k: Drop -fno-strength-reduce from KBUILD_CFLAGS
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Feb 7, 2021 at 8:08 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> This workaround became redundant either when the driver in question was
> removed (in Linux v2.6.23) or when the compiler flag became a no-op
> (in GCC v4.2). Linux has required GCC v4.6 or later since v4.19.
>
> Link: https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=efa1cdf01850b28c2f6f7035ebd4420259494615
> References: commit 565bae6a4a8f ("[SCSI] 53c7xx: kill driver")
> References: commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.14 branch.

> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -66,8 +66,7 @@ KBUILD_CFLAGS += $(cpuflags-y)
>  KBUILD_CFLAGS += -pipe -ffreestanding
>
>  ifdef CONFIG_MMU
> -# without -fno-strength-reduce the 53c7xx.c driver fails ;-(
> -KBUILD_CFLAGS += -fno-strength-reduce -ffixed-a2
> +KBUILD_CFLAGS += -ffixed-a2
>  else
>  # we can use a m68k-linux-gcc toolchain with these in place
>  KBUILD_CPPFLAGS += -DUTS_SYSNAME=\"uClinux\"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
