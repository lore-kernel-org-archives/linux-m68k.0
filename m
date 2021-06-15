Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082BEC48BE5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Jun 2021 22:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C916B611AB
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Jun 2021 22:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhFOWFX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Jun 2021 18:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhFOWFW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Jun 2021 18:05:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9FDC061574
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Jun 2021 15:03:16 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b37so749920ljr.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Jun 2021 15:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hoQkSnA6XRE+cBEiih5+9r6Hum8C///uGbJ9Kw2ELY0=;
        b=g/G9Q+2q40OzWZg7EFc4fouy9Igftb3L4Bk0mo8X1bGB4ay1i3Hzx7gDAXF7I9BNha
         YY8Tb63PTEjuFPLmasFyOxKTcxDVfcgS07QY91o7V0JoZ5Vat/JBFwVsnn2A0xh999aU
         tK9zqa7kM5VekQfnZejDxEUyMFWO9psHM4igQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hoQkSnA6XRE+cBEiih5+9r6Hum8C///uGbJ9Kw2ELY0=;
        b=iV+e0OIGDNR1c+1NEPsXFun9tsq3hnmHEXe6hAv0qizqoSizD9obrg/TRBmRuleFFW
         S6+1f7WZnovLC1gEYpXk1BH+gUJ7vArGkGeIDGEB5DyPjJdWZAkTyudzscSs5K/VP0yD
         Kmxnw3H/19exZpS397drVzP3QcHh5OZWjYdSZ5/WygfTwooWBRCiWy924EfFAQfan7M+
         Yq+y0jNtSoVK4cWOR3FN3c1LYYnbGn3WFSmaI9mclwZoL7rgR3/uBkMP4eLcM2krTONz
         r0NuTYi1io1dU4Bt5Dwk9dbuXbMnEQNad6tG8Y/xGthEI5bxIhcgHTd/Vcgw3SZQwGE1
         fPZA==
X-Gm-Message-State: AOAM533/8FmASDVB2KBmiINo8bNmCes55gCjU8xahGrl2UzMlDA5Beqo
        HtLLthWfCXzPYGFWDpS2qkmvklfbTdGbPy3V
X-Google-Smtp-Source: ABdhPJzSl95JJnSlAz8Z0pUUdcDI/a/b6M7wook1XLwzyPkDb6BKgptjWGAM/UTDo6N23IWYS/+Dig==
X-Received: by 2002:a2e:9d43:: with SMTP id y3mr1501893ljj.85.1623794594501;
        Tue, 15 Jun 2021 15:03:14 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id v19sm31450lfp.92.2021.06.15.15.03.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 15:03:13 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id d2so770169ljj.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Jun 2021 15:03:13 -0700 (PDT)
X-Received: by 2002:a2e:9644:: with SMTP id z4mr1520639ljh.507.1623794593506;
 Tue, 15 Jun 2021 15:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
In-Reply-To: <87zgvqor7d.fsf_-_@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Jun 2021 15:02:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
Message-ID: <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
Subject: Re: [PATCH] alpha: Add extra switch_stack frames in exit, exec, and
 kernel threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
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

On Tue, Jun 15, 2021 at 12:36 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
> I looked and there nothing I can do that is not arch specific, so
> whack the moles with a minimal backportable fix.
>
> This change survives boot testing on qemu-system-alpha.

So as mentioned in the other thread, I think this patch is exactly right.

However, the need for this part

> @@ -785,6 +785,7 @@ ret_from_kernel_thread:
>         mov     $9, $27
>         mov     $10, $16
>         jsr     $26, ($9)
> +       lda     $sp, SWITCH_STACK_SIZE($sp)
>         br      $31, ret_to_user
>  .end ret_from_kernel_thread

obviously eluded me in my "how about something like this", and I had
to really try to figure out why we'd ever return.

Which is why I came to that "oooh - kernel_execve()" realization.

It might be good to comment on that somewhere. And if you can think of
some other case, that should be mentioned too.

Anyway, thanks for looking into this odd case. And if you have a
test-case for this all, it really would be a good thing. Yes, it
should only affect a couple of odd-ball architectures, but still... It
would also be good to hear that you actually did verify the behavior
of this patch wrt that ptrace-of-io-worker-threads case..

           Linus

               Linus
