Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66983C43334
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jun 2022 12:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbiFGMxV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242548AbiFGMxU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Jun 2022 08:53:20 -0400
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66EE2CDE5
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jun 2022 05:53:18 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id el14so12239432qvb.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 05:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i2nmQNF/3gAoxeluRHoOdJNgK2z7f54HL004Ai8ZD6Y=;
        b=S/CqF7atUHMGWkMAryTC0VbgmYzqS7FYyldDxOGLqwu9RUixpOUb6r+HxbW9sT6xxg
         uCIij9EJmmJjwa8Ylr3pSd+iMVCeyyomztcr+b2iVxzDyCYk7KOdUQQDQfhs21FRLZwZ
         MTNVmfzH9XpGyiy7AfI+3tJL3fFnZmww6/MAlfbH8RPfmSDWCU9KU8ZAFSlyyzMa+oth
         WuyjTyTwWD+oEzp6RILnjFCZ7OUcuKWuftxtTpBSZpkqNYnXxR06IYhNZ8/ruw6dsfjd
         zy6V5hIOivdPguh/0sJEscHQIo33NVJxVSbGZWqo4KxDKJ0HqI4wCYCXSU9dImMTkgb3
         DpeA==
X-Gm-Message-State: AOAM531tvAsfCOqvE2r2TfpDCcYc1a3uwcLA47yFBjc4sAXoCo8Oxrp9
        dtTQxGP2uc4k/Opzkoxm4a3ehQjexiNVMw==
X-Google-Smtp-Source: ABdhPJzNM3/mcNv05BLOJZrOAA5BP8Np2BowljA87O3G/OkLwygSz5GSYuijRvDBR5F93cV7tPKgtg==
X-Received: by 2002:ad4:5c84:0:b0:464:5827:c6a7 with SMTP id o4-20020ad45c84000000b004645827c6a7mr32212275qvh.37.1654606397546;
        Tue, 07 Jun 2022 05:53:17 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a404800b006a69aba9f19sm10793073qko.80.2022.06.07.05.53.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:53:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p13so30979776ybm.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 05:53:17 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr31329554ywa.47.1654605952647; Tue, 07
 Jun 2022 05:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220606114908.962562-1-alexandr.lobakin@intel.com>
In-Reply-To: <20220606114908.962562-1-alexandr.lobakin@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jun 2022 14:45:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR0Nu+RENB8rFnJFiW=T0P7Kq_XAG7t1MF=fdyD6pUGw@mail.gmail.com>
Message-ID: <CAMuHMdXR0Nu+RENB8rFnJFiW=T0P7Kq_XAG7t1MF=fdyD6pUGw@mail.gmail.com>
Subject: Re: [PATCH 0/6] bitops: let optimize out non-atomic bitops on
 compile-time constants
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Alexander,

On Mon, Jun 6, 2022 at 1:50 PM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
> While I was working on converting some structure fields from a fixed
> type to a bitmap, I started observing code size increase not only in
> places where the code works with the converted structure fields, but
> also where the converted vars were on the stack. That said, the
> following code:
>
>         DECLARE_BITMAP(foo, BITS_PER_LONG) = { }; // -> unsigned long foo[1];
>         unsigned long bar = BIT(BAR_BIT);
>         unsigned long baz = 0;
>
>         __set_bit(FOO_BIT, foo);
>         baz |= BIT(BAZ_BIT);
>
>         BUILD_BUG_ON(!__builtin_constant_p(test_bit(FOO_BIT, foo));
>         BUILD_BUG_ON(!__builtin_constant_p(bar & BAR_BIT));
>         BUILD_BUG_ON(!__builtin_constant_p(baz & BAZ_BIT));
>
> triggers the first assertion on x86_64, which means that the
> compiler is unable to evaluate it to a compile-time initializer
> when the architecture-specific bitop is used even if it's obvious.
> I found that this is due to that many architecture-specific
> non-atomic bitop implementations use inline asm or other hacks which
> are faster or more robust when working with "real" variables (i.e.
> fields from the structures etc.), but the compilers have no clue how
> to optimize them out when called on compile-time constants.
>
> So, in order to let the compiler optimize out such cases, expand the
> test_bit() and __*_bit() definitions with a compile-time condition
> check, so that they will pick the generic C non-atomic bitop
> implementations when all of the arguments passed are compile-time
> constants, which means that the result will be a compile-time
> constant as well and the compiler will produce more efficient and
> simple code in 100% cases (no changes when there's at least one
> non-compile-time-constant argument).
> The condition itself:
>
> if (
> __builtin_constant_p(nr) &&     /* <- bit position is constant */
> __builtin_constant_p(!!addr) && /* <- compiler knows bitmap addr is
>                                       always either NULL or not */
> addr &&                         /* <- bitmap addr is not NULL */
> __builtin_constant_p(*addr)     /* <- compiler knows the value of
>                                       the target bitmap */
> )
>         /* then pick the generic C variant
> else
>         /* old code path, arch-specific
>
> I also tried __is_constexpr() as suggested by Andy, but it was
> always returning 0 ('not a constant') for the 2,3 and 4th
> conditions.
>
> The savings on x86_64 with LLVM are insane (.text):
>
> $ scripts/bloat-o-meter -c vmlinux.{base,test}
> add/remove: 72/75 grow/shrink: 182/518 up/down: 53925/-137810 (-83885)
>
> $ scripts/bloat-o-meter -c vmlinux.{base,mod}
> add/remove: 7/1 grow/shrink: 1/19 up/down: 1135/-4082 (-2947)
>
> $ scripts/bloat-o-meter -c vmlinux.{base,all}
> add/remove: 79/76 grow/shrink: 184/537 up/down: 55076/-141892 (-86816)

Thank you!

I gave it a try on m68k, and am a bit disappointed seeing an increase
in code size:

    add/remove: 49/13 grow/shrink: 279/138 up/down: 6434/-3342 (3092)

This is atari_defconfig on a tree based on v5.19-rc1, with
m68k-linux-gnu-gcc (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0, GNU ld (GNU
Binutils for Ubuntu) 2.34).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
