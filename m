Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3836C433ED
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 09:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A6BC610CD
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Apr 2021 09:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhDAJ3Z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Apr 2021 05:29:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38687 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbhDAJ3M (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Apr 2021 05:29:12 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9FX5-1lVSPR1S6x-006NpL for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Apr
 2021 11:29:10 +0200
Received: by mail-ot1-f49.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so1577430oto.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Apr 2021 02:29:10 -0700 (PDT)
X-Gm-Message-State: AOAM530n2Jl0qVY0HZqqA3UniTtB4XS9oG3zYgrRl3xAyuAEqyN2x07o
        9c/YFD0XUwBF8yZDUv2Urbxicl78Q55youIIOls=
X-Google-Smtp-Source: ABdhPJx3QsdoGUsw9pHERckr3f5KeRsspxanWz7xZVoNUPIClyIXxiSoe95afl7728tbFkutzVy8X1AghVyQZnowz7E=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr6210224otk.305.1617269349103;
 Thu, 01 Apr 2021 02:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210401003153.97325-1-yury.norov@gmail.com> <CAHp75VdzRXPsQ7Jvivm5UU+mfkgQ_0rmnegp04v-v9fwrjdrqg@mail.gmail.com>
In-Reply-To: <CAHp75VdzRXPsQ7Jvivm5UU+mfkgQ_0rmnegp04v-v9fwrjdrqg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 1 Apr 2021 11:28:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EGc4BS7UTyC6=ySgLEoyqbswh1Gh_=M21NmhRThssYQ@mail.gmail.com>
Message-ID: <CAK8P3a2EGc4BS7UTyC6=ySgLEoyqbswh1Gh_=M21NmhRThssYQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] lib/find_bit: fast path for small bitmaps
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Alexey Klimov <aklimov@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Sterba <dsterba@suse.com>,
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
X-Provags-ID: V03:K1:wL7qnR3yMAl+/XC2oaqlyeNv/w5U5otkWE3o+SNy+1PiEdHvHYR
 MdeyKPWb2KgkJqJk3pkOBGwq17y9vs7HvEAt7Zz9zzx593jqpk8mB8WPs1AwHgoX96vBcBH
 WtCSKoSfrlyoMeeZoe5BUMrStg4vYqS7DQ5PkPZUml+HmVrCp+k2BpMwanFlJY04OcP9xCO
 c8e4RmwgjHbbLZLGXCbRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VeROZc6utW8=:0mXAtcV1zU96zkDcErb+MH
 z0Zxr7AxoKRofXAmMzuKJGYuqACZbWAEQr47vh8PImMv+SBCD7+4sOxDw6ZogQtXHivthGrZR
 reGXlmO9AtcfJDT/amBKULE3cG+ZwrPKJaGirL45FU1wbweu9b/Be+TFg6VYcs13nKTeObKBe
 ibqnidSQ/CpbBM3yiv9jYTb+QUh6fFeQ9QHva7evE8bU2qSjJC3FelBE4jx7+rO1kERiRP+EC
 vdG/y9yqzHox5AUeBhv2dD/iOtMA6CHfl1ToC0YQUCEqKkBSkWfyFKnMg6078+yKhZwg9VZNM
 r/EUqblHfd8DhIvS9/zz4GPiSShuRoS5y9xoPKTWCTkznpzLzDoFQNrmjh3AFagALvMEYHgYu
 BJTyYd4BQ4pQW43T6sY21F65rI5PIICUoUzyTZ1w/D2JqIU76Upz3/A21PBnUbqS3GftUQKJ7
 BQZB9p0gHUkMwTRLQTh58dTKSEWmzz0=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 1, 2021 at 11:16 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 1, 2021 at 3:36 AM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Bitmap operations are much simpler and faster in case of small bitmaps
> > which fit into a single word. In linux/bitmap.c we have a machinery that
> > allows compiler to replace actual function call with a few instructions
> > if bitmaps passed into the function are small and their size is known at
> > compile time.
> >
> > find_*_bit() API lacks this functionality; but users will benefit from it
> > a lot. One important example is cpumask subsystem when
> > NR_CPUS <= BITS_PER_LONG.
>
> Cool, thanks!
>
> I guess it's assumed to go via Andrew's tree.
>
> But after that since you are about to be a maintainer of this, I think
> it would make sense to send PRs directly to Linus. I would recommend
> creating an official tree (followed by an update in the MAINTAINERS)
> and connecting it to Linux next (usually done by email to Stephen).

It depends on how often we expect to see updates to this. I have not
followed the changes as closely as I should have, but I can also
merge them through the asm-generic tree for this time so Andrew
has to carry fewer patches for this.

I normally don't have a lot of material for asm-generic either, half
the time there are no pull requests at all for a given release. I would
expect future changes to the bitmap implementation to only need
an occasional bugfix, which could go through either the asm-generic
tree or through mm and doesn't need another separate pull request.

If it turns out to be a tree that needs regular updates every time,
then having a top level repository in linux-next would be appropriate.

        Arnd
