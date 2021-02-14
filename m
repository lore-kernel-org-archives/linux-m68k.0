Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146D0C433DB
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Feb 2021 17:02:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC5F261493
	for <linux-m68k@archiver.kernel.org>; Sun, 14 Feb 2021 17:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhBNRCP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 14 Feb 2021 12:02:15 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54742 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhBNRCP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 14 Feb 2021 12:02:15 -0500
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11EH1DPf005787
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Feb 2021 02:01:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11EH1DPf005787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613322074;
        bh=SP1sGJk9Sz6Zv6lJ9Wi/Vff8sScxvUIuNUkChOHpFR8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eW5SCVd/ORO2ykDHxnNRrd0j5pNeofX24lJWfc1sAWEZK87VwCvlyBONkk1p+q0pw
         n9urDcCM7JXO/83SDgjvjWIuq0kCzJpxghQ0kdEY/9lSUqF57fsB4kVM44LTekaoBL
         2K5usgTVkdb+i9kzobmJV+tecZNrbgkAygUEWwX3cvMZxzFNtx08+4IWsN9L58B4V9
         msLNld5lBI4A8trmLyO3EgTzKOINsLN5xgyvh+eWnDvPTyAVb6rNcHXCo6xnYQ8S9l
         7hdmlhpR1RGeMV1AEHEn5ADueffOKPk44du6buIJ89LAEEs34fToTGEhTLY+vWrQY3
         BiMMNZH6MaRbw==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id u143so2764935pfc.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Feb 2021 09:01:13 -0800 (PST)
X-Gm-Message-State: AOAM531jmmVBCFs6tB74JpS2hGgVY20Y9uYugmvt1ufCJRDrIKY8hNGB
        +k8aP0TXq6o7FS5IZVVmPoQ9rxrgeunc4Hfc2DA=
X-Google-Smtp-Source: ABdhPJynyvRuko2AvW0s/Rsmpz6hR6NWNFNxrImHm+1o7F+Y7g0dNzPk8oFZuEX0oJ2YCILzMn7MQK6BnXeqMrnP+x0=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr11945438pgf.47.1613322073045;
 Sun, 14 Feb 2021 09:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210128005110.2613902-1-masahiroy@kernel.org> <20210128005110.2613902-22-masahiroy@kernel.org>
In-Reply-To: <20210128005110.2613902-22-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 15 Feb 2021 02:00:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDcfqSCsCeG9+ytrJNfD5mS8OLS2uZS8WRBuTHRL1qRg@mail.gmail.com>
Message-ID: <CAK7LNAQDcfqSCsCeG9+ytrJNfD5mS8OLS2uZS8WRBuTHRL1qRg@mail.gmail.com>
Subject: Re: [PATCH 21/27] sparc: remove wrong comment from arch/sparc/include/asm/Kbuild
To:     linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-alpha@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um@lists.infradead.org,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 28, 2021 at 9:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> These are NOT exported to userspace.
>
> The headers listed in arch/sparc/include/uapi/asm/Kbuild are exported.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild/fixes.


> ---
>
>  arch/sparc/include/asm/Kbuild | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
> index 3688fdae50e4..aec20406145e 100644
> --- a/arch/sparc/include/asm/Kbuild
> +++ b/arch/sparc/include/asm/Kbuild
> @@ -1,6 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -# User exported sparc header files
> -
>  generated-y += syscall_table_32.h
>  generated-y += syscall_table_64.h
>  generated-y += syscall_table_c32.h
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
