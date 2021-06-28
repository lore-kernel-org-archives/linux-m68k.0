Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C62AC2B9F4
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A76961AC0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhF1H2e (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 03:28:34 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:45806 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhF1H2d (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 03:28:33 -0400
Received: by mail-ua1-f47.google.com with SMTP id c20so6591712uar.12
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 00:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LsKnbt4+ViUcXtKxLi4ZKEFU973s/ysubk2jt/d6VUE=;
        b=VHvjXL6xKT8jH9yacEKVKWxQBa3CsIpnEOZq315dIJxWO07J1bLXA9N9a+n7/fLOBE
         dgLZXI4SpfAMpy50bKY5BrCnXx8I1JOQcslRuhyV/nscysS0bgZo7ARGyve4Tj0jIYHF
         wUxiGooerZdozSUGkc/3/EV4jccm0IEJ3xnHQSDee1EnYzGn/laRXDPXobZyA0q4hPXB
         uHLQxwieWSjKcciLVDgltwiza10yyFvGBn5lzgFyzd68o/bWoXRMuKjUytPhbdYpRuUh
         sakgq8VBiL7Lux66JLTQ3dgeqCEAZb61i7a7TMI/39L28057tvCRSfMC6LPnLB4iH+RH
         i1Bw==
X-Gm-Message-State: AOAM532hb16yY8nt83UP1qMU3vh4gdgchC80FYeBYcANsA+pQRY2juRi
        +POILv56dPtQ3TxMiRUjIilr62hAJWnkgkizGTw=
X-Google-Smtp-Source: ABdhPJx7bGqXKb6Ma5HvVbcA8UO26T+/XYpS38fC2GoBFUthXIpO4gn+I3T6UbSziPgk9xhP2LOiaNBwXzCMqq5aE+8=
X-Received: by 2002:ab0:3734:: with SMTP id s20mr19893993uag.106.1624865168354;
 Mon, 28 Jun 2021 00:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com> <1624495560-6351-2-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1624495560-6351-2-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 09:25:57 +0200
Message-ID: <CAMuHMdWoX=6Yf7MZXR92Q3APYixY5MDM6MW_UUf0DO2+oDkHAQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] m68k/kernel - wire up syscall_trace_enter/leave
 for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jun 24, 2021 at 2:46 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> m68k (other than Coldfire) uses syscall_trace for both trace entry
> and trace exit. Seccomp support requires separate entry points for
> trace entry and exit which are already provided for Coldfire.
>
> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
> in preparation for seccomp support. Check return code of
> syscall_trace_enter(), and skip syscall if -1. Return code will be
> left at what had been set by ptrace or seccomp (in regs->d0).
>
> No regression seen in testing with strace on ARAnyM.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

>  arch/m68k/kernel/entry.S  |  8 +++++---

We need similar changes to arch/m68k/68000/entry.S and
arch/m68k/coldfire/entry.S

>  arch/m68k/kernel/ptrace.c | 17 -----------------
>  2 files changed, 5 insertions(+), 20 deletions(-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
