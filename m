Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E21C433E0
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 20:27:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1272F64E6B
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 20:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234231AbhBWU1w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 Feb 2021 15:27:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbhBWU1t (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 Feb 2021 15:27:49 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21D5C06178B
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 12:27:09 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id w18so9529977pfu.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 12:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=Kk5JpRbDq4xRfQD7TUXlnwHHd/9lf684NeDm/b3OOQ4=;
        b=rII14qYh1Cca7rwfLGWNs7Fyr/DUwNZTzihjQrueY5urtWwbdyJZi35sbOgST0WGK8
         u8c10P1/0sKzEwqoIISzyv7qHK7OqsBDWWGGEIHMkRMnJ61cB7AZ/uYE0zd2u8NBUTeS
         7e1Oyr9LFdWtr6nsQa4hcaHAIsqlBP8Zk6eNkYMmP39ibXz9dkAACaUE8Nk6w4sd0QGn
         mA6HLSBiF7d+softgXGGLxwwD+7JfkwYEofLZG+QKBYyh7qZe/beElRyEsl2koQxbP0n
         PHowSXAL+UBxZtt1DULgI5dSAXLy43tvQHLAcE60bPxxjR4deMccheLcAtJAkDmZvTYx
         JzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=Kk5JpRbDq4xRfQD7TUXlnwHHd/9lf684NeDm/b3OOQ4=;
        b=AoS3qgwi/rdeov0n4R27p6EpUrQahIB95xNTYZAlzKXqphr5a5N+V4P7TXBJS09Wv3
         +GLMkwbgWmoAAupVNIP/Ol/E9NwaAjmVK5VBTc2L5PuE9xuVY25fd2m+oBEzsywM8ufx
         NPvhXr+MirW1DGUYUIa75r0h9298xyoNs1fFUlHePeNP6PsOWavHKmbjptOaML1VM+F1
         cqjXV9lpadeSaqNkaswrbBah0QXhw+vNXvwGviHebM8BTHxns4+GShJr7Q6B3rtCWnTT
         B3+rg5x3CjYps8ysWkB5P2TK0HLyUD3xRy54sjLvb6SgPOM+KHik0uoX2bhnzI7me/kw
         krrw==
X-Gm-Message-State: AOAM530yDvqJQzNNado5jswaJbPS/kG4OFjG42TKkZu57bzBiS3tjup6
        edfvYyswF2EslQVDyXfZNzaGnw==
X-Google-Smtp-Source: ABdhPJx3SnBLKpP+diJy0QcY1fUev+Mdrm6tm5rjjQn8OW4pmR38bFO1x2yGkQGBShGe3PxvApRG/A==
X-Received: by 2002:a62:1ad4:0:b029:1ed:b92c:6801 with SMTP id a203-20020a621ad40000b02901edb92c6801mr3749066pfa.7.1614112029199;
        Tue, 23 Feb 2021 12:27:09 -0800 (PST)
Received: from ?IPv6:2600:1010:b005:a3de:6cc4:ccf5:1045:b347? ([2600:1010:b005:a3de:6cc4:ccf5:1045:b347])
        by smtp.gmail.com with ESMTPSA id o188sm16858149pfb.102.2021.02.23.12.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 12:27:08 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC 0/4] Add support for synchronous signals on perf events
Date:   Tue, 23 Feb 2021 12:27:05 -0800
Message-Id: <3D507285-835F-4C83-8343-2888835971B4@amacapital.net>
References: <20210223143426.2412737-1-elver@google.com>
Cc:     peterz@infradead.org, alexander.shishkin@linux.intel.com,
        acme@kernel.org, mingo@redhat.com, jolsa@redhat.com,
        mark.rutland@arm.com, namhyung@kernel.org, tglx@linutronix.de,
        glider@google.com, viro@zeniv.linux.org.uk, arnd@arndb.de,
        christian@brauner.io, dvyukov@google.com, jannh@google.com,
        axboe@kernel.dk, mascasa@google.com, pcc@google.com,
        irogers@google.com, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        x86@kernel.org
In-Reply-To: <20210223143426.2412737-1-elver@google.com>
To:     Marco Elver <elver@google.com>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


> On Feb 23, 2021, at 6:34 AM, Marco Elver <elver@google.com> wrote:
>=20
> =EF=BB=BFThe perf subsystem today unifies various tracing and monitoring
> features, from both software and hardware. One benefit of the perf
> subsystem is automatically inheriting events to child tasks, which
> enables process-wide events monitoring with low overheads. By default
> perf events are non-intrusive, not affecting behaviour of the tasks
> being monitored.
>=20
> For certain use-cases, however, it makes sense to leverage the
> generality of the perf events subsystem and optionally allow the tasks
> being monitored to receive signals on events they are interested in.
> This patch series adds the option to synchronously signal user space on
> events.

Unless I missed some machinations, which is entirely possible, you can=E2=80=
=99t call force_sig_info() from NMI context. Not only am I not convinced tha=
t the core signal code is NMI safe, but at least x86 can=E2=80=99t correctly=
 deliver signals on NMI return. You probably need an IPI-to-self.

>=20
> The discussion at [1] led to the changes proposed in this series. The
> approach taken in patch 3/4 to use 'event_limit' to trigger the signal
> was kindly suggested by Peter Zijlstra in [2].
>=20
> [1] https://lore.kernel.org/lkml/CACT4Y+YPrXGw+AtESxAgPyZ84TYkNZdP0xpocX2j=
wVAbZD=3D-XQ@mail.gmail.com/
> [2] https://lore.kernel.org/lkml/YBv3rAT566k+6zjg@hirez.programming.kicks-=
ass.net/=20
>=20
> Motivation and example uses:
>=20
> 1.    Our immediate motivation is low-overhead sampling-based race
>    detection for user-space [3]. By using perf_event_open() at
>    process initialization, we can create hardware
>    breakpoint/watchpoint events that are propagated automatically
>    to all threads in a process. As far as we are aware, today no
>    existing kernel facility (such as ptrace) allows us to set up
>    process-wide watchpoints with minimal overheads (that are
>    comparable to mprotect() of whole pages).

This would be doable much more simply with an API to set a breakpoint.  All t=
he machinery exists except the actual user API.

>    [3] https://llvm.org/devmtg/2020-09/slides/Morehouse-GWP-Tsan.pdf=20
>=20
> 2.    Other low-overhead error detectors that rely on detecting
>    accesses to certain memory locations or code, process-wide and
>    also only in a specific set of subtasks or threads.
>=20
> Other example use-cases we found potentially interesting:
>=20
> 3.    Code hot patching without full stop-the-world. Specifically, by
>    setting a code breakpoint to entry to the patched routine, then
>    send signals to threads and check that they are not in the
>    routine, but without stopping them further. If any of the
>    threads will enter the routine, it will receive SIGTRAP and
>    pause.

Cute.

>=20
> 4.    Safepoints without mprotect(). Some Java implementations use
>    "load from a known memory location" as a safepoint. When threads
>    need to be stopped, the page containing the location is
>    mprotect()ed and threads get a signal. This can be replaced with
>    a watchpoint, which does not require a whole page nor DTLB
>    shootdowns.

I=E2=80=99m skeptical. Propagating a hardware breakpoint to all threads invo=
lves IPIs and horribly slow writes to DR1 (or 2, 3, or 4) and DR7.  A TLB fl=
ush can be accelerated using paravirt or hypothetical future hardware. Or re=
al live hardware on ARM64.

(The hypothetical future hardware is almost present on Zen 3.  A bit of work=
 is needed on the hardware end to make it useful.)

>=20
> 5.    Tracking data flow globally.
>=20
> 6.    Threads receiving signals on performance events to
>    throttle/unthrottle themselves.
>=20
> Marco Elver (4):
>  perf/core: Apply PERF_EVENT_IOC_MODIFY_ATTRIBUTES to children
>  signal: Introduce TRAP_PERF si_code and si_perf to siginfo
>  perf/core: Add support for SIGTRAP on perf events
>  perf/core: Add breakpoint information to siginfo on SIGTRAP
>=20
> arch/m68k/kernel/signal.c          |  3 ++
> arch/x86/kernel/signal_compat.c    |  5 ++-
> fs/signalfd.c                      |  4 +++
> include/linux/compat.h             |  2 ++
> include/linux/signal.h             |  1 +
> include/uapi/asm-generic/siginfo.h |  6 +++-
> include/uapi/linux/perf_event.h    |  3 +-
> include/uapi/linux/signalfd.h      |  4 ++-
> kernel/events/core.c               | 54 +++++++++++++++++++++++++++++-
> kernel/signal.c                    | 11 ++++++
> 10 files changed, 88 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.30.0.617.g56c4b15f3c-goog
>=20
