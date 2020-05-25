Return-Path: <SRS0=WAuH=7H=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F045C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:46:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B228206DD
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389083AbgEYIqW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 May 2020 04:46:22 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:39452 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388945AbgEYIqW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 May 2020 04:46:22 -0400
Received: by mail-oo1-f66.google.com with SMTP id c194so1448682oob.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2020 01:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ubzZtv8ijyTCkjYnqGrhQi6vWDPzStF+JDYNjTjJn0I=;
        b=kAy7n1IF0Zy2usaNekMt2R90cpoKQlYWmolNKohsqIvV9BKR4PnORg8BdWEvsL7n6W
         IQVVClDZRgbIOehjfll44YAFJCreTDt/lbAyDs6te848/+Hcie5YhO05KVdZ3UEQQBM/
         xrZNRk5KN25AhEMHWpg7hqYjDL4qYd03kmyUtDiDEs65Wi24lHM1xhyCMBXKD9V5VoJl
         qUwfZAMvJqKmcDqSpN7BVd96gzzkcxmQoJ/9Hb5TqpDZl9h5x40H6VuEc/dSCGRRDd7J
         iZQVzOgXeS+kypcwG79THs1GVa3/VScuvTS3lzahjZ0P+1E1vsNPgE9Pjr1XQT0jysAi
         3oDg==
X-Gm-Message-State: AOAM532VHmfCotXzapr85dkBWhfjhpaANWjciHJcOTSAXes1xPjs0QOZ
        zc3LnqlJ2DHNuD7PSXzlmW+Mwxvumz8eT+NIjcE=
X-Google-Smtp-Source: ABdhPJwfjprgjzv7kU2ov1BX7oUvTVQiDv6t4ZKPgak3qtmm/RWZs7QsAW2ZbhEUquXsngwLU6GQFZJOi3PiZBjoXUI=
X-Received: by 2002:a4a:e295:: with SMTP id k21mr12605732oot.11.1590396381231;
 Mon, 25 May 2020 01:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <bfbb71db52c5e162d3afa25a28fc5d535ca87138.1589949122.git.fthain@telegraphics.com.au>
In-Reply-To: <bfbb71db52c5e162d3afa25a28fc5d535ca87138.1589949122.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 May 2020 10:46:10 +0200
Message-ID: <CAMuHMdWSxz98B4HcBPbGj5e3TQx+ndUCLPeNg7ggdvpTzOA54A@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Avoid stuck ISM IOP interrupt on Quadra 900/950
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 20, 2020 at 6:41 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> On a Quadra 900/950, the ISM IOP IRQ output pin is connected to an
> edge-triggered input on VIA2. It is theoretically possible that this
> signal could fail to produce the expected VIA2 interrupt.
>
> The two IOP interrupt flags can be asserted in any order but the logic
> in iop_ism_irq() does not allow for that. In particular, INT0 can be
> asserted right after INT0 is checked and before INT1 is cleared.
>
> Such an interrupt would produce no new edge and VIA2 would detect no
> further interrupts from the IOP. Avoid this by looping over the INT0/1
> handlers so an edge can be produced.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.8 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
