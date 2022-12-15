Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2924C46467
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Dec 2022 08:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiLOIvB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Dec 2022 03:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiLOIvB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Dec 2022 03:51:01 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EA61BEB8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Dec 2022 00:51:00 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id h16so4645304qtu.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Dec 2022 00:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IObtWoKZrv/byxcXlzYwmVNDpTjH/MksUA6nr3afl+k=;
        b=RXS9JTwX4CqkigtUaJ1fMKufn+lP1/PgT4qyE25FexKSlR18FkBYImEj/JlF+wVbDY
         kQlaD9SECBCQ/2/xctREOWHpJTD0THGEy4XzQbM/M1r3j632L1qWhX6mRBk6rXrXQGb5
         hfx2GyAToZkpf8Ukt+6LgB0fKHcIStfiHdzUjK31SQWas8Hph/ZKZa1ilTdIXkBPJ0g0
         jwIH6EOUOzabQc0Fcaymdf1bB1YNnbwqJQjue0qJfS7IdI7Ou2DHjv4QhU0q434Zv8pf
         HR7bgVa2fKO7DpZ+qRQXJ5utZEQT4n8HRMfVFf9YRucjGvWYseLYYz9j0riC0DmLumw6
         QISg==
X-Gm-Message-State: ANoB5pkjb0fjb8NWE0KaEH8sgPCOXEtk1aET9P0Rn6y9NRI3krmVawQj
        MtsP+ZAAlI3kNLsqNXJK60/bidrr5j+quw==
X-Google-Smtp-Source: AA0mqf5psrh7up6FFsY0MKAUAzpqj9TshgvkMxODbOPoPbW8MhlLkDpkvPLewccCnTFY4ydUZ/S78g==
X-Received: by 2002:a05:622a:1f11:b0:3a7:f4cc:8dd5 with SMTP id ca17-20020a05622a1f1100b003a7f4cc8dd5mr44804908qtb.34.1671094258860;
        Thu, 15 Dec 2022 00:50:58 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id m11-20020a05620a290b00b006fc6529abaesm11722146qkp.101.2022.12.15.00.50.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 00:50:57 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id o127so2710219yba.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Dec 2022 00:50:56 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr34386835ybg.36.1671094256707; Thu, 15
 Dec 2022 00:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20221115083349.1662-1-thunder.leizhen@huawei.com>
In-Reply-To: <20221115083349.1662-1-thunder.leizhen@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 09:50:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM6+pC3yUqy+hHRrAf1BCz2sz1KQv2zxS+Wz-639X-aA@mail.gmail.com>
Message-ID: <CAMuHMdWM6+pC3yUqy+hHRrAf1BCz2sz1KQv2zxS+Wz-639X-aA@mail.gmail.com>
Subject: Re: [PATCH v9] kallsyms: Add self-test facility
To:     Zhen Lei <thunder.leizhen@huawei.com>
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

On Tue, Nov 15, 2022 at 9:41 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
> Added test cases for basic functions and performance of functions
> kallsyms_lookup_name(), kallsyms_on_each_symbol() and
> kallsyms_on_each_match_symbol(). It also calculates the compression rate
> of the kallsyms compression algorithm for the current symbol set.
>
> The basic functions test begins by testing a set of symbols whose address
> values are known. Then, traverse all symbol addresses and find the
> corresponding symbol name based on the address. It's impossible to
> determine whether these addresses are correct, but we can use the above
> three functions along with the addresses to test each other. Due to the
> traversal operation of kallsyms_on_each_symbol() is too slow, only 60
> symbols can be tested in one second, so let it test on average once
> every 128 symbols. The other two functions validate all symbols.
>
> If the basic functions test is passed, print only performance test
> results. If the test fails, print error information, but do not perform
> subsequent performance tests.
>
> Start self-test automatically after system startup if
> CONFIG_KALLSYMS_SELFTEST=y.
>
> Example of output content: (prefix 'kallsyms_selftest:' is omitted
>  start
>   ---------------------------------------------------------
>  | nr_symbols | compressed size | original size | ratio(%) |
>  |---------------------------------------------------------|
>  |     107543 |       1357912   |      2407433  |  56.40   |
>   ---------------------------------------------------------
>  kallsyms_lookup_name() looked up 107543 symbols
>  The time spent on each symbol is (ns): min=630, max=35295, avg=7353
>  kallsyms_on_each_symbol() traverse all: 11782628 ns
>  kallsyms_on_each_match_symbol() traverse all: 9261 ns
>  finish
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Thanks for your patch, which is now commit 30f3bb09778de64e ("kallsyms:
Add self-test facility") in linus/master.

I gave this a try on m68k (atari_defconfig + CONFIG_KALLSYMS_SELFTEST=y),
but it failed:

    start
    kallsyms_lookup_name() for kallsyms_test_func_static failed:
addr=0, expect 60ab0
    kallsyms_lookup_name() for kallsyms_test_func failed: addr=0, expect 60ac0
    kallsyms_lookup_name() for kallsyms_test_func_weak failed: addr=0,
expect 60ac2
    kallsyms_lookup_name() for vmalloc failed: addr=0, expect c272a
    kallsyms_lookup_name() for vfree failed: addr=0, expect c2142
    kallsyms_on_each_match_symbol() for kallsyms_test_func_static
failed: count=0, addr=0, expect 60ab0
    kallsyms_on_each_match_symbol() for kallsyms_test_func failed:
count=0, addr=0, expect 60ac0
    kallsyms_on_each_match_symbol() for kallsyms_test_func_weak
failed: count=0, addr=0, expect 60ac2
    kallsyms_on_each_match_symbol() for vmalloc failed: count=0,
addr=0, expect c272a
    kallsyms_on_each_match_symbol() for vfree failed: count=0, addr=0,
expect c2142
    abort

Given all addresses are zero, it looks like some required functionality
or config option is missing.

$ grep SYM .config
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_SELFTEST=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_ASYMMETRIC_KEY_TYPE is not set
CONFIG_SYMBOLIC_ERRNAME=y
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_KALLSYMS_SELFTEST

Do you have a clue?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
