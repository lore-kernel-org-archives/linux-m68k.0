Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FC7C43460
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Apr 2021 07:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 609F4613A7
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Apr 2021 07:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbhDGHTh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:19:37 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:39697 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346598AbhDGHTf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Apr 2021 03:19:35 -0400
Received: by mail-vk1-f169.google.com with SMTP id c5so3738164vkm.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Apr 2021 00:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7Kx3btHgz7ta84S98Pg8BsIYMvQVkxtEX2Vc+I1KDE=;
        b=AQxZ84E+WISKFo3rbk77ZglyGklZ7QJOYG61712g0lR+8L8HJIkNYfaujbIQ3ULu3C
         PbTRLp5KyZiLTpd51/C9070lVbD5RXPxhrVveNZ8LobOQ/AGCEOSn5w6Dq4lUcZ3uO+n
         U6wPxxJI6mwQAEF9olEJfkBl8AXDlDlDlSDtigYbjYzUj7iI2Cl5MhgZwKUrcsX6F9e+
         2EXAMepUb5QrSoq5vZQH5bAmL2wq2WeAqlylmD7RBUj6Je8bs+dsP19MJmdtkoVssZMw
         z0UIqYFWh04RS7UtfHDYzQHDHHwsmt0Qgw68W9bT0nYQvBLc7LARPFKILooqF4JjPgY3
         SEUg==
X-Gm-Message-State: AOAM531ctXyfUZrkWlze6F6z7yHdMoec+UBxRTquwlgTPNdfE83yQOuy
        EcxGVpxWb+s9GuvimGBud0AYHmXF79KiYa9FSVE=
X-Google-Smtp-Source: ABdhPJwSQIt0vRe/XPXraai5HlJT7pCQD6XwKdxiqkw/AiDw3l8QCTjw4hMZ46DTMUjbS5Q4AAwq3/pfH95+VvfIl+g=
X-Received: by 2002:a1f:b689:: with SMTP id g131mr1055576vkf.6.1617779964647;
 Wed, 07 Apr 2021 00:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210407053419.449796-1-gregkh@linuxfoundation.org> <20210407053419.449796-13-gregkh@linuxfoundation.org>
In-Reply-To: <20210407053419.449796-13-gregkh@linuxfoundation.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Apr 2021 09:19:13 +0200
Message-ID: <CAMuHMdUP38rfMSFB87MCfJ0J_2JteKfJGYsdTnkkOcHViQL_OA@mail.gmail.com>
Subject: Re: [PATCH 12/20] kbuild: m68k: use common install script
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Wed, Apr 7, 2021 at 7:35 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> The common scripts/install.sh script will now work for m68k, all that
> is needed is to add it to the list of arches that do not put the version
> number in the installed file name.
>
> With that we can remove the m68k-only version of the install script.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for your patch!

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

I guess it would "work" with the version number, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
