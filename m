Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406DFC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Mar 2022 07:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352286AbiCPHVh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Mar 2022 03:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350880AbiCPHVg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Mar 2022 03:21:36 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74A15F8DB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Mar 2022 00:20:22 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id t7so1096992qta.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Mar 2022 00:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2UrYIeGG5yGpNR6ELr9LbkL+htuceQjp8Txzg7tIWr8=;
        b=eEv39eX8/va9SnQfCnW3+NE06fYcvacMZdzznHCU7QTDVo+ueX06q8s5UBMLQcb+B/
         ZlWXLMuS6EyK4Iqx/Z9KUtRwsBwHzZOrC9f+rqsgMgtbXwU7e+5A3wASLM6n9ZCTaK7T
         Gp15plkNsU/11j8x5Lw+Sdg81og4SHZ0BjM1mfXh+hu2Ppq+YLhCeTlFJ7dXQohODPYs
         P0WQTW/Q1VLUdFFhtELjg1i0PGGhbcS4W7g2hKEWk0Zx0QbM7JQWXTTy9zhPOvosIzaP
         bWb9/mx80R89KYK3HCU3PpAoB8WAEzYjuG9HsSxdqiC/IqJxKXEDWUyxFLFraX/9RwZ4
         tQnQ==
X-Gm-Message-State: AOAM532NPQfSkcCBSAEzIOjU6UB1WgYs1+MMnwGFY6ieSX1m5jfb7FeA
        9DmVYXKrCsaUxfxPfGFpLrLRMu8tK+liHA==
X-Google-Smtp-Source: ABdhPJyo98v17H9rM0X28QKugHLhkrIwGysLJ17rlY8Futr9XnbPt+1PsrZ6xaOB2Sd+MYRUue7v4Q==
X-Received: by 2002:a05:622a:10:b0:2e1:c3b3:4317 with SMTP id x16-20020a05622a001000b002e1c3b34317mr17480425qtw.39.1647415221423;
        Wed, 16 Mar 2022 00:20:21 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 20-20020ac84e94000000b002e1d5505fb6sm883485qtp.63.2022.03.16.00.20.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 00:20:21 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id u103so2785593ybi.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Mar 2022 00:20:21 -0700 (PDT)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr26791854ybn.6.1647415220657; Wed, 16
 Mar 2022 00:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220315235148.54253-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220315235148.54253-1-yang.lee@linux.alibaba.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Mar 2022 08:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvgXAnZTGxBWyQ78LPko1f1uUhQRT6TxE1ZDHhRiT2Zw@mail.gmail.com>
Message-ID: <CAMuHMdXvgXAnZTGxBWyQ78LPko1f1uUhQRT6TxE1ZDHhRiT2Zw@mail.gmail.com>
Subject: Re: [PATCH -next] ptrace: Remove duplicated include in ptrace.c
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Oleg Nesterov <oleg@redhat.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abaci Robot <abaci@linux.alibaba.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Yang,

CC Eric

On Wed, Mar 16, 2022 at 12:52 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
> Fix following includecheck warning:
> ./arch/m68k/kernel/ptrace.c: linux/ptrace.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/kernel/ptrace.c
> +++ b/arch/m68k/kernel/ptrace.c
> @@ -19,7 +19,6 @@
>  #include <linux/ptrace.h>
>  #include <linux/user.h>
>  #include <linux/signal.h>
> -#include <linux/ptrace.h>
>
>  #include <linux/uaccess.h>
>  #include <asm/page.h>

This is due to commit 153474ba1a4aed0a ("ptrace: Create
ptrace_report_syscall_{entry,exit} in ptrace.h"), which is not yet
in the m68k tree, but only in next-20220315, so I cannot do anything
about it before v5.18-rc1.

Eric: Can you still fix this in the original commit?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
