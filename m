Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E744CC07E99
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 11:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB3DB613C8
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 11:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhGELg2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 07:36:28 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:46778 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhGELg1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 07:36:27 -0400
Received: by mail-vs1-f48.google.com with SMTP id w3so611911vsw.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Jul 2021 04:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ySDG8Sr+Riu7XyvWRWEKE2UYstES43lKpWl5pBMgBBw=;
        b=C6lcuI1PwLeeuRtW3gieWsk5S8ZuQlUCJI1JCpqPY8qq5C8sl+uwIfNrs805gyzpTC
         cBSQMrq+VdbL7Qe1gSDID0ocPCB8RisqMg9P4U5bdY3G+zyEfMW65aocQnUa7vz3e0Dy
         R8LJQkBvDlR1GIKvLShNHJtbuRlxSsv5BD3xegn/55Z6X3DMCtXGB7G/3SVMJbheHjkB
         Fi+5fHDcjnvzFccuGlrAEDGjUl92yD4W171h2kXojcvHHT5BZKLjtYlwNNQDuTMaOlsh
         0fTjglCbd21ZZqQZu93gcP0yZI4u0D6kFCMfA/ftYI9U1G5HYeHvo3sRAbqk2CJr8SeR
         rwNg==
X-Gm-Message-State: AOAM5321gehzHKv8n8jl104ORLdFEfwGCGuDrXwgvK3zpmAuOmaTGvBo
        dbxtIs5IEEuAA2Hy9gPY0CPaY2C9f+bk1PJEGUY=
X-Google-Smtp-Source: ABdhPJycNbrp/4D2OaX8Nm1KmoIGl/Hna3Hq7zkLAQ57pI6h0zcL7hkMPgieshxUGTLjRhSLczm92ZT4E+QpdK+kuXI=
X-Received: by 2002:a67:770d:: with SMTP id s13mr8515416vsc.40.1625484830456;
 Mon, 05 Jul 2021 04:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com> <20210705085607.GA6827@lst.de>
In-Reply-To: <20210705085607.GA6827@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Jul 2021 13:33:39 +0200
Message-ID: <CAMuHMdXB1aYK+jUtkf0L5UCNt2HCH53gxY2rDxYHCNFVSG91yw@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Jul 5, 2021 at 10:56 AM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Jul 05, 2021 at 10:44:51AM +0200, Geert Uytterhoeven wrote:
> > > --- a/arch/m68k/Kconfig
> > > +++ b/arch/m68k/Kconfig
> > > @@ -32,7 +32,7 @@ config M68K
> > >         select NO_DMA if !MMU && !COLDFIRE
> > >         select OLD_SIGACTION
> > >         select OLD_SIGSUSPEND3
> > > -       select SET_FS
> > > +       select SET_FS if MMU
> >
> > Probably this should be
> >
> >     select SET_FS if CPU_HAS_ADDRESS_SPACES
> >
> > instead.  Classic m68k (except for good old 68000) has address spaces,
> > Coldfire has not.
>
> No, at least not yet.  Coldfire and co still rely on set_fs for various
> things in the m68k arch code, and also don't provide
> __{get,put}_kernel_nofault yet.  So wile m68k with CPU_HAS_ADDRESS_SPACES
> will probably one of the hardest ports to get rid of set_fs() for,
> m68k/mmu without CPU_HAS_ADDRESS_SPACES would be a logical next step.
> I could try to whiteboard code some of it, but I'd need help from dedicated

M68k/mmu with CPU_HAS_ADDRESS_SPACES needs to use the address spaces
to access user space from kernel space using the "moves" instruction.
Coldfire doesn't.

See arch/m68k/include/asm/uaccess.h.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
