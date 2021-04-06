Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900ABC433ED
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Apr 2021 07:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B8BA60C41
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Apr 2021 07:29:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbhDFH3W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:29:22 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:37858 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbhDFH3W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Apr 2021 03:29:22 -0400
Received: by mail-vs1-f44.google.com with SMTP id 2so6340240vsh.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Apr 2021 00:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kyM/uX3bNRVEEpQyWz+heQsyz9AuEXH5GY8XvmdJ2M8=;
        b=gc8mFKgySQvslNhsp/XqdEN9El41x9BqLcLk6oqNCAyvXkuWgnpMiWjAF1F0EGekz+
         uY/fxj2YI7RR2nwLKBr5z5bsmmpChwLuVvtwc3/pQH9b5rYV+snAfaHfzi0p26xdkreO
         7mxVJFvIOEpn+3UTA1m250QJw8JAWAIKuYD7onBy9bGa2mSIcDzKBaRXPN8xDAuI+ooW
         S6intLE/39fdXH+6pumUhMhuRnFoxuHFeJ+s7H1n7pxrOzhwBGNUp7MlTxcmPo4Imr8S
         8U0uGcjh59rwaFKDhDI3fdKoiwSMxucAJfRB6WoxYfS7MSRk48pW9LTPyGB6tmbFZ33E
         9ABw==
X-Gm-Message-State: AOAM532OC99PmFY2iXDqVHYH5nTJMr+Fhh5bl+dXtG3IssaISX3aeIGs
        HyIydFhKV7jenjHPJf9M9CB58yvv5qcCFY6TReQ=
X-Google-Smtp-Source: ABdhPJxRrheCHURj0E2MRfmD4sDJxeC2/iWmE2pAfQHXfFzaRswrQd5da0Fd6b1HnnZCYlYkGTtsz4fvdwunMa9q754=
X-Received: by 2002:a05:6102:3010:: with SMTP id s16mr12429339vsa.3.1617694154355;
 Tue, 06 Apr 2021 00:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <4fdaa113db089b8fb607f7dd818479f8cdcc4547.1617089871.git.fthain@telegraphics.com.au>
In-Reply-To: <4fdaa113db089b8fb607f7dd818479f8cdcc4547.1617089871.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Apr 2021 09:29:03 +0200
Message-ID: <CAMuHMdV6X6tP5WddrTbowo9=YkZqzOTw71329o6mK=SiFqSQSQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mvme147, mvme16x: Don't wipe PCC timer config bits
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Michael Pavone <pavone@retrodev.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Mar 30, 2021 at 9:40 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> Don't clear the timer 1 configuration bits when clearing the interrupt flag
> and counter overflow. As Michael reported, "This results in no timer
> interrupts being delivered after the first. Initialization then hangs
> in calibrate_delay as the jiffies counter is not updated."
>
> On mvme16x, enable the timer after requesting the irq, consistent with
> mvme147.
>
> Cc: Michael Pavone <pavone@retrodev.com>
> Fixes: 7529b90d051e ("m68k: mvme147: Handle timer counter overflow")
> Fixes: 19999a8b8782 ("m68k: mvme16x: Handle timer counter overflow")
> Reported-and-tested-by: Michael Pavone <pavone@retrodev.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks, applying, and queueing in the m68k for-v5.13 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
