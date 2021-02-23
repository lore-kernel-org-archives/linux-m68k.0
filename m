Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D59BC4332B
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 20:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B7764E6B
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 20:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbhBWUFN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 Feb 2021 15:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbhBWUEh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 Feb 2021 15:04:37 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB53C06178B
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 12:03:57 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id b8so16884642oti.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDbWfjB7meY0E7XLsjIrc5m2e7z/Yrkuj6hZaVwwlGE=;
        b=uueyZEhCJsJkc1//64Eechxof/hRtg3m1Kam7rXXOkGxioSseruAEXvRT1gwPL8vci
         FduZ0uQOv8+hJwNqH9PO99dchqYCcxQiJavaJVEq/x4E+GhQSZ1/+TJqGhdyxth/c9b0
         uBrjxFkcXCrqELg63jTj2cOvhZihBwrbswwm24tvtYDcz3VfF4hdNH3wZ4J2dUZ+BkDt
         MufANT3JpO5VQjXitgDU8rg0FNLkZhigCEZj/mve/wdbPae6jymb4nI850CjV70cb/eu
         vERzojj1KOkEFfWGrh7Xvuh/pR7gscOH4+/AOHuoREQG0qNB8ht4uwrfaELflnr/vR/c
         +bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDbWfjB7meY0E7XLsjIrc5m2e7z/Yrkuj6hZaVwwlGE=;
        b=X6invVumSr079qh7V8/uOhKpwD/ZrskdX4Zg1dw1nURNZkDCCc0ZwMQ62S6Qg0T7X5
         VB2PYfFRn7hEx/3t9GvyvYXJZglcrG5eo2PNg881qHIpoAc4yrQlH/p97/Oj0owvBdo7
         Rtc6k6EZ49syk9pfRUYKR52PjOEl/jiAtEVkMa6ngVb9ws3wfyQmGPKWmto0FuRhlCxa
         r5aZHwt0d2Hs8ljfQo6K865EQOjSiYZ3r6TtSEGOz/GcuG7zEdNKpzMju6JsCoBxjcNL
         k/YlFlwY0bm0AMADmpnI9eYkYkXxJY6849rkX33/M18b3BMzeHqndZAutmIQUpQUYppJ
         p9sA==
X-Gm-Message-State: AOAM53190RfhAy/6b3WBw95ZN74CGCBTb70F7nldWd46q1IYTF/NK1wm
        f/0DE0KSPFUY3wUTxAjy8LWEhusT27NFEKzMiDPMdw==
X-Google-Smtp-Source: ABdhPJym6kizV7WwEuRTO4LxrYB6Kngg9p2qqbI8TF8TQ17KCmxCWMoNs/hCqzqUJllLyQpwObR4PeorYP4v1txmJq8=
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr22473227otf.251.1614110636519;
 Tue, 23 Feb 2021 12:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20210223143426.2412737-1-elver@google.com>
In-Reply-To: <20210223143426.2412737-1-elver@google.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 23 Feb 2021 21:03:44 +0100
Message-ID: <CANpmjNPEzA0EP9zEGE-O7tz=3EhKjdhVi43jbhoTDRG5wo3C1A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Add support for synchronous signals on perf events
To:     Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Alexander Potapenko <glider@google.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Christian Brauner <christian@brauner.io>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jann Horn <jannh@google.com>, Jens Axboe <axboe@kernel.dk>,
        Matt Morehouse <mascasa@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Ian Rogers <irogers@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 23 Feb 2021 at 15:34, Marco Elver <elver@google.com> wrote:
>
> The perf subsystem today unifies various tracing and monitoring
> features, from both software and hardware. One benefit of the perf
> subsystem is automatically inheriting events to child tasks, which
> enables process-wide events monitoring with low overheads. By default
> perf events are non-intrusive, not affecting behaviour of the tasks
> being monitored.
>
> For certain use-cases, however, it makes sense to leverage the
> generality of the perf events subsystem and optionally allow the tasks
> being monitored to receive signals on events they are interested in.
> This patch series adds the option to synchronously signal user space on
> events.
>
> The discussion at [1] led to the changes proposed in this series. The
> approach taken in patch 3/4 to use 'event_limit' to trigger the signal
> was kindly suggested by Peter Zijlstra in [2].
>
> [1] https://lore.kernel.org/lkml/CACT4Y+YPrXGw+AtESxAgPyZ84TYkNZdP0xpocX2jwVAbZD=-XQ@mail.gmail.com/
> [2] https://lore.kernel.org/lkml/YBv3rAT566k+6zjg@hirez.programming.kicks-ass.net/
>
> Motivation and example uses:
>
> 1.      Our immediate motivation is low-overhead sampling-based race
>         detection for user-space [3]. By using perf_event_open() at
>         process initialization, we can create hardware
>         breakpoint/watchpoint events that are propagated automatically
>         to all threads in a process. As far as we are aware, today no
>         existing kernel facility (such as ptrace) allows us to set up
>         process-wide watchpoints with minimal overheads (that are
>         comparable to mprotect() of whole pages).
>
>         [3] https://llvm.org/devmtg/2020-09/slides/Morehouse-GWP-Tsan.pdf
>
> 2.      Other low-overhead error detectors that rely on detecting
>         accesses to certain memory locations or code, process-wide and
>         also only in a specific set of subtasks or threads.
>
> Other example use-cases we found potentially interesting:
>
> 3.      Code hot patching without full stop-the-world. Specifically, by
>         setting a code breakpoint to entry to the patched routine, then
>         send signals to threads and check that they are not in the
>         routine, but without stopping them further. If any of the
>         threads will enter the routine, it will receive SIGTRAP and
>         pause.
>
> 4.      Safepoints without mprotect(). Some Java implementations use
>         "load from a known memory location" as a safepoint. When threads
>         need to be stopped, the page containing the location is
>         mprotect()ed and threads get a signal. This can be replaced with
>         a watchpoint, which does not require a whole page nor DTLB
>         shootdowns.
>
> 5.      Tracking data flow globally.
>
> 6.      Threads receiving signals on performance events to
>         throttle/unthrottle themselves.
>
>
> Marco Elver (4):
>   perf/core: Apply PERF_EVENT_IOC_MODIFY_ATTRIBUTES to children
>   signal: Introduce TRAP_PERF si_code and si_perf to siginfo
>   perf/core: Add support for SIGTRAP on perf events
>   perf/core: Add breakpoint information to siginfo on SIGTRAP

Note that we're currently pondering fork + exec, and suggestions would
be appreciated. We think we'll need some restrictions, like Peter
proposed here: here:
https://lore.kernel.org/lkml/YBvj6eJR%2FDY2TsEB@hirez.programming.kicks-ass.net/

We think what we want is to inherit the events to children only if
cloned with CLONE_SIGHAND. If there's space for a 'inherit_mask' in
perf_event_attr, that'd be most flexible, but perhaps we do not have
the space.

Thanks,
-- Marco

>
>  arch/m68k/kernel/signal.c          |  3 ++
>  arch/x86/kernel/signal_compat.c    |  5 ++-
>  fs/signalfd.c                      |  4 +++
>  include/linux/compat.h             |  2 ++
>  include/linux/signal.h             |  1 +
>  include/uapi/asm-generic/siginfo.h |  6 +++-
>  include/uapi/linux/perf_event.h    |  3 +-
>  include/uapi/linux/signalfd.h      |  4 ++-
>  kernel/events/core.c               | 54 +++++++++++++++++++++++++++++-
>  kernel/signal.c                    | 11 ++++++
>  10 files changed, 88 insertions(+), 5 deletions(-)
>
> --
> 2.30.0.617.g56c4b15f3c-goog
>
