Return-Path: <SRS0=+VAR=CY=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079F7C433E2
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Sep 2020 06:39:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C19652076C
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Sep 2020 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600151987;
	bh=XlhPQhFrX0A/aql6pX2YgbW2X9pXKFj7GYWfRrmIPak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=g/lhmvdG1sg/6aJoQnd8SrIj8naKkeuAklGv4s112GwcsNwoEMshdMKBzU0yW6a9X
	 1taBjU8zHkA/EcKakAGp3XALi/NAE2v/Q6ZgGw3CdiYFHj9Ts8rxqgHTKq+7EwrBQm
	 zoAupTegq2QT66v/KTS289/yl0RrvCVHknJUmeGI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgIOGjq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Sep 2020 02:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgIOGjg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Sep 2020 02:39:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C346EC061788
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Sep 2020 23:39:35 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b19so1745205lji.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Sep 2020 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7AZvvtnOCrBJ0y7Ea7nJQgHCW8PeMBJ8MoPUyYrAJro=;
        b=Gqovwkb5A8FW/jwlWWxLLQ/avI7lnDibBgUBcgb3YHy5ole3D6O2HF9xebthy2Sa7D
         pdxdxxmQzGYxo9HEtGYBgkQkdY49pjUNwIF0aUEETd48RydGVCxehC4UHZ1aoiJMH2WY
         rTXUOrEKNo5NyWYCWs4UE3XuCPJLSnSLauj5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7AZvvtnOCrBJ0y7Ea7nJQgHCW8PeMBJ8MoPUyYrAJro=;
        b=mmM0F4hGoqWi/hcOng0XyUucV98Ryg1g2b8J/F2yXPgUkD6MKOiGsZ42YGcuMQVRDY
         TFkIQKSu+45q6SbRq3hwZ9hLjfloDuYmWD+E5BnhC4YUslM0RkX11Gx0lAStGxVIddkD
         sc6UOOg0Xqc8QC7gBuMgGUjNBr+D8of17yFaIWhl8mV1Mx5eL5q5YTVBUTAHziOk0Uzt
         gqeUIL/PkqRnKoF0JI4wMadpd2lGrzfKKSlQmcr/cQvzzhed16lQS5oHNeD1znuYxsui
         HITUZ9J5GJ5pX12FqcMtgciP2AlLH0h6OIyRuuUDn9dHliX31aK4IOQQYWOjgS7K7wym
         pn/A==
X-Gm-Message-State: AOAM532z1xGi2UynwLs5lOFAA5iVfiDyEgmlbJtK7I2DtngKQr8sv38S
        eB7JeyF92bgw3iKpOqXPXke9zHnIMHjNaQ==
X-Google-Smtp-Source: ABdhPJyvlAiAms6wX2l0RZxFfiohhc3Pr7BBQTuLypVxpb8LgWvxWqfbsvXf1FbHgRf/8+ckY5awNg==
X-Received: by 2002:a2e:b44f:: with SMTP id o15mr6020391ljm.321.1600151972539;
        Mon, 14 Sep 2020 23:39:32 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id z28sm4557390ljn.46.2020.09.14.23.39.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 23:39:31 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id m5so1877627lfp.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Sep 2020 23:39:31 -0700 (PDT)
X-Received: by 2002:a19:8907:: with SMTP id l7mr5566265lfd.105.1600151970683;
 Mon, 14 Sep 2020 23:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
 <CAMj1kXHrDU50D08TwLfzz2hCK+8+C7KGPF99PphXtsOYZ-ff1g@mail.gmail.com> <20200915062253.GA26275@gondor.apana.org.au>
In-Reply-To: <20200915062253.GA26275@gondor.apana.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Sep 2020 23:39:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wir6LZ=4gHt8VDdASv=TmEMjEUONuzbt=s+DyXPCvxaBA@mail.gmail.com>
Message-ID: <CAHk-=wir6LZ=4gHt8VDdASv=TmEMjEUONuzbt=s+DyXPCvxaBA@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Shuah Khan <shuah@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 14, 2020 at 11:24 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Sep 15, 2020 at 09:20:59AM +0300, Ard Biesheuvel wrote:
> >
> > The documentation of kmap_atomic() states the following:
> >
> >  * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
> >  * gives a more generic (and caching) interface. But kmap_atomic can
> >  * be used in IRQ contexts, so in some (very limited) cases we need
> >  * it.
> >
> > so if this is no longer accurate, perhaps we should fix it?
>
> This hasn't been accurate for at least ten years :)

Yeah, that used to be true a long long time ago, but the comment is very stale.

> > But another reason I tried to avoid kmap_atomic() is that it disables
> > preemption unconditionally, even on 64-bit architectures where HIGHMEM
> > is irrelevant. So using kmap_atomic() here means that the bulk of
> > WireGuard packet encryption runs with preemption disabled, essentially
> > for legacy reasons.
>
> Agreed.  We should definitely fix that.

Well, honestly, one big reason for that is debugging.

The *semantics* of the kmap_atomic() is in the name - you can't sleep
in between it and the kunmap_atomic().

On any sane architecture, kmap_atomic() ends up being a no-op from an
implementation standpoint, and sleeping would work just fine.

But we very much want to make sure that people don't then write code
that doesn't work on the bad old 32-bit machines where it really needs
that sequence to be safe from preemption.

So it's mostly a debug thing.

I say "mostly", because there might be small other details too, like
shared code, and perhaps even a couple of users out in the wild that
depend on the pagefault_disable() inherent in the current
kmap_atomic(), who knows..

So no, the preemption disabling isn't inherent in the operation
itself. But it does have some argument for it.

                   Linus
