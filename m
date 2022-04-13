Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097B5C433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Apr 2022 14:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbiDMOfV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Apr 2022 10:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236109AbiDMOfU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Apr 2022 10:35:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE254B1C0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Apr 2022 07:32:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 27A40B824EE
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Apr 2022 14:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CF5C385AB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Apr 2022 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649860377;
        bh=y/gFQs+hgHZ3/vvOq41ylGPCtjhP53O/JBKcPRIcQfg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j9z9yWf8zEBxpTdwXTBA42xlV0Br6pgBatJ9sZ+YFz9LeI2saNhT1Bt0zi1X0urlL
         CI5liYogMUqvV61ey99QW3McYhlY26REm9v2P/huS84KMGI/k9oIyLs8IlEM/0Iovs
         lj1JN/763Sr2cWqDd3F8GuvqDOU6tjFxjvUJqP8iW1M3p1zSdZLc72xZJgACvgsla4
         mtjhKV2l+be+xhGxib4Epqg0KtTxytIlXBxXkybu3Mv8hFLnjnnC38OEhpdvJlPRJa
         NGtK3aKDybE/aad/0SbJcOL8d4+sP+GaiPIe5izEZKuzZg7b/ZSqROZkcmhqVzhfO8
         BvzDu2yEGHOgA==
Received: by mail-io1-f44.google.com with SMTP id e22so2062095ioe.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Apr 2022 07:32:57 -0700 (PDT)
X-Gm-Message-State: AOAM532HuJlD5gxvANv2qk+rQKU6+BZ39aL49x3KCgjI1coBWee+Kl+d
        Y5leKU1dycLfRjRQrpbFTxuyleXfL1W0h1Phyg==
X-Google-Smtp-Source: ABdhPJztV5+8KEJ74WCQvEE2mueV1uP9FdDpJontci3NKw8uFVcyU1+ScsVCAwrzKj/88xIwClDnzYiNbkHkece/VFk=
X-Received: by 2002:a05:6638:24d0:b0:326:34d2:5c22 with SMTP id
 y16-20020a05663824d000b0032634d25c22mr6761858jat.91.1649860365852; Wed, 13
 Apr 2022 07:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com> <20220413115411.21489-2-Jason@zx2c4.com>
In-Reply-To: <20220413115411.21489-2-Jason@zx2c4.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 13 Apr 2022 09:32:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJYq5Oe_zBbcwYNMpfpqGLGCyaSfGqOrPjZ_Pj=nF73mA@mail.gmail.com>
Message-ID: <CAL_JsqJYq5Oe_zBbcwYNMpfpqGLGCyaSfGqOrPjZ_Pj=nF73mA@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] timekeeping: add raw clock fallback for random_get_entropy()
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-m68k@lists.linux-m68k.org,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um@lists.infradead.org, X86 ML <x86@kernel.org>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 13, 2022 at 6:55 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> The addition of random_get_entropy_fallback() provides access to
> whichever time source has the highest frequency, which is useful for
> gathering entropy on platforms without available cycle counters. It's
> not necessarily as good as being able to quickly access a cycle counter
> that the CPU has, but it's still something, even when it falls back to
> being jiffies-based.
>
> In the event that a given arch does not define get_cycles(), falling
> back to the get_cycles() default implementation that returns 0 is really
> not the best we can do. Instead, at least calling
> random_get_entropy_fallback() would be preferable, because that always
> needs to return _something_, even falling back to jiffies eventually.
> It's not as though random_get_entropy_fallback() is super high precision
> or guaranteed to be entropic, but basically anything that's not zero all
> the time is better than returning zero all the time.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  include/linux/timex.h     |  8 ++++++++
>  kernel/time/timekeeping.c | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/include/linux/timex.h b/include/linux/timex.h
> index 5745c90c8800..fbbe34226044 100644
> --- a/include/linux/timex.h
> +++ b/include/linux/timex.h
> @@ -62,6 +62,8 @@
>  #include <linux/types.h>
>  #include <linux/param.h>
>
> +extern unsigned long random_get_entropy_fallback(void);
> +
>  #include <asm/timex.h>
>
>  #ifndef random_get_entropy
> @@ -74,8 +76,14 @@
>   *
>   * By default we use get_cycles() for this purpose, but individual
>   * architectures may override this in their asm/timex.h header file.
> + * If a given arch does not have get_cycles(), then we fallback to

'does not have a usable get_cycles(), ...' as clearly some arches have
get_cycles() and yet still need a fallback.

Why not handle the 'if get_cycles() returns 0 do the fallback' within
a weak random_get_entropy() function? Then more arches don't need any
random_get_entropy() implementation.

Rob
