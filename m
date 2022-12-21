Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF34C10F1B
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Dec 2022 19:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLUTIZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Dec 2022 14:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbiLUTIY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Dec 2022 14:08:24 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD779205D3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 11:08:23 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id fu10so14490479qtb.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn+t8qDtNQ9Zc5y1ZpPtqZOcEJkis56LzveCTgnEvi8=;
        b=VG2RhAC4GerNWJVwD5eJK2dJtjzxa5jl2ZE1QCuq5JVGE55Nw9FULecqOtzxRwYK6X
         6x1WsybFrqNdJhT41JDls6OTcVcDuZilELmRIQWqu4uWpTYScMFpjXEAVirA2mY2wWZC
         BFqQ0e6nDcmL/pH5o0U4mrpND+AVZUnqI15hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qn+t8qDtNQ9Zc5y1ZpPtqZOcEJkis56LzveCTgnEvi8=;
        b=ZEAs+M0bh1cyxWWQJbK9VE4rr8VxsmFs/G9kWmrav94Ei0G5fG6WZyJKdsq0A7oN+e
         ptl+8IW9HIUhtzR1e0du0cgo/OPxzU5gQeoB77nFEpoxjVp7zKl5c9vbJaTlq0MtoJEq
         AEzvsCX1L/ikifcYUThZFEbXm15KRDDsybJ1PUjR1zWNbpGVFN8Hlkmu2bg2pA012Lsa
         66X6Q+fgQkVOYDIfdxhJ9sATHM8Wu67zhIcq7AYmQEd8uk5l8Kn3vEeErauOErmW3ky1
         eH7elXaZcqMvSXwIJW4H4yMJ3bnhurHZNeOOzhj1o17A+dKOJDIJrckp54yMvQsjvHmw
         ZLiA==
X-Gm-Message-State: AFqh2krt+EOmcnXhmqZ/vV6BiBr+p6OXqD/3ZE7eEop4vrOdJqPu1uqP
        y+SE2oxgIr5Ae6vrDmzLZDtgEy/BV3pIoHfs
X-Google-Smtp-Source: AMrXdXvP0VhGZzn2+fwIYKRmFxkin0Yjh63ol8rPx+Z0S4n150MeXQSJWsk8ITnByj4KOXGgDe6tTg==
X-Received: by 2002:ac8:7513:0:b0:3a9:8b17:d090 with SMTP id u19-20020ac87513000000b003a98b17d090mr3316459qtq.36.1671649702524;
        Wed, 21 Dec 2022 11:08:22 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id h19-20020ac85693000000b0039c7b9522ecsm9622004qta.35.2022.12.21.11.08.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 11:08:21 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id c14so10975716qvq.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Dec 2022 11:08:21 -0800 (PST)
X-Received: by 2002:a05:6214:1185:b0:4c6:608c:6b2c with SMTP id
 t5-20020a056214118500b004c6608c6b2cmr133347qvv.130.1671649701297; Wed, 21 Dec
 2022 11:08:21 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
 <20221221171922.GA2470607@roeck-us.net> <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
In-Reply-To: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 21 Dec 2022 11:08:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiL2njz3b-_jY7iSJ15eu-9Drb4TOyPdd0cJ=kk_RQEvg@mail.gmail.com>
Message-ID: <CAHk-=wiL2njz3b-_jY7iSJ15eu-9Drb4TOyPdd0cJ=kk_RQEvg@mail.gmail.com>
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

On Wed, Dec 21, 2022 at 10:46 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But it looked very obvious indeed, and I hate having buggy code that
> is architecture-specific when we have generic code that isn't buggy.

Side note: we have an x86-64 implementation that looks fine (but not
really noticeably better than the generic one) that is based on the
'return subtraction' model. But it seems to get it right.

And we have a 32-bit x86 assembly thing that is based on 'rep scasb',
that then uses the carry bit to also get things right.

That 32-bit asm goes back to Linux 0.01 (with some changes since to
use "sbbl+or" instead of a conditional neg). I was playing around a
lot with the 'rep' instructions back when, since it was all part of
"learn the instruction set" for me.

Both of them should probably be removed as pointless too, but they
don't seem actively buggy.

               Linus
