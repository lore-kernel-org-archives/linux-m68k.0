Return-Path: <SRS0=fXYQ=3R=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1062C35240
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jan 2020 14:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF611205F4
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jan 2020 14:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgA1OBD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Jan 2020 09:01:03 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36453 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgA1OBA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Jan 2020 09:01:00 -0500
Received: by mail-oi1-f194.google.com with SMTP id c16so10374786oic.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jan 2020 06:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OCFuL8nkr5blWlcwOVW49/EKio8n2sFV+etyZ2EpR94=;
        b=bVqqEjcASp80a8+FcYtirpzR9u0wLk46eNcX/XQOEkgkSh5/9i3gMlbL55spDnbdHa
         u0u4H4wt3THGQfO4nh9Rz1G8QaeJk8dyZOmVFYfKn3sSrzNDQ4ZKgHeKYJLKNX/ItKPy
         d19YEzTwtHtJnmlxdePYQJUHtZcSQIvLcr2Y51iRXvzCBHMpd1rktb5Q1jKuieh0gaKL
         V/N3uqLLKbqgHdM2Mw6uPTJQYeMD0N/hPOx21U+NIXSi5zKUdq79aTYJu4Uf0YfMH6xF
         Zj1jGt3QvWhRiUG1NUgDRtJ0vVCiLwAk6tTJUNyVL7sgLnCI/6A/p7jcDutjme/YXeUG
         JEIw==
X-Gm-Message-State: APjAAAVxhRD57hNDzebkuiHI5XOm1I9iX9BY+PZgKPGbQ+GtD/77QuRq
        /+fa6N5BYiLfjf8KZJ5opNg8FYa+h9FDT87Dn38=
X-Google-Smtp-Source: APXvYqxrHnIsrRlmUTpiBsG79AVEhNTd/CViP1DeJLvEwZ7XUcGo4ohWp0QXGaIEAI242T0kOYFgmJFOWCMQh7kKbxw=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2770347oia.148.1580220058752;
 Tue, 28 Jan 2020 06:00:58 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200128133410eucas1p19fb97c9696596da07181e0c630fb6c6b@eucas1p1.samsung.com>
 <20200128133343.29905-1-b.zolnierkie@samsung.com>
In-Reply-To: <20200128133343.29905-1-b.zolnierkie@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jan 2020 15:00:47 +0100
Message-ID: <CAMuHMdWRRRNh2kkDt2KAOQoQgh36Fh_axQXYSYdq5dAhfs++fA@mail.gmail.com>
Subject: Re: [PATCH 00/28] ata: optimize core code size on PATA only setups
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-ide@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Bartlomiej,

CC linux-m68k

On Tue, Jan 28, 2020 at 2:34 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> There have been reports in the past of libata core code size
> being a problem in migration from deprecated IDE subsystem on
> legacy PATA only systems, i.e.:
>
> https://lore.kernel.org/linux-ide/db2838b7-4862-785b-3a1d-3bf09811340a@gmail.com/
>
> This patchset re-organizes libata core code to exclude SATA
> specific code from being built for PATA only setups.
>
> The end result is up to 17% (by 17246 bytes, from 101787 bytes to
> 84541 bytes) smaller libata core code size (as measured for m68k
> arch using atari_defconfig) on affected setups.
>
> I've tested this patchset using pata_falcon driver under ARAnyM
> emulator.

Thanks a lot!

[...]

https://lore.kernel.org/lkml/20200128133343.29905-1-b.zolnierkie@samsung.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
