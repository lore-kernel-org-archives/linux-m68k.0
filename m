Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EC4C4332F
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Dec 2022 13:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiLVNFp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Dec 2022 08:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbiLVNFn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Dec 2022 08:05:43 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193A0B58
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Dec 2022 05:05:42 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id a16so1239189qtw.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Dec 2022 05:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLCFjw9XIBAbu93dkTI6RLAmkXvVW4axCY2krlbo1Ww=;
        b=PfEfmCpA/OO5WcFEnSxkR9JHw2Y9osFR4CoHgjXouiQ048TqQD6ItsQqJVg4tszN6T
         0IXMUNS5IimL/UBmkJGOU369InvMYjIuKOk61XSoN1jnvPouCYSQX9imj4fDYn/3o6Wf
         y3wNxwLpv6pFxDcCUPPvDFSUrL4TXrz5HdCDM6XjwFO9qmS+6+eBqzM6jTECNORNjrl2
         N+cmNtbaT9UF1nu2hGFFhGCBI3PjHeBW/KyLiJCEU65EhaAM+A5JhPkrpoMY/H2uKZjC
         9bSXPc+jVDM7iiadFN9TaYVxmsxbUl3XGr5+WqOr2d24oLtSvwaRPKscedF72ysI8Fh0
         Bcxw==
X-Gm-Message-State: AFqh2krIG2GtePWAud0ZaJ1o0ggX9XvNQOjwFV764dKS0SFyuXR/Yz9g
        Lcytx9uv5uMdy4b/5rVI2dO2kPpxQ4UQZQ==
X-Google-Smtp-Source: AMrXdXuG0kMgTxdzYJWh07wmD9W6+U7w3/0BOjghMKPUA+APbW7nYuB7cETOI1f/FHhFKv19nWCfww==
X-Received: by 2002:ac8:468f:0:b0:3a9:7568:fb92 with SMTP id g15-20020ac8468f000000b003a97568fb92mr6336881qto.50.1671714340884;
        Thu, 22 Dec 2022 05:05:40 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id b7-20020ac85407000000b0039467aadeb8sm330760qtq.13.2022.12.22.05.05.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 05:05:39 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3b48b139b46so25680027b3.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Dec 2022 05:05:39 -0800 (PST)
X-Received: by 2002:a05:690c:d84:b0:437:febc:6583 with SMTP id
 da4-20020a05690c0d8400b00437febc6583mr536308ywb.384.1671714339227; Thu, 22
 Dec 2022 05:05:39 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
 <20221221171922.GA2470607@roeck-us.net> <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
In-Reply-To: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Dec 2022 14:05:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwNv-xzrsckMab_eAtZZ-ybDFPyxG9f9ndHBgXjLAayQ@mail.gmail.com>
Message-ID: <CAMuHMdWwNv-xzrsckMab_eAtZZ-ybDFPyxG9f9ndHBgXjLAayQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-toolchains@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On Wed, Dec 21, 2022 at 7:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Dec 21, 2022 at 9:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > On Wed, Dec 21, 2022 at 09:06:41AM -0800, Linus Torvalds wrote:
> > > I think the real fix is to just remove that broken implementation
> > > entirely, and rely on the generic one.
> >
> > Perfectly fine with me.
>
> That got pushed out as commit 7c0846125358 ("m68k: remove broken
> strcmp implementation") but it's obviously entirely untested. I don't
> do m68k cross-compiles, much less boot tests.
>
> Just FYI for everybody - I may have screwed something up for some very
> non-obvious reason.
>
> But it looked very obvious indeed, and I hate having buggy code that
> is architecture-specific when we have generic code that isn't buggy.

Thank you for being proactive!
It works fine (and slightly reduced kernel size, too ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
