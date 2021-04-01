Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA7BC433B4
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 08:49:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1BF56100C
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 08:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbhDAIsu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Apr 2021 04:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbhDAIsi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Apr 2021 04:48:38 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C5FC0613E6
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Apr 2021 01:48:38 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so643380pjg.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Apr 2021 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaMKRvnuGzCN3sXjasGo8hmNFZefS5kSQGclo2fJbBI=;
        b=RljTDOEYU5XD+dZbqPCT0sRbBCzSo+UFmVUzBkTwHvl4gZ2pUQe0+WjEXJEE2jsBd6
         ZWO9Ffluvko6gBrEZ0GS10VRCIyB6hVuXie4Nwh9bY9G6SuxCwdc0PzYkXi1/HjViyQ6
         TApFIOfDUzfXslu7xPtrqUQPFu80STdM5GhiLc8KR6OQasaosPaJ5ixgWUUTyEgZS4El
         2BghF6UtLpMLhSvxFwEWAo7bq8D1tTrlWSXbAai0HJ/max4AVhSFR4Fq5mYbD6tGkxWb
         gJL1+IjFzf5SQBwxB433GSOiVcD7Y+QTe8k28x1u1nSvip/Vpd7sXQS1kHqzG4ypzI0r
         tAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zaMKRvnuGzCN3sXjasGo8hmNFZefS5kSQGclo2fJbBI=;
        b=rcbaxdQMhoMc0bEWyKhCnjf8/syOMXTqyqCM5KpjH46Mlxn457VJZcCse+jtqrxagr
         jZ7wabqjYAwpuFvANB4Vngpdo1Tg5EiSvUCwvdLubK2GzejEBYfXclFj7itx0K2hb+dp
         M2+5fyBvf5hRhKDPpnqNNljvLBf62wpEDKx4wu8DLu0KqJxpXCSPH7t9iCLEgarJh3/n
         T0M1pDTloJrluzuvBKtZB93q4wEnZCfzdEgNrOz1kOYRH9Qwlza9yjT4TJgbbLGOEEp8
         hqn6/+CoLhRh2UXpJLiHgfc/QneWu3WIltqBX/rLoR78QbYPEsNkE4VdJuZrH0l1Ink4
         IQqg==
X-Gm-Message-State: AOAM532I03HRYYXdHDiP1dUxP4lXs3XkkKeSrTsjQ13vFJmTGL/iSq68
        7njKVCHn9XhIzHK6QpHZGW8/flYNQleRn41Smb/9eyVeYORbwA==
X-Google-Smtp-Source: ABdhPJwD8VPdnqmAWIPa4E1ZC+MKDhMghA/DJtHpKqSt5PzZvEnlukiOQ/Q9RsJYH72bZmvB9GrVcr8b7RqVItcMmks=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr7035221plq.17.1617266917618; Thu, 01 Apr
 2021 01:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210401003153.97325-1-yury.norov@gmail.com> <20210401003153.97325-10-yury.norov@gmail.com>
In-Reply-To: <20210401003153.97325-10-yury.norov@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Apr 2021 11:48:21 +0300
Message-ID: <CAHp75Vd6c4+Q5+-FYcMPL_64FX2qjqmz9u0hJ7N0m2Ojs0RCcA@mail.gmail.com>
Subject: Re: [PATCH 09/12] lib: add fast path for find_next_*_bit()
To:     Yury Norov <yury.norov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Alexey Klimov <aklimov@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 1, 2021 at 3:41 AM Yury Norov <yury.norov@gmail.com> wrote:
>
> Similarly to bitmap functions, find_next_*_bit() users will benefit
> if we'll handle a case of bitmaps that fit into a single word inline.
> In the very best case, the compiler may replace a function call with
> a few instructions.
>
> This is the quite typical find_next_bit() user:
>
>         unsigned int cpumask_next(int n, const struct cpumask *srcp)
>         {
>                 /* -1 is a legal arg here. */
>                 if (n != -1)
>                         cpumask_check(n);
>                 return find_next_bit(cpumask_bits(srcp), nr_cpumask_bits, n + 1);
>         }
>         EXPORT_SYMBOL(cpumask_next);
>
> Currently, on ARM64 the generated code looks like this:
>         0000000000000000 <cpumask_next>:
>            0:   a9bf7bfd        stp     x29, x30, [sp, #-16]!
>            4:   11000402        add     w2, w0, #0x1
>            8:   aa0103e0        mov     x0, x1
>            c:   d2800401        mov     x1, #0x40                       // #64
>           10:   910003fd        mov     x29, sp
>           14:   93407c42        sxtw    x2, w2
>           18:   94000000        bl      0 <find_next_bit>
>           1c:   a8c17bfd        ldp     x29, x30, [sp], #16
>           20:   d65f03c0        ret
>           24:   d503201f        nop
>
> After applying this patch:
>         0000000000000140 <cpumask_next>:
>          140:   11000400        add     w0, w0, #0x1
>          144:   93407c00        sxtw    x0, w0
>          148:   f100fc1f        cmp     x0, #0x3f
>          14c:   54000168        b.hi    178 <cpumask_next+0x38>  // b.pmore
>          150:   f9400023        ldr     x3, [x1]
>          154:   92800001        mov     x1, #0xffffffffffffffff         // #-1
>          158:   9ac02020        lsl     x0, x1, x0
>          15c:   52800802        mov     w2, #0x40                       // #64
>          160:   8a030001        and     x1, x0, x3
>          164:   dac00020        rbit    x0, x1
>          168:   f100003f        cmp     x1, #0x0
>          16c:   dac01000        clz     x0, x0
>          170:   1a800040        csel    w0, w2, w0, eq  // eq = none
>          174:   d65f03c0        ret
>          178:   52800800        mov     w0, #0x40                       // #64
>          17c:   d65f03c0        ret
>
> find_next_bit() call is replaced with 6 instructions. find_next_bit()
> itself is 41 instructions plus function call overhead.
>
> Despite inlining, the scripts/bloat-o-meter report smaller .text size
> after applying the series:
>         add/remove: 11/9 grow/shrink: 233/176 up/down: 5780/-6768 (-988)

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  include/asm-generic/bitops/find.h | 30 ++++++++++++++++++++++++++++++
>  include/asm-generic/bitops/le.h   | 21 +++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/include/asm-generic/bitops/find.h b/include/asm-generic/bitops/find.h
> index 7ad70dab8e93..4148c74a1e4d 100644
> --- a/include/asm-generic/bitops/find.h
> +++ b/include/asm-generic/bitops/find.h
> @@ -20,6 +20,16 @@ static inline
>  unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
>                             unsigned long offset)
>  {
> +       if (small_const_nbits(size)) {
> +               unsigned long val;
> +
> +               if (unlikely(offset >= size))
> +                       return size;
> +
> +               val = *addr & GENMASK(size - 1, offset);
> +               return val ? __ffs(val) : size;
> +       }
> +
>         return _find_next_bit(addr, NULL, size, offset, 0UL, 0);
>  }
>  #endif
> @@ -40,6 +50,16 @@ unsigned long find_next_and_bit(const unsigned long *addr1,
>                 const unsigned long *addr2, unsigned long size,
>                 unsigned long offset)
>  {
> +       if (small_const_nbits(size)) {
> +               unsigned long val;
> +
> +               if (unlikely(offset >= size))
> +                       return size;
> +
> +               val = *addr1 & *addr2 & GENMASK(size - 1, offset);
> +               return val ? __ffs(val) : size;
> +       }
> +
>         return _find_next_bit(addr1, addr2, size, offset, 0UL, 0);
>  }
>  #endif
> @@ -58,6 +78,16 @@ static inline
>  unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
>                                  unsigned long offset)
>  {
> +       if (small_const_nbits(size)) {
> +               unsigned long val;
> +
> +               if (unlikely(offset >= size))
> +                       return size;
> +
> +               val = *addr | ~GENMASK(size - 1, offset);
> +               return val == ~0UL ? size : ffz(val);
> +       }
> +
>         return _find_next_bit(addr, NULL, size, offset, ~0UL, 0);
>  }
>  #endif
> diff --git a/include/asm-generic/bitops/le.h b/include/asm-generic/bitops/le.h
> index 21305f6cea0b..5a28629cbf4d 100644
> --- a/include/asm-generic/bitops/le.h
> +++ b/include/asm-generic/bitops/le.h
> @@ -5,6 +5,7 @@
>  #include <asm-generic/bitops/find.h>
>  #include <asm/types.h>
>  #include <asm/byteorder.h>
> +#include <linux/swab.h>
>
>  #if defined(__LITTLE_ENDIAN)
>
> @@ -37,6 +38,16 @@ static inline
>  unsigned long find_next_zero_bit_le(const void *addr, unsigned
>                 long size, unsigned long offset)
>  {
> +       if (small_const_nbits(size)) {
> +               unsigned long val = *(const unsigned long *)addr;
> +
> +               if (unlikely(offset >= size))
> +                       return size;
> +
> +               val = swab(val) | ~GENMASK(size - 1, offset);
> +               return val == ~0UL ? size : ffz(val);
> +       }
> +
>         return _find_next_bit(addr, NULL, size, offset, ~0UL, 1);
>  }
>  #endif
> @@ -46,6 +57,16 @@ static inline
>  unsigned long find_next_bit_le(const void *addr, unsigned
>                 long size, unsigned long offset)
>  {
> +       if (small_const_nbits(size)) {
> +               unsigned long val = *(const unsigned long *)addr;
> +
> +               if (unlikely(offset >= size))
> +                       return size;
> +
> +               val = swab(val) & GENMASK(size - 1, offset);
> +               return val ? __ffs(val) : size;
> +       }
> +
>         return _find_next_bit(addr, NULL, size, offset, 0UL, 1);
>  }
>  #endif
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
