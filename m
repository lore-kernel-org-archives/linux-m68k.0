Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CBEC5479D
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Jan 2023 08:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbjABI3q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Jan 2023 03:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjABI3S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Jan 2023 03:29:18 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C59E47
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Jan 2023 00:29:17 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id h26so22039258qtu.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Jan 2023 00:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zbtsyLDE+wPwkATs9/xlAjvp9QCBVfBrqTl0t3/H28=;
        b=ApM/RmaqXPIKarKM4Isoxvv9b05miv8zw2BldAKlWpbKrl9SS+ummUdohtbSmMxqsm
         oxR89HTPOSu7kfw7lWg2GJQ5hJGG/2YnSZFA/QXi3JhWyNeHubaA3cPNySCxMS9b5ItI
         wMUJ226imAXWVU8exo02bHc4LFR12n96hLqgNwilu0rvh24Y3K1niMiV1qbdaDzEgQxD
         gJV8KueHqn7pmVAdSPbEMbeiXbq6JUZjfmOIKkdiEeT4qrzCVAg8u2FEgUh+Lvg11DMt
         TYaGtH6nqaQPNuWPAPX6TM69aAZfcHGM4MfW7l7I3WdRTgmDHT80LNt5r9YGJguQ+Rp7
         K96w==
X-Gm-Message-State: AFqh2kqNrimTABTRNIwurTmTZRRdbrEHM+NDy4kAgYMrXXtCCtee47zS
        jt8EoOmc108U3qK6N6fadx5TkKgvyFsYHg==
X-Google-Smtp-Source: AMrXdXuOxZl1dGHnhirdLE7SyUxC42Mjmvs5jjxp4np2k0Ud7nSoBAF5xnbV2KcBhBhw7ZiIIh4bYg==
X-Received: by 2002:a05:622a:1dcb:b0:3a7:e426:2892 with SMTP id bn11-20020a05622a1dcb00b003a7e4262892mr62735769qtb.28.1672648156321;
        Mon, 02 Jan 2023 00:29:16 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id bk2-20020a05620a1a0200b006ff8ac9acfdsm20212374qkb.49.2023.01.02.00.29.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 00:29:15 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id j206so29604246ybj.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Jan 2023 00:29:14 -0800 (PST)
X-Received: by 2002:a25:aae1:0:b0:6fc:1c96:c9fe with SMTP id
 t88-20020a25aae1000000b006fc1c96c9femr5228868ybi.36.1672648154519; Mon, 02
 Jan 2023 00:29:14 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
 <b2144334261246aa8dc5004c5f1a58c9@AcuMS.aculab.com> <f02e0ac7f2d805020a7ba66803aaff3e31b5eeff.camel@t-online.de>
 <357cbd67260040e4bcf17d519aaafdcb@AcuMS.aculab.com>
In-Reply-To: <357cbd67260040e4bcf17d519aaafdcb@AcuMS.aculab.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Jan 2023 09:29:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWP2GoBU8nwwDP2m_SUxV2sD67nTPyKjQ0Skjc7q7bcNw@mail.gmail.com>
Message-ID: <CAMuHMdWP2GoBU8nwwDP2m_SUxV2sD67nTPyKjQ0Skjc7q7bcNw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     David Laight <David.Laight@aculab.com>
Cc:     Holger Lubitz <holger.lubitz@t-online.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi David,

On Fri, Dec 30, 2022 at 12:39 PM David Laight <David.Laight@aculab.com> wrote:
> Thinking further the fastest strcmp() probably uses big-endian word compares
> with a check for a zero byte.
> Especially on 64 bit systems that support misaligned loads.
> But I'd need to think hard about the actual details.

arch/arc/lib/strcmp-archs.S
arch/csky/abiv2/strcmp.S

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
