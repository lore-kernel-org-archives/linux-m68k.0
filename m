Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9806FC432BE
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 07:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD3B6052B
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 07:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhGZGy2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jul 2021 02:54:28 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:37869 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhGZGy2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jul 2021 02:54:28 -0400
Received: by mail-vs1-f47.google.com with SMTP id o8so4746437vss.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jul 2021 00:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvM7HjIDAYdvcqBKdK4pW118x+lT4xSLF2Y4SSYHsTM=;
        b=GJI2a7mNnKvUxQPrcsqbwfQzoTCRwTlWwKFtE5BegXdN4qUaDWOleCcnFmegD3K2sD
         z22IKo5Ptwer68m9UiU8h8cauzPL/6G0fNu9JCQgeUBwvQsQ2k7iIKB0A9TPsWWe9Wk6
         EcLRkuMA3TjWLCtumTvGq2yG4syfg5JsQPd4TRY3iLtwE7QIQN7L80XMhZZc6JiHiz1U
         IdmwdLq/TZvlAeef7x5OqItJrxttlRE572CIATn26f9TkRIQrrus/O1dhWYmQrD429la
         +X7qKD4Awb7WSMd+M6ALbwvlYBPYHdiFLBFKwQs2eivtyP+JV0LKuC4RDx6U8k1d/Y//
         6WKA==
X-Gm-Message-State: AOAM532cMhoPNa+wcP5YmBqE+/jAnfw0BtW12dwU1JXd5zrbWNvjfUm/
        UQ7IJyxLEgVKp7FPYyLU9OhjQ1ODDBS1IdCrU6c=
X-Google-Smtp-Source: ABdhPJx8y2O7mgeJAugSzCWIY61iUi7ZxClLxCsa1DNFsUBFPW2qrbU8WUBynTZ/eTGTlqN+R98llDtD2uuWvrBGo2s=
X-Received: by 2002:a05:6102:2828:: with SMTP id ba8mr11201079vsb.18.1627284896108;
 Mon, 26 Jul 2021 00:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210725104618.365790-1-geert@linux-m68k.org> <db2de193-a10-598-a21e-3a305b91d191@linux-m68k.org>
In-Reply-To: <db2de193-a10-598-a21e-3a305b91d191@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 09:34:45 +0200
Message-ID: <CAMuHMdWrg7zUC+iMjXS=RS=Fa7ZVS-0iycjQ2UP6W0pHzdGxKQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix asm register constraints for atomic ops
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Greg Ungerer <gerg@uclinux.org>, Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Brendan Jackman <jackmanb@google.com>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, Jul 26, 2021 at 1:45 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Sun, 25 Jul 2021, Geert Uytterhoeven wrote:
> > Fixes: d839bae4269aea46 ("locking,arch,m68k: Fold atomic_ops")
> > ...
> > Technically, the issue was present before, but I doubt adding pre-v3.18
> > Fixes tags would make any difference for stable...
>
> There is a better way to constrain backporting, that is Cc:
> stable@vger.kernel.org # 3.12+

I don't want to constrain backporting.

> The reason I mention it is that Fixes tags could be seen as a way to
> identify commits that introduce bugs, e.g. for the purposes of training

OK, had a look through the full log....
There are no other commits introducing the bug (renaming and
merging files without changing functions doesn't count), except for the
initial import into git. So I'll add that one, too.

> AIs, or attributing blame, or measuring quality etc. I think it would be
> unfair to point the finger at Peter's commit.

The first Fixes commit definitely introduced a new buggy user.
The second Fixes commit is debatable, as it copied the bug for a new
function from two functions that were removed in the process.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
