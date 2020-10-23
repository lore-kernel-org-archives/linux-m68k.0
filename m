Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32137C5517A
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 15:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE8B220878
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603468507;
	bh=lSm7bqHTmkN1/WgtfgWR6pMAxMHJ4CrRjx6gMHZi0pI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=rXsyuXPHJXL5Bv32RIiMzqhzKm9rGUcF83pZ+X9C6i5OzGJVTFomJUKJjmfu3ScJ5
	 TSs8v4PQ08eyX7GYGOjPZqjvt6rssh2poAhCuB1iisjV+wZWo9CAX+vAFlriUiWqzd
	 pfeTczn/gr3vODAwb1aXF2ypTrC9GG9TQNxLkojU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464044AbgJWPzH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 11:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464043AbgJWPzH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 11:55:07 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38708C0613D2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:55:06 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id l28so2655861lfp.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CVCIDlW+4rSCxQwC/0UuCHmyl6vLpGQY3YbrIv0lS7k=;
        b=GD436E2U3ELljPkL4nM1PYvlFMy+YQnW7aen5YTspfRl7ksFgb2HDAmkn6V4t+JDaG
         dMMQj13VpeQs7o/RmxbX2tP6MlGCxWLIBdmEqKZM5NLiH7YFdLHZUROFosyHo2YrU1Oc
         /mkd7zfPG7SEUfxCAGBxjhO9Vpkj4+BC/pLM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CVCIDlW+4rSCxQwC/0UuCHmyl6vLpGQY3YbrIv0lS7k=;
        b=kYI4ffVnewrtw/72W8LN0GNrw31v+TYz5uGchxusjW9Wftscipq0XgN8fRYCYqpSUs
         jqbV6XlTMp/QFeHqRN/JWa7CPXzAmSP7yA6EkjPawCbfvlOy6aSn1/RtYFKgEsnSTrhZ
         mz+tQzkUAAWpn40HSQhymDUON+00sfXUKpSd2KMMZ2E1tV2F9AOC2FgK6NzWElr0zuHg
         o3Ph4UL5hYXHJ/cmZfGihBxb+h5+fddkhRK4AP5qssF27CC3F7/wrDplMYFcO3xBYY2N
         PHJM5Hot7HyfhP0pNAnZGGH/XeIScKNcSQ4O4jPfzZo7eJhI2jPcUIIzv+dEZ0ZJMbXz
         Z8Jw==
X-Gm-Message-State: AOAM533xpf7W5oLpigcDMzTYRQ/Ouo4VQa6dEFCVurCy386nJHVOFNaa
        0XOiglGrWynfHJcR8pan107/ASsi1qXXDg==
X-Google-Smtp-Source: ABdhPJyxyTe9C9JGQFHP/dMzMwd/ASMck+Mv8Oav2V1GUbh9Y284KQ97LFjP1zwo4YHfeovZK4ZDMA==
X-Received: by 2002:a05:6512:32b8:: with SMTP id q24mr951209lfe.176.1603468503925;
        Fri, 23 Oct 2020 08:55:03 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id s2sm201456ljp.17.2020.10.23.08.55.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 08:55:01 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 134so1070859ljj.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:55:01 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr1227378ljh.312.1603468500894;
 Fri, 23 Oct 2020 08:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com> <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
In-Reply-To: <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 23 Oct 2020 08:54:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
Message-ID: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> could break something else), but the obvious first step of rearranging
> so that the ptr argument is evaluated before the assignment to __val_pu

Ack. We could do that.

I'm more inclined to just bite the bullet and go back to the ugly
conditional on the size that I had hoped to avoid, but if that turns
out too ugly, mind signing off on your patch and I'll have that as a
fallback?

             Linus
