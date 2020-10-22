Return-Path: <SRS0=bR5W=D5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EB1C388F9
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Oct 2020 23:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 078AF223BF
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Oct 2020 23:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603410250;
	bh=w0hhhK9SuJ4StTvf9Zuf0dXNaEgn7v4WIO2UyE2pTVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ngSydSTnuddheWHnG4sNJZ8gZ3HS43BkyWMxJHxH727Y/0tUPA6UTotIJeezHJZp9
	 MjZqDfUt8ATP1TYKKhLGw60q34cwjZRv6JdJ3eSevvHJm+O69p/6AmI0kighF3pDTy
	 2UBv0s1pZ07NAp81B2MOhbmtk13u1ffrguytvy7A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373459AbgJVXoB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Oct 2020 19:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373457AbgJVXnu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Oct 2020 19:43:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494F5C0613CE
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 16:43:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x16so3824174ljh.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 16:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZlkuWdQsWCC+a50v77gxrEMTeODSOjQWFOP4UJJDnk=;
        b=cUh4yK+PBHMfvd0jB2OsQ/bbtVKzuZXCL7HCSyczFYL0WDzRBvZVm9aGeWWIrYr1bV
         eQsOXOM/9NK6ZpiQfmHlPRe4enJaYE4/D8F89jSu64rneyt74YTf/zmuRNDcncLY9PbV
         vox7spklRgKMSQvRa+Z12H1g1wjSNh7DosrlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZlkuWdQsWCC+a50v77gxrEMTeODSOjQWFOP4UJJDnk=;
        b=KXRfbXz15vV0OBzXmDkPBWMAYWX7dtHxwFzonU/xdMQVJYEe8yqMKV9oFc2z9WZn7D
         rid2W3e+YWQmfHuxkib4D0bZqWirmnwhBvRsXvPnHgCgPaRGv5inJY7AbEcgaCaOJGL9
         RcNOXZpRvjwmHiqBlAEk60iZapUcOT6Q+oQLbnxuWAll/3JfZrREcGZY76g2FQDnuFbi
         XwjT84hQVugtT0TmOSA/cc7cZqxL1wTn1F/e/HrFat4ESXwcZwLZIKVnhX/FAa9IESco
         lPyrhSrlXlKrjdNUcr+M1dWsTWcvb0MKrUzkZbcJQpFP4pJIjukKEtTvzSueU0g8aPn+
         kIcw==
X-Gm-Message-State: AOAM530BwPfg9Ixb0eA7+K1p2qaq44tKafU77zH7mlchgToU8u5dDPTG
        MblagBalVYaDuyTGYjSJIjGvYH3pbmqcQA==
X-Google-Smtp-Source: ABdhPJwbwf1v1vSISafQn2XseNZ/2XgAhoFGzREgsYAT0IOAXEzwtEsWGnUBYhTqv69dvX1NF3EzNg==
X-Received: by 2002:a2e:a375:: with SMTP id i21mr1886205ljn.135.1603410228244;
        Thu, 22 Oct 2020 16:43:48 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id n125sm414577lfd.7.2020.10.22.16.43.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 16:43:46 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id m16so3811355ljo.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 16:43:45 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr2045832ljh.312.1603410225256;
 Thu, 22 Oct 2020 16:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com> <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
In-Reply-To: <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Oct 2020 16:43:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
Message-ID: <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 1:55 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The bad commit points to,
>
> commit d55564cfc222326e944893eff0c4118353e349ec
> x86: Make __put_user() generate an out-of-line call
>
> I have reverted this single patch and confirmed the reported
> problem is not seen anymore.

Thanks. Very funky, but thanks. I've been running that commit on my
machine for over half a year, and it still looks "trivially correct"
to me, but let me go look at it one more time. Can't argue with a
reliable bisect and revert..

            Linus
