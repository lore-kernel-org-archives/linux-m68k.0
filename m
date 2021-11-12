Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FBDC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 08:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6365261002
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 08:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhKLIit (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 Nov 2021 03:38:49 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:39896 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbhKLIis (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 12 Nov 2021 03:38:48 -0500
Received: by mail-ua1-f47.google.com with SMTP id i6so17310791uae.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Nov 2021 00:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBk8MCSNtlUvD8rLqSbjXq3e+2xkJNNwK7CzcOaPWQY=;
        b=BnKZ6TR3EsLVLwBU4PZuU1idp75nhmKXtC8KsDDByUkfOMhoHBZpLSW5cykjSFRKDF
         6RQENcj873olfcMT6siifQnpRUmVXXKq04L0xUMRCtUJclv+DCAwjCD+iidAT9DALa10
         w4DMJ7ca20in+XCau4D6UVZ5KPYIcCumZpOuxDQ9gItKsINDrEo7lcopjhHMItoTShJW
         Gyj8wAUEK24UXasYbmL2XKnBivyzM5U9ZpYRs0/PiRys/yUUdjAmCCztmeFvitfTpoMN
         DsHtCqundSQRLNYovZjuqpv3Wo1+Hy+O/YrkeDF0DiEWyPWaQJLeEoeMoIYsIjxisUHT
         0FdA==
X-Gm-Message-State: AOAM532Q4h1sFG7deHU62jcXLxLal8hbTSahN7XZBA27qvJqrFnDRTeN
        iM1CpObbs2hBvKn8n39CJsNC1o0qUPNkIQ==
X-Google-Smtp-Source: ABdhPJwKp0PyZhVt4OTzNXTG8JxyF8u0t7aQsjvxXNkKJ45IBB1+tPUIHhbPxDd4yuXHG12CjoZPZQ==
X-Received: by 2002:ab0:f2:: with SMTP id 105mr19561449uaj.125.1636706158096;
        Fri, 12 Nov 2021 00:35:58 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id i1sm3468318vkn.55.2021.11.12.00.35.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 00:35:57 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p37so15641425uae.8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Nov 2021 00:35:57 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr20017412uae.122.1636706157380;
 Fri, 12 Nov 2021 00:35:57 -0800 (PST)
MIME-Version: 1.0
References: <e07d814e65cd38c00bf7b6cb806e81a4d32286ef.1636593047.git.fthain@linux-m68k.org>
In-Reply-To: <e07d814e65cd38c00bf7b6cb806e81a4d32286ef.1636593047.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 09:35:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPu1Kp_1RE_RG=Pg65rn0vt4WJ0x6cZ+=QkJEi_h+Eow@mail.gmail.com>
Message-ID: <CAMuHMdXPu1Kp_1RE_RG=Pg65rn0vt4WJ0x6cZ+=QkJEi_h+Eow@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add macfb driver to Macintosh section
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Nov 11, 2021 at 2:12 AM Finn Thain <fthain@linux-m68k.org> wrote:
> According to the MAINTAINERS file, the Framebuffer Layer (and
> drivers/video/) is an orphan. However, macfb is still maintained
> so update the file to reflect that.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

I can take this, if Joshua is happy (haven't heard from him for a
very long time).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
