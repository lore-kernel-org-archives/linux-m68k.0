Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F45C433FE
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Apr 2022 11:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbiDPLMZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 16 Apr 2022 07:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbiDPLMY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 16 Apr 2022 07:12:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE591BEAF
        for <linux-m68k@lists.linux-m68k.org>; Sat, 16 Apr 2022 04:09:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54B7BB81222
        for <linux-m68k@lists.linux-m68k.org>; Sat, 16 Apr 2022 11:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC922C385A1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 16 Apr 2022 11:09:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="g+btqVRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1650107386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BWpDj5fGUy3iYp41L7HbRmBg65jO9i+zxCcxvQs/HHk=;
        b=g+btqVRChHnHyGUICbjeqfe5YYjRiqyygKZLwxXjYPkaA5j3jW4vmX8m+7+du8kxhPFXcW
        IfyanKqdIdz9DqEEmt85mKS49ttxCFc+55nLassRWonxBnW2i6ND7MrcLkL69UCU9Ygmwz
        cKV5lnWwHDWzY9i7byD5B0GlOzHNEwU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73e0702c (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Sat, 16 Apr 2022 11:09:46 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id x200so18119660ybe.13
        for <linux-m68k@lists.linux-m68k.org>; Sat, 16 Apr 2022 04:09:46 -0700 (PDT)
X-Gm-Message-State: AOAM533p7/4piMhyFX3oSpXBZH76w3whnfJefTqtyAGRtwYv2XmxPuLR
        Z9AhIcr/tH+hRP4H+KDRBLa/5PRkcD1Zhp0AJA8=
X-Google-Smtp-Source: ABdhPJyAY5xi4OGR681ypI25l7Liwu41MbRbYQFXrT4jbAkvhI1v7BitiVeDW4TLYpgWqNVatNZXdBjODAZ+DfSqjbM=
X-Received: by 2002:a5b:782:0:b0:634:683f:310e with SMTP id
 b2-20020a5b0782000000b00634683f310emr2707608ybq.398.1650107375189; Sat, 16
 Apr 2022 04:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com> <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de> <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk> <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Sat, 16 Apr 2022 13:09:24 +0200
X-Gmail-Original-Message-ID: <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
Message-ID: <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um@lists.infradead.org, X86 ML <x86@kernel.org>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Maciej,

On Fri, Apr 15, 2022 at 2:26 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote=
:
>     return (random_get_entropy_fallback() << 14) | ((1<<14) - read_c0_ran=
dom());
>
> of course, as bit 13 is still one of the active ones in the R3k CP0 Rando=
m
> register.

Ah, thanks, will do that.

>  There are two variants only of the CP0 Random register that we can ever
> encounter, as it's been de-facto standardised in early 1990s already and
> then written down in the MIPSr1 architecture specification ~2000.  So I
> think it may make sense to actually handle them both explictitly with
> individual calculations, possibly conditionalised on a CONFIG setting or
> `cpu_has_3kex', because kernels that support the two variants of the MMU
> architecture are mutually incompatible.

Okay, I can give this a shot, but this certainly isn't my fort=C3=A9. It
may ultimately wind up being simpler for you to just send some code of
what you envision for this, but if I understand your idea correctly,
what you're saying is something like:

static inline unsigned long random_get_entropy(void)
{
        unsigned int prid =3D read_c0_prid();
        unsigned int imp =3D prid & PRID_IMP_MASK;
        unsigned int c0_random;

        if (can_use_mips_counter(prid))
                return read_c0_count();

        if (cpu_has_3kex)
                c0_random =3D (read_c0_random() >> 8) & 0x3f;
        else
                c0_random =3D read_c0_random() & 0x3f;
        return (random_get_entropy_fallback() << 6) | (0x3f - c0_random);
}

What do you think of that? Some tweak I'm missing?

>  Isn't it going to be an issue for an entropy source that the distributio=
n
> of values obtained from the CP0 Random bit-field is not even, that is som=
e
> values from the 6-bit range will never appear?

It's the same situation without inverting the order: instead of some
bits on the top never happening, some bits on the bottom never happen
instead. In general, counters don't form uniform distributions anyway,
since the lower bits change faster, and neither are they independent,
since one sample in large part depends on the previous. This is just
sort of the nature of the beast, and the code that calls
random_get_entropy() deals with this appropriately (by, at the moment,
just hashing all the bits).

Jason
