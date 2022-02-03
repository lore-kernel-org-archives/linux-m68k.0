Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FF8C433F5
	for <linux-m68k@archiver.kernel.org>; Thu,  3 Feb 2022 08:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345414AbiBCINp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 3 Feb 2022 03:13:45 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:42713 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344284AbiBCINn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 3 Feb 2022 03:13:43 -0500
Received: by mail-ua1-f49.google.com with SMTP id e17so3732571uad.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 03 Feb 2022 00:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9uBxzW1iQTkHJWmlNd6eDgXf7Vcz0FCfwe1uYSA3ng=;
        b=NH+2zDZ/KqLaBrQNQ6EBiEu1AagdmEYLQdybu9+JujZjLw2OboRSr9qkkaU1hsdtou
         kr9BQDd3WNWiqfPz/3afDyn33YkhfsZhGoe0gtkjgQgzgmPGxKgyqnnGIPLC69MA75S+
         rCf5YoThtJdstuFKVLGIXkqEVmgfhu/ftrdGauphc63b1AY7NmeSHE/Q5xwoIvoM6Olq
         BQdqFjT9LEgLSBVcoegWomJbnId8GNg5yApO5mup7AxnB6bVjnqL87wxXgmlc36QbZXj
         uTg1NCyw2e5N6bwIHQKpd4t7WijgxnDMRn8PG4KOpNQuYns54qslqedX8C3IFGNKi6WS
         Ilig==
X-Gm-Message-State: AOAM5315bybAbBorKJXq3fM32PTTCbgf8uoXETaIylB4SUSKFcmLTsgi
        Fc3XMkjRBKAWg8EF/tl1HNZmSGObJTTRhg==
X-Google-Smtp-Source: ABdhPJwe5wRmSVmcXaJTnoAcnxdkkE3nMq7kW4WmWNkx0R9P5ML75RnUTh1kjz5tTDk7MC09/7VrLA==
X-Received: by 2002:a05:6102:3f07:: with SMTP id k7mr13741562vsv.13.1643876022793;
        Thu, 03 Feb 2022 00:13:42 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id x7sm6369192vkg.31.2022.02.03.00.13.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 00:13:42 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 60so3819105uae.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 03 Feb 2022 00:13:42 -0800 (PST)
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr13728057uaj.89.1643876022094;
 Thu, 03 Feb 2022 00:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20220202225327.1544295-1-keescook@chromium.org>
In-Reply-To: <20220202225327.1544295-1-keescook@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Feb 2022 09:13:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRrD+2zKoHxAaQdDuiK5JFDanbv0SJ91OdWfx+eyekPQ@mail.gmail.com>
Message-ID: <CAMuHMdVRrD+2zKoHxAaQdDuiK5JFDanbv0SJ91OdWfx+eyekPQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: cmpxchg: Dereference matching size
To:     Kees Cook <keescook@chromium.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kees,

On Wed, Feb 2, 2022 at 11:53 PM Kees Cook <keescook@chromium.org> wrote:
> Similar to the recent arm64 fix[1], avoid overly wide casts in the cmpxchg
> implementation. Avoid this warning under -Warray-bounds with GCC 11:
>
> net/sched/cls_tcindex.c: In function 'tcindex_set_parms':
> ./arch/m68k/include/asm/cmpxchg.h:64:17: warning: array subscript 'volatile struct __xchg_dummy[0]' is partly outside array bounds of 'struct tcf_result[1]' [-Warray-bounds]
>    64 |                 __asm__ __volatile__
>       |                 ^~~~~~~
> net/sched/cls_tcindex.c:338:27: note: while referencing 'cr'
>   338 |         struct tcf_result cr = {};
>       |                           ^~
>
> No binary output differences are seen from this change.
>
> [1] commit 3364c6ce23c6 ("arm64: atomics: lse: Dereference matching size")
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Do you want me to queue this in the m68k for-v5.18 branch, or do
you want to take it yourself, together with commit a8712a32665f9b1a
("Makefile: Enable -Warray-bounds") in linux-next that triggers this?
In case of the latter:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Please let me know. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
