Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A65C433E1
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 11:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89C8F206EB
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 11:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgHZLbJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 07:31:09 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45843 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbgHZL3W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Aug 2020 07:29:22 -0400
Received: by mail-oi1-f194.google.com with SMTP id d189so750644oig.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2020 04:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1FLY0eW4GFuoR8mTu1lJlREb+UEGmC42E+5Rra5UznE=;
        b=Eklu7SXAkMc1dOlzz2t9NKJIeA8hBzbGVI341uJANi6cZPJUObn8Hmc+Rj78ZJjXng
         HhxSw7+lD6KRiwucijIO7oIkiBtXftfj66xPkE6zxq9dXiVloa6+/pdncI8sqbcK/1Bp
         wbZTCxX6IYGP5gvFDaXWSRdsejl+ty87F/vZTNg9BSd3ocKKBEF7BOUuJtkssnbl1uhL
         T3Pz4A/Vq5k3Dfza2tKKqJiNbHHrJ3CFIdYvzg4DTsBJlwYW47dp1dbRoGPH9PoUi3nh
         iNh5TUxFAPVxTwB2rAe83k74+xNHOJGyHdwtPIJSPVHNwQmdLlEbq9rhdJMEw98Wi+NA
         S4Zg==
X-Gm-Message-State: AOAM532k+Oy7A4cqdxxx2nCowC5sTJ7fFpcY/vcFMK2nzLhrpbwAgN2n
        2dgi76tvLv0F6Z+yHu2a3YNV1uKsvcI11nvSj0k=
X-Google-Smtp-Source: ABdhPJx7jX+qSl6hSkIJjjuVHvApPexAU/jsCaAJ1qdjT3qf5oCZgY38PO9ALloX5AEO8e8WFaJLeRawU/yp8PkK28E=
X-Received: by 2002:aca:b742:: with SMTP id h63mr3423281oif.148.1598441339761;
 Wed, 26 Aug 2020 04:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200713072429.6182-1-geert@linux-m68k.org>
In-Reply-To: <20200713072429.6182-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Aug 2020 13:28:48 +0200
Message-ID: <CAMuHMdXWfLa8dCZPF6jSQYuowGBR4dJnS1hx_rN1kDpPFZnVGg@mail.gmail.com>
Subject: Re: [PATCH] zorro: Fix address space collision message with RAM
 expansion boards
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Stefan Reinauer <stefan.k.reinauer@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 13, 2020 at 9:24 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> When booting Linux on an Amiga with BigRAMPlus Zorro expansion board:
>
>     zorro: Address space collision on device Zorro device 12128600 (Individual Computers) [??? 0x50000000-]
>
> This happens because the address space occupied by the BigRAMPlus Zorro
> device is already in use, as it is part of system RAM.  Hence the
> message is harmless.
>
> Zorro memory expansion boards have the ERTF_MEMLIST flag set, which
> tells AmigaOS to link the board's RAM into the free memory list.  While
> we could skip registering the board resource if this flag is set, that
> may cause issues with Zorro II RAM excluded in a memfile.
>
> Hence fix the issue by just ignoring the error if ERTF_MEMLIST is set.
>
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied, and queued in the m68k for-v5.10 branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
