Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868C2C11F65
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Jun 2021 08:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50DE061CA2
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Jun 2021 08:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhF3I1j (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Jun 2021 04:27:39 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:41734 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbhF3I1i (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 30 Jun 2021 04:27:38 -0400
Received: by mail-vs1-f46.google.com with SMTP id c26so1202542vso.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jun 2021 01:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HzfJJ9ti6dGQXCyhzrQPruP9ARjniKrfItQOricwCVM=;
        b=RdFKX9QCwuSSAU2FY0+npJVuPjpwnVVD3NOqMMJ70WpYliOfBgA2ckk/PGZPtP8VJe
         ZV/8LWbjaHQ7VB4kSafe6a5UylvfCCY0MXC0YVHzJoQy3iAD7AEFxlXlvWimDIO4gel9
         gJlYHqJQeq/eT3qCc/YWGmtGJ4gO3Lzb/z8jTC8xgxvnRus6d7ChRSTr+uJfC7pR0U1m
         D96Q6lffupvlrFhXwQnaxop6yuvlqb6GosHJ1lM0tATbRoVzRJzc6v601O0OklfzP7Vk
         JgoICByEP+6rUZur0H6M46aTaiChPOGlUs7R2owfb0rRgfBth9HONDgOQmaKAfX65ovL
         b3Ww==
X-Gm-Message-State: AOAM532pIej3e24vOLtk2X0gEt1HvfQDX/tUhv+s7T5kb+19ztocqKQr
        qPit6HU7XvsdagAHK3Rab+w7EOkg90q0emxzKrc=
X-Google-Smtp-Source: ABdhPJwvmAwu+HHSJotcuovnPRGUgRQIzPIHkWjnNsqWWB4uNk5qd6bRBDzubrcXQnmkI1MR5TfaxpSeI4gWUCilEjI=
X-Received: by 2002:a67:770d:: with SMTP id s13mr16356931vsc.40.1625041508842;
 Wed, 30 Jun 2021 01:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133> <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133> <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
 <YNj4DItToR8FphxC@zeniv-ca.linux.org.uk> <6e283d24-7121-ae7c-d5ad-558f85858a09@gmail.com>
 <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com>
 <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com> <CAMuHMdUi5Ri=GmWzS8hb7dkfPyAE=HpQHg6OsKSLDse_364E=g@mail.gmail.com>
 <dbb4ca2d-a857-84f0-f167-5ad4e06aa52b@gmail.com> <CAMuHMdVKdZNBU-cTUY0zotA5DmtQ=dxH+iFY0_GX=4DzqpycZQ@mail.gmail.com>
 <36123b5d-daa0-6c2b-f2d4-a942f069fd54@gmail.com> <87sg10quue.fsf_-_@disp2133>
In-Reply-To: <87sg10quue.fsf_-_@disp2133>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Jun 2021 10:24:57 +0200
Message-ID: <CAMuHMdU8avXoY=06Moj_y4Z1ymr0HB59Y3UzARvgPVjUgG+PGg@mail.gmail.com>
Subject: Re: [CFT][PATCH] exit/bdflush: Remove the deprecated bdflush system call
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 29, 2021 at 10:28 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
> The bdflush system call has been deprecated for a very long time.
> Recently Michael Schmitz tested[1] and found that the last known
> caller of of the bdflush system call is unaffected by it's removal.
>
> Since the code is not needed delete it.
>
> [1] https://lkml.kernel.org/r/36123b5d-daa0-6c2b-f2d4-a942f069fd54@gmail.com
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

>  arch/m68k/kernel/syscalls/syscall.tbl         |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
