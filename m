Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9A3C433E1
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 12:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80F8A2076C
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 12:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgHZMjE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 08:39:04 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34805 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgHZMjE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2020 08:39:04 -0400
Received: by mail-ot1-f65.google.com with SMTP id k20so1352131otr.1
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 05:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NR9OReFq4HVfs7eHVMROxnuecpHpSgbn35xjndxkD4o=;
        b=KYRU2aUTVoDX67OzS2PIXXdvWob4bhRhJ20q1y8p2onPUfs8Y0dtuVfswckAHVvn5d
         40i+YuWduyGGqFuZnO46MwAPCe357Sbm/7IoMsL8Wxpe1JQfTwZJP+8cQumqvvpJ6J+9
         AUvNNC9F0CtfU5wcFjrKwaRrkVPq70kJjwkxlYr8l9Y+R3zt/8Q2b41AGP/WgLqPClPO
         FFwoeBAfZPeSGpmxiXXh+hyqJyARnlio4JrYqCodUAAEjD+1q4WDohOCrJkTtcsG9i7O
         9K8jw20vde6Qrde47aT/zqLtyue+7VSen+P1oFNRL1sVVOtdPRySj1aDqqI6Y9wIiTaF
         JEgQ==
X-Gm-Message-State: AOAM530sFGDjaJ/Qo5nK71Qgbq1kxYg2pSq5X1yHcn03bVZsrTmjPcN7
        HeQ9oudrUjN2k1Y/q5BBKcpkqBEH5oaaIi58BioD5nNN
X-Google-Smtp-Source: ABdhPJwAY70whLEgMgCxBmwU7EiqTpT1o37ImQhv6zSPFgEK/8EwMiHCZJ2mKhugpQMUn7nnwV6ctWuYDA4MycBKpPw=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr9098373otb.107.1598445543121;
 Wed, 26 Aug 2020 05:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <01c270ec-cd73-1d7e-0d1a-4ccde66e9d1b@physik.fu-berlin.de>
 <alpine.DEB.2.21.2008261430460.30022@ramsan.of.borg> <db3aaa13-1cc5-232d-102a-ef89a3304065@physik.fu-berlin.de>
In-Reply-To: <db3aaa13-1cc5-232d-102a-ef89a3304065@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Aug 2020 14:38:51 +0200
Message-ID: <CAMuHMdVH6OtTMzM7jbhnwvhUtag217PTYghLwd3iVAchXEn2xw@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Wed, Aug 26, 2020 at 2:35 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 8/26/20 2:32 PM, Geert Uytterhoeven wrote:
> >  #include <linux/uaccess.h>
> >  #include <asm/page.h>
> > @@ -277,6 +278,9 @@ asmlinkage int syscall_trace_enter(void)
> >
> >      if (test_thread_flag(TIF_SYSCALL_TRACE))
> >          ret = tracehook_report_syscall_entry(task_pt_regs(current));
> > +
> > +    secure_computing_strict(task_pt_regs(current)->orig_d0);
> > +
>
> That part is outdated. It was removed in the second commit I posted, see:
>
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/sh?id=0bb605c2c7f2b4b314b91510810b226de7f34fa1

That's the part which adds seccomp filter support.

> Do you have the check of the return value already in syscall_trace_entry?
>
> It should check for "-1" and jump to syscall_exit if true.

No, as that's needed only for seccomp filter support, AFAIU.

Have a look at arm, where seccomp filter support is optional, depending on ABI.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
