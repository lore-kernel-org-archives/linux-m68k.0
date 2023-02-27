Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DF5C64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 12:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjB0Mk5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 07:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjB0Mk4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 07:40:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3BC1E1FC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 04:40:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 130B160D54;
        Mon, 27 Feb 2023 12:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6113FC433EF;
        Mon, 27 Feb 2023 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677501654;
        bh=6lI04aS9MGqV+ZqNg2+Q4xf/M+pevrEoA8ySHiLynC4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EyrDSLA6H3OPJV4KPaMZYzFkS7YYnQ13OSrujcukklNy6ZpEsOHWh9yFMzW7jlO6K
         rpVlccx9k8MjgIkGCFtXWrLt2NwCzNELipa8v4fKOKJZCMIWAt57qPqiKA4AcZBidh
         XsjAQ6VwAhjwsFABgNm+jvDT6yni/TCrN4Kdi09xRBREWAM4KLoWPS0f2517tyUm0N
         WXotRxAUI6mlgXYVMz/sVHqiqMcndDEgsx20eWUIdHZ+7nGgqSKZIulcQLhgQsbPZy
         xe/6UmpT5ZHCxTzu1N3pUrNbJJSZV+qT3+oHFAR+fjyvwNyQx/bjN7Mp21fEK5adHH
         a7dqRP4azyUnQ==
Date:   Mon, 27 Feb 2023 14:40:40 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
Message-ID: <Y/ykyFEDt5tYoWp3@kernel.org>
References: <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
 <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com>
 <30ad3b65-c43c-4389-e8af-b53705833146@linux-m68k.org>
 <CAMuHMdV47vKvJyYV1fw9R66piT-73Q5=CiUwZ-RWa_XAgsJH+g@mail.gmail.com>
 <2159d5c6-ee10-06e6-8085-831914ceccce@gmail.com>
 <Y/yVSM5Mi/Qdc2N1@kernel.org>
 <CAMuHMdWk+D1jDEFn1aSmNwKR08jc3wKeynE8Nkvf71T8cSZV4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWk+D1jDEFn1aSmNwKR08jc3wKeynE8Nkvf71T8cSZV4w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On Mon, Feb 27, 2023 at 01:31:23PM +0100, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Mon, Feb 27, 2023 at 12:34 PM Mike Rapoport <rppt@kernel.org> wrote:
> > On Mon, Feb 27, 2023 at 10:42:34PM +1300, Michael Schmitz wrote:
> > > Am 27.02.2023 um 21:26 schrieb Geert Uytterhoeven:
> > > > > On Mon, 27 Feb 2023, Michael Schmitz wrote:
> > > > > > I wonder whether Finn's memtest patch merely exposed another MM bug
> > > > >
> > > > > A kernel patch may be easier than a bootloader patch (even if this is a
> > > > > bootloader bug) particularly if it affects multiple platforms.
> > > > >
> > > > > A partial revert of my patch (below) will probably avoid the issue, but
> > > > > with the side effect that use of memtest will clobber the initrd.
> > > >
> > > > Which we can avoid, by moving the ramdisk handling inside paging_init().
> > > >
> > > > > The initrd and memtest features aren't usually needed together. At the
> > > > > time when I needed the memtest feature I did not have confidence in the
> > > > > hardeare. An initrd wasn't very useful at that point.
> > > > >
> > > > > diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> > > > > index 3a2bb2e8fdad..92f1b9268dff 100644
> > > > > --- a/arch/m68k/kernel/setup_mm.c
> > > > > +++ b/arch/m68k/kernel/setup_mm.c
> > > > > @@ -326,6 +326,8 @@ void __init setup_arch(char **cmdline_p)
> > > > >                 panic("No configuration setup");
> > > > >         }
> > > > >
> > > > > +       paging_init();
> > > > > +
> > > > >  #ifdef CONFIG_BLK_DEV_INITRD
> > > > >         if (m68k_ramdisk.size) {
> > > > >                 memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
> > > >
> > > > Presumably something in memblock_reserve() relies on having
> > > > called paging_init() before?
> >
> > memblock_reserve() does not rely on paging_init() as it operates on
> > physical addresses and it does not care if memory was already registered.
> >
> > What does rely on paging_init() it's phys_to_virt() in the line after
> > memblock_reserve():
> >
> >                 initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
> >                 initrd_end = initrd_start + m68k_ramdisk.size;
> >
> > So to have both memtest and initrd we'd need something like
> >
> >         memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
> >
> >         paging_init() {
> >                 /* setup page tables and memblock */
> >                 early_memtest();
> >         }
> >
> >         initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
> >
> > or
> >
> >         paging_init(); /* without early_memtest() */
> >
> >         memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
> >         initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
> >
> >         early_memtest();
> 
> Of course... /me bangs his head against the TFT for not having
> realized before the values saved into initrd_{start,end} are not just
> for printing in the pr_info() line...

Happens to the best of us :)
 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.
