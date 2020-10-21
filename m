Return-Path: <SRS0=XyjB=D4=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A2FC55179
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Oct 2020 17:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F6062224E
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Oct 2020 17:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ub1i2qnq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503411AbgJURXK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Oct 2020 13:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443833AbgJURXK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Oct 2020 13:23:10 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB38C0613D2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2020 10:23:07 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id p15so4035314ioh.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2020 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7535FUlfM8DZDchGw8aykWjhU0FVacKPwMt6VunyyW4=;
        b=ub1i2qnqq5gc5yWa++WfJbKGLRDF3XgcjuF4SNEwsZorMl0qqBlkzzk65jDvd1rIp6
         lsc7BJmCFH+/nkMbVQcVwn4bYWFUNTGPYV9LnCocI598fe1uL6/mDLuJIxfahYegMgmV
         O6P5shfiwBpbj5CWne+FmGk5phLqk0nId5IETHoA04NJ3VI8BSq+2EJbyBFyDYvD9KOQ
         SIXqL0Q6SqAfgMBeJW3/ZMjqQX2LwKMlStEFUHBOIC/HAkX92HVDxbei5SvC4AtBDDgM
         BjeK/N4wHt0pTqvRnrqr83fx4BR3FWwhR0strhBEMc39uPq0fD7cDyRbXeouxt7OuCWl
         kfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7535FUlfM8DZDchGw8aykWjhU0FVacKPwMt6VunyyW4=;
        b=TDyzIh07dvV0tVnZrP1CnVZ9NdclUjBmfTX9M316gbg0ysVZovTeGfaML/smzzIlJ2
         MdP0Sa2bWRxmV1yUEQh+TV7yg3HUSBf4gAGpgkBl6Wa+vMsH2+SP9fCFr/7Ank1MffM0
         QGpTsRp3fHyNx+2cK2GNc6omwvvpSUDon+7YSiPd2B9BzY4mxkbcKL2HK0JJt8YBAm3v
         wiKOvt73UNgyYRWKG6iS41yXkPMHZp/tf6LVXcDpRHUKOwh7txX3xViDet2DDEx7fyx+
         75mCR/6p2DhsgOqXugeXyQfmUV/4tlc1uZjMqoqKunFmumFy853It4rZu9dj7siNCBIK
         4UNQ==
X-Gm-Message-State: AOAM532TpbxQ3/sKWz9i8TiodBGr8Pa2zJIDvpRjnTFCL6lP1keoK0Jq
        0CS57+hmNSD3fvarP1QSp5QXDe+yIi4f+i2LspaPgQ==
X-Google-Smtp-Source: ABdhPJwAHwzHnXyK/Q61hpqVatVAWev4QhEe6lQZY+aucdSgk3iXPP53Fr7H1mN9nTWnRSkEsIkHirrQTjnUX0bFcLQ=
X-Received: by 2002:a6b:5c06:: with SMTP id z6mr3661750ioh.49.1603300986883;
 Wed, 21 Oct 2020 10:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
In-Reply-To: <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 21 Oct 2020 22:52:55 +0530
Message-ID: <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
Subject: Re: mmstress[1309]: segfault at 7f3d71a36ee8 ip 00007f3d77132bdf sp
 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        X86 ML <x86@kernel.org>, LTP List <ltp@lists.linux.it>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        zenglg.jy@cn.fujitsu.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 21 Oct 2020 at 22:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Oct 21, 2020 at 9:58 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
> > x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
> > This regression started happening from next-20201015 nowards
>
> Is it repeatable enough to be bisectable?

Yes. This is easily reproducible.
I will bisect and report here.

>
>              Linus

- Naresh
