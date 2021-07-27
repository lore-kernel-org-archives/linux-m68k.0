Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6FFC4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jul 2021 10:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4480961414
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jul 2021 10:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbhG0KHm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Jul 2021 06:07:42 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:44934 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhG0KHm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Jul 2021 06:07:42 -0400
Received: by mail-vk1-f181.google.com with SMTP id r2so2633073vkl.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jul 2021 03:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FCUItsUrNsIOTE4P27lKrABY3CasfpkaGPUBOlpzuIA=;
        b=XjOfnRRO0N8CvVvJIU2WgJbuTOi4yM9aLcZtvfpZuMNzqqI9jRNlO9sUX/c0o+qW7S
         IfXtPYC8cFiAvlpTM9iPw0YFwj6U1Tvea3SspH13HAtkGN4+2yJXems7IdFYausulY2C
         8uPm36iGjY2FA9BHkCGE4SOEiRV1UZAGECxzGM4pO9qaK9vaUZCXaZkMHafR1naHswnt
         d2Q1tQYsFjSG0J004F554f+yNFHIXQT1pFKjlwSFUC7ozQ8QNoOG9RY1EIUtwOpVo72D
         QVJRBgpSozK161rwikXdWbYe5VKg6P1KDvQqIjYDlBPXkHNfRDDJsoX9gUNVtdP/FTkv
         68jA==
X-Gm-Message-State: AOAM533gWDjJ8JhUPOque2VXn/0f8zATalafBZe4ons0yKZ4j5VL9ODt
        d2yEu/5xDLHCY6QQ2Wsim6G75+85Y+zo7BbYzCM=
X-Google-Smtp-Source: ABdhPJyJZ2K2v5gkPcV5lyHX5OJ6ojes2JgkZC6Nxg8yjXVY0y3Yn43EJt4tI1HaIXLl75DtR+ZLBeyBHpoziXGZOkM=
X-Received: by 2002:ac5:c956:: with SMTP id s22mr13658214vkm.2.1627380461341;
 Tue, 27 Jul 2021 03:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210727080840.3550927-1-u.kleine-koenig@pengutronix.de>
 <20210727080840.3550927-2-u.kleine-koenig@pengutronix.de> <d74ccd1-116d-9450-5ee4-8d5074998872@linux-m68k.org>
In-Reply-To: <d74ccd1-116d-9450-5ee4-8d5074998872@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Jul 2021 12:07:30 +0200
Message-ID: <CAMuHMdX=K4S3Yd_ybd5C3e40XefMf5kHs1tWs1+VKTgiWEWEDg@mail.gmail.com>
Subject: Re: [PATCH 1/5] nubus: Simplify check in remove callback
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Tue, Jul 27, 2021 at 11:50 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 27 Jul 2021, Uwe Kleine-König wrote:
> > Apart from that, the compiler might already assume dev->driver being
> > non-NULL after to_nubus_driver(dev->driver) was called.
>
> I don't understand how a compiler can make that assumption. But then, I
> don't know why compilers do a lot of the things they do...

It is one of those recent optimizations people have been complaining
about.  Once you have dereferenced a pointer, compilers may remove
all further NULL-checks, assuming they can't happen, as the code
would have crashed anyway before due to the dereference.
Good luck running on bare metal with RAM at zero ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
