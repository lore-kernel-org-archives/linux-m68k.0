Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFFFC433E6
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 20:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 209A964E22
	for <linux-m68k@archiver.kernel.org>; Tue, 23 Feb 2021 20:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhBWUI1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 Feb 2021 15:08:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:40998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233125AbhBWUHf (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 Feb 2021 15:07:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 334C164EDD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614110815;
        bh=18JzbvqWGWvOaX8sGgbXQ8ZBt6M8MWKzgoqyxsrjh/w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jme//fgHeOes3SI3UlLbu8aQMEsNJIIdLE5iTobsvB3uDhkLnsCtKAu65fqamJwb2
         DKBCB6HqdngiG1fu/MIctv0Z0jFH/vl6oySNGLr99pvsQkYCdv9UXqIx0kU7+uSOMh
         m6wYMwMgjbxXHBtUs1JEQcYbhupQL1LVUMCM0kX1I6Rn075pFCBViKUvhkl5/FbtCm
         4ZwICoq+TTHFBvbeAWOnBjJIIyUEAj+mrNZWBW5U7B/Mzz66sYSTjN5nQY52SMj8n4
         kNf5FDHyfCs9SiQLoobtwQ75+NoGFoxMcpunKepSVwS5ixSnI02RAphdLJmVJEBcQ0
         IVnGZK0yjGhLw==
Received: by mail-oo1-f41.google.com with SMTP id e17so4182517oow.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Feb 2021 12:06:55 -0800 (PST)
X-Gm-Message-State: AOAM531i0eB0Je+Qgfr4GAov1yKXWvv8VwtwVpcD45QScmRycizDCxMO
        2jz7ksAGLsFogHNdRGNI8zaYXX/S4r/Mdsc+91o=
X-Google-Smtp-Source: ABdhPJwVq3FqhVZjTBFetpO3mOU7GL+78ojBZOQ2pjE3Bh7kqAyWdbPNnj/q23QeJRymW4tpB96Sgwc/UDkiyf761pQ=
X-Received: by 2002:a4a:8ed2:: with SMTP id c18mr19775387ool.66.1614110814282;
 Tue, 23 Feb 2021 12:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20210223143426.2412737-1-elver@google.com> <20210223143426.2412737-3-elver@google.com>
 <CAMuHMdXVZ+UvNgoaNC-ZZoiuJ=DOsZs4oZzd8DubA7D+4iLCow@mail.gmail.com>
In-Reply-To: <CAMuHMdXVZ+UvNgoaNC-ZZoiuJ=DOsZs4oZzd8DubA7D+4iLCow@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 23 Feb 2021 21:06:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nCxY=bF_Z_aDDqHFOFgOSJUmaN5X+46oXN7-x1o5z_g@mail.gmail.com>
Message-ID: <CAK8P3a1nCxY=bF_Z_aDDqHFOFgOSJUmaN5X+46oXN7-x1o5z_g@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] signal: Introduce TRAP_PERF si_code and si_perf
 to siginfo
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Potapenko <glider@google.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Christian Brauner <christian@brauner.io>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jann Horn <jannh@google.com>, Jens Axboe <axboe@kernel.dk>,
        mascasa@google.com, Peter Collingbourne <pcc@google.com>,
        irogers@google.com, kasan-dev <kasan-dev@googlegroups.com>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 23, 2021 at 7:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, Feb 23, 2021 at 3:52 PM Marco Elver <elver@google.com> wrote:
> > Introduces the TRAP_PERF si_code, and associated siginfo_t field
> > si_perf. These will be used by the perf event subsystem to send signals
> > (if requested) to the task where an event occurred.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> >  arch/m68k/kernel/signal.c          |  3 +++
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

For asm-generic:

Acked-by: Arnd Bergmann <arnd@arndb.de>
