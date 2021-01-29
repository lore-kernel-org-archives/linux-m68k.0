Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F16EC433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 21:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F73B64E02
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 21:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbhA2VLu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 16:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbhA2VLn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 16:11:43 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836C0C061756
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 13:11:03 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id n10so7481002pgl.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 13:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6lLJH6wGpbFuj0IJWQQeHITjZneLVulSJuUvdnDWMbY=;
        b=QtRKN8NH/DzC+3SzwtpiiqfC2nryUUmnIkvftX8d3jsJEq/87GLpMN2GT5qMpiCFm4
         MYUkAoaB3/nZDk5BTvXQJWAKTIJQGfJkBKAnOyK52eo70mngbvfhqPFEyTk5QdhlxZ21
         zXA0275SvvFMvNI1gXOPhhpzWS2Za/aEwmmdTgc9i3YObBnPbdozv6WJ3mtJeKSw23RG
         zhUlD6ylcWKX6dXIDjeqtnQqlFOTs22LRBzoY1JLaXW8Ne3LUhaq8xfyId9CLge/WStT
         GSTEEGc1SAc6XKPpd5hukBrrzhIgrXZMdnfiCv8DXRDQlkPSgnnH0JNDGqtUcANuEsAm
         jUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6lLJH6wGpbFuj0IJWQQeHITjZneLVulSJuUvdnDWMbY=;
        b=ikSPMD9Na+4yjkwUShqPTa1CXv6aMkV9jyfa1ixqidObAppr3hOgRXAUhfvienWU8r
         xjLpJToUqgfRKO4q3JrrT15dfnOChC8iwgcBGA0ab7CcSTBwHxduHjqau3WjDDWaNuCp
         fIUyMt88OsFPMYMIkT8LyP/DawplDQ4L4vYOahEFTKpr+BlMbj/CLcpew7MfKNQJstij
         VaPw1ndJou6AtAIh2ttmkKZkVbRqqCAT2gGOCQwc4Wh1iwAgkh2mw04k3HMiLH7Ub9/q
         n9UwxEiK8QA2Brbjk5UhG2YsLFPwzrnaT7Y+692fKOv58TAMKTXSHNM7m7GbQuhUPHuk
         ZEIg==
X-Gm-Message-State: AOAM532k6ussOBZhSzPyhhgluZWfSalS84yrW0tvyzfwAwbuaEkk66MP
        3Nf3SRAX7ALEW0u4afbdhsZBFhdNO/+4N9CeuSM=
X-Google-Smtp-Source: ABdhPJyKW6Z/95t+hHhCZW1namNNCkIlh//UBqOWDRX49nhShezelkJMtz0JqWU9szoU6YK4ygAc/WnsuNls9IwVCBQ=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr5965005pfb.7.1611954662708; Fri, 29
 Jan 2021 13:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20210129204528.2118168-1-yury.norov@gmail.com> <20210129204528.2118168-4-yury.norov@gmail.com>
In-Reply-To: <20210129204528.2118168-4-yury.norov@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Jan 2021 23:10:46 +0200
Message-ID: <CAHp75VcSc=myrcvyBOkaUDguR6aPjJAFFXi2iSvmU21+1664Hw@mail.gmail.com>
Subject: Re: [PATCH 2/5] bits_per_long.h: introduce SMALL_CONST() macro
To:     Yury Norov <yury.norov@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jan 29, 2021 at 10:49 PM Yury Norov <yury.norov@gmail.com> wrote:
>
> Many algorithms become simplier if they are passed with relatively small

simpler

> input values. One example is bitmap operations when the whole bitmap fits
> into one word. To implement such simplifications, linux/bitmap.h declares
> small_const_nbits() macro.
>
> Other subsystems may also benefit from optimizations of this sort, like
> find_bit API in the following patches. So it looks helpful to generalize
> the macro and extend it's visibility.

> It should probably go to linux/kernel.h, but doing that creates circular
> dependencies. So put it in asm-generic/bitsperlong.h.

No, no, please leave kernel.h alone. It's already quite a mess.

And this shouldn't be in the commit message either.

...

> -       if (small_const_nbits(nbits))
> +       if (SMALL_CONST(nbits - 1))

Not sure if we need to rename it.

...

> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -37,7 +37,7 @@
>  #define GENMASK(h, l) \
>         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>
> -#define BITS_FIRST(nr)         GENMASK(nr), 0)
> +#define BITS_FIRST(nr)         GENMASK((nr), 0)

How come?!

...

> diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
> index 8f2283052333..432d272baf27 100644
> --- a/tools/include/asm-generic/bitsperlong.h
> +++ b/tools/include/asm-generic/bitsperlong.h

I think a tools update would be better to have in a separate patch.

-- 
With Best Regards,
Andy Shevchenko
