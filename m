Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859E0C47082
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 14:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D32360FEF
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 14:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhFGOi1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Jun 2021 10:38:27 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:37781 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhFGOi0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Jun 2021 10:38:26 -0400
Received: by mail-vs1-f46.google.com with SMTP id f21so7308572vsl.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Jun 2021 07:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIEuZnR+0pmXVTw7szVUo35cG2jdA3wDrXhvKfhXtfw=;
        b=mzkkX59GxYA8V5+1By++qtsbvHWBJj4VD8FLyUbs14H6APyzp/2gJ5ePRgBb320yfB
         6u/Eh95JMXVMdKkOfDNqr1a1aUD+GgHB+4JrSuXKrdS+LBwHMf8UW0BZQeZhP5zxWLex
         G3+DOcmEGTHfgso9u3+vourSjSlQNDsYK4/JDCtI9WyrZihJuOCxSUd+zBmg5FRyEZod
         ocxHB55MBUp1RzyAa3mIVLo0kRojrH9k+7OczCQt1G0O6dR3WfwOaFVugO/8vnKH7wgC
         0zEqlV+bfZnRMhlBvuTROtk80/R6wSoFFjkRyo9zhkTJUmnZWfSO7N4qZOC26E6u+5S7
         dvVg==
X-Gm-Message-State: AOAM5334X0WPYbL8wGE+dbcUBj3Izc4h6QydIvzWc2WPXtID9toEwMIH
        rbCN29jCAA7gH3c/H49oe/HNFfwdOXKoLjKPYuY=
X-Google-Smtp-Source: ABdhPJyAB7LObhZVr6DP0FIXQJk11mzn8e1kVEmnHMYa9jjp3/mzqxniD/pQfzoaiVG47ccHD0gA31WHIrO2gUawgA8=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr4961726vss.18.1623076594247;
 Mon, 07 Jun 2021 07:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210527001251.8529-1-rdunlap@infradead.org> <CAMuHMdWxBDM6za4_zPrkPGja8K6vy47gfdzYMNjJ-i1n1ySsHA@mail.gmail.com>
 <YLcF8k71w1mhN9OX@google.com>
In-Reply-To: <YLcF8k71w1mhN9OX@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Jun 2021 16:36:23 +0200
Message-ID: <CAMuHMdUYDHQB2gv9sfbB+xt_9H9EwaOLnycORVRctbqPJGJzvA@mail.gmail.com>
Subject: Re: [PATCH v2] MOUSE_ATARI: fix kconfig unmet dependency warning
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Dmitry,

On Wed, Jun 2, 2021 at 6:15 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, May 27, 2021 at 08:56:30AM +0200, Geert Uytterhoeven wrote:
> > On Thu, May 27, 2021 at 2:12 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > Since the code for ATARI_KBD_CORE does not use drivers/input/keyboard/
> > > code, just move ATARI_KBD_CORE to arch/m68k/Kconfig.machine to remove
> > > this dependency.
> > >
> > > Removes this kconfig warning:
> > >
> > > WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
> > >   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
> > >   Selected by [y]:
> > >   - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
> > >
> > > Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: Michael Schmitz <schmitz@debian.org>
> > > Cc: Roman Zippel <zippel@linux-m68k.org>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: linux-input@vger.kernel.org
> > > Cc: linux-m68k@lists.linux-m68k.org
> > > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
> >
> > > ---
> > > v2: move the symbol outside of INPUT_KEYBOARD (Geert) -- all the way
> > >     to Kconfig.machine (Michael). Thanks.
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > I'm willing to queue this in the m68k for-v5.14 branch, if Dmitry agrees.
>
> Sure, works for me.
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks,  queue in the m68k for-v5.14 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
