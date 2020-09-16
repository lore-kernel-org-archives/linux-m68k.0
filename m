Return-Path: <SRS0=bvH4=CZ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98165C43461
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Sep 2020 18:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54FED206B5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Sep 2020 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600281534;
	bh=HYwhM1wvJq+PP6+3ZxYuGja3O/ADjo0jvjpne4xOCuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=R5XfdFGAtWoBjjk9y6W22xJGlEN1bZHqthomR8WNmr5yFL4IC++Xf/XOBcl78XihQ
	 Dff343ZcNEITnbjYspRA6opvzaZ+9Crgszenz8CuyoyyagoZdXMZi9XJ5MN6Z+8TKv
	 2kaB3XWW3gCzqKUkgGzNaxdsOYKFZiofaKoW5xGE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbgIPSiv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgIPSih (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Sep 2020 14:38:37 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25BEC06174A
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Sep 2020 11:38:36 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so12000260ejf.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Sep 2020 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oa2KOKBruJIa8JzwEuXDvn8lq/AyW8Gh05WzKpjKQjk=;
        b=UEueMUHZ3w1bML4TffC03SPtwmMbG26ZS04QoHTBFtkbazq0zj1LMx+FyboyvzzASg
         nydFo8G58LEHhfHuiZfy7mbpmIDsIlzAJfeeTzYG6VJXbIqW/NS9VqvGKvKAt1o7QE3H
         aEBuUY03yHBMaYNPFFjhHL22z9bGvgl38mViw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oa2KOKBruJIa8JzwEuXDvn8lq/AyW8Gh05WzKpjKQjk=;
        b=fm5OZWLfVulI9dDXDHdamtoJV/Olp6jm69A2YnDwSc2ZIXsOWzH9Vh17oTGhE8mTSH
         srqxmlFGH9xfuSRt0TlgRutwDjbmrdIyON2mG9IsEwU+mFFvQEVaETX4NfGbVzTc6AIH
         oCBkrG1Qs5YQ5X2niB+OOR78DC5fYACNSYZ8sjN9x+7paw4fMIktHbtzkeHvwJ4qr8Qk
         m+i/48/qf+R5W7ywMhdwBymIx5VaeY4pvZ0iC0FK3XBlf3RZfPLCEKWoGeYLG3ZA0+Cw
         P+g/nOiq7j7qwM7Wt0BqYKsfuapqk6vLj9DyFlT139hH66e8dlFTPcv4VinoLSmVig2J
         FkJA==
X-Gm-Message-State: AOAM531MW2CjW/NZm7gg8w3uIM9i6xK0grTc1nm9x8ffVwRmE+qgnjKL
        hD9H+C0Vom3vvQ5U5kPmzBKMAiQD5UWT6w==
X-Google-Smtp-Source: ABdhPJx+vUYrq3lu5LTdO3s68Nn2f0Me6lTV9XNp3bLVgzs/2Z9X++nEU7MUncgUB5tI7dTiJ8bS4w==
X-Received: by 2002:a17:906:c2d2:: with SMTP id ch18mr28368499ejb.79.1600281515138;
        Wed, 16 Sep 2020 11:38:35 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id s19sm13192379eja.54.2020.09.16.11.38.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 11:38:34 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id e23so12026936eja.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Sep 2020 11:38:34 -0700 (PDT)
X-Received: by 2002:a19:e00a:: with SMTP id x10mr9071213lfg.603.1600281136741;
 Wed, 16 Sep 2020 11:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de> <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
 <CAKMK7uHAk9-Vy2cof0ws=DrcD52GHiCDiyHbjLd19CgpBU2rKQ@mail.gmail.com> <20200916152956.GV29330@paulmck-ThinkPad-P72>
In-Reply-To: <20200916152956.GV29330@paulmck-ThinkPad-P72>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Sep 2020 11:32:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMycgMHJrCmeetR3r+K5bpSRtmVWfd8iaoQCYd_VYAg@mail.gmail.com>
Message-ID: <CAHk-=wjsMycgMHJrCmeetR3r+K5bpSRtmVWfd8iaoQCYd_VYAg@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
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
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Shuah Khan <shuah@kernel.org>, rcu@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Sep 16, 2020 at 8:29 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> All fair, but some of us need to write code that must handle being
> invoked from a wide variety of contexts.

Note that I think that core functionality is different from random drivers.

Of course core code can (and will) look at things like

        if (in_interrupt())
            .. schedule work asynchronously ..

because core code ends up being called from odd places, and code like
that is expected to have understanding of the rules it plays with.

But something like RCU is a very different beast from some "walk the
scatter-gather list" code.

RCU does its work in the background, and works with lots of different
things. And it's so core and used everywhere that it knows about these
things. I mean, we literally have special code explicitly to let RCU
know "we entered kernel context now".

But something like a driver list walking thing should not be doing
different things behind peoples back depending on whether they hold
spinlocks or not. It should either just work regardless, or there
should be a flag (or special interface) for the "you're being called
in a crtitical region".

Because dynamically changing behavior really is very confusing.

               Linus
