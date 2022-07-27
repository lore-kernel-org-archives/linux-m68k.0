Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5FEC19F28
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Jul 2022 01:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240181AbiG0BeP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Jul 2022 21:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240195AbiG0BeK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Jul 2022 21:34:10 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8F83B940
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 18:34:08 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id l68so9247657vsc.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 18:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/vmVKqoirO/ZnmWFWh7pPMm3cXVMOD/O70AH93NwoQ=;
        b=Jc6Ja1iL+PmFORd+ayfCdUAApsKwWJH3RfjPl/SQuZhrBaZzCXxdetQ7soy2EcQ6dE
         f/nj5SyVuHTBOA/KjFi5utIcWohXkfywgsRATmBnYC04gNbsmz83ocjbKaRp9g83rcuk
         DhMYOeaq/VteMEk0cRjq+hFoBQcrQ3fUYOHARFyICB9SNqsTFisArW8UEaQ90k5lEh8z
         anyJBKA7hPC0NEyC5JZ1wQ4BYi/YB9bCXWuo5pm0FVN4qHFWpH4yPs3QQIBJlhzOkclx
         2F7lKyyI/n+cS7QMfS0nNxChHpDhxlQvH7kvT3LDfZ0jZzvcM+4rXNAnke9WUeAjp7Y6
         Xtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/vmVKqoirO/ZnmWFWh7pPMm3cXVMOD/O70AH93NwoQ=;
        b=0eG1+3Msw7e9G9BMnVlG/5m4xR9oayMtlksEAQJc9x12bt3PnWj7m8+6dUXG30IJui
         5hsXj10EyWsp0ECbg5tsPOdfFXT6AqenyDTHEJLkNm9hWBtbWNwF5jJzwXFkNswzt9pS
         oGujkcdn3LFNy8rZ/yXQHt04Ases+btUTvTx0AxbPnadThJZrNvDm81jR9FJmYrHhEYA
         CvaTBUzk5K7VyPvmrUKtcbWotHejAyy/u72225fK6vYrWfyCpQKmN7ilL2jaNQBQbx6Y
         CjB3q2oAfR1XNA40NL7vjx0erhNlLD8HZ9wlRZn6oEZx8k6NfkJZp8KkhMDH4hk5ism8
         GfcQ==
X-Gm-Message-State: AJIora/mcnWXTtaEGlpu7OcxKw8LStEgJW6mg++7oZppkkYN/ZeTOuzj
        2f1h32/iHBMBF3ryLsr3+WFJEBSay/7MOxw4tOE=
X-Google-Smtp-Source: AGRyM1sFGyULinUFRT9jlmibW4PcLK23Ey/VconZdFQvR2s3dTBQrqddR20oAw/7ezMa0qJ0CAjintrL+9pmKUHhcRc=
X-Received: by 2002:a05:6102:2387:b0:34b:9f6d:10da with SMTP id
 v7-20020a056102238700b0034b9f6d10damr6233583vsr.28.1658885647112; Tue, 26 Jul
 2022 18:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiWwDYxNhnStS0e+p-NTFAQSHvab=2-8LwxunCVuY5-2A@mail.gmail.com>
 <20220725161141.GA1306881@roeck-us.net> <CAHk-=whtGUwJwHUSNsXd4g7cok=n0Zwje7nACp8skh1fa2NtJA@mail.gmail.com>
 <YuAm5h1B6bsrR/9q@fedora> <CAHk-=wgYpJTMMxmfbpqc=JVtSK0Zj4b15G=AvEYk6vPNySDSsA@mail.gmail.com>
 <YuAv+lV324G7pmlk@yury-laptop> <CAHk-=wg2-j8zocUjurAeg_bimNz7C5h5HDEXKK6PxDmR+DaHRg@mail.gmail.com>
 <YuBEIiLL1xZVyEFl@shell.armlinux.org.uk> <CAHk-=wjpYLLoi1m0VRfVoyzGgmMiNwBhQ0XXG0VWwjskcz5Cug@mail.gmail.com>
 <YuCDscyJotkjNQcH@shell.armlinux.org.uk>
In-Reply-To: <YuCDscyJotkjNQcH@shell.armlinux.org.uk>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Tue, 26 Jul 2022 18:33:55 -0700
Message-ID: <CAAH8bW-BNfhuXF_2cO+x2Qc51G-DFskFmKw8hzDHhC+3Rn1ZUA@mail.gmail.com>
Subject: Re: Linux 5.19-rc8
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 26, 2022 at 5:15 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Jul 26, 2022 at 01:20:23PM -0700, Linus Torvalds wrote:
> > On Tue, Jul 26, 2022 at 12:44 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > Overall, I would say it's pretty similar (some generic perform
> > > marginally better, some native perform marginally better) with the
> > > exception of find_first_bit() being much better with the generic
> > > implementation, but find_next_zero_bit() being noticably worse.
> >
> > The generic _find_first_bit() code is actually sane and simple. It
> > loops over words until it finds a non-zero one, and then does trivial
> > calculations on that last word.
> >
> > That explains why the generic code does so much better than your byte-wise asm.
> >
> > In contrast, the generic _find_next_bit() I find almost offensively
> > silly - which in turn explains why your byte-wide asm does better.
> >
> > I think the generic _find_next_bit() should actually do what the m68k
> > find_next_bit code does: handle the first special word itself, and
> > then just call find_first_bit() on the rest of it.
> >
> > And it should *not* try to handle the dynamic "bswap and/or bit sense
> > invert" thing at all. That should be just four different (trivial)
> > cases for the first word.
>
> Here's the results for the native version converted to use word loads:
>
> [   37.319937]
>                Start testing find_bit() with random-filled bitmap
> [   37.330289] find_next_bit:                 2222703 ns, 163781 iterations
> [   37.339186] find_next_zero_bit:            2154375 ns, 163900 iterations
> [   37.348118] find_last_bit:                 2208104 ns, 163780 iterations
> [   37.372564] find_first_bit:               17722203 ns,  16370 iterations
> [   37.737415] find_first_and_bit:          358135191 ns,  32453 iterations
> [   37.745420] find_next_and_bit:             1280537 ns,  73644 iterations
> [   37.752143]
>                Start testing find_bit() with sparse bitmap
> [   37.759032] find_next_bit:                   41256 ns,    655 iterations
> [   37.769905] find_next_zero_bit:            4148410 ns, 327026 iterations
> [   37.776675] find_last_bit:                   48742 ns,    655 iterations
> [   37.790961] find_first_bit:                7562371 ns,    655 iterations
> [   37.797743] find_first_and_bit:              47366 ns,      1 iterations
> [   37.804527] find_next_and_bit:               59924 ns,      1 iterations
>
> which is generally faster than the generic version, with the exception
> of the sparse find_first_bit (generic was:
> [   25.657304] find_first_bit:                7328573 ns,    656 iterations)
>
> find_next_{,zero_}bit() in the sparse case are quite a bit faster than
> the generic code.

Look at find_{first,next}_and_bit results. Those two have no arch version
and in both cases use generic code. In theory they should be equally fast
before and after, but your testing says that generic case is slower even
for them, and the difference is comparable with real arch functions numbers.
It makes me feel like:
 - there's something unrelated, like governor/throttling that affect results;
 - the numbers are identical, taking the dispersion into account.

If the difference really concerns you, I'd suggest running the test
several times
to measure confidence intervals.

Thanks,
Yury
