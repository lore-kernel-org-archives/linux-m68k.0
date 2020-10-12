Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8794C433E7
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FFFC2065D
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388750AbgJLNP1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:15:27 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35852 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388738AbgJLNPS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:15:18 -0400
Received: by mail-oi1-f195.google.com with SMTP id u17so18694864oie.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=479sdd44MecSreb9si4jbrVvzN+pxNd9n3jIu5G3rEw=;
        b=VbbogXvwBZ+wv56tEyMA0FQ1htq7N8Zs73pTc9bBNLQRYwnfy7kqsVPghFAfBEWNkJ
         gBLynTIEJgTV+/X9NhJIH6ATFuC/c/XzEV40X9OwKnFoneCApWFE8n3AYEFdnI/4UDKf
         Wn3bJUoYAqfJe8iRSkFQcsG9TegCbQugYYyip8Y39A7Xc6rMbbZHA8AqW5XsM4S+H4jl
         AJwRJOEW6oqJBSJEt+AHqEUUdDRkaZGUxFnb4rP61iZif206wJbNS2jziDi2VKecndUe
         ONC9BfXIMfg9g5X6PE9jd/xtijEvnQ57wa4HEn/Al9Bff9VxHlRWPnlju289kG1vPFNQ
         ZAGg==
X-Gm-Message-State: AOAM533s9/6NTRGPBUZQZN6038w9EZENlYpQgQ1GnVmzJHYeGVVFjTfI
        nRj/O+z/KTX7NRfoPKiUTvFk44yWlMjadXJjBNs=
X-Google-Smtp-Source: ABdhPJxW+cuVuSNpTqFXx/Oo7DUbd+3z4lLadyCXqpYmjYp69GvJFXK10DtV6alyiU95OoxbP6hkY5LDEnOMkJzJjYo=
X-Received: by 2002:aca:4441:: with SMTP id r62mr10153443oia.153.1602508517137;
 Mon, 12 Oct 2020 06:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-8-arnd@arndb.de>
In-Reply-To: <20201008154651.1901126-8-arnd@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 15:15:06 +0200
Message-ID: <CAMuHMdUgT38aG7YNqk9U2iD-y-Ms3JJO24jfVY9pGweuRFMcjA@mail.gmail.com>
Subject: Re: [PATCH 07/13] m68k: sun3/sun3c: use legacy_timer_tick
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
> These two are different from all other machines:
>
> * sun3 does not call timer_routine() but open-codes it
>   except for the profile_tick() call that appears to
>   be unintentionally missing.
>
> * sun3x has a commented-out timer irq handler but no
>   functional timer tick I could find.
>
> Change both to calling the new legacy_timer_tick here,
> which includes the call to profile_tick() but does not
> fix sun3x as that is still commented out.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
