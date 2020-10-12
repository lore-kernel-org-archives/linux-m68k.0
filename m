Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA230C4363A
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FAB82076E
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388709AbgJLNPM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:15:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45927 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388548AbgJLNPL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:15:11 -0400
Received: by mail-oi1-f195.google.com with SMTP id j7so1101801oie.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpOWl2K8xGZe8ObyWcT/Rs8C0sopZbqbVvo88pQRdW8=;
        b=B6zpGr/UyFFMbZ9o8vw8Xf+Np8Mwn6ne1l0nY0hCTKWiGmJ5GYl+sX4OPlhKeV5lOo
         g77QIbnGOkJ1iptMnkRVL4Xz/bT3fnkoRT7UkdApqHURICw32DR6ZHGtwCdDlbYn6CEc
         vk65XKvXglkGqXGxGIvlW6D2N2LXuBRi13TfGE0X9tboKj/oEbgSf97iBWAnxHr8n8zH
         6Pf0iJRycAab4wJTl1+tYZNssLDXzc4Lp5Js+YbAdyynyHy7XRmXTV3ux16TFMSR5Lex
         9xlgx88DA9Be0nwXvatw59chXdDtnX66DW10/7pvUahLC1ZcjVgKWI7pSKBsekJZ7tKX
         aAKQ==
X-Gm-Message-State: AOAM531aad4/WotO40MP6NkGLe79woLdkhNLCx0yIDnn3di4WdGsZKQv
        BsEl5vmTcjlu/v1nwjmg5SkY8D8UieuvxliUKqs=
X-Google-Smtp-Source: ABdhPJx4N97WaNtxkBiGWavGJamYpC2k/3nsjt/ifSHOvJJxlsVXZ3k/2Mj9uJqTjcLeGamsrfAVV4ILuEa2QQZHLEA=
X-Received: by 2002:aca:c490:: with SMTP id u138mr10798781oif.54.1602508510780;
 Mon, 12 Oct 2020 06:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-7-arnd@arndb.de>
In-Reply-To: <20201008154651.1901126-7-arnd@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 15:14:59 +0200
Message-ID: <CAMuHMdWPcw39MZotZtBP-b_CiiaX0iyys5SyuK6TYQQZ0+k_PQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] m68k: split heartbeat out of timer function
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 8, 2020 at 5:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
> The heartbeat functionality is mostly separate from the
> actual timer interrupt handling, and it is only used on
> five platforms.
>
> Split it out into a separate function and call that directly
> from the timer irq on those platforms.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

And finally (for Amiga):
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
