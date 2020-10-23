Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A270C388F9
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 21:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3504421D6C
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603487769;
	bh=qQcFmOGTx12wPD63RiThRe7Vh0MNAYSb3WtVSv6KO9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=e86zfvr3fOjw7TY2ANp+icF9lJ2rz7++0jg1FxE12hpktt9hx+VL7OG5Ud/tOonej
	 UjguxXRiZwpZdIw3TMLPDIyOs+OP9b/z4T3/HRK2yT17rl386lcKLRnTh3tHFjAkBB
	 MfVJSyeW/K6Gk725wRU9dwJ9S/LA6u1FW5sCG80I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755857AbgJWVQI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 17:16:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:40248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755356AbgJWVQH (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 17:16:07 -0400
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A10502465D
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603487767;
        bh=qQcFmOGTx12wPD63RiThRe7Vh0MNAYSb3WtVSv6KO9I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ylYjv002r5/d4PJz5MfpZMB4thciSwlk1eXkJiCA3bvenmoPxzuiHjvcXDcackAcE
         w6VNJ7rBH6083fbGYBlG3chnrNZbtJNPqO54/g2gQKHUjVIOrFDXlaNINXtFbJdoKt
         OK0nV4hNeaJ18/R+8VfmdHAtYYky9/5RkmV0QCgE=
Received: by mail-lj1-f176.google.com with SMTP id c21so2991656ljn.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 14:16:06 -0700 (PDT)
X-Gm-Message-State: AOAM531IIIXquxFC2kTLMgc6OJ4+zszQw78nM/lC5uLQa7bFIomhxfoq
        HFLUYfGHMFfAz5Al1yX7elUPj+Npo2t/F6vnBC8=
X-Google-Smtp-Source: ABdhPJxMP4Oqfuc0h+oHI0VayAXX1a002RyckvG+CEYT7Qe0w/jJqsSdKxhG124OF9Ag+jl4aWynWIOTPbYK55JDXo0=
X-Received: by 2002:a05:651c:cd:: with SMTP id 13mr1498277ljr.392.1603487764782;
 Fri, 23 Oct 2020 14:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com> <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
In-Reply-To: <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
From:   Song Liu <song@kernel.org>
Date:   Fri, 23 Oct 2020 14:15:53 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6wZRVoT3Bu6YBVjWVm6JBz9n6_RoZKGM7KrVAXx89SFQ@mail.gmail.com>
Message-ID: <CAPhsuW6wZRVoT3Bu6YBVjWVm6JBz9n6_RoZKGM7KrVAXx89SFQ@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
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

On Fri, Oct 23, 2020 at 10:51 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 10:00 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > [Old patch from yesterday]
> >
> > After applying your patch on top on linux next tag 20201015
> > there are two observations,
> >   1) i386 build failed. please find build error build
>
> Yes, this was expected. That patch explicitly only works on x86-64,
> because 32-bit needs the double register handling for 64-bit values
> (mainly loff_t).
>
> >   2) x86_64 kasan test PASS and the reported error not found.
>
> Ok, good. That confirms that the problem you reported is indeed the
> register allocation.
>
> The patch I sent an hour ago (the one based on Rasmus' one from
> yesterday) should fix things too, and - unlike yesterday's - work on
> 32-bit.
>
> But I'll wait for confirmation (and hopefully a sign-off from Rasmus
> so that I can give him authorship) before actually committing it.
>
>               Linus

My test vm failed to boot since

commit d55564cfc222326e944893eff0c4118353e349ec
x86: Make __put_user() generate an out-of-line call

The patch also fixed it.

Thanks!
Song
