Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E468C433ED
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 07:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7DD36121D
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 07:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236711AbhDLHiF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:38:05 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:33466 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbhDLHiE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 12 Apr 2021 03:38:04 -0400
Received: by mail-vs1-f44.google.com with SMTP id e16so5590094vsu.0
        for <linux-m68k@vger.kernel.org>; Mon, 12 Apr 2021 00:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z96SqmYa0TzWWpgPLHQmQYduiXk8qwN8IBJ+Av0a0iM=;
        b=ijx7fTzvTM3AsGfoPCJ3DKsbB3iNtgLLF54JKVXSHHL2+oXdB2xgMNfBwVSH+1/8dp
         YQe62qskbQqFSpYxHQrSttpseHJY3KWmUd6XdGKnzSqJbQmDxcIywS/1nrrl5lhrRnJC
         w14W2bXpuDscUe/J8wDotFVu37x1aOYMigosSTjO9Xuf/sNGxrxgqizINOgFgwVmRIFz
         z7wn+OYNmJYk/ItjBlgCFu37k9ixYqp1770gyWax6mutlEiw7/z6qZPQHmN/WfO3Mo8Y
         WO3dMPnYC9/z24xowWyxkKbNbLGqANSBnorIAXUKVeE0NnVPKLP0RVv5l4hj1tNP0o5S
         ho7Q==
X-Gm-Message-State: AOAM533lwdqRUJaC1K5Don4HNzoXU4gYAN+KE7CxPpCTfG1zxW32YbQh
        zOtfmgbrzVKxP0CzDfteujHrszpuv3GzLgUVHYOpRHze
X-Google-Smtp-Source: ABdhPJxJAF9SAm33rsArYHRq04Ctg66+K1veoHpinjXS40FVNRRuXAsDfCBZS8OXXlKnjNLa8VRIU5aCoFNYtHpI3Rg=
X-Received: by 2002:a67:2082:: with SMTP id g124mr3865299vsg.40.1618213066950;
 Mon, 12 Apr 2021 00:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210408213740.3235446-1-angelo@kernel-space.org>
In-Reply-To: <20210408213740.3235446-1-angelo@kernel-space.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 09:37:35 +0200
Message-ID: <CAMuHMdVL+F+MyfSAr=grTq9GDvJVRZNZKO807q7bFYVEkSPmMw@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: coldfire: fix irq ranges
To:     Angelo Dureghello <angelo@kernel-space.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 8, 2021 at 11:38 PM Angelo Dureghello
<angelo@kernel-space.org> wrote:
> Working on flexcan0, there was no way to have irq 128 working.
> Fix irq 128 and 196 setup.
>
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
