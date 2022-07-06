Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67ACC433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiGFJAl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbiGFJAe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:00:34 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE551A83C
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:00:30 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id g14so17330082qto.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+A5o8tUrRNDtNylm0pOuZuXmTXA18iZkAubQygVne4=;
        b=4nskTmnOTQv1pciaJJLeXkWgAitVrIvMek0Iy3txyCUYlFN7k9rF0Oy9DAOjp4FWLq
         H26WdvhgI3UW2KARcW7SSGCMF6WmmISeQ82AXSdNoG6KIg6CTisuvUOZtBT0zR0gutpk
         Yey2MCyP/4L8FCr/gMGyPoUp65y4xqDbj6nQd0fWFN0e4Ji0qXDRZoHOdCSU0FII2xrF
         jdL8c5u/8AcvPrhM+Btrl1zOEU28kw/rOq69UetCxW3IWRi4SiYQzZ0LC6oNIf+0IzOC
         cLvuAUijbcOK+Sp2R+AzrsFsPfs4rB20ktj6lFYiNk5eCOWerLvTwSi5rK/D4+yafksI
         xpdg==
X-Gm-Message-State: AJIora+FxbDAf+gJp8XAMeezBaMI2rUXuU7yBGODJMShmNdcGzxGgbXS
        6QnHLbr7PEy/UMLzwuZcR252augJXgbhgg==
X-Google-Smtp-Source: AGRyM1sj+ZIsEPkG2XuzB08f+u+QuKAGmBMiVdz6M1Qy4bn2MpKhRVzbyDqwf2VZXIqH7GOCYd1beg==
X-Received: by 2002:a05:6214:d41:b0:472:f5cf:1fa6 with SMTP id 1-20020a0562140d4100b00472f5cf1fa6mr12105430qvr.98.1657098028687;
        Wed, 06 Jul 2022 02:00:28 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id q8-20020a37f708000000b006b1fe4a103dsm14934421qkj.51.2022.07.06.02.00.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:00:28 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-31cac89d8d6so63609597b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:00:28 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr9877031ywb.502.1657098028124; Wed, 06
 Jul 2022 02:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <Yrg6BzpKIJBTAVmO@zx2c4.com> <20220626111509.330159-1-Jason@zx2c4.com>
In-Reply-To: <20220626111509.330159-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:00:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3WH6ixwGjit6-z8iWe2-9ukeExDc5YWu1degJzcGKzw@mail.gmail.com>
Message-ID: <CAMuHMdX3WH6ixwGjit6-z8iWe2-9ukeExDc5YWu1degJzcGKzw@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: virt: use RNG seed from bootinfo block
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jun 26, 2022 at 1:15 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Other virt VMs can pass RNG seeds via the "rng-seed" device tree
> property or via UEFI, but m68k doesn't have either. Instead it has its
> own bootinfo protocol. So this commit adds support for receiving a RNG
> seed from it, which will be used at the earliest possible time in boot,
> just like device tree.
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

> --- a/arch/m68k/include/uapi/asm/bootinfo-virt.h
> +++ b/arch/m68k/include/uapi/asm/bootinfo-virt.h
> @@ -13,6 +13,13 @@
>  #define BI_VIRT_VIRTIO_BASE    0x8004
>  #define BI_VIRT_CTRL_BASE      0x8005
>
> +/* A random seed used to initialize the RNG. Record format:
> + *
> + *   - length       [ 2 bytes, 16-bit big endian ]
> + *   - seed data    [ `length` bytes ]

", padded to preserve 2-byte alignment"

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch with the above fixed.
No need to resend.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
