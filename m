Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01BCC2D0CB
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Dec 2022 09:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiLOJj4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Dec 2022 04:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiLOJjy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Dec 2022 04:39:54 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CCB52169
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Dec 2022 01:39:53 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id i20so4672532qtw.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Dec 2022 01:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jp/+Wj6EIr+L03jV36seXrIL7qHbU6yeUB4I93Scy3s=;
        b=wEcyE4khyPL2a8MWebT3XW9MvmMmq2QtcdZciDxB0XwOSrphEUYR3fYuCK7N8P32bo
         m0TsyegfdrigOgitp2jMiuHacaDMyofByM9MChhPh0lP7UMQK1JgA21hx0WuoevJwrgR
         wnJNhHkkEH8ENc8ejBytfURTEmX1+4+8xjQEehEJNzQwEjRGtYNAZ1IHcN9qAyyAi5rx
         YFe9J3O6nDOK5c/1mG31fsteGBMjEIUuCGFXb5uYP4wtsZoZVAjMsL37ajUG553w8/x/
         VLNGsV7Rw4hoHfJzYNVzwVhp1kKepSE7g2shbaEnAtFwfTnQ+IvjMLTgpwgAWNIXHArc
         xgMQ==
X-Gm-Message-State: ANoB5pn/XMBIf2oz1tasNBQbZZw/8mpF6q/NzrHN+7vV4VPTbfGbhlFd
        QNPPfz9z4/PuX2e1ZQhApsnlKtnKkLZaRQ==
X-Google-Smtp-Source: AA0mqf7qvneIUSrRcKa2BD9a3uhk/WcZOrE0fbbfXUqkYXdhtshPMbJUfBe0uVUCS6K1kFqfqDkZCw==
X-Received: by 2002:a05:622a:4c8b:b0:3a8:43:3bb0 with SMTP id ez11-20020a05622a4c8b00b003a800433bb0mr40864517qtb.53.1671097192200;
        Thu, 15 Dec 2022 01:39:52 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id x8-20020ac84d48000000b00398a7c860c2sm3175671qtv.4.2022.12.15.01.39.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 01:39:51 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 2so2787700ybl.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Dec 2022 01:39:50 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr34405249ybg.36.1671097190502; Thu, 15
 Dec 2022 01:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20221115083349.1662-1-thunder.leizhen@huawei.com>
 <CAMuHMdWM6+pC3yUqy+hHRrAf1BCz2sz1KQv2zxS+Wz-639X-aA@mail.gmail.com> <ad09966d-9357-1c32-e491-a402af8dac6e@huawei.com>
In-Reply-To: <ad09966d-9357-1c32-e491-a402af8dac6e@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 10:39:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=KXfYc3Rqz6LizJcDxRX3BzUFTPpdTpDB68sw+QPJ=A@mail.gmail.com>
Message-ID: <CAMuHMdW=KXfYc3Rqz6LizJcDxRX3BzUFTPpdTpDB68sw+QPJ=A@mail.gmail.com>
Subject: Re: [PATCH v9] kallsyms: Add self-test facility
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Josh Poimboeuf <jpoimboe@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        David Laight <David.Laight@aculab.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Zhen,

On Thu, Dec 15, 2022 at 10:16 AM Leizhen (ThunderTown)
<thunder.leizhen@huawei.com> wrote:
> On 2022/12/15 16:50, Geert Uytterhoeven wrote:
> > On Tue, Nov 15, 2022 at 9:41 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
> >> Added test cases for basic functions and performance of functions
> >> kallsyms_lookup_name(), kallsyms_on_each_symbol() and
> >> kallsyms_on_each_match_symbol(). It also calculates the compression rate
> >> of the kallsyms compression algorithm for the current symbol set.
> >>
> >> The basic functions test begins by testing a set of symbols whose address
> >> values are known. Then, traverse all symbol addresses and find the
> >> corresponding symbol name based on the address. It's impossible to
> >> determine whether these addresses are correct, but we can use the above
> >> three functions along with the addresses to test each other. Due to the
> >> traversal operation of kallsyms_on_each_symbol() is too slow, only 60
> >> symbols can be tested in one second, so let it test on average once
> >> every 128 symbols. The other two functions validate all symbols.
> >>
> >> If the basic functions test is passed, print only performance test
> >> results. If the test fails, print error information, but do not perform
> >> subsequent performance tests.
> >>
> >> Start self-test automatically after system startup if
> >> CONFIG_KALLSYMS_SELFTEST=y.
> >>
> >> Example of output content: (prefix 'kallsyms_selftest:' is omitted
> >>  start
> >>   ---------------------------------------------------------
> >>  | nr_symbols | compressed size | original size | ratio(%) |
> >>  |---------------------------------------------------------|
> >>  |     107543 |       1357912   |      2407433  |  56.40   |
> >>   ---------------------------------------------------------
> >>  kallsyms_lookup_name() looked up 107543 symbols
> >>  The time spent on each symbol is (ns): min=630, max=35295, avg=7353
> >>  kallsyms_on_each_symbol() traverse all: 11782628 ns
> >>  kallsyms_on_each_match_symbol() traverse all: 9261 ns
> >>  finish
> >>
> >> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >
> > Thanks for your patch, which is now commit 30f3bb09778de64e ("kallsyms:
> > Add self-test facility") in linus/master.
> >
> > I gave this a try on m68k (atari_defconfig + CONFIG_KALLSYMS_SELFTEST=y),
> > but it failed:
> >
> >     start
> >     kallsyms_lookup_name() for kallsyms_test_func_static failed:
> > addr=0, expect 60ab0
> >     kallsyms_lookup_name() for kallsyms_test_func failed: addr=0, expect 60ac0
> >     kallsyms_lookup_name() for kallsyms_test_func_weak failed: addr=0,
> > expect 60ac2
> >     kallsyms_lookup_name() for vmalloc failed: addr=0, expect c272a
> >     kallsyms_lookup_name() for vfree failed: addr=0, expect c2142
> >     kallsyms_on_each_match_symbol() for kallsyms_test_func_static
> > failed: count=0, addr=0, expect 60ab0
> >     kallsyms_on_each_match_symbol() for kallsyms_test_func failed:
> > count=0, addr=0, expect 60ac0
> >     kallsyms_on_each_match_symbol() for kallsyms_test_func_weak
> > failed: count=0, addr=0, expect 60ac2
> >     kallsyms_on_each_match_symbol() for vmalloc failed: count=0,
> > addr=0, expect c272a
> >     kallsyms_on_each_match_symbol() for vfree failed: count=0, addr=0,
> > expect c2142
> >     abort
> >
> > Given all addresses are zero, it looks like some required functionality
> > or config option is missing.
> >
> > $ grep SYM .config
> > CONFIG_KALLSYMS=y
> > CONFIG_KALLSYMS_SELFTEST=y
> > CONFIG_KALLSYMS_BASE_RELATIVE=y
> > # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> > CONFIG_SYMBOLIC_ERRNAME=y
> > # CONFIG_STRIP_ASM_SYMS is not set
> > CONFIG_KALLSYMS_SELFTEST
> >
> > Do you have a clue?
>
> cat /proc/kallsyms | grep kallsyms_test_func
> Let's see if the compiler-generated symbols have some special suffixes.

Thanks, looks normal to me:

    atari:~# cat /proc/kallsyms | grep kallsyms_test_func
    00060ab0 t kallsyms_test_func_static
    00060ac0 T kallsyms_test_func
    00060ac2 W kallsyms_test_func_weak
    atari:~#

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
