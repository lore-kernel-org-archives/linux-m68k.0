Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299A1C11F66
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 19:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D4006187E
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 19:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbhF1TUU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 15:20:20 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:45947 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbhF1TUT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Jun 2021 15:20:19 -0400
Received: by mail-vk1-f175.google.com with SMTP id b64so3978402vkh.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jun 2021 12:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kgfbZhYJkXzzmr7bNgLSoqZcGM1rWxHnjonqp3p6M4=;
        b=NAqyj2M+LkumidfJEwA83kJ31IiBHzBnjQPj6F8eZZuHK2HnTvbwiMiF99Btu0y9AC
         RZZjwMsYKUxNQcZi83KUDOVnwCHhL4ZZwoRqTCliFZNgJn4aIa+/ry+bXYPAz0mbvvJa
         C1veUWCJt+HTFlUOjnIjUa3PvQ4aSQxLbKdj3jdT5vH+dAI48wQHWffFk++OmusPJ352
         e0uTrWKReizhDpsU9MmfSdKDeY0YWu4QnN1BkRvp89axuhyc4cegjBD2usAE20onXdEI
         tX5D1n2G80lLwWqkYExOmQDS5Gf+rg/wwYX1uuwIA2/V8JFfns6FAt5Z02KkOu0Jk/Iy
         epmw==
X-Gm-Message-State: AOAM531Nnh9mlkbut08AucSQn4sBdhoKgf+MImdbC3La7xXiKLcDY6sT
        yXynSzBJBl8LBfd+a2uWbXjjVeoyCWqYJ53HcrU=
X-Google-Smtp-Source: ABdhPJzs8zbnJjOLDbjAx1eFBIkt9LTfmLSpKI8oTfbuVusOL0Bm2d6UnYO3XmABdwIa/jNXr5Siyc6+oD1nv2X1nUA=
X-Received: by 2002:a1f:ac45:: with SMTP id v66mr18581239vke.1.1624907871922;
 Mon, 28 Jun 2021 12:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133> <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133> <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
 <YNj4DItToR8FphxC@zeniv-ca.linux.org.uk> <6e283d24-7121-ae7c-d5ad-558f85858a09@gmail.com>
 <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com> <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com>
In-Reply-To: <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 21:17:33 +0200
Message-ID: <CAMuHMdUi5Ri=GmWzS8hb7dkfPyAE=HpQHg6OsKSLDse_364E=g@mail.gmail.com>
Subject: Re: [PATCH 0/9] Refactoring exit
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
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
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Mon, Jun 28, 2021 at 7:14 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.06.2021 um 19:31 schrieb Geert Uytterhoeven:
> >> Haven't found that warning in over 7 years' worth of console logs, and
> >> I'm a good candidate for running the oldest userland in existence for m68k.
> >>
> >> Time to let it go.
> >
> > The warning is printed when using filesys-ELF-2.0.x-1400K-2.gz,
> > which is a very old ramdisk from right after the m68k a.out to ELF
> > transition:
> >
> >     warning: process `update' used the obsolete bdflush system call
> >     Fix your initscripts?
> >
> > I still boot it, once in a while.
>
> OK; you take the cake. That ramdisk came to mind when I thought about
> where I'd last seen bdflush, but I've not used it in ages (not sure 14
> MB are enough for that).

Of course it will work on your 14 MiB machine!  It fits on a floppy, _after_
decompression.  It was used by people to install Linux on the hard disks
of their beefy m68k machines, after they had set up the family Christmas
tree, in December 1996.

I also have a slightly larger one, built from OpenWRT when I did my first
experiments on that.  Unlike filesys-ELF-2.0.x-1400K-2.gz, it does open
a shell on the serial console, so it is more useful to me.

> The question then is - will bdflush fail gracefully, or spin retrying
> the syscall?

Will add to my todo list...
BTW, you can boot this ramdisk on ARAnyM, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
