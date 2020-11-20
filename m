Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B12C63777
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 08:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CFDC22227
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 08:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgKTIJY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:09:24 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:38952 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgKTIJY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Nov 2020 03:09:24 -0500
Received: by mail-oo1-f67.google.com with SMTP id l10so2021219oom.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2020 00:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InNbA7CRjLYtLhlk26DHO/uIWWNOi+DN6zjuKNiE/Ks=;
        b=s9tDjnaNb2xkhqVD00vUenS+ERqeLEZXRbfCPK1k1zPOP5ez8AGk3iIzFw9sje4EBa
         R0ZZnRVCleauutG7iVQiI1tpy/9fPCRVVlcHTfBU4FY/SZ/sZ1NSQttYjJxM6fQsiNvH
         nJiAIVqi7NOK6VHe+Oq7c2biusSN0l0gGXe+QMyV1jwDTIOcdF1+FNjALFX2ZD3w+qxN
         1vZgXZPj1qYpd98uV9jPOc8CPGZQoW5CvLf1zENVWWVVlY7LX7Ztyz95TAHovtwzfm+K
         xnuQvn50sYHFAnOczMs7iksFT+aSMtNgj4Sc44bxUmfygsDNBh8eJzTE3p0HA+/mN00+
         3VZw==
X-Gm-Message-State: AOAM532BdLb+BvGw4xWEvh0ZeFA67rKEUlC75gfxNZayhsL1JGwfG4JY
        smGu1GUHUH8/lP43+H7WxeXTeBdfwtlPYwbg8rU=
X-Google-Smtp-Source: ABdhPJxGwm7/S5ctN8aQPOK7rG35tOPLhSt3z2MThLsdzZA1IkYeZDNG+QHEOYf8XzjUIIBm2N3HdRGurzA1HWWneiU=
X-Received: by 2002:a4a:e5ce:: with SMTP id r14mr13347126oov.11.1605859762129;
 Fri, 20 Nov 2020 00:09:22 -0800 (PST)
MIME-Version: 1.0
References: <1605852474-23446-1-git-send-email-tangyouling@loongson.cn>
In-Reply-To: <1605852474-23446-1-git-send-email-tangyouling@loongson.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:09:11 +0100
Message-ID: <CAMuHMdUq4ghBczAXOb8pdVc5=Uv5kUDmBdKW0O4VCkeQ7pBnuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k: Drop redundant NOTES in link script
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 20, 2020 at 7:08 AM Youling Tang <tangyouling@loongson.cn> wrote:
> Commit eaf937075c9a ("vmlinux.lds.h: Move NOTES into RO_DATA") after
> should remove redundant NOTES.
>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
