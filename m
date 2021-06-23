Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0EBC2B9F4
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 00:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98176135A
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 00:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFWAo2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 22 Jun 2021 20:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhFWAo1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 22 Jun 2021 20:44:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B90EC06175F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 17:42:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j4so1170825lfc.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 17:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pJi6stLtza5ZFdImIffUNgdJoHKsMjc09flZZ4qiAI=;
        b=SFcCe3m1FiAXHxPsSVxKjvrdNckQVrxdff+U4unr4V4zJzTMYaBEpSK9jjYtU7tMd6
         D6+UsvBUdCLcIdv0JgGtdHlWRGtgBWAILphbvJEUZilovxO8PsYLDfvqyyYAEF0oFQuI
         Rb1F4OutZ2mQyaIxFkh4FOdwyNm9Ixhuqq2qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pJi6stLtza5ZFdImIffUNgdJoHKsMjc09flZZ4qiAI=;
        b=HX+3yjNA34ZZgCoHynTMa/RrCFgPaIJJV166V/eVkiwQYZ8hO1WxocKR2jhMJfP7Z7
         Fj3lySJoQJ8uQRLiQ2mLA66zQ9PDFjMShgzt0yQ+b7JbMx8k7NXmL0TjXdR1qa4u+HDb
         SzlL1ZMjdBqP/TxEFxgrVrX8Wlm3ykUIkTYJb7xAlhTBhJFlbgb4ELqhImyZ0l0GdKaA
         QwjyXNUsHcjh4zudz7nByDLCADqF5ZrTyqA5FwI51XeX5CtWvBMHd3KsJEqUz3ucwG64
         WfyAwllNTnUrZT4W8SJNmpma9UkPz6ja0Jd6bkwGHWzIstUWuC5ARxdA9QZ2EGqisdbT
         sGrw==
X-Gm-Message-State: AOAM530sZJfYZslqzeMKkdtf7QVkpUnaFZXMpSQHV9pH+s8u2xKEE7qq
        /x66A+Vu+7+IHbWvu+YjpVNxNN1GPnMKU7kF
X-Google-Smtp-Source: ABdhPJxjNZegdvZH6otjD0aGa/fZlfdWj0ed1p6I9yQPmsJ9Hy5fysE8qCYKqlxzPjoB2m15BTwQKA==
X-Received: by 2002:ac2:5fa5:: with SMTP id s5mr4941303lfe.497.1624408928481;
        Tue, 22 Jun 2021 17:42:08 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id m16sm404036lfj.250.2021.06.22.17.42.07
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 17:42:07 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id d16so1227381lfn.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 17:42:07 -0700 (PDT)
X-Received: by 2002:a05:6512:15a2:: with SMTP id bp34mr4693530lfb.40.1624408926925;
 Tue, 22 Jun 2021 17:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
In-Reply-To: <87tulpbp19.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 22 Jun 2021 17:41:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
Message-ID: <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 22, 2021 at 1:53 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Playing with it some more I think I have everything working working
> except for PTRACE_EVENT_SECCOMP (which can stay ptrace_event) and
> group_exit(2).
>
> Basically in exit sending yourself a signal and then calling do_exit
> from the signal handler is not unreasonable, as exit is an ordinary
> system call.

Ok, this is a bit odd, but I do like the concept of just making
ptrace_event just post a signal, and have all ptrace things always be
handled at signal time (or the special system call entry/exit, which
is fine too).

> For purposes of discussion this is my current draft implementation.

I didn't check what is so different about exit_group() that you left
that as an exercise for the reader, but if that ends up then removing
the whole "wait synchromously for ptrace" cases for good I don't
_hate_ this. It's a bit odd, but it would be really nice to limit
where ptrace picks up data.

We do end up doing that stuff in "get_signal()", and that means that
we have the interaction with io_uring calling it directly, but it's at
least not a new thing.

               Linus
