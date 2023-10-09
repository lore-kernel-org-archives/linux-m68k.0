Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C73FE95A91
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 11:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbjJILaV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbjJILaR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 07:30:17 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7ECFEA
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 04:29:52 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f82ad1e09so55429967b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 04:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696850991; x=1697455791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmxle10UmTm3V9bFVaMw9WXKc8CRfQ8WHVztXUU4bIQ=;
        b=aQUiqcGFxubDcajX392LaYCy/I6CmrOcw9D2j5AxA3+n/xQSP3WRKEmwnvWSvuDrDP
         Xy8jzcjaCg9nSQp9YdyIoATVEjfW7W4Jc3neDlok8Iu54iXnsDXiPlB5b3Vknw3BxyFH
         DrAgQGRNC3RuAB3zt9N4k40giDhzpis9V1W31rdqqstvpVIi+tUi2amLb524a7OoV021
         E9MuXb0qzPUs2LA2OqX860R1K4Sf1yl8gEVwJwz3AtRengkZ2QivxAH8/xAVGemO/0Np
         0wkWuJh+0sYj0MQgH6o6a7BbFTWpevY2/JWG5zAmwuiV5RARhu5Ux1m6bIloMcd1i9ml
         M90A==
X-Gm-Message-State: AOJu0YzoRhiJkeEAjHda9QLUqhrCR6uMa6WtD5yXOj2GNcueD3myombK
        g44k9YpPq83lEcoq3pu3Ri5ibGQewHVY3A==
X-Google-Smtp-Source: AGHT+IE3dXtRX4mCTfFzPMTd+0G3iRtHQrgeOTqrlZjMNZ2AkHS+Xeev4f3Vy9Jdi/dOa2glv1xmCw==
X-Received: by 2002:a0d:c886:0:b0:59f:9c08:8f12 with SMTP id k128-20020a0dc886000000b0059f9c088f12mr18894816ywd.38.1696850991692;
        Mon, 09 Oct 2023 04:29:51 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id z16-20020a81a250000000b0059b24bd4f2asm3599451ywg.57.2023.10.09.04.29.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:29:51 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9a3bee451bso103087276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 04:29:51 -0700 (PDT)
X-Received: by 2002:a25:bccd:0:b0:d4b:6a0:fe2b with SMTP id
 l13-20020a25bccd000000b00d4b06a0fe2bmr14893641ybm.36.1696850990864; Mon, 09
 Oct 2023 04:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <7858a184cda66e0991fd295c711dfed7e4d1248c.1696603287.git.geert@linux-m68k.org>
In-Reply-To: <7858a184cda66e0991fd295c711dfed7e4d1248c.1696603287.git.geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 13:29:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT7QEfagWcLx9z7YGtFiKRW5-J3F6gyxKYEzFBb=2_Gg@mail.gmail.com>
Message-ID: <CAMuHMdVT7QEfagWcLx9z7YGtFiKRW5-J3F6gyxKYEzFBb=2_Gg@mail.gmail.com>
Subject: Re: [PATCH/RFC] m68k: Add full preempt support
To:     Greg Ungerer <gerg@linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 6, 2023 at 4:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Currently, a Preemptible Kernel is only supported on the Coldfire CPU
> family.  Extend preempt support to the full Classic M68K CPU family
> (68020+ with MMU, and 68000-derivatives without MMU).
>
> Make sure preemption is disabled in loops involving cache and TLB
> flushing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Tested on ARAnyM, using none/voluntary/full preemption.

bloat-o-meter summaries for atari_defconfig:

PREEMPT_NONE -> PREEMPT_VOLUNTARY:

    add/remove: 0/0 grow/shrink: 238/30 up/down: 2804/-748 (2056)
    Total: Before=4478149, After=4480205, chg +0.05%

PREEMPT_VOLUNTARY -> PREEMPT:

    add/remove: 735/277 grow/shrink: 3050/347 up/down: 244359/-11440 (232919)
    Total: Before=4480205, After=4713124, chg +5.20%

Ouch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
