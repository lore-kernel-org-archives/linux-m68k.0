Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A55EC4363A
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 17:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F7F322254
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603475946;
	bh=N+3JAAx2qTcttW0/O/6Y6XpDcrK0Q7WlA5nzQr+/Mt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=gp0LVFMsDBgtClwlrzdQb/647MXHf1VsFrZ26oscbwqNha44lq0kEN06VorLxlY/S
	 AONh8aqnKHejbutUuI24VWd0ZHy0Gu85sk+O5T2Gz8zShL5AFMx9+tY/grKYJ8l03o
	 IxwrQvXwLIZi85nF6JR2lY/baIzXOdEr/rxEEVNs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463592AbgJWR7F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 13:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463587AbgJWR7F (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 13:59:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C284C0613CE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 10:59:05 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l16so2389534eds.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mjWltIsY/Tc/YTJZanmOnMdRvb0TAEPFdspWZ6zBj4M=;
        b=ThO1o259d6kg56YqDsLmT8MiBOJwLSiD9qKO4kwi21uldYbpY5uyCtH8bMuSvipaQl
         CAjmtz5HofISRTDvt16RteSXYTCR0nmL/dTW8wJ3RA9FrZ/uL5lQDuHg90R5IKGG2JeY
         BhpUEEHod/4CuMNQE9mr91H2mLES9qJx1qZ1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjWltIsY/Tc/YTJZanmOnMdRvb0TAEPFdspWZ6zBj4M=;
        b=DOgedGieccWwO1rKiP99HrtD25hiD7urL4dcMF+4zCCZZxg2yNEk0Rk1mDeg9qfjAk
         ljaYT7aV3kHoCzhjrocJ7qB/NJ/IjS4NbhMB4jI701K3QLTN92DW9lHNSQ6nywyU+CLR
         oGPW7ekTWIQr/HwgvmWnNAb1AhnuIcn9jvh7XVQDuUA0RdRP8YuFWi/4BBmXBbM6Nn0J
         vTJzVi2XNcaTtm8OX3ehZosQKU0/xEzynJL9U+pSYT+rDcRsA7qPqlxhSkfjptgWzSc/
         RNoNEXcvkaFeR3ciwqIsse/eTzdxlRe/39JorNSylLQaNORTH0IgjN/2i0/51AaEwirj
         Ozdg==
X-Gm-Message-State: AOAM531W92Dc54UlkJ4FhYxyRI/7z62gVgQQ/CE6+5oUtnxD6EgkaSmk
        jh2/UyGDL8SW18h3sRrjnqMZF8EgYn5z2g==
X-Google-Smtp-Source: ABdhPJwbH1UPS258iFVzK8ymYyd5l6CBkHvActlj1oAOVorwhaPtm2v31FlmotE25nbLKqPq4wXN6w==
X-Received: by 2002:aa7:c586:: with SMTP id g6mr3448135edq.343.1603475943688;
        Fri, 23 Oct 2020 10:59:03 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 59sm1093100ede.73.2020.10.23.10.59.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 10:59:03 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id gs25so3576409ejb.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 10:59:03 -0700 (PDT)
X-Received: by 2002:a2e:868b:: with SMTP id l11mr1279720lji.102.1603475472083;
 Fri, 23 Oct 2020 10:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com> <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
In-Reply-To: <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 23 Oct 2020 10:50:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
Message-ID: <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
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

On Fri, Oct 23, 2020 at 10:00 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> [Old patch from yesterday]
>
> After applying your patch on top on linux next tag 20201015
> there are two observations,
>   1) i386 build failed. please find build error build

Yes, this was expected. That patch explicitly only works on x86-64,
because 32-bit needs the double register handling for 64-bit values
(mainly loff_t).

>   2) x86_64 kasan test PASS and the reported error not found.

Ok, good. That confirms that the problem you reported is indeed the
register allocation.

The patch I sent an hour ago (the one based on Rasmus' one from
yesterday) should fix things too, and - unlike yesterday's - work on
32-bit.

But I'll wait for confirmation (and hopefully a sign-off from Rasmus
so that I can give him authorship) before actually committing it.

              Linus
