Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDF5C388F9
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 00:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C350223C7
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 00:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603412598;
	bh=JkMHsX00scG8RG40PkHwqAPGCznrmXFCZCEp1YjR6/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=RYwSgCFxwnaBgWkpd9+kw2cGpiat/1hgbuxGFwGMXzBDfjEJHcvz8HwFy5YBSZ2Mg
	 fvnWRPApQO1DKJNSX/xQKEacLZbynwb6INfYgHBZG8t90IcDPSEE5QOfQ2HvXFuyse
	 HO+35nBp0XQgqrURQQESQdso7eEG9Rsk/1D166TQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508393AbgJWAXR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Oct 2020 20:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2901292AbgJWAXR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Oct 2020 20:23:17 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A748FC0613CF
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 17:23:16 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j30so4484630lfp.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKRAxIo6c5FisvVeBU9yqsWIDr+qdhruysORLXOncrM=;
        b=bS2jLvh7vQ7kVcl9lNidPdK72YodR3TdlvHITcAlNYbV1H5WvtWBHkH3n72zN5qksn
         hhTGaYZupVEqQDijLXzlvu27kjGqNTTSQHebcdWKhIDs1IxhBoQmiF2fzAUbTd+hIJwi
         P6mCkiBawvH/9GPgqnfBayA/RDSiwcxFNhm+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKRAxIo6c5FisvVeBU9yqsWIDr+qdhruysORLXOncrM=;
        b=kydBwOWBnP1QSbpBPLJ/On0u9yBiwDc9TXhf1S1fet8Ka2gltMgLTI6KWTmWMUbRgN
         QBe6SCEDjNNk5j6JEtgIGekrwv2Bxdz+fRF0FYY6HBxnglEnU65U1yjVoEG7t11dwkAJ
         cBDzeF9trpX9PWPArD6P6oPixdNzrwOanm1jAFphaENQdiIofZZxd+d04HSvC2zEWB9K
         vQEhL3W3ID0NcrPTelUALe5JagTFyOnfzSBiFpa6VGX/tEvrjSTApNewzGaFyzg84a5/
         HUcbTSQ2YChcxIFIc/QKoMmDpQOoeE50WZuTYeF9grqr1Alw0vokHUa0x3JzdYWv8+l7
         7iHA==
X-Gm-Message-State: AOAM531BVIAaK1RqWGTz4iuo5ArqoZ40bslKSP6x7xmNAguCCoff/ezh
        pkBeLJA8H69ah8cvUcGXhHAtarA0I7sgEg==
X-Google-Smtp-Source: ABdhPJy9x6wjtNEeJJSexcdXLEyczkk4YKCDdxf5eGJJLeSHcFsiSkyFHW1GuB1c/DGOHygChn+Stw==
X-Received: by 2002:a19:c3cd:: with SMTP id t196mr1475561lff.501.1603412594547;
        Thu, 22 Oct 2020 17:23:14 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id r7sm417503lfc.206.2020.10.22.17.23.12
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 17:23:13 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id d24so3873695ljg.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 17:23:12 -0700 (PDT)
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr1747084ljp.421.1603412592176;
 Thu, 22 Oct 2020 17:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com> <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
In-Reply-To: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Oct 2020 17:22:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgeHE7AS2Q4kPrkC5dMqfx_6+E84+FcEDYJSTugxqivUA@mail.gmail.com>
Message-ID: <CAHk-=wgeHE7AS2Q4kPrkC5dMqfx_6+E84+FcEDYJSTugxqivUA@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 5:11 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> In particular, I wonder if it's that KASAN causes some reload pattern,
> and the whole
>
>      register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);
> ..
>      asm volatile(.. "r" (__val_pu) ..)
>
> thing causes problems.

That pattern isn't new (see the same pattern and the comment above get_user).

But our previous use of that pattern had it as an output of the asm,
and the new use is as an input. That obviously shouldn't matter, but
if it's some odd compiler code generation interaction, all bets are
off..

                Linus
