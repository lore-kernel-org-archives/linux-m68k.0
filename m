Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510F1C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3544061076
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237510AbhKHIK0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 03:10:26 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:46058 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235534AbhKHIKZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 8 Nov 2021 03:10:25 -0500
Received: by mail-ua1-f46.google.com with SMTP id ay21so29756182uab.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Nov 2021 00:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12zMeNHe/fGVoF0uYNVZnD8aQuXksUYIErzX9Jbj4So=;
        b=Y5tkd00up647Ff4pkqQ03F2fFsX6Q8GJkrG0Uu1V7qq/bv4Vb9oeUrrp18Oa8J+Z6T
         NykkPLMrb4BIRle2vceTfA43cWp0J2Mb3fXrhIkWg0QbyX3BcYfai+b4X4W+F3J7yM1C
         ssUwD9JX9z8YzBDeBwbRVzhTsuOqXjDqynFhjHRioG7+mQPlKrPREED2g+OC7x8WUraV
         Xd6BQtb1bctjhD7IZyN251VtbKHo5DiqegkopU/Uou0prwJLuXBahE230yPW+qyKJOp2
         yI5GEYtJq599VjJUUa0+9iRsUTegi6wdWgxvaxr4OeUu+aTOyOMOkTPIR7tiIlD+s5qu
         46ig==
X-Gm-Message-State: AOAM5322hCWrnfVUa5cqYDlDW7LH5/aXucciJlVVfXbKuUPOu8HHtqKL
        UCYJeVA+B9D3Ay2qL8UwtOjOCnXkZVbiSA==
X-Google-Smtp-Source: ABdhPJx4vFWQg6g0jOgqXQozgDMmKBoc6agYJUPRpig0+0IUV8sWgUGKxEZQspkENRhWPA+RzCF0Ag==
X-Received: by 2002:a67:d19d:: with SMTP id w29mr19583627vsi.26.1636358860863;
        Mon, 08 Nov 2021 00:07:40 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id e7sm1582211vkn.20.2021.11.08.00.07.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:07:40 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id e2so29789434uax.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Nov 2021 00:07:39 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr35705130vsb.9.1636358859788;
 Mon, 08 Nov 2021 00:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-2-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-2-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 09:07:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViJiXaRWQraS+A4Shs-WD8iUoCajO78DeO7+He2L251w@mail.gmail.com>
Message-ID: <CAMuHMdViJiXaRWQraS+A4Shs-WD8iUoCajO78DeO7+He2L251w@mail.gmail.com>
Subject: Re: [RFC 2/3] gpiolib: remove empty asm/gpio.h files
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Fri, Nov 5, 2021 at 2:04 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly. This leaves coldfire as the only gpio driver

All but arch/sh/boards/board-magicpanelr2.c do. So that one needs
a direct inclusion of <cpu/gpio.h>.

> that needs something custom for gpiolib.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
