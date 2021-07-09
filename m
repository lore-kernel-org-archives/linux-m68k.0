Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81497C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 11:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C22F613B0
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 11:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhGILXp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 07:23:45 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:35584 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhGILXo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 07:23:44 -0400
Received: by mail-vk1-f177.google.com with SMTP id d7so2106866vkf.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 04:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6fHBwjdK/f053MpUJCotw/5k709m8iVPMD/w/B1VzI=;
        b=fQ/DETteFpfzRuTC9mdwA3j09rMOEG1MJEBe7nle9ZksDo9QCoWglKOdykMhDV6+PP
         4hkrXho1b6IQTKnT3gowCqrIkMJY07hVMza0lq1EaM4iqa3J+WKib0FnGDTpIpIZW6Mj
         IhYNnp1Whd57lf2F7CvTWi4qk8wHWGqfY78O2/ekRarVmxEkD6aXf87a0S7beBck/P3A
         U9vwdL7v8EXZQFCReU3pDY2uS+brsbXpT37/0FcNeg8R8gKx57W+U4bJZrG8/XaNXwOo
         Pp1935ghu7+NlVf4rp6o7L/U72AtORRvW79teqJTl0XzoQcS6qO8DasWYhJLvj2/1PMZ
         Usmg==
X-Gm-Message-State: AOAM530QG46ZcOks4oVUYayO0jueBGHDne+fLJDUv7o+t75WFdDkgkaF
        wmCFfFHReP1U/pu2+IRrxFJZ6oVSbXzlbx8CivM=
X-Google-Smtp-Source: ABdhPJyYeWl8CJGNV61O1jDrcCDStoHO0vhCFbVgwsGRJfsiyiQUpfg3vmgwnbAI7kZd0zNY0q8fy3xgWwmCNUf9uUo=
X-Received: by 2002:a05:6122:588:: with SMTP id i8mr21256559vko.6.1625829660404;
 Fri, 09 Jul 2021 04:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com> <20210709085324.GA23590@lst.de>
 <061de3e3-91df-2c23-116f-250f579a664e@gmail.com>
In-Reply-To: <061de3e3-91df-2c23-116f-250f579a664e@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jul 2021 13:20:49 +0200
Message-ID: <CAMuHMdVWuHfHdNjMLq1LG0cQ0jq2w-XodvJPOK+Q4Dhy807fuA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Jul 9, 2021 at 11:00 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 09.07.2021 um 20:53 schrieb Christoph Hellwig:
> > On Fri, Jul 09, 2021 at 08:34:07PM +1200, Michael Schmitz wrote:
> >> Just booting to a login prompt: Quite a few with 8 bytes, some with 4 bytes
> >> (those from the keyboard driver), the rest is 16, 24, 36 and 92 bytes (a
>
> Over 400x 8 bytes, 20x 4 bytes on a count with the larger one suppressed.
>
> >
> > The 4/8 byte ones can usually be switched to just use get/put_user easily.
>
> Need to log the call sites then ... that should be fun. Something to do
> tomorrow :-)

WARN_ON_ONCE() is your friend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
