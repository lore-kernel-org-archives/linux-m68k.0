Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20070C433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 10 Apr 2022 23:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244200AbiDJXc1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 10 Apr 2022 19:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244120AbiDJXcJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 10 Apr 2022 19:32:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883F2617C
        for <linux-m68k@lists.linux-m68k.org>; Sun, 10 Apr 2022 16:29:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C46060E9A
        for <linux-m68k@lists.linux-m68k.org>; Sun, 10 Apr 2022 23:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC30AC385A4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 10 Apr 2022 23:29:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kJhfffoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1649633387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xT3So0usAoJxQ304XiPl75pb1sVc2oURXduYIBIz2jE=;
        b=kJhfffoWE5rmSZr2hkEBhrREccH2sB52cPnomZx5gep5MIK4PQjzHHXGb04ece9ONLjSgZ
        yketIE1A/v7z2GoBvYc7ATI8Lj+bmpEBR2ipHdS3falZFhkT8pyVpHMlhjd4pLOOw5jbyD
        lbupiR0wmGHmG3XfeRNkYAbLuj0ruLM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 01af28cf (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Sun, 10 Apr 2022 23:29:47 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id a17-20020a9d3e11000000b005cb483c500dso10204374otd.6
        for <linux-m68k@lists.linux-m68k.org>; Sun, 10 Apr 2022 16:29:47 -0700 (PDT)
X-Gm-Message-State: AOAM530bonXCuAOXb/4fsD+Fx0PDakozTU70gOQnCmT4Y1xrTtarLZB/
        yuDJQj6UapXVjGLrtDUnzz/X/H/UZIDfnwGd8mg=
X-Google-Smtp-Source: ABdhPJyBO6AKhupquz7e2wxSHr1eLUo0K1GhDFMIDJNkDGyTIn23DuFzdaauI+vZ7nL7liNEn+igem8NUaNiYqzOtLk=
X-Received: by 2002:a81:1e81:0:b0:2eb:cdd3:20ee with SMTP id
 e123-20020a811e81000000b002ebcdd320eemr14046908ywe.396.1649633374899; Sun, 10
 Apr 2022 16:29:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:a28:b0:173:f33c:dee9 with HTTP; Sun, 10 Apr 2022
 16:29:34 -0700 (PDT)
In-Reply-To: <YlNiOunUd5xfQiSL@sol.localdomain>
References: <20220408182145.142506-1-Jason@zx2c4.com> <YlNiOunUd5xfQiSL@sol.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 11 Apr 2022 01:29:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9quorveHN-z=n4r_gfj8ShEfprXcTvsc7bYj9_caxx7sg@mail.gmail.com>
Message-ID: <CAHmME9quorveHN-z=n4r_gfj8ShEfprXcTvsc7bYj9_caxx7sg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/10] archs/random: fallback to using
 sched_clock() if no cycle counter
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        arnd@arndb.de, "Theodore Ts'o" <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, x86@kernel.org,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eric,

On 4/11/22, Eric Biggers <ebiggers@kernel.org> wrote:
> On Fri, Apr 08, 2022 at 08:21:35PM +0200, Jason A. Donenfeld wrote:
>> By my first guess, we have ktime_get_boottime_ns(), jiffies, and
>> sched_clock(). It seems like sched_clock() has already done a lot of
>> work in being always available with some incrementing value, falling
>> back to jiffies as necessary. So this series goes with that as a
>> fallback, for when the architecture doesn't define random_get_entropy in
>> its own way and when there's no working cycle counter.
>
> Won't this interact badly with how try_to_generate_entropy() (a.k.a. the
> "Linus
> Jitter Dance") detects the presence of an appropriate timer currently?
>
>         stack.cycles = random_get_entropy();
>
>         /* Slow counter - or none. Don't even bother */
>         if (stack.cycles == random_get_entropy())
>                 return;
>
> So if random_get_entropy() always returns 0, then try_to_generate_entropy()
> won't run.  However, if random_get_entropy() is even just a low-precision
> timer,
> then try_to_generate_entropy() will have a chance of running, since the
> timer
> might change between the two calls to random_get_entropy().  And if
> try_to_generate_entropy() does run, then it credits 1 bit of entropy for
> every
> iteration, regardless of the timer's precision.
>
> This is an existing problem, but this patchset will make it worse, as it
> changes
> a lot of cases from "no timer" to "low precision timer".
>
> Perhaps try_to_generate_entropy() should check the timer at least 3 times
> and
> verify that it changed each time?

What you've identified is actually already the case for platforms
where the cycle counter is already just slow (and there are a few such
platforms; my odroid C2 even exhibits this). As you identified, the
cycle counter might already be too slow, yet we get [un]lucky and
reach this code right on the cusp or a change.

So the problem isn't new here, per say, for this patchset. But indeed
perhaps we should consider adjusting the heuristics for that a bit in
a separate patch. Your check three times idea seems like a good
starting point, if you want to send a patch and we can poke at it.

Jason
