Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF578C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 11:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBBEB6124C
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 11:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhGILie (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 07:38:34 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:33299 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhGILie (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 07:38:34 -0400
Received: by mail-ua1-f53.google.com with SMTP id d2so3484476uan.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 04:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w8wbufa0AoSD1RIBGwDQfggiZgEdfKHp0u9KlHRuim0=;
        b=VCf0l9faMJuOg6YX7kxzXZf/yeopY1gVJTPs+gBRNH0aO84dswUZwQkHZNEdB8RJ02
         qVM7lWVCD0UgFuoAPyWpIq6NxBuwa0KFCb+wqpK7QjaBG2MoVTI/8i8+nGtm5bT/6v3a
         KuUxKL5zZGEUqOFTZAe3d/IgFQ/fEGXanyOIysnrVfkzP7EJ4zaI75RI2WtZrOLyJMdD
         tCIpBUSges1oPnpjtovicezlIqgpe3m2yDNA8smc9Dj/5il5x3L0fIVaBdirKYFFYUcG
         COnBoL00LELuwEYKyQfIfsUFSlXDs/Nh6bRGH8YBFpU48lZ1+haKivVLDC/dvx6cBzWJ
         LC9Q==
X-Gm-Message-State: AOAM53269RB+8K7aE0Cq+X6lz6imUy3sFsmXl9x1fs3ccCoDvhVgtaeg
        vcO+WmfyeBiJ9j49cD4rYJpOkXzybsJNZlfxUVw=
X-Google-Smtp-Source: ABdhPJyKHnjcuYUGW2bPi96N8BIOJV2VNiBC3U6O1xs5A/xK0FldXk5uWDzNWFmtc57e5GfVw6VQjrKpVGUH+7GAoo4=
X-Received: by 2002:ab0:6584:: with SMTP id v4mr30375381uam.4.1625830550501;
 Fri, 09 Jul 2021 04:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com> <20210709085324.GA23590@lst.de>
In-Reply-To: <20210709085324.GA23590@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jul 2021 13:35:39 +0200
Message-ID: <CAMuHMdXwhHV=fx7axh+eB6cFxbTZuN5aKkz5hymfH9mU1n5wmA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Fri, Jul 9, 2021 at 10:53 AM Christoph Hellwig <hch@lst.de> wrote:
> On Fri, Jul 09, 2021 at 08:34:07PM +1200, Michael Schmitz wrote:
> > Just booting to a login prompt: Quite a few with 8 bytes, some with 4 bytes
> > (those from the keyboard driver), the rest is 16, 24, 36 and 92 bytes (a
>
> The 4/8 byte ones can usually be switched to just use get/put_user easily.

Yeah, that seems like the best path forward.
I'm positively surprised that getting rid of the constant size
handling shrinks the kernel by ca. 10 KiB.  Probably it made sense
a long time ago (perhaps before the fixup sections were added,
if anyone still remembers?)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
