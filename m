Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14157C433E0
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 09:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9B65206E2
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 09:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgFAJKW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 05:10:22 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40282 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgFAJKW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 05:10:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id f95so4003317otf.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Jun 2020 02:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HTQ7pcyei2DeFkq5Sn+bdzrT7dJ5a3VXGPitkIthbGA=;
        b=WvISpLUmwW79s3nv8AF/SW2yDbvIiSOubUoaQHSVtre25KofZZXrWFPlTdO6XzSroX
         gbkhCXGY+EcYSl+hQkonWEm9sj3kPFcqLl0p8Sgktsw3iIU+RDDVJobgMOOtgz1RCkTr
         m+C+TP05hQxCysYGpiD7qWpr+vletIIdJhfC1vzE+NPu+AgcwRt5YeB2cd5TjjCHskMd
         /5eVptYdvXfQ59YiX5PFl1RdsIyNFFaCWoc1Zy2qlhS1SOtmA/jRvCGfpKlRlcQn17SK
         9wevOTIIldaV59oZq3t9kRmwBwQvscM9Bi6tEukf5IcVkRbULGhG0xkOgnkmYYI77Hgg
         nY4g==
X-Gm-Message-State: AOAM53175CJuj9kibQF+HZFeqlvUEPx4mzqrPd/b7deDCk+WUMIRwcmT
        IPEuWmcfierAZmGnI0LzxeOnRiK8q/C5/VAx6TU=
X-Google-Smtp-Source: ABdhPJyj0hf8C6yXd7U8Owgk7Y+looRYu57OLr6RWX5Hh03Ougumjcw/Di4KWKaiBUX8YQZvleFNeoDUU8BTzOzAucU=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr8837128otr.107.1591002621470;
 Mon, 01 Jun 2020 02:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
 <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com> <20200531200140.GA27809@allandria.com>
In-Reply-To: <20200531200140.GA27809@allandria.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Jun 2020 11:10:10 +0200
Message-ID: <CAMuHMdWsLH_6G3EYG=NpcMaorGnRC1uPw3O9pp=tKNYpvKe+uQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
To:     Brad Boyer <flar@allandria.com>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Brad,

On Sun, May 31, 2020 at 10:01 PM Brad Boyer <flar@allandria.com> wrote:
> On Sun, May 31, 2020 at 10:38:04AM +0200, Geert Uytterhoeven wrote:
> > >  arch/m68k/include/asm/adb_iop.h |  1 +
> > As this header file is used by a single source file only, perhaps it should
> > just be absorbed by the latter?
> > Then you no longer need my Acked-by for future changes ;-)
>
> While I don't really feel involved in this specific change (although I
> was one of the testers when the driver was first written), I am a little
> curious about the current coding standards. This header is pretty much
> just a declaration of the hardware interface, of which there are many
> in this directory. Is it better to just define all the offsets and bits
> for hardware registers inside the driver? We used to always put them in
> headers like this, but is that not the current standard? Would it be
> cleaner to put such headers in the directory with the driver effectively
> making them private? I seem to see quite a bit of that as well.

The idea behind header files is to share definitions among multipe
source files, right? It seems there is only one user of this header
file, so no sharing is involved, and thus these definitions are
de-facto private to the driver.  Hence, the hardware declarations
could be absorbed by the driver source file.

In this case having two separate files makes maintenance more
difficult, as the two files belong to different maintainer spaces
(drivers/macintosh/ and arch/m68k/).

In general, moving header files to the driver directory is an option,
if nothing outside the driver directory needs it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
