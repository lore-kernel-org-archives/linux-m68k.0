Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF6DC00140
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Jul 2022 18:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbiGZSgn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Jul 2022 14:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbiGZSgm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Jul 2022 14:36:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4B413F62
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 11:36:41 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l23so27744711ejr.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaLMCBsCDvWTi9/iULkdHwQgKcBgvkSR9TjQnyfmggo=;
        b=RiFLWIrPzZnN+X+JPvKwY2y1+frWBSLdbh11cpd503I5uiDZy880x5bQgnJKNnMioM
         I0UPwWgzlZmo8LPMCrgYhibsLxH48Pu9ZwzbkFoPQzRzqbgaQwFHnvkrStgyBilwuD2A
         W5oC8UgCQQaq2OtWUdVzVzngUtXnxq1E5ZGBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaLMCBsCDvWTi9/iULkdHwQgKcBgvkSR9TjQnyfmggo=;
        b=ulcb0qMXPyRM305K2vFQpR9LhLef2j+9RAfIslJtwiMwdfiJ6+D7AVyidjtu4UnDzu
         C64hRO0/ifelUtoPyNFxRDoru+85KvFLAUe7sswlv+sSzcLUiu6poDv7JkLP+2C6nF4c
         1N5/r88VYx9LKxJC0N8GQMRhfMcwzxQ5LAC025+PkKjMcP4OW+JlbJP4umCzFO3stDcZ
         mGVEPbX6uavTv3GTDGEEBxQ0eZhwMUBPbS+nqmiBf/rHKvUwluso3as0XolumJml/XFW
         IhZE026VtuaW8mHpufDN4tVWLD5rq4vuCWwpzshoWjJcNBPXMzD2OKSr/mStFj1/5XGc
         4UKw==
X-Gm-Message-State: AJIora87A1m7lVkCnKhzkRjCvg5JmjQwjBHa0fYEGYUFh6entc3vpEp3
        kHfHMw37vtyrIQ7Hy/61fydm7Tk2AfA28YsG
X-Google-Smtp-Source: AGRyM1sKLVrkKv5OV/N+c3HYCIFzPafsm88ax6e+aTr/miP1tUqHT9y7LWlQ1n3gZorMAltipGubaA==
X-Received: by 2002:a17:907:6e0f:b0:72e:d066:dfe5 with SMTP id sd15-20020a1709076e0f00b0072ed066dfe5mr15301893ejc.558.1658860599429;
        Tue, 26 Jul 2022 11:36:39 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b00722e4bab163sm6766438ejf.200.2022.07.26.11.36.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 11:36:38 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id u5so21328245wrm.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 11:36:38 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id
 f8-20020a0560001a8800b0021daa97cb16mr11925079wry.97.1658860597963; Tue, 26
 Jul 2022 11:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiWwDYxNhnStS0e+p-NTFAQSHvab=2-8LwxunCVuY5-2A@mail.gmail.com>
 <20220725161141.GA1306881@roeck-us.net> <CAHk-=whtGUwJwHUSNsXd4g7cok=n0Zwje7nACp8skh1fa2NtJA@mail.gmail.com>
 <YuAm5h1B6bsrR/9q@fedora> <CAHk-=wgYpJTMMxmfbpqc=JVtSK0Zj4b15G=AvEYk6vPNySDSsA@mail.gmail.com>
 <YuAv+lV324G7pmlk@yury-laptop>
In-Reply-To: <YuAv+lV324G7pmlk@yury-laptop>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 26 Jul 2022 11:36:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2-j8zocUjurAeg_bimNz7C5h5HDEXKK6PxDmR+DaHRg@mail.gmail.com>
Message-ID: <CAHk-=wg2-j8zocUjurAeg_bimNz7C5h5HDEXKK6PxDmR+DaHRg@mail.gmail.com>
Subject: Re: Linux 5.19-rc8
To:     Yury Norov <yury.norov@gmail.com>
Cc:     Dennis Zhou <dennis@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 26, 2022 at 11:18 AM Yury Norov <yury.norov@gmail.com> wrote:
>
> We have find_bit_benchmark to check how it works in practice. Would
> be great if someone with access to the hardware can share numbers.

Honestly, I doubt benchmarking find_bit in a loop is all that sensible.

These are helper functions that are probably seldom super-hot in
cache, and as with so many of these things, I suspect the cool-I$
numbers are the ones that matter most in real life.

When some filesystem ends up searching for a free block or similar, it
will probably have done other things before that that means that the
L1 I$ has been long flushed, and branch history is quite possibly
entirely gone too.

The same is quite possibly true for the bitmap itself in D$ too.

That said, looking at the x86 code generation (not only because I have
the build environment, but where I can actually read make sense of the
asm), the only thing that looks bad is the conditional bswap.

So the code gen looks fairly good,

                 Linus
