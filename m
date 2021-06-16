Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFD1C48BE5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 14:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4569D6115B
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 14:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhFPOF4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:05:56 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:37620 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbhFPOF4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Jun 2021 10:05:56 -0400
Received: by mail-vs1-f42.google.com with SMTP id f21so1072553vsl.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Jun 2021 07:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+f5sLik4XtE8AxPdTpyCLVGikmyyN7+qp4rDdjwAW4=;
        b=jP729Slzt63EiLL8mcRLnif0EqjrsZAwyWiZLiVnnj/2tm84NUI6+Wld0VtifnK9DG
         I33h0je6PK1PI2gKZb8o5eiOuMgWvqPiW6ttBp+RYCduFZ9q1Wn55Izi2OppELqnDErS
         mfRPSmtFQHUQGN/vmhHcQpkXQ/MMOwE188skX5JQ2owp5E16OkYE512xrc+Jwe/V+Zy9
         YERbSpc1Fx8oAk9istLxL4nxk5gQb8NXMlwIgVxVpD90mF3VEo4Ii/+Kovqid6RlAwqM
         RxGrFx6FLLO8svLgrhc4ijUmnp9OB3SKZZX19DNNGYTGGppGDXFwie3MRu4YbkDN0y2c
         j7cg==
X-Gm-Message-State: AOAM5339Lruyk2FnzU+C298BydDi29h8svFewfHcypIOejXn8mr4c/z3
        l0UVXjNOeLyj90WPxNP8pJy1NKlgsukj98qffy4=
X-Google-Smtp-Source: ABdhPJyfGg05f6ZxQMZ7EK0ZWu2rGAgultHLHHPWzPSWNBX5rUJApIAb8UXAJbLGKQhUGw9054I6TDtKNIH+CUyWMhM=
X-Received: by 2002:a67:f106:: with SMTP id n6mr11256802vsk.40.1623852230017;
 Wed, 16 Jun 2021 07:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210616134658.1471835-1-hch@lst.de> <20210616134658.1471835-6-hch@lst.de>
In-Reply-To: <20210616134658.1471835-6-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jun 2021 16:03:38 +0200
Message-ID: <CAMuHMdUbEBO28w3XKOvSKUk3XUaesOqxEfL+8i4W0Thu10pNTw@mail.gmail.com>
Subject: Re: [PATCH 5/6] m68k: use libata instead of the legacy ide driver
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Wed, Jun 16, 2021 at 3:50 PM Christoph Hellwig <hch@lst.de> wrote:
> Switch the m68 defconfigs from the deprecated ide subsystem to use libata
> instead.  The gayle and buddha and falcon drivers are enabled for libata,
> while support for the q40 and macide drivers is lost.

I guess you forgot to update the last sentence, too?
These are now handled by the falcon and generic platform libata drivers.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/m68k/configs/amiga_defconfig | 10 +++++-----
>  arch/m68k/configs/atari_defconfig |  8 ++++----
>  arch/m68k/configs/mac_defconfig   |  8 ++++----
>  arch/m68k/configs/multi_defconfig | 14 +++++++-------
>  arch/m68k/configs/q40_defconfig   |  8 ++++----
>  5 files changed, 24 insertions(+), 24 deletions(-)

With the above fixed:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
