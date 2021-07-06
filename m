Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F4AC07E9B
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 04:13:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0949B6198E
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 04:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGFEQe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Jul 2021 00:16:34 -0400
Received: from verein.lst.de ([213.95.11.211]:58963 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhGFEQd (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Jul 2021 00:16:33 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8D75868B05; Tue,  6 Jul 2021 06:13:53 +0200 (CEST)
Date:   Tue, 6 Jul 2021 06:13:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [PATCH] m68knommu: remove set_fs()
Message-ID: <20210706041353.GA10889@lst.de>
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de> <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com> <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 05, 2021 at 01:39:03PM -0700, Linus Torvalds wrote:
> On Mon, Jul 5, 2021 at 1:46 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Probably this should be
> >
> >     select SET_FS if CPU_HAS_ADDRESS_SPACES
> 
> Actually, I don't think m68k has a single real "set_fs()" at all, and
> it should just be converted as-is to not use CONFIG_SET_FS.
> 
> Yes, there is a "set_fs()" function, but none of the remaining uses
> actually are the traditional kernel style of "use kernel addresses as
> user addresses". So as far as the *kernel* is concerned, m68k already
> looks like a no-SET_FS architecture, and "set-fs()" is purely a
> syntactic thing.

It still needs "real" kernel-style set_fs for the mm/maccess.c routines,
but adding __{get,put}_kernel_nofault should not be too hard.

> So I think the right thing to do looks something like this:
> 
>  - make the rule be that SFC/DFC is always normally USER_DATA
> 
>  - the special m68k sequences that need to play with special segments
> will always do
> 
>         preempt_disable();
>         set_segment(..whatever segment they need..);
>         .. do the special operation ..
>         set_segment(USER_DATA);
>         preempt_enable();
> 
>  - set_fs() goes away entirely, because the user access functions
> always work on USER_DATA and SFC/DFC is always right for them.

Yes, that's what I mean with needing a more work.
