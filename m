Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCC6C4743C
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 23:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F84B611BD
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 23:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFUXo5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Jun 2021 19:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbhFUXo4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Jun 2021 19:44:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77873C061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 16:42:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f30so33003748lfj.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 16:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqBMFMkh+3vsj4PE2zy4sOG9Di6zkfuPgmZeKyRMggk=;
        b=FwTzGNcpDtlrI1kY0RIGO3zETGbXVETw5XVSJFPsLGj6Xz/SJV56ObDVCGf2pDuQ1Z
         igDUi27LyzA/lOjip7sVylirPYT+bZ/hF+sKh406iS7GyB+Vq1L8K8GDXIUSy1RHLXYZ
         859pKuXlceGLPjaK41xP26kUTIY685CWI4qnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqBMFMkh+3vsj4PE2zy4sOG9Di6zkfuPgmZeKyRMggk=;
        b=uA05LYnravzqFVhftJQd7kAqDqtg8pQ2TIrpsnPRNkMtN4HCG7L01g+8MCD8BHRHZ3
         //Xk5DV63lPTWDnIhSRe6/XJJ91zf18DW5YcDCDB2L8YSEe5aaqsiBkf/QLR+QO33C7O
         WHQYCj5jLc1q9WX9ufIkfSMwUd5EuehdJQIve0nDdHDyY5m7dJjEhMcu0/7lkkblswNR
         8z0GdwpHGZonQdw7r5DH1MP6joluyq4+Nwq/e/h6lRGtJm1L/zH6DKugMw5M8aBiSBeh
         B2hyfM1oliT8BLBqtPYzE17kvmNumODgzUj5SssGZJ3bpRs5ZETVX6E5NgRVKC1+Mljp
         vJJw==
X-Gm-Message-State: AOAM531VxCRLnAXs9i3DHy2btd1qbfnVh0fhhQYSNJXUT6u5fGxvxQu5
        UZ37mx7yxcT/fIYQOFaD9P6FoHde4Zxyg+zsFiE=
X-Google-Smtp-Source: ABdhPJzNgQKFk2k69NvM/KuA5IBxsUudLihOlPTy0SqvZfSSjXAmkW4HYSPt3x1qIwSzjpxzYXtCdQ==
X-Received: by 2002:a19:c182:: with SMTP id r124mr545506lff.173.1624318959757;
        Mon, 21 Jun 2021 16:42:39 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id v2sm713406lfo.194.2021.06.21.16.42.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 16:42:39 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id i1so5930773lfe.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 16:42:39 -0700 (PDT)
X-Received: by 2002:a2e:22c4:: with SMTP id i187mr544552lji.251.1624318609289;
 Mon, 21 Jun 2021 16:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk> <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
 <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
In-Reply-To: <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 16:36:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
Message-ID: <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
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
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 21, 2021 at 4:23 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         How would it help e.g. oopsen on the way out of timer interrupts?
> IMO we simply shouldn't allow ptrace access if the tracee is in that kind
> of state, on any architecture...

Yeah no, we can't do the "wait for ptrace" when the exit is due to an
oops. Although honestly, we have other cases like that where do_exit()
isn't 100% robust if you kill something in an interrupt. Like all the
locks it leaves locked etc.

So do_exit() from a timer interrupt is going to cause problems
regardless. I agree it's probably a good idea to try to avoid causing
even more with the odd ptrace thing, but I don't think ptrace_event is
some really "fundamental" problem at that point - it's just one detail
among many many.

So I was more thinking of the debug patch for m68k to catch all the
_regular_ cases, and all the other random cases of ptrace_event() or
ptrace_notify().

Although maybe we've really caught them all. The exit case was clearly
missing, and the thread fork case was scrogged. There are patches for
the known problems. The patches I really don't like are the
verification ones to find any unknown ones..

            Linus
