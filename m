Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE78C433B4
	for <linux-m68k@archiver.kernel.org>; Wed, 12 May 2021 07:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 178AC61624
	for <linux-m68k@archiver.kernel.org>; Wed, 12 May 2021 07:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhELHvE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 May 2021 03:51:04 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48811 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhELHvE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 May 2021 03:51:04 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MaIvV-1m3gUY2DcT-00WJ0V for <linux-m68k@lists.linux-m68k.org>; Wed, 12 May
 2021 09:49:55 +0200
Received: by mail-oi1-f177.google.com with SMTP id f184so1291022oig.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 May 2021 00:49:55 -0700 (PDT)
X-Gm-Message-State: AOAM533oum7ZjXwksOvAnAB5IkVgU5woUj3BXMFScIbv7kX9gHtMmTOG
        Bf5DWR61JUdf4OALBNLbmsipVyNx0dL7zEKWtEc=
X-Google-Smtp-Source: ABdhPJxd0lpfpoLIqJOw+6SPCO8QED3/X3t9JAR8I4sQlku1WpueQz6KE4WIiLlRxouPNnwly1mFxvEEQ4Zrg7KWp+o=
X-Received: by 2002:aca:f587:: with SMTP id t129mr25234423oih.84.1620805794260;
 Wed, 12 May 2021 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210401003153.97325-1-yury.norov@gmail.com> <20210401003153.97325-12-yury.norov@gmail.com>
 <1ac7bbc2-45d9-26ed-0b33-bf382b8d858b@I-love.SAKURA.ne.jp>
 <CAHp75Vea0Y_LfWC7LNDoDZqO4t+SVHV5HZMzErfyMPoBAjjk1g@mail.gmail.com>
 <YJm5Dpo+RspbAtye@rikard> <YJoyMrqRtB3GSAny@smile.fi.intel.com>
 <YJpePAHS3EDw6PK1@rikard> <151de51e-9302-1f59-407a-e0d68bbaf11c@i-love.sakura.ne.jp>
 <YJrrJhvwq7RUvDXD@rikard>
In-Reply-To: <YJrrJhvwq7RUvDXD@rikard>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 12 May 2021 09:48:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02qNHcksJ8DahHgLtbM9ZOydGjE3__3GoxgJFiWrAT0w@mail.gmail.com>
Message-ID: <CAK8P3a02qNHcksJ8DahHgLtbM9ZOydGjE3__3GoxgJFiWrAT0w@mail.gmail.com>
Subject: Re: [PATCH 11/12] tools: sync lib/find_bit implementation
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Alexey Klimov <aklimov@redhat.com>,
        David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HCx7TVFObo8DRPI6mL/iiRg4W+4ZzAN2bgH9PWren+bqE5txu6X
 oVCPqJzbcuiE3HMpGgiQuKbt9U7Irqb4EsCSj/o/tQvHIuaOFVmoS7uVey2kZ3LtZVP6v/N
 nFiv2+ts2mPvCtyDA5dTrwhKo3o9hf6vnl13+kLFewZgoaby55mtBHNaWJhIH/nkkBEzGsq
 rFiWw0aHwweBqiW/z1kWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3mNT/Orpj50=:wNTMPjKQIN6A+l1yaBzQ71
 rbimQcyFplVde+0EFpKFhyG9Z99DkF0rY1sykRhRfh5naQHot0bujpHZcMGvUnlfPEWDH/msW
 oqRnlm5+bX11+88SYF6LXMXUKHN0EpRqu/UDvCNAl6tsxNOFf2/tCCoJUsz4tO4QszWLDnBLD
 ExI1hCvV4OfN3E0tfvXzl+Ny0FWLOeYAptvNeBctG58PFnbLXqo92OZlzH1y8qYjF5Hd12a3R
 XhYSXpcoHlTUcPl+tAj77RKYhJB38KYx7fMExbvFc8/thVRNA8h6/i+zQVVMzRnsipUn354iw
 6gtRjfgn7jrFSkrtAP9BRyBnQIk74cbYaxtkcPvgcdBCkvO0PzAS454GxV10d4bdSKtiJlfv0
 fJbzMnAgp8gElug+0CGqGpSxqASQfcmVqEBiDVK0HpCVcBXHU2FDY3oQC5O4wHE1TRF5yvp7A
 QQPwa53cjj9/C8V8J8rP6hECB0yngonduDzFAv8CWhglelwsSkI1FvFJ0uvtFKB0IM49s7ZaD
 mEGUvZpSHK2N/8ncePRKAJNq/Suhm+/QbnWIUir0urrzNQEcbZ2XfThzVFlzfgLDtmypNT0O6
 G53AM7g975SRM+uXqtmmuwM+cFIfKYFwNKLAH3nw4yUA1kmLC2JwoayONqN1vFfUbM1I6Hiek
 3y2s=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 11, 2021 at 10:39 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
> On Tue, May 11, 2021 at 08:53:53PM +0900, Tetsuo Handa wrote:

> > #define GENMASK_INPUT_CHECK(h, l) \
> >      (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> >           __builtin_constant_p((l) > (h)), (l) > (h), 0)))
> >
> > __GENMASK() does not need "h" and "l" being a constant.
> >
> > Yes, small_const_nbits(size) in find_next_bit() can guarantee that "size" is a
> > constant and hence "h" argument in GENMASK_INPUT_CHECK() call is also a constant.
> > But nothing can guarantee that "offset" is a constant, and hence nothing can
> > guarantee that "l" argument in GENMASK_INPUT_CHECK() call is also a constant.
> >
> > Then, how can (l) > (h) in __builtin_constant_p((l) > (h)) be evaluated at build time
> > if either l or h (i.e. "offset" and "size - 1" in find_next_bit()) lacks a guarantee of
> > being a constant?
> >
>
> So the idea is that if (l > h) is constant, __builtin_constant_p should
> evaluate that, and if it is not it should use zero instead as input to
> __builtin_chose_expr(). This works with non-const inputs in many other
> places in the kernel, but apparently in this case with a certain
> compiler, it doesn't so I guess we need to work around it.

I have a vague memory that __builtin_constant_p() inside of
__builtin_choose_expr()
always evaluates to false because of the order in which the compiler processes
those: If constant-folding only happens after __builtin_choose_expr(), then
__builtin_constant_p() has to be false.

        Arnd
