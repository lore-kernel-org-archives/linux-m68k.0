Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F14C63777
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 08:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71F4C22240
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 08:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgKTIRV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:17:21 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:44545 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgKTIRV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Nov 2020 03:17:21 -0500
Received: by mail-oo1-f67.google.com with SMTP id i13so2025841oou.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2020 00:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wgLd9BBo4uYIF4N/NL617CUs8tQbYdNBRQ1iVnTQmdw=;
        b=XnPU/nO7gqVj6VsIlwYzP3jkWmdy3j1s1BQavAX6svCgHVwMKWw3Kw1krcuTzTCD2F
         WqnSuqUW20xVQuXqRbi5VtUKz0GdQNDSfXTzsfznS7lBaRrdWOKclMUNX1++4xlnK5XK
         mxHVPM+Agj+GeRw2w+N/bkLz4cVnSpzkUslJT233VC5uN3ajKJx6WsOZJfYizJMJmTq8
         TXSXUB0Ne2cUw5FNRWiQXsRebxwf+g3qwtECAdhY0gymrGjj01VtILn66bARTXdhpuhK
         trbw5SjN80xEftm6/rIOVaskQ1yrYTqEpu87245kZYAbigK4wd+IKlMSfRwE+x8B/3QD
         AlcQ==
X-Gm-Message-State: AOAM532xu+Fu1+gTDRXahKClK8c2JDMkgrL1+WuvI34cvGJI/V55/SFX
        kM/PS9akMFRfhzICtATV+G61zYV3H8wVOrqAcX4=
X-Google-Smtp-Source: ABdhPJz2rlvtnz62/IN8qU2Va4dApiOA7G8a+PqbUd2beP0jChAoN8gyHy+iOieFRLBTeVj1h9hn8kHu10tYD85QmCg=
X-Received: by 2002:a4a:e80b:: with SMTP id b11mr13222498oob.1.1605860240013;
 Fri, 20 Nov 2020 00:17:20 -0800 (PST)
MIME-Version: 1.0
References: <1605852494-23515-1-git-send-email-tangyouling@loongson.cn>
In-Reply-To: <1605852494-23515-1-git-send-email-tangyouling@loongson.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:17:08 +0100
Message-ID: <CAMuHMdVhskCPQKRvdQP=pqZ+ojGoRf22UNxiYHYM9Ae9DiyZ0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: Add a missing ELF_DETAILS in link script
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 20, 2020 at 7:08 AM Youling Tang <tangyouling@loongson.cn> wrote:
> Commit c604abc3f6e3 ("vmlinux.lds.h: Split ELF_DETAILS from STABS_DEBUG")
> after should add a missing ELF_DETAILS, at the same time, the .comment
> section has been included in the ELF_DETAILS.
>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
