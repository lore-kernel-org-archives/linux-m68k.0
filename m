Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC28C433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Jan 2021 08:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9B2D64DD9
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Jan 2021 08:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhA1IAK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:00:10 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:35118 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbhA1H74 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 28 Jan 2021 02:59:56 -0500
Received: by mail-ot1-f52.google.com with SMTP id 36so4388175otp.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Jan 2021 23:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFvlavdQj3vCTWkwoAVwJZYrgCNBuE8sgIQdKiGhY+w=;
        b=NLimCBzMerQ4T6lEZc7yfui/91bajnBzUrUxCE7FcYET3P/DNEpUt1oGlrMggdgWNp
         oE7SRNZsklCkTbpi5imI6/KKzAwrN0xLIiYb2ZZMgBGGyFIeBoPmMpD8cd7YGGBGeWKF
         FUbxZhD516NloevqCKPWhi81Pi8bVxjuIlAQ1AKqMS1n8xGxv0bZSSmwnqFsPtznNhUP
         af5yxjFMqOPrGcjbKRbRvifVu+8ShYlwa4NDUKwVLxogj+zef2x85ZKr4yZiBs+DBZe9
         P0Xpzhp+O/C9omlc1Hgq4kSubhGep1llUGbxSRVzicpizf5LJe8coH9k517HHZEyqcwr
         FRcA==
X-Gm-Message-State: AOAM531YvwVCvZ4fxrc+sAQCeFF52efDyFN/uGw4hnH5Uqv5uXy4e0rJ
        nfNLwMRDqyHQ8dXKQaWx1ex6pXT5bCg2aSC+jdE=
X-Google-Smtp-Source: ABdhPJznIX8Ez5rT0eH2kPu8lo8LgYhmVvO6LoHIL5yF3kdkazjNHo5u99kdHiTbtJ4IH8g890LINaHfxGpj5ywaFPQ=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr10464911otr.107.1611820723093;
 Wed, 27 Jan 2021 23:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20210128005110.2613902-1-masahiroy@kernel.org> <20210128005110.2613902-12-masahiroy@kernel.org>
In-Reply-To: <20210128005110.2613902-12-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Jan 2021 08:58:32 +0100
Message-ID: <CAMuHMdWTK7Xa-6E2yLHxv8sGkD-VYgDF2SMRCj4_tDTVS2Uw1A@mail.gmail.com>
Subject: Re: [PATCH 11/27] m68k: add missing FORCE and fix 'targets' to make
 if_changed work
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        alpha <linux-alpha@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 28, 2021 at 1:54 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> The rules in this Makefile cannot detect the command line change because
> the prerequisite 'FORCE' is missing.
>
> Adding 'FORCE' will result in the headers being rebuilt every time
> because the 'targets' addition is also wrong; the file paths in
> 'targets' must be relative to the current Makefile.
>
> Fix all of them so the if_changed rules work correctly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
