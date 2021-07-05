Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0AEC07E98
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 08:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48A6F6128E
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 08:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhGEI6r (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 04:58:47 -0400
Received: from verein.lst.de ([213.95.11.211]:56163 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230121AbhGEI6r (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 04:58:47 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4B02E67373; Mon,  5 Jul 2021 10:56:08 +0200 (CEST)
Date:   Mon, 5 Jul 2021 10:56:07 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] m68knommu: remove set_fs()
Message-ID: <20210705085607.GA6827@lst.de>
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de> <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 05, 2021 at 10:44:51AM +0200, Geert Uytterhoeven wrote:
> > --- a/arch/m68k/Kconfig
> > +++ b/arch/m68k/Kconfig
> > @@ -32,7 +32,7 @@ config M68K
> >         select NO_DMA if !MMU && !COLDFIRE
> >         select OLD_SIGACTION
> >         select OLD_SIGSUSPEND3
> > -       select SET_FS
> > +       select SET_FS if MMU
> 
> Probably this should be
> 
>     select SET_FS if CPU_HAS_ADDRESS_SPACES
> 
> instead.  Classic m68k (except for good old 68000) has address spaces,
> Coldfire has not.

No, at least not yet.  Coldfire and co still rely on set_fs for various
things in the m68k arch code, and also don't provide
__{get,put}_kernel_nofault yet.  So wile m68k with CPU_HAS_ADDRESS_SPACES
will probably one of the hardest ports to get rid of set_fs() for,
m68k/mmu without CPU_HAS_ADDRESS_SPACES would be a logical next step.
I could try to whiteboard code some of it, but I'd need help from dedicated
