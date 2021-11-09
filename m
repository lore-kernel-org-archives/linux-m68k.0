Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2853DC433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 20:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 037B461159
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 20:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244158AbhKIUKn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 9 Nov 2021 15:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244154AbhKIUKm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 9 Nov 2021 15:10:42 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3F7C0613F5
        for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Nov 2021 12:07:56 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso374389otj.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Nov 2021 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jay4bvn1CHVbECfZlQ8rRUGomUTSbkN+CtKVdn6fLuw=;
        b=UjmZ16XdSJmMTk1B1Q+5+jygX0AQnxVwiZ8nHytzix8JWJdKkHA1DfCyxpMIn+LvEH
         8oizt36qlO9lPjxYa3z2hdYSazQstIsTha8sWrMq1ruzMdEPbGL3u5PuxcO4nDQuLaUq
         pyPzmwEP8ypf51mZzOYgHlTUGmWAcNvmbj4GcHgW1Le9W2SMDQpIoZkZurFoTaWpkMxJ
         KQz5SeJ7AjGA+PDdbqbJvFDXxQh0CLR4VQuTMWpxCcQ3rpPXPUIZctwdhI5NK9/3E07a
         B+zKCrYOIohAOeNfqN7g2oTnYVPNaqsaqUv23gFcCRUKzyRNzVLCPBqc2W48WHrcvU7O
         WOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jay4bvn1CHVbECfZlQ8rRUGomUTSbkN+CtKVdn6fLuw=;
        b=F7fiET4qrwjKT1ugggHQIU+pKBFV2BH5SqyySr4kLWqompjWIAo13W3uJOBkDzgCg6
         Rpxz6VtXitxlxD52EmXek/5+TOsQ5lJu+LmzooCTeY6fTAfsXdpVF1j6tzX9e6VqeOq2
         /FsTS4sOIQuSDw5PaX3R8zt2+KjzTJrlbdipCClTAZkR4XX+70QyTE/baa18JmqtI3Gf
         F0q5topLQFZFueekqs+Q5yrixVq17ocj+h/rlnjIvFoJTBjb7xUbqgKENlGGf31eJ6tv
         RQICx4H57PZL/DgI6MaoFKKptQOOhkUfT+T/JclYtVSN4qthSScWernhNgSG0bHhVnvw
         4K5w==
X-Gm-Message-State: AOAM533B5n6QzeD7wmp2UzmVLOGROA9c3n2Alcb/OcFdS6vwGJjC72OK
        ccVSXYEz92G5EpLWvRmg7KOyVfNJoovhsbiQUf/IrA==
X-Google-Smtp-Source: ABdhPJxNipPZr7+vmyXXCN9McHMGmga6b23qum9RT+SVZQNWx6aLiAtMH8PkORDzg0FIgBHPXVE6XphIIe1qjYrStiM=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr8389289otk.179.1636488475884;
 Tue, 09 Nov 2021 12:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-3-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:07:44 +0100
Message-ID: <CACRpkdYdrm_YnwvxjqLBrJfOF07_nDyu1g0xggRMJ9_x2S+LJA@mail.gmail.com>
Subject: Re: [RFC 3/3] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 5, 2021 at 2:05 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that coldfire is the only user of a custom asm/gpio.h, it seems
> better to remove this as well, and have the same interface everywhere.
>
> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
> functions, the custom version is only a micro-optimization to inline the
> function for constant GPIO numbers. However, in the coldfire defconfigs,
> I was unable to find a single instance where this micro-optimization
> was even used, so to my best knowledge removing this has no downsides.
>
> The custom gpio_request_one() function is even less useful, as it is
> guarded by an #ifdef that is never true.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
