Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193B3C433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Apr 2022 23:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiDLXWR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Apr 2022 19:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiDLXV7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Apr 2022 19:21:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A441B644D
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 15:52:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B01C61CB4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 21:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE982C385A6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 21:17:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PN66lJ9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1649798247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7RYqiP9nhX0rKf7m7FCUHmIMWi5HqXJa2wb5GRUCRN4=;
        b=PN66lJ9Ucajbvf2VVHjWPG1FJUFASZDmOYitMzqJBqTCLQXHhFBshwjiwR+Mg/UydgTKlL
        Jbn7/unSYJoKGR5pvsqrEXiau7+ImngUEYdhw6Zr1FpdNhIofmZljw0weE4T09fWhYikum
        FXFLf6Z984cSQ7hS160SW4xM1RbeJ/8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5da26980 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Tue, 12 Apr 2022 21:17:27 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id v19-20020a056820101300b0032488bb70f5so31468oor.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 14:17:26 -0700 (PDT)
X-Gm-Message-State: AOAM531AatA5uBmp2LF54rQJmQZRe2XiAWMCi/F6v6vQa1Ig9O9TBEMc
        7NXKjfY852MHs/QZi0G1yVtmVBJZDBhookH8YcY=
X-Google-Smtp-Source: ABdhPJyzoWPsFnF8ik/yAzlm3KPNzdj5Txo6RqIWYvjdGUg1ERYyQK8PArA04S/85l5pbLiU/ZXjCNxyEog+/ToSU0U=
X-Received: by 2002:a81:4a55:0:b0:2ef:3ef1:def7 with SMTP id
 x82-20020a814a55000000b002ef3ef1def7mr1543639ywa.2.1649798234768; Tue, 12 Apr
 2022 14:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220412172754.149498-1-Jason@zx2c4.com> <20220412172754.149498-2-Jason@zx2c4.com>
 <87bkx6f29b.ffs@tglx>
In-Reply-To: <87bkx6f29b.ffs@tglx>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 12 Apr 2022 23:17:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9pVhO24V8V3YdeHfz6q1nmSgqXocUtn=+zu5Wh-OWrSRA@mail.gmail.com>
Message-ID: <CAHmME9pVhO24V8V3YdeHfz6q1nmSgqXocUtn=+zu5Wh-OWrSRA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] timekeeping: add raw clock fallback for random_get_entropy()
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
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
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Thomas,

On Tue, Apr 12, 2022 at 10:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Apr 12 2022 at 19:27, Jason A. Donenfeld wrote:
> > +/**
> > + * random_get_entropy_fallback - Returns the raw clock source value,
> > + * used by random.c for platforms with no valid random_get_entropy().
> > + */
> > +unsigned long random_get_entropy_fallback(void)
> > +{
> > +     return tk_clock_read(&tk_core.timekeeper.tkr_mono);
> > +}
> > +EXPORT_SYMBOL(random_get_entropy_fallback);
>
> EXPORT_SYMBOL_GPL() please.

Okay, will do.

Jason
