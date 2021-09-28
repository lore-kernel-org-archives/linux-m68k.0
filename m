Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A20BC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Sep 2021 07:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 434A761052
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Sep 2021 07:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239221AbhI1HWG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Sep 2021 03:22:06 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:44862 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239211AbhI1HWF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Sep 2021 03:22:05 -0400
Received: by mail-ua1-f53.google.com with SMTP id 37so6057008uaq.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Sep 2021 00:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z3oM/UfSb0uF4ufg5hPTNhl4CxjwTh19TsLWgZ0xKP8=;
        b=pog+l74t/k+zg1xL/fpo5J8pZu/CTybAG+UTZzrkwamULIlHjT6eU4tF5qb/kRfU9w
         W0WbQGJxTwenYsuN3aykq68lKOUbDednsVIdhs7B0kzW/mbjjgZrkNl9u+rvgDomOq2h
         JZwAvK790YrwgJRDS75OPKBQA22GmCjtGXZ70oaK/Suj44UUxs1GPFj1oD7nizcSRoM4
         uVVUc1eN6QPVCl8+rn6z9vypk/tomiwqhKbnQ3zFILNqqxNkAYCpeQuTCbV64s4yRcZU
         JeLVqSc/7Z1Uhl2gNe0/0QXErlfUHk3FlgkAe9c0NOBb45JyF1hikIadDfqVpQI0A9mG
         vhyw==
X-Gm-Message-State: AOAM532i+HgvUcBGs95c/LPaD9vXLhRn1zkOB6dVC6RKyy+hF5J+DRFT
        ZgzsqY+my2NzIQkFLI1aZG5Sa0EIOAFM4PIDaZY=
X-Google-Smtp-Source: ABdhPJz87WYOzHq0FLVtLg4fw0iXjvmNTcW7EfAxFF5VRuSXdnBhe/VH6GrCIVf3lD4ltjTVA74dYqJfft+Ywu1PZKg=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr3714037uaa.14.1632813626497;
 Tue, 28 Sep 2021 00:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <a1c34f2b-115c-7ab9-5b69-7c11ebc18b4f@infradead.org>
In-Reply-To: <a1c34f2b-115c-7ab9-5b69-7c11ebc18b4f@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Sep 2021 09:20:15 +0200
Message-ID: <CAMuHMdWJGFm0p-5qSj4xybfo7pZB_PrSjt2ghcgL2HaB6TQENw@mail.gmail.com>
Subject: Re: m68k: default value for MEMORY_RESERVE?
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Mon, Sep 27, 2021 at 11:26 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> Would it be safe (or unsafe) to add a default value for MEMORY_RESERVE?

No idea ;-)

> As it is, kconfig can generate a randconfig with
> "CONFIG_MEMORY_RESERVE=" (no value) since it has no default.
>
> Then a following 'make all' finds an invalid symbol value and restarts
> the config:
>
> .config:214:warning: symbol value '' invalid for MEMORY_RESERVE
> * Restart config...
> Memory reservation (MiB) (MEMORY_RESERVE) [] (NEW)
>
> That's OK until I try to script/automate randconfig builds.
>
> Can we do anything about this or should I just add it to my
> ignore-list?

Looking at its sole user, I guess "default 0" would be fine.
Greg?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
