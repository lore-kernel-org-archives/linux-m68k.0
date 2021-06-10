Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD62C48BD1
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Jun 2021 07:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62537613BC
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Jun 2021 07:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhFJHQQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Jun 2021 03:16:16 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:41932 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhFJHQP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Jun 2021 03:16:15 -0400
Received: by mail-vs1-f43.google.com with SMTP id c1so1324110vsh.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Jun 2021 00:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0PGTrqqap0AD0zgzrltlkdjoUc8xunpWBJ8PcUZGZg=;
        b=sKyjWuseuyR6clO9F3NaPg+BvK5FVZAouA/ocpXo6miVGwwWIkxsT1AAcouzUkWEXs
         Dczvmg0iWoQRD2dq/HBg9JyyN8lB1MMPcyVtzA3i4fVsGTuNRBVbnRzxTkM3eo/qlLeh
         EB4kBtZTNUAX23LWeGUlOHcAhQp5VTO++GMEy3Dfe3NHdec2xmXY6Ps6Zsu7VSqv2sOj
         6cWjYoLkSpYAG/aeYyvizA6PsOJbmDBsvzmhKhX4EV1QMoUfHJIuUtxWFM9zk+w+DKVa
         CFLh2KDMBg5aKaaa40dGVpr2q+7ST8QtfRFlD0i1wFdl9WhCrEHYhDy70r8IXkMBy0sv
         mr8A==
X-Gm-Message-State: AOAM531ukiluIMwpprXAsIuPSziBBHAnryjBf5Uvok80CyarjnqHJy5S
        QZAV5VkwqO6Qs5Y3Kt7e5rfyJjx3A4XS4iIKK7M=
X-Google-Smtp-Source: ABdhPJyCuBdZk9ZP3ryMwLapVtEZoI5iKL7Zkhu6nonEYVDpYYmFJ9VmENs1OstRv2+BQ73VOOJ57IqQxjm00FxC6o0=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr2927387vsr.40.1623309246296;
 Thu, 10 Jun 2021 00:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623287706.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1623287706.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 09:13:55 +0200
Message-ID: <CAMuHMdWLJWBH5uz=PLL7pt2uEHz9uSO2Gh7twCDUTz3NDfhdEQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Use libata platform drivers to replace deprecated
 m68k IDE drivers
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        "David S. Miller" <davem@davemloft.net>,
        Joshua Thompson <funaho@jurai.org>, linux-ide@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Thu, Jun 10, 2021 at 3:34 AM Finn Thain <fthain@linux-m68k.org> wrote:
> This patch series allows m68k platforms to switch from deprecated IDE
> drivers to libata drivers.
>
> Changed since v1:
>  - Added reviewed-by and tested-by tags.
>  - Improved commit log.
>
> Changed since v2:
>  - Added #ifdef guards to prevent build failure when CONFIG_ATARI=n.

Thanks for the update!

Note that Jens has already applied v2 to block/for-next.
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9658506fbf8c1b629ca8a660862bc1ee57400506

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
