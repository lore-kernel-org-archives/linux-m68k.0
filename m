Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A97C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Apr 2022 18:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345638AbiDSSl5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Apr 2022 14:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351912AbiDSSlv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Apr 2022 14:41:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88263DA63
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 11:39:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70BA4B81865
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 18:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EFCC385A5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 18:39:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FfHRsSha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1650393543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VyT5yFR69WOgQEnV8/wlLftu+VkDei1XdPwIV0Ddyb0=;
        b=FfHRsShawHw79xX5MproQbwJIKEKNKclDMWcwCTvBU7adfG2PllXbp2Zdo7mUztKZnYZCA
        JRE6wGoIgT5oSqWZUoltWQ2uaqGrXcWRmUvNaD2hnpBsO/NI73G4PKIenaLoo3UTwqkYQZ
        WRkotXE75SZ1HAN9caWPy+sMz/+9wuA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ebb433b (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Tue, 19 Apr 2022 18:39:03 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id y2so6142167uaq.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 11:39:03 -0700 (PDT)
X-Gm-Message-State: AOAM5331V6Z4glEOCcqSM/h/NAjrxwDiIIby++kbfxZsUv2SP0X0sEm8
        lLU1LXOCxYIa82t1hr+NTGIQSSExUFddrqNdAI8=
X-Google-Smtp-Source: ABdhPJygDGhFZIcjwzbmxEAjC5M4INHOWHqlOEzmD5UKXJ5M3M4pBOw2NrPU2pCGLpW8o7rnLG0GwAkXiG41Hu3MclU=
X-Received: by 2002:a25:d88c:0:b0:645:570:72d2 with SMTP id
 p134-20020a25d88c000000b00645057072d2mr11051453ybg.373.1650393531955; Tue, 19
 Apr 2022 11:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com> <20220419111650.1582274-8-Jason@zx2c4.com>
 <Yl78gLLcSb3EHv0B@zn.tnic>
In-Reply-To: <Yl78gLLcSb3EHv0B@zn.tnic>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 19 Apr 2022 20:38:41 +0200
X-Gmail-Original-Message-ID: <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
Message-ID: <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] x86: use fallback for random_get_entropy()
 instead of zero
To:     Borislav Petkov <bp@alien8.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
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
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um@lists.infradead.org, X86 ML <x86@kernel.org>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Borislav,

On Tue, Apr 19, 2022 at 8:16 PM Borislav Petkov <bp@alien8.de> wrote:
> > +static inline unsigned long random_get_entropy(void)
> > +{
> > +#ifndef CONFIG_X86_TSC
> > +     if (!boot_cpu_has(X86_FEATURE_TSC))
>
> cpu_feature_enabled() pls.

This function began as a carbon copy of get_cycles(), which reads:

static inline cycles_t get_cycles(void)
{
#ifndef CONFIG_X86_TSC
       if (!boot_cpu_has(X86_FEATURE_TSC))
               return 0;
#endif

       return rdtsc();
}

As you see, random_get_entropy() is the same function, but with that
zero replaced with the fallback. (Using the fallback in get_cycles()
wouldn't be appropriate.)

So, your options are:
a) We keep this patch as-is, using boot_cpu_has(); or
b) I make an unrelated change inside of this same patch to change
get_cycles() to use cpu_feature_enabled() (in addition to the new
random_get_entropy()).

I think I prefer doing (a), and leaving (b) for another time when you
or another x86 maintainer can do so. But I'll do whichever you say.
Which would you like?

Jason
