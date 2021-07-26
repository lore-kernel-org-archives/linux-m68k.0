Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E021DC4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 07:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C80E360F02
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 07:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhGZGsx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jul 2021 02:48:53 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:45834 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhGZGsw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jul 2021 02:48:52 -0400
Received: by mail-ua1-f44.google.com with SMTP id t26so3177267uao.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jul 2021 00:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NG27AyXXZCjyF9qPFwESDtcNxflCSnT0u4Wh1DD8tKI=;
        b=GNoZHFVYWH4jSoUkHFuLordcH6mfYqggIuW6Ct53B30y6n5rQ1H7wHuDdeCcesUc27
         /F1oSCf3I5P3Md7uQgGl2xVoQn1HFBMPX2KRxV382BCnIQrruy4H+XCHx8LwgIupDS0W
         FDB9r4ZoimWPim8+YtQunEJh8LSdKeAnDcnNTCH34wpc+zqsuSzH9g5nKSGhNWsuzJXg
         JCOEbNDkdCBZ5exuPpTHCyCiWHUlsPfEzSweSjp1MwptoQmBMTV4bzDXXsk8jr8gtIW6
         iELp0reaZWLv5cs5rTRuuU7P7Sjdbj8DshYR3Q0DUfM8n5HOOtMbPWwC74ekwLUOSoHi
         sJOg==
X-Gm-Message-State: AOAM533+PB1Tva/9I7EnL9+5HO2o+2HR5v4CWZj2LjOy+oqlMGrzDdvR
        aBDqTK7lllrLojR7VdQ+OnF6b5C1JDgKtdesOcg=
X-Google-Smtp-Source: ABdhPJxLD4ikNVv07En0vqEiq9snN7hRwnpHZdlIycaLnBHc8MiULtoCWq/tCZCRcWxDgsRkki9Dc9AF3qfRocp1KNE=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr11373970uam.106.1627284561331;
 Mon, 26 Jul 2021 00:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210725104618.365790-1-geert@linux-m68k.org> <87r1fm4gkc.fsf@igel.home>
In-Reply-To: <87r1fm4gkc.fsf@igel.home>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 09:29:10 +0200
Message-ID: <CAMuHMdVbZtnOMsc0p84bTX5RJXeYN-hcW4=W0En04nf_b1WKGw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix asm register constraints for atomic ops
To:     Andreas Schwab <schwab@linux-m68k.org>
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

Hi Andreas,

On Sun, Jul 25, 2021 at 4:24 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Jul 25 2021, Geert Uytterhoeven wrote:
> > Depending on register assignment by the compiler:
> >
> >     {standard input}:3084: Error: operands mismatch -- statement `andl %a1,%d1' ignored
> >     {standard input}:3145: Error: operands mismatch -- statement `orl %a1,%d1' ignored
> >     {standard input}:3195: Error: operands mismatch -- statement `eorl %a1,%d1' ignored
> >
> > Indeed, the first operand must not be an address register.  Fix this by
> > adjusting the register constraint from "g" (general purpose register) to
> > "d" (data register).
>
> You should also allow immediate ("i").

Good point.

> There is the ASM_DI macro for that, but since CONFIG_RMW_INSNS is never
> defined for CONFIG_COLDFIRE, it probably doesn't matter.

As the second operand is a register, not memory, there is no need to
use ASM_DI, and "di" should be fine, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
