Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8CEC433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 11 May 2022 12:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiEKMCT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 May 2022 08:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235801AbiEKMCS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 11 May 2022 08:02:18 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9AC68994
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 May 2022 05:02:16 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id y3so1756592qtn.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 May 2022 05:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZWFmwKWOlLPl7XEc75NKSaHMr/hgroG2DFqYMNTA9rE=;
        b=S7mGY5KMfKMBexMIq7N4q3JqeUmVpwYi2ijJItTpCGvG+vQBdsxxXm895p9ZgutJ2p
         GyIJMLfvrz9jHpsMjelLOH6xMzCJEz1qWKX/dkvQRq1SwVaLIPnSWIr+H/73srRCTw/4
         Xx19qhzAolHKSs4I1sla/UDHJfKskgl+z7alrhdbaB9A7qy5e2hsX6sCvxj2HpLky5Yu
         mWvkmieX318zPap5ILtQGM6jMZ3+2fJBH8AqHgITL9ENEV3Oto7xWtlP+S4yh0tV71Ns
         PzepXNsfVwWVLERQZsMueUmqAxzExxLrCljYmxtwcZwcg+MQg6lawQPWqirhvkc/FRTE
         uI4w==
X-Gm-Message-State: AOAM5317RGuGT/ipieVaT4gkVJMpUafaYhdttza0nII10wh5fP3liajM
        g7HYgxYO06DzdmpvVhV1qckAD6nGg0GHZA==
X-Google-Smtp-Source: ABdhPJwnmXCB4jk/VEJ1ntMm4RPYSHFVX84/tiHlZTK2OW2v1S/h/Wzw6GE0lSb35skz9dWLqH09wg==
X-Received: by 2002:a05:622a:311:b0:2f3:ddb0:4ae6 with SMTP id q17-20020a05622a031100b002f3ddb04ae6mr10942323qtw.140.1652270535466;
        Wed, 11 May 2022 05:02:15 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 138-20020a370890000000b0069fc13ce1fcsm1078360qki.45.2022.05.11.05.02.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 05:02:15 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id m190so3567230ybf.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 May 2022 05:02:14 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr24367466ybb.36.1652270534527; Wed, 11
 May 2022 05:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <e0a9cf982a80f14efbf01cdc38e31128a9f41999.1652262437.git.geert@linux-m68k.org>
 <875ymcwek5.fsf@igel.home>
In-Reply-To: <875ymcwek5.fsf@igel.home>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 May 2022 14:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrd07goR2WffENJnLMAWZxtxoQzaL_7+SG-ZSvaYK1HQ@mail.gmail.com>
Message-ID: <CAMuHMdXrd07goR2WffENJnLMAWZxtxoQzaL_7+SG-ZSvaYK1HQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: math-emu: Fix dependencies of math emulation support
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Greg Ungerer <gerg@uclinux.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On Wed, May 11, 2022 at 1:43 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Mai 11 2022, Geert Uytterhoeven wrote:
> > Drop the dependency on MMU, as the code should work fine on 68020 and up
> > without MMU (which are not yet supported by Linux, though).
> > Add dependencies on M68K_CLASSIC (to rule out Coldfire) and FPU (to rule
> > out 68xxx below 68020).
>
> Depending on FPU looks strange, since that is supposed to be an FPU
> emulation, for CPUs that _lack_ an FPU (ie. 680[23]0 without the
> 6888[12], or 68LC0[46]0).

I picked FPU because it is selected by all of M680[2346]0.
Upon closer look, both the hard FPU and soft FPU code are protected
by CONFIG_FPU, so the latter looks like the right symbol.
The FPU emu code also relies on the CPU trapping on the proper
instructions, which I believe you need a 68020+ for, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
