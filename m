Return-Path: <SRS0=XyjB=D4=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B55C56201
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Oct 2020 17:05:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17ADC223BF
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Oct 2020 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603299930;
	bh=3lfR7xa5boYnvRubhbBaoRUMe0SZwtv6QBp1elG4dxg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0juBtegsf3RFKlY6q5k+XlFRbeXkd70VfCARwXx+UFLKewCCsDD3mHtmsRSNiBGKo
	 QsCYwOUseh7/2xzPcgU1EOKFduNuK/ZNIx9jHhpFcEJ3oseM/HNKTZOzT3IFWhNE+r
	 3r79DoqSLrJS6Lz1APZyxGDqHbpMpcSBkLPE+7Jg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503354AbgJURFa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Oct 2020 13:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438032AbgJURF3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Oct 2020 13:05:29 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B0AC0613CE
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2020 10:05:27 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id p15so3412588ljj.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2020 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jZ8rX4nMXu9yVxF6VhEpyRT/HJL/yeSOHN33lmmqE3Q=;
        b=d6nJua3ZU/+MbORwAQIhOyj2afUAGnde4GMpRV2HxlMNrYs0QlTInEU5dTEigbF5Df
         dmv41P9p05B6BQtvCcM2OmGGKAdgaTWy1b42EvZb4/P124a6kJRtmA9iy0DRhNfGxKOc
         95gwtWQc4/Bu6Cew4ZrJmy92LVxyerHew+FaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZ8rX4nMXu9yVxF6VhEpyRT/HJL/yeSOHN33lmmqE3Q=;
        b=ZYeUgCQ47vvuJYJIgkzVyUdbUXfLYnTcQfTvUAYhcb88uJpbCKXpxprGuCc6/wWWyL
         9X6RfstPu+pKGCH4zSrLGOw5vycJ29EKnbWppMpTggvg5xn3kyeIhViSSzOSD7K48lqo
         wx0BnLuOCScVbrbxBK3tjUDlHoDlp9Llnm4FI6v8Hi2ZtC4k/ADU5moNS9qdFliPMKJ/
         4kCKEIitFGUR+lveZV/NJ4ZAlyl9t/klTU6s58PKj7NNx9+SCHH5uUZNl7GhmX/nfSYM
         Z9fnXXET5KkJxtvYcVs/mVI+GyHH9N4RZ2jLLiTBw6/4RQFUDD2pVLIepeti/hmboj7A
         1Sxw==
X-Gm-Message-State: AOAM533MRVUIG6/9b/2osfPgp3DMOSsF9DLBKkvElzG2i5f/7no4xgpa
        mzkZhUca9OuTObPUnc+eOsCOmB5dTGPKng==
X-Google-Smtp-Source: ABdhPJwv2M3OripYu4yuVRA823AkYtZ0QjRpG2FRhG9npuu4WSwxmnuLt44nNe19dyjvBClN6Pn91w==
X-Received: by 2002:a2e:8e72:: with SMTP id t18mr1756706ljk.445.1603299925910;
        Wed, 21 Oct 2020 10:05:25 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id m8sm469720lfh.258.2020.10.21.10.05.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 10:05:23 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id h6so4067277lfj.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2020 10:05:22 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr1474665lff.105.1603299922233;
 Wed, 21 Oct 2020 10:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
In-Reply-To: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 21 Oct 2020 10:05:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
Message-ID: <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
Subject: Re: mmstress[1309]: segfault at 7f3d71a36ee8 ip 00007f3d77132bdf sp
 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
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

On Wed, Oct 21, 2020 at 9:58 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
> x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
> This regression started happening from next-20201015 nowards

Is it repeatable enough to be bisectable?

             Linus
