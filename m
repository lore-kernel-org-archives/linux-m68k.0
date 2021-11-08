Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96155C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F09561215
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237374AbhKHICv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 03:02:51 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:43563 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhKHICu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 8 Nov 2021 03:02:50 -0500
Received: by mail-pj1-f53.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso8166814pjb.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Nov 2021 00:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKY+F1Oxez66TS15siDD/nDvyuOA050VB5MhJkhC4js=;
        b=5uuNl8Ur+eBU7ps/QF/ijy9QjkatlgDMZ83qc7l9xFvJgDDHWkJ0AUP0LR6Zc0KZzy
         YKrnyI10YuR2gUFK+bmfI44zlPCMnXDa5WvYthT605wSA5oahSCZ5674b0sDtC3xSNVD
         J0ZdlcfwWq7gcrI2cPMeic80k+o6sgtOMheLUhCxERgOKBQ4CXiPRuI9tTt1qfI7JhSK
         6+6rnS/DyW5z2r9ibIhhI4TZW8nxwYZuboqyQPxpKRJtpDeESgplzywS4lCMoVg30BFO
         lI0bI915HPahoWGIJOoMes7zwfqH4GQn0IxN7pQ5Rj9YQpJGessyc7rtaodx4nU2hx/D
         MWvA==
X-Gm-Message-State: AOAM5332XiWmYJbEySJe42e9DTklgIRxhv2jcRg1175PGDK17W6luafG
        4m3zaUC++/bFUMmf1Yk/swX1A5jeDQ9Dsg==
X-Google-Smtp-Source: ABdhPJyUX/JqrL7UysEVbH4C0LNFaypEBbHiTld1Oryd++B/39DX3cDF+nwi6NVZ1TsglygQPNma2Q==
X-Received: by 2002:a17:90a:be13:: with SMTP id a19mr286724pjs.43.1636358406611;
        Mon, 08 Nov 2021 00:00:06 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id e14sm11827044pga.76.2021.11.08.00.00.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:00:06 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id t21so15238273plr.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Nov 2021 00:00:06 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr38079054vsj.50.1636357917661;
 Sun, 07 Nov 2021 23:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-1-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 08:51:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+jb+aZHPcJ1XeEawjEwwT+VJ=YVtQnVcr=kJtnG_shw@mail.gmail.com>
Message-ID: <CAMuHMdX+jb+aZHPcJ1XeEawjEwwT+VJ=YVtQnVcr=kJtnG_shw@mail.gmail.com>
Subject: Re: [RFC 1/3] gpiolib: remove irq_to_gpio() definition
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Arnd Bergmann <arnd@arndb.de>,
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 5, 2021 at 2:03 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All implementations other than coldfire have returned an error since
> the avr32 and blackfin architectures got removed, and the last user in
> driver code was removed in 2016, so just remove this old interface.
>
> The only reference is now in the Chinese documentation, which should be
> changed to remove this reference as well.
>
> Cc: Fu Wei <tekkamanninja@gmail.com>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Hu Haowen <src.res@email.cn>
> Cc: linux-doc-tw-discuss@lists.sourceforge.net
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
