Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67171C2B9F4
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4951B6194B
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhF1HrP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 03:47:15 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:34775 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhF1HrP (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 03:47:15 -0400
Received: by mail-vs1-f53.google.com with SMTP id x1so9533919vsc.1
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 00:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Wdn42pVjXddthv/fcZQZUXc/tLtV6tLrYN/I2Q8r20=;
        b=fDskaogDCSUR3Ht4B3QI0RarL800MI9chHNXGvz+FzPu7vVeEHrqlQeiI+zzcOejHp
         AeGntBuiSFGUvXa1dih7+dh+R+CzS0KuO1srmpsqjxox2a5CvIZOqtaEmIpPEJ6ZDqpn
         7IpBTtMl8hptZJjeXG8sokxHyHTLpaELFx7gB4QeuIMlRz/LMS8MwT3xEZlr6dkxCV3R
         LKPINmy3x4+g00QGRjXyDqmvPcDukZPLDwus74AuLW7ehdQoZlJFTH5BiRDTNYwlF1xE
         TT09VecZJDVH40RVVkpMdoWpKMC2g9OwEq3fKzu1NoszTphsbMR/lgUEw2LYJ+pGscj2
         /LXA==
X-Gm-Message-State: AOAM530CFATNeZr+RbxM85fkqxbSdWqgBN3xhyD+zq2Dkx5dArD7zVbm
        fJCIrIi46dRTDdnq+48MvEv9Zoqmsccbj2TfZ4s=
X-Google-Smtp-Source: ABdhPJwWYIAqJIjtz9yXx7y58Gf4xys7ZJTVQwF00yXdaxYNv20b0oLn01pbfOnZLKPaUXuqG8oDbRTHrXcU/ekp6WE=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr17098305vsn.40.1624866289272;
 Mon, 28 Jun 2021 00:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <1342441646-5645-1-git-send-email-gerg@snapgear.com> <1342441646-5645-2-git-send-email-gerg@snapgear.com>
In-Reply-To: <1342441646-5645-2-git-send-email-gerg@snapgear.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 09:44:38 +0200
Message-ID: <CAMuHMdWSBLUzWfDFK0mSiuO0+=cidymmd33jR3qQ1gFmCPk02A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] m68k: common PCI support definitions and code
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Jul 16, 2012 at 2:25 PM <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Basic set of definitions and support code required to turn on CONFIG_PCI
> for the m68k architecture. Nothing specific to any PCI implementation in
> any m68k class CPU hardware yet.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -340,4 +340,6 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
>   */
>  #define xlate_dev_kmem_ptr(p)  p
>
> +#define ioport_map(port, nr)   ((void __iomem *)(port))

So should we dop:

    config NO_IOPORT_MAP
            def_bool y

Triggered by seeing CONFIG_GPIO_TQMX86 being removed from allmodconfig
builds due to commit c6414e1a2bd26b00 ("gpio: AMD8111 and TQMX86
require HAS_IOPORT_MAP").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
