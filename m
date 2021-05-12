Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AA2C433ED
	for <linux-m68k@archiver.kernel.org>; Wed, 12 May 2021 08:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEA03611CE
	for <linux-m68k@archiver.kernel.org>; Wed, 12 May 2021 08:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhELIfQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 May 2021 04:35:16 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60667 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhELIfP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 May 2021 04:35:15 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKt3r-1lx3JK0H8P-00LHrC for <linux-m68k@lists.linux-m68k.org>; Wed, 12
 May 2021 10:34:07 +0200
Received: by mail-wr1-f47.google.com with SMTP id x8so430484wrq.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 May 2021 01:34:06 -0700 (PDT)
X-Gm-Message-State: AOAM532QpvXIVVSB8jQvTW0eeILwWpVXH6ZVQu+0yrSig9ZftyS/6RPj
        3coXWJQAEUFOkCtRSXke3C+jzASvGd9B8UbBGHo=
X-Google-Smtp-Source: ABdhPJy/2uRU9aSi9rjDqWPnVEgag1L9JoJOkhRvHxsygwED7kOpnGuz239zZP+9k1tyTkHBE/oRIWT9z+C6YV5aUq8=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr44897685wrz.105.1620808446720;
 Wed, 12 May 2021 01:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210401003153.97325-1-yury.norov@gmail.com> <20210401003153.97325-12-yury.norov@gmail.com>
 <1ac7bbc2-45d9-26ed-0b33-bf382b8d858b@I-love.SAKURA.ne.jp>
 <CAHp75Vea0Y_LfWC7LNDoDZqO4t+SVHV5HZMzErfyMPoBAjjk1g@mail.gmail.com>
 <YJm5Dpo+RspbAtye@rikard> <YJoyMrqRtB3GSAny@smile.fi.intel.com>
 <YJpePAHS3EDw6PK1@rikard> <151de51e-9302-1f59-407a-e0d68bbaf11c@i-love.sakura.ne.jp>
 <YJrrJhvwq7RUvDXD@rikard> <CAK8P3a02qNHcksJ8DahHgLtbM9ZOydGjE3__3GoxgJFiWrAT0w@mail.gmail.com>
 <030ae370-967c-22d4-56f8-cb0435be7540@rasmusvillemoes.dk>
In-Reply-To: <030ae370-967c-22d4-56f8-cb0435be7540@rasmusvillemoes.dk>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 12 May 2021 10:33:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1u3WnVAasCXG-sk=7cM2HCcitFWtXvn5hzCnpFU85Lxg@mail.gmail.com>
Message-ID: <CAK8P3a1u3WnVAasCXG-sk=7cM2HCcitFWtXvn5hzCnpFU85Lxg@mail.gmail.com>
Subject: Re: [PATCH 11/12] tools: sync lib/find_bit implementation
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
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
X-Provags-ID: V03:K1:cOjraI0LXTQjRp+WqzqSVzJGoF7SqxUSsM3rWnVJXsN5R3N08vD
 ezrcgJ8AbKpFphXRMLqObFr+JW6pz5J76UkmFTsGkvryq+Jdj4V8Xpq7svNkxpjRJNRDO6b
 8yPT8ShXdb5NIyMWvxreuYrDSI9y59E1+IeyzONqlkd4vtPJ2F++izvN5HFWbDYEzbqGjoc
 kM+nyY8Of0pOPyw65rRPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vuwH10C1yTk=:of2sQx2yjRkOhc4yuH5iAI
 aYBU4HgZ67UNVbIDokVvNdP0ynnyH3cuXz3SyLFNuBUNLHLFj5mOP5LG2BnDqdCbMQlfM8bJt
 +hVbVwo+A1ELqKDQlDSkPtvHYqymbakC7PWdANRCuEzUos29X3oL90ivEiTLzYmfOhvhq1Nir
 j/SiRJ+t0W7TXJopoAC58+Fk7e46yJa4vD+JWVzJAggTUDnDPVxsg8LIdk7Nt//HkAuZ2pbSy
 8UD7DHrob387dN1SUY40dql1wr2lg/VL6kq/AkrxLuzTwC2c/M/YGKfwxNtqrMYllC5OzIAgh
 6GI5RxnhK2xF2h/cFT61uxCd3IPeP+K2tqOmKivjVXb3Y6m2UyDKy6fMAjxUAf6mW26TMcly8
 7TD1qZmQgRiF7XRvNN3kLXI6vC/vzmHCOQKw0RC904fPBHn5cCwKWunV+k0nki2yu8VdaYAEv
 J+YvmanQZ7JCy38i0V/F/EftP8p1LRVcefuCE6yzr7LQjeLYzkZbkwOiB6BuMyfuPNhtGrMj5
 rLfrQ0yUdGSlcNIojhq+8Wz5XHFqbTeQzVm4zkxwp/iXPeizVtlsd746UH0gK5xQ+3RYh4ie/
 FCyFoiYhtZ+/4I0HpbVSEow0/1GEX+hIFeKRkc5gfrBrX/457e0gmjcIGXPWFFOoAPEAYWF72
 BcV0=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 12, 2021 at 10:16 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> It's more complicated than that. __builtin_constant_p on something which
> is a bona-fide Integer Constant Expression (ICE) gets folded early to a
> 1. And then it turns out that such a __builtin_constant_p() that folds
> early to a 1 can be "stronger" than a literal 1, in the sense that when
> used as the controlling expression of a ?: with nonsense in the false
> branch, the former is OK but the latter fails:
>
> https://lore.kernel.org/lkml/c68a0f46-346c-70a0-a9b8-31747888f05f@rasmusvillemoes.dk/
>
> Now what happens when the argument to __builtin_constant_p is not an ICE
> is a lot more complicated. The argument _may_ be so obviously
> non-constant that it can be folded early to a 0, hence still be suitable
> as first argument to __b_c_e. But it is also possible that the compiler
> leaves it unevaluated, in the "hope" that a later optimization stage
> could prove the argument constant. And that's the case where __b_c_e
> will then break, because that can't be left unevaluated for very long -
> the very _type_ of the result depends on which branch is chosen.
>
> tl;dr: there's no "order in which the compiler processes those", __b_c_p
> can get evaluated (folded) early, before __b_c_e inspects it, or be left
> for later stages.

Thanks for the detailed explanation. Checking the actual behavior of
a trivial example, I find that

int f(void)
{
    const int i = 1;
    return __builtin_choose_expr(__builtin_constant_p(i), 1, 2);
}

used to return '2' with gcc-7, which is what I remembered.
With gcc-8 and up as well as any version of clang, it returns '1' now:
https://godbolt.org/z/7eKjbMocb

I have also seen a couple of cases where __builtin_constant_p()
without a __builtin_choose_expr() ended up unexpectedly
returning true when gcc found a code path that it would be constant
(e.g. conditionally initializing a variable to one of two possible
ICEs), but then later turning that back into a non-constant
expression in a later optimization stage. There is probably also
a much more detailed explanation behind those.


        Arnd
