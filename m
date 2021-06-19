Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11686C48BDF
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 01:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1CB460FE7
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 01:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbhFSB5W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Jun 2021 21:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbhFSB5W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Jun 2021 21:57:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E3EC06175F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Jun 2021 18:55:10 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f8so7842477lfu.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Jun 2021 18:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lg+K1zU+2dStQVWKUOdP34UwGw2vJJvLbwau/fvffAA=;
        b=Nv/flYhKtgltntmBq1tzvLsNQ/psPmRZIqCV37PZInIw1jjmg1gSirNRvsbGYE+6vY
         gL8r9JhQ4eH121zp95P8jrsbWkOQhH71GdmdgBwhs0lCOZKMohPCjreUdeeEZL7OLS69
         ij/+3/27K37keovrO3Eg3GR/AMfh26YRbefKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lg+K1zU+2dStQVWKUOdP34UwGw2vJJvLbwau/fvffAA=;
        b=iacDhU+dH+rv+LakcImyT9HynzZWNMFbpXGsL72ghahJUpnhm6u3Wy+4QFcyxLn4x8
         8UOCykXTif9+ZvGbL8ilglYaalZwTMQk5eFflNlbdxfmAiohVKhuDSwJIi5m3/mde4K7
         YdDEizM74SbA2e8Fg93WgR+8QYNP8dt5k7Yv9NRAnn7JhKxJoS7tmeVzcxEEogBnd/vh
         P7CNPLMK4RG3D1i3H0vtgFPiI8JLNgFgjMezK8uPSvXpE6iMihdjAgDgeDhJ2Nq2NNJM
         X9ushr5DJYymMwCeIqqGOKjCl/3e2oRwvotD1FdeXLHiAUMevCG2yGOzOmPvBW5uRKgw
         qReg==
X-Gm-Message-State: AOAM532a/xXBTj98gdqLkzNHhUCAr5e0ZFeGYMxx/8iEXfHiUp1zAK7U
        bCKdL3Q4iGh+O3KUExGq+yTBHrQFeruTiPf0
X-Google-Smtp-Source: ABdhPJzB5EegI9SnBRF/LzQzsTozyD/5TavXaNqnU/zl9aAy9qIWGQ5lcLuNrQevJYKG2YhL2dSgFA==
X-Received: by 2002:a19:4916:: with SMTP id w22mr5611763lfa.374.1624067708818;
        Fri, 18 Jun 2021 18:55:08 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id o10sm381443lfk.14.2021.06.18.18.55.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 18:55:08 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id a11so6570995lfg.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Jun 2021 18:55:08 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr5217920lfc.201.1624067707828;
 Fri, 18 Jun 2021 18:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <1623979642-14983-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whTKf6UFr6YneXsPU4=8dTs+eEX_861ugESTE3CmZtFUg@mail.gmail.com>
 <91865b90-c597-6119-5e14-dfe521a33489@gmail.com> <CAHk-=whjJappNkdsrmsRoA4QUiu0_NNqa9Y_ct0A21m2XT5+YA@mail.gmail.com>
 <2b2ba866-104c-afea-9c29-145e9d80c2d5@gmail.com>
In-Reply-To: <2b2ba866-104c-afea-9c29-145e9d80c2d5@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 18 Jun 2021 18:54:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjFG7zfO7RXu8RUOkuRPE59-OuqzBFsH-Zk1ieSKYbrYA@mail.gmail.com>
Message-ID: <CAHk-=wjFG7zfO7RXu8RUOkuRPE59-OuqzBFsH-Zk1ieSKYbrYA@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: save extra registers on more syscall entry points
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 18, 2021 at 6:32 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> *** FORMAT ERROR ***   FORMAT=0
> Current process id is 1
> BAD KERNEL TRAP: 00000000
> Modules linked in:
> PC: [<00002af0>] resume_userspace+0x14/0x16
> SR: 2204  SP: (ptrval)  a2: 00000000
> d0: 00000000    d1: 00000000    d2: 00000000    d3: 00000000
> d4: 00000000    d5: 00000000    a0: 00000000    a1: 00000000

Yeah, so that's presumably the rte that causes an exception due to
garbage on the stack.

The registers being zero at that point is actually expected, so that's
not much of a hint. But yeah, clearly I got some stack initialization
offset or something wrong there, and I don't know modern m68k nearly
well enough to even guess where I screwed up.

             Linus
