Return-Path: <SRS0=bR5W=D5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AF7C5517A
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Oct 2020 20:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C26E72080C
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Oct 2020 20:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VyEe68Xl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896682AbgJVU4O (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Oct 2020 16:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896406AbgJVUzc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Oct 2020 16:55:32 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91587C0613CF
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 13:55:32 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id n6so3121940ioc.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VDqQ1zUFMtHdEQX/XnB1xFyEhicaRQXlC/XVGrEZwa8=;
        b=VyEe68XlMV50b/P9pS/svd5VOtStgjDnCFZMZjKTTx7pdFDDhzCENV4HcxJM9i+Uuw
         LiDRngh7O9Fhy7t3czR8G9POoGKJpzUcMMpE1KWlgBTNmSNaqB++disNaWd9E1RwFlbR
         mGcwn/ktt+GC/IvkgbcVni01WjvOc/MWsa+mCzzp38xtrKCPVsJKBs2zakxjrmPEoly5
         4wSESx7ApniV/x9orqnTmBy63HxvP9CrSQwEyhWS0mpkEEWpcKIZ2X9Kl99vLuruKYpo
         Q8HWU9xP/cvr2EBSZCnacbWsDa8VuNrqvliEVRVD/1BzqJNXTLpIX7MCpYtmnfhCSqko
         95HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VDqQ1zUFMtHdEQX/XnB1xFyEhicaRQXlC/XVGrEZwa8=;
        b=NHCOJwRPUXaBXom3Mdq54N9hOo6StRKjk8QQcW16h8CC+Cei6T/8jwrQJcm3vMKusQ
         VU77Whhe4yjXq1nHyH3hP+JHq+N5Xc4HAOEbjGXe5B3A6U87KpTVP+Rygf5nq50LGeFP
         bJSJ+G/32ous4GW/2nsZvl3/0Tc/DoIeTL+3mIT0bmaQ2n9Qfx1PlDqbStTnYCxGBYub
         UDiaic/TarkW6JJl4MeBMBnhVxAlNsTdzXsLn1Sch1CXA6+nUVQuGmgxyCf9orcCi190
         Vb3JWaQCunVqgZJcpAvRgKI/NAV0pve9pDmffB6Zq2yrtv43PEvS+PAKfnLobBXEAKJh
         5gAQ==
X-Gm-Message-State: AOAM530/mVNYnNdynsULZ+KonA38Vf37oI5ODUlJM5lMn9VOyodVfOmz
        duqjE7AN3y1OcL8gFgtaI48V9u0ZnFpIxsWJJ5mA1w==
X-Google-Smtp-Source: ABdhPJzNAEoDdzk8im6Rre99ntzZ1ceh3FOZU/YY1017p4KAHNCXoSiYj9RA6tXJM5tmAF3CrywzIjbpBzUeroOsy8o=
X-Received: by 2002:a02:ec3:: with SMTP id 186mr3173967jae.92.1603400131365;
 Thu, 22 Oct 2020 13:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com> <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
In-Reply-To: <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 23 Oct 2020 02:25:19 +0530
Message-ID: <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
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

On Wed, 21 Oct 2020 at 22:52, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Wed, 21 Oct 2020 at 22:35, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Oct 21, 2020 at 9:58 AM Naresh Kamboju
> > <naresh.kamboju@linaro.org> wrote:
> > >
> > > LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
> > > x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
> > > This regression started happening from next-20201015 nowards
> >
> > Is it repeatable enough to be bisectable?
>
> Yes. This is easily reproducible.
> I will bisect and report here.

The bad commit points to,

commit d55564cfc222326e944893eff0c4118353e349ec
x86: Make __put_user() generate an out-of-line call

I have reverted this single patch and confirmed the reported
problem is not seen anymore.

- Naresh
