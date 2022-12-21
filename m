Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355E9C10F1B
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Dec 2022 18:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiLUSqb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Dec 2022 13:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbiLUSq3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Dec 2022 13:46:29 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F436E088
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 10:46:29 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id i12so10914382qvs.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0sODeRBjvPETeUrYPz7JbnedMQB/IxCocAx1FoaszTU=;
        b=Wy0Sz3Rojhc+tOVGf8KvjRmRjEZJqCHd1i96YwhlFe4AQJBhrynZfO6wMunqOJzcXp
         OtAxmPiWamNa669nglrJtYL1LY751fImTMMRlSeC3y0bx2EEI6E+E52yb1KBO5mdAHbC
         maEreRZaysRS4E6MKmemJDVUZ/OrXE9mHf/EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sODeRBjvPETeUrYPz7JbnedMQB/IxCocAx1FoaszTU=;
        b=d0Wk8seCdoyT854qbdBL9tFBqKtD0Zgvq5uTrKcHpQ3SBzxeLmlw2KKsTOjwzMIRy4
         WXdPht4/GQjxaX7DavphB90v2hFH5fr0KsuTUv8kHwJcQeD+Vq35LEREzgPzCmGAgBUF
         t/witN7rtSVGML/W3bHqNyt6sz5qcEmWIYWppMfSIIPXvTDTTCDNfmrUbQrfUMm0bwKW
         qYGhVa7v56Ny06EO+60nDnZcYpKPdZsyLWYeqO7jjhg6IEX7Uohl14TQI4Yi2biXsJ6R
         Bv/TOsYbQB+w8AfUINtfLhXyCz2wBAVRSDyNnhDFciSm32R1WoTEdz1+znhCxfCbLzfH
         5i4Q==
X-Gm-Message-State: AFqh2kruHvjDAY52l8tnxVpFe7r8ucAzCI6W0s4HqZi2h8Z73hd7UZfR
        g3aEGvYA5gfbbp/paQ+YnXUjQIG3+LGU5wdg
X-Google-Smtp-Source: AMrXdXsZWu2w6oXwRfF4hnvqebFPPkfEUqCVtf6bHBKokS3ZCQ8boQQIxU91dbHQgd34yI02frdXGQ==
X-Received: by 2002:ad4:4f32:0:b0:4c6:9271:a037 with SMTP id fc18-20020ad44f32000000b004c69271a037mr3608912qvb.30.1671648387929;
        Wed, 21 Dec 2022 10:46:27 -0800 (PST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id dt17-20020a05620a479100b007023fc46b64sm7899597qkb.113.2022.12.21.10.46.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 10:46:26 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id c7so14366177qtw.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 10:46:25 -0800 (PST)
X-Received: by 2002:ac8:4e26:0:b0:3a7:648d:23d4 with SMTP id
 d6-20020ac84e26000000b003a7648d23d4mr140158qtw.180.1671648384706; Wed, 21 Dec
 2022 10:46:24 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com> <20221221171922.GA2470607@roeck-us.net>
In-Reply-To: <20221221171922.GA2470607@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 21 Dec 2022 10:46:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
Message-ID: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Wed, Dec 21, 2022 at 9:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Dec 21, 2022 at 09:06:41AM -0800, Linus Torvalds wrote:
> >
> > I think the real fix is to just remove that broken implementation
> > entirely, and rely on the generic one.
>
> Perfectly fine with me.

That got pushed out as commit 7c0846125358 ("m68k: remove broken
strcmp implementation") but it's obviously entirely untested. I don't
do m68k cross-compiles, much less boot tests.

Just FYI for everybody - I may have screwed something up for some very
non-obvious reason.

But it looked very obvious indeed, and I hate having buggy code that
is architecture-specific when we have generic code that isn't buggy.

                   Linus
