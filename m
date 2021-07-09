Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B427C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7D2261361
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhGIHco (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:32:44 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:36528 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHco (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:32:44 -0400
Received: by mail-vs1-f53.google.com with SMTP id w13so278459vsa.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 00:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9O0jqtEyYp/Fry7vpxezebqGPcEN7kuVr5q0icEGE0Q=;
        b=M+RoG+766uKhcgn2kv03KnDZmi0bFK+hU9yyRQBOuIytwp03ObxguHsHDn9uDtsaxb
         H+P/QKVtPx9lF8UR6/rr7z2zPHwzQM2f46zUwzAIThYXymsRAOh33HDQ/qcLzTNVIw1Z
         OJUCmY5Qoyu4iKLVODF+2/aCYaKMan0zA4xOF8Wzwa2ex8pV0Xo/8nD53gScii8kW63r
         AZuMFFiqZJb4evKK3GVOb+iO+eB4CEHABBE5fTGprM3ZsL8Xxgl5JU6tbOfYxOGkcjy6
         JgfYsLAvv1QdXDhwv3LY9uGdsl3LI5zzwxGBFe91iK2eyOhbpUOP0HX9RcKUaRqGlYpq
         ZD4w==
X-Gm-Message-State: AOAM531OVydJvboIOqQx3ovKGgwx8GCdeypZVZxNGj3ZXm2Di3ZfLtvr
        fImui9hWqlQahjU8BJqepEslfh121Reb86gdOq0=
X-Google-Smtp-Source: ABdhPJxbCjpnQL/BUMRxabrt9tUsb2r7EV9qpljSy89BhTMK4O0JnbGCIkZ1U7GX44X+LwzPgupj8TL3IkLOGdOelHE=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr9167641vsf.40.1625815801154;
 Fri, 09 Jul 2021 00:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
In-Reply-To: <20210709042219.GA13558@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jul 2021 09:29:50 +0200
Message-ID: <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
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

On Fri, Jul 9, 2021 at 6:22 AM Christoph Hellwig <hch@lst.de> wrote:
> On Fri, Jul 09, 2021 at 12:31:45PM +1200, Michael Schmitz wrote:
> > That patch works fine on a casual test. What you did to
> > __constant_copy_to_user() does not appear to matter - but I haven't put the
> > system under any kind of stress yet. I'm a little reluctant to do that
> > (recovering from a trashed boot disk is a little dicey), I'll probably only
> > try that with your changes to __constant_copy_to_user() from commit
> > d36105c942e0 backed out.
>
> As Linus pointed out, small copy_to_user basically doesn't happen as
> we have switched all the suspect call sites to just use put_user.
>
> Geert: do you care about __constant_copy_to_user at all, or can we just
> kill it (as well as the copy_from_user side)?

If it blocks you, feel free to remove it.
BTW, do you have an idea of how many calls use small sizes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
