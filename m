Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDD3C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 11:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239821AbiDDLqF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 07:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346977AbiDDLqE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 07:46:04 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244611B7A6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 04:44:08 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id s11so7417240qtc.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 04:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYvQ/9sOxTrqd5FO05k5YTA5C/LjNCLjagWPfQG2994=;
        b=r7NJAMFNKOAUMliVJO4pXF5x4icdju/rhxLVsOTn3Vr6zDjTnAFcq1uHdfErTg5bK6
         3vXt7mQJsTDINyp0a3APS5SN+y/468Hzm5d6t5YS1jqZZ03l2Rm35VKx8i5QY5+YQ7uy
         VkGVM6bxsQwSmfPIhJa2oxl/3jHNuxZGqeOB/C2mJl3O1bdlb4kxxJ8a07QjZMqnibBV
         KDpmEFFiC1/Tnlmw9qigG9AD8+s89GlTJxtRlu6GjTQOntl7z/sjuGSrANqNGcQ5ibPs
         Blwkl5Li8qGd82AAGgUbSGrioLftsTMNeDPLPawXmWO5814nplwNuymHrFB+24AU8cWa
         aR2g==
X-Gm-Message-State: AOAM5319B6v1iMF4+PYkh8HWmuy9w0ofP3wlWEPH3qRaqOM8i31/8uRt
        0Q6z4AZL9KUufjbOMrptCtqZjV/JdbWhDA==
X-Google-Smtp-Source: ABdhPJypjYtTpwUrbYnaLccBx/xMl9Vv0Fs/IXNH+hr9gN8087xUzFpKjgTfROBfuJld4Fw1C8rr2Q==
X-Received: by 2002:ac8:5f12:0:b0:2e0:67f8:132d with SMTP id x18-20020ac85f12000000b002e067f8132dmr16823188qta.417.1649072646679;
        Mon, 04 Apr 2022 04:44:06 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c11-20020a05620a134b00b006809a92a94fsm5941330qkl.79.2022.04.04.04.44.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 04:44:06 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2db2add4516so95978337b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 04:44:05 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr22035506ywb.132.1649072645615; Mon, 04
 Apr 2022 04:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220404111204.935357-1-elver@google.com>
In-Reply-To: <20220404111204.935357-1-elver@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Apr 2022 13:43:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURqaCYDt5SJg0GLKqEs92JgUhHAhVa8B4RKextRH43aQ@mail.gmail.com>
Message-ID: <CAMuHMdURqaCYDt5SJg0GLKqEs92JgUhHAhVa8B4RKextRH43aQ@mail.gmail.com>
Subject: Re: [PATCH] signal: Deliver SIGTRAP on perf event asynchronously if blocked
To:     Marco Elver <elver@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-perf-users@vger.kernel.org,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Apr 4, 2022 at 1:30 PM Marco Elver <elver@google.com> wrote:
> With SIGTRAP on perf events, we have encountered termination of
> processes due to user space attempting to block delivery of SIGTRAP.
> Consider this case:
>
>     <set up SIGTRAP on a perf event>
>     ...
>     sigset_t s;
>     sigemptyset(&s);
>     sigaddset(&s, SIGTRAP | <and others>);
>     sigprocmask(SIG_BLOCK, &s, ...);
>     ...
>     <perf event triggers>
>
> When the perf event triggers, while SIGTRAP is blocked, force_sig_perf()
> will force the signal, but revert back to the default handler, thus
> terminating the task.
>
> This makes sense for error conditions, but not so much for explicitly
> requested monitoring. However, the expectation is still that signals
> generated by perf events are synchronous, which will no longer be the
> case if the signal is blocked and delivered later.
>
> To give user space the ability to clearly distinguish synchronous from
> asynchronous signals, introduce siginfo_t::si_perf_flags and
> TRAP_PERF_FLAG_ASYNC (opted for flags in case more binary information is
> required in future).
>
> The resolution to the problem is then to (a) no longer force the signal
> (avoiding the terminations), but (b) tell user space via si_perf_flags
> if the signal was synchronous or not, so that such signals can be
> handled differently (e.g. let user space decide to ignore or consider
> the data imprecise).
>
> The alternative of making the kernel ignore SIGTRAP on perf events if
> the signal is blocked may work for some usecases, but likely causes
> issues in others that then have to revert back to interception of
> sigprocmask() (which we want to avoid). [ A concrete example: when using
> breakpoint perf events to track data-flow, in a region of code where
> signals are blocked, data-flow can no longer be tracked accurately.
> When a relevant asynchronous signal is received after unblocking the
> signal, the data-flow tracking logic needs to know its state is
> imprecise. ]
>
> Link: https://lore.kernel.org/all/Yjmn%2FkVblV3TdoAq@elver.google.com/
> Fixes: 97ba62b27867 ("perf: Add support for SIGTRAP on perf events")
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Marco Elver <elver@google.com>

>  arch/m68k/kernel/signal.c          |  1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
