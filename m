Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEE7C433B4
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Apr 2021 06:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1F866141B
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Apr 2021 06:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbhD1Gyb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Apr 2021 02:54:31 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:39467 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236357AbhD1Gy3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Apr 2021 02:54:29 -0400
Received: by mail-vs1-f50.google.com with SMTP id u22so20323765vsu.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Apr 2021 23:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qcj7/vi64EhvIZ063r8YI4RxRFbLfs3PNow3a+YW0lg=;
        b=WxW8Io8Rug4JqWHNWKNIpXVpD/zraScVdw144MtIzF93GBAJzJ4vFothBVUGZwf0nF
         FfdjeKp642XXESthQQZS1Id74FM3nQyRRQZ7u4DWovXPlWfPibnN/RC25tl4wnFD8r6I
         wY7m1A3lnU/+WQDoqIoxjNXoPtd+r/XMqzaI5/LdMZCN6G7n9vHRPTSYK1Jtsl5xDYuN
         xNocCV83IFHHHr08Tpr6ouAV36sLI169mlI09RigBBLYk6AlfgSkOBQ5TvxfXFiwiQPF
         J1K1wzpWR7AbemlsGJ0auE+12FdBOSk5Jjhrl0BAWuPAuCT8nP9f5AlwQ9NX5FfSPzlz
         w/gQ==
X-Gm-Message-State: AOAM533E+/JjAXcWDYmwurwHfMe8oPN4ZZfgjgKGjBC73ld4JPxY0xkm
        hL7vT29VMilzL6FNi+3Tte7fkrukASz60ODeFiI=
X-Google-Smtp-Source: ABdhPJyELbGS2kG/kxrsEFotGwuE+59fsAnvQWK55bL61m1yNIRT7/aVm3vglBf6ZYvQwO5jkVSO99DpOIS8s+tQ5cQ=
X-Received: by 2002:a67:8745:: with SMTP id j66mr23450138vsd.18.1619592824818;
 Tue, 27 Apr 2021 23:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <793432cca963b632709c4d1312baa9874d73e1d8.1619341585.git.fthain@telegraphics.com.au>
 <ba908b1d-eab5-a4e5-0c0a-2c745287d121@physik.fu-berlin.de>
 <10a08764-c138-9fe5-966c-ce68349b9b6@nippy.intranet> <65f01f42-31d9-522a-e690-73d286405a01@gmail.com>
 <9650358f-a789-7dbd-4495-1d39ff321ded@nippy.intranet> <ada88dd6-f8d7-11dc-9a89-5c7e437a0981@gmail.com>
In-Reply-To: <ada88dd6-f8d7-11dc-9a89-5c7e437a0981@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Apr 2021 08:53:33 +0200
Message-ID: <CAMuHMdUy_B_+pHZQpnDHYsee+gpXOs9ek_HaVxLjE2HVfGmLQg@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Replace macide driver with generic platform driver
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@fastmail.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christoph Hellwig <hch@lst.de>,
        Joshua Thompson <funaho@jurai.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ide@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Apr 27, 2021 at 9:55 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 27/04/21 3:47 pm, Finn Thain wrote:
> > On Tue, 27 Apr 2021, Michael Schmitz wrote:
> >> On 26/04/21 7:37 pm, Finn Thain wrote:
> >>> Was macide the only IDE driver in Debian/m68k kernels without a libata
> >>> alternative? If so, this patch would allow you to finally drop
> >>> CONFIG_IDE.
> >>>
> >> There's still q40ide.c (ISA IDE interface, byte-swapped, so would need
> >> treatment similar to Falcon IDE). Hasn't been updated to a platform
> >> device yet.
> >>
> > AIUI, q40 support is not included in Debian/m68k kernel builds.
> I see.
> > I wonder whether q40 could re-use the pata_falcon driver . I suppose
>
> I'm pretty sure it could, but there is no reason why it would have to be
> crippled in that way. Interrupts should work perfectly fine with IDE on
> Q40.
>
> There is another reason why using the same module binary for both might
> fail - the awkward address translation code in io_mm.h. Not certain at
> all whether we can even have Q40 and Atari in the same kernel binary...

That's supposed to work, else our multi_defconfig is broken.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
