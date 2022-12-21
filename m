Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A446C4332F
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Dec 2022 17:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbiLURHC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Dec 2022 12:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiLURHB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Dec 2022 12:07:01 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0EF19000
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 09:07:00 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-417b63464c6so219639277b3.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYOKcpVH/CwZxAmDD07aAMcukw6jGJ7fZk2tWZQJ5Co=;
        b=EmYCuGZi1aBhi0+7PLOQjdb/1nrr3I38sgxXNpnj2Ob5gPWVW+wHeaOB0rT2rW9ia1
         2eC+kMDfVwn1Aw6vUx9l+Y+mROuW36ElXsnZxVtkTOtX3gWfd+EaTqrQgaKdEDoFyGkW
         RPvMC8bGtPA+mM+/6Yrg5RydYu4wMK+vVcANc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYOKcpVH/CwZxAmDD07aAMcukw6jGJ7fZk2tWZQJ5Co=;
        b=iCgtL5cMOscJG2QP+zgxLH/JLGJc/uX4srl2EPBAk7Q6BCOhux2kCVJZP5tPyUJvTW
         YzWVU+SJQEUShQWwuTbFMOjk0fsxHWGC++FBdqgB+qhhYSGCKIMO74arTOPwq+9ItJrH
         jO2e1mF8Nr1k3Z2YKRdpigdd8RdzFSsQgUgyZ3vGTMV7tocibu7ZOjasw5UYwEAwG4TX
         nkdPR3syHAxAQUhvTxAPNDkv6EgDaif1y8v0/5uMeohxFHKSlMWng/tGlOHocGpJ5tEC
         qhpNfaGKL+xAvgMe0f0mVuD3LQ1/zJfysaeMRYd75+zdx+ChTZXipFPgAeDYWMzW9zxQ
         yAUw==
X-Gm-Message-State: AFqh2koXoRsSTPQc5SxOgKpBPvrx3n3eGfXr8mKMXk4+ANg75X+giQoZ
        Mkrl15nXpL3fQNxgJiK1n39HEOSAx6qqKY55
X-Google-Smtp-Source: AMrXdXsTsQruUcFX7hx+iTUlf6ZOkmH3U6Wcrk/sf6EaFpAwpOfJx+4JT/66W16D6ihJgRKY5fXwMA==
X-Received: by 2002:a05:7500:368d:b0:ee:5695:7751 with SMTP id fq13-20020a057500368d00b000ee56957751mr170918gab.51.1671642418942;
        Wed, 21 Dec 2022 09:06:58 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id u25-20020a37ab19000000b006feea093006sm10949877qke.124.2022.12.21.09.06.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 09:06:58 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id g8so6899828qkl.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 09:06:58 -0800 (PST)
X-Received: by 2002:ae9:ef49:0:b0:6fe:d4a6:dcef with SMTP id
 d70-20020ae9ef49000000b006fed4a6dcefmr84873qkg.594.1671642417917; Wed, 21 Dec
 2022 09:06:57 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
In-Reply-To: <20221221155641.GB2468105@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 21 Dec 2022 09:06:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
Message-ID: <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Dec 21, 2022 at 7:56 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The above assumes an unsigned char as input to strcmp(). I consider that
> a hypothetical problem because "comparing" strings with upper bits
> set doesn't really make sense in practice (How does one compare G=C3=BCnt=
er
> against Gunter ? And how about G=C7=96nter ?). On the other side, the pro=
blem
> observed here is real and immediate.

POSIX does actually specify "G=C3=BCnter" vs "Gunter".

The way strcmp is supposed to work is to return the sign of the
difference between the byte values ("unsigned char").

But that sign has to be computed in 'int', not in 'signed char'.

So yes, the m68k implementation is broken regardless, but with a
signed char it just happened to work for the US-ASCII case that the
crypto case tested.

I think the real fix is to just remove that broken implementation
entirely, and rely on the generic one.

I'll commit that, and see what happens.

               Linus
