Return-Path: <SRS0=lrj2=5Q=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C14C43331
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 07:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B112220578
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 07:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCaHCW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Mar 2020 03:02:22 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:45573 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCaHCW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Mar 2020 03:02:22 -0400
Received: by mail-oi1-f182.google.com with SMTP id l22so18007640oii.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Mar 2020 00:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NrZdqqPJMaCzyHpom7Q0BfP5gkkjvlNXcgZccBCbXYA=;
        b=XrSkCzWrBH/7OiuDFv2wHn2A7fzeh+3watM2Lg4LnbUFW4odbZ6Q+/imHdFUkwMStu
         Y1P55p8moOtI/siLFWWdVAs5bbH0rj7Js++zIFwYRavm5/3lcICuOVL29sz2kQg6+yAD
         Q15rUSvgvbuPfd7Hi9oAex9MWqUhK8T9hmjCxXhPhBASllmGUqXQO1pGGs7B7kkDPJiX
         eMzuJzQHFjjr5YWSkz52roNbbU1+pGChNFJMTnKAOqThvf4d9K5HhzhGthc88f9QxCP0
         kcz7u2LRH1qc/UlfGR2cPtw2k39Xyzspm3MQI3um/M+/7jMruD/ajUWy4uCyWGrMOzPd
         Zmug==
X-Gm-Message-State: ANhLgQ1soL1mQ8LTVbsTOBvKe8x86iv1NMxU1rLl2wsGyFjNvq1ghjvP
        hdbJPZxDNvnBOtYNIRfOubYiho4MW7PeGO+XmCQ=
X-Google-Smtp-Source: ADFU+vugw+80GJ/lFZqvZ6pJMFh8Hm3UmZ0lwQVhcid8GeI+cihW7RIiERyThm5kOzDmc+tF1/rJC7koyiyQoQfpqnQ=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr1103474oib.148.1585638141027;
 Tue, 31 Mar 2020 00:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
 <CAMuHMdVN_v4bp7w2LhqXcnEE05BiswfimK=pVdep5=j31o-jbA@mail.gmail.com>
 <CABq5eXG6VdWxVCX3da3nkwJ_Cha34gK_D+X5MYpYxSh5cZWZAA@mail.gmail.com>
 <CAMuHMdUCh8G3PGBMFoNn=c98kDbBW7501UuTeV+MnW+Jb7pqjw@mail.gmail.com> <CABq5eXGFiiLYkBJB-sv+nnFzM0U5i9_Kk50EvcLy-W3CxoAUYw@mail.gmail.com>
In-Reply-To: <CABq5eXGFiiLYkBJB-sv+nnFzM0U5i9_Kk50EvcLy-W3CxoAUYw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Mar 2020 09:02:09 +0200
Message-ID: <CAMuHMdXf3q79hpLcv6mcj0LaGJEmNym_XOyNBOJ99QKrUP2DuQ@mail.gmail.com>
Subject: Re: BigRAMPlus seems to be detected now
To:     Stefan Reinauer <stefan.k.reinauer@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stefan,

On Tue, Mar 31, 2020 at 7:07 AM Stefan Reinauer
<stefan.k.reinauer@gmail.com> wrote:
> On Tue, Mar 10, 2020 at 1:15 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Mar 10, 2020 at 4:06 AM Stefan Reinauer
> > <stefan.k.reinauer@gmail.com> wrote:
> > > On Sun, Mar 8, 2020 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > As well as trying to boot it with the BRP as primary memory (BRP first
> > > > in memfile) or sole memory (motherboard RAM disabled in memfile).
> > >
> > > With BigramPlus as sole memory the system can't seem to deal with the
> > > initramfs (see log)
> >
> > However, according to this log you have both enabled:
> >
> > > On node 0 totalpages: 4096
> > >   DMA zone: 40 pages used for memmap
> > >   DMA zone: 0 pages reserved
> > >   DMA zone: 4096 pages, LIFO batch:0
> >
> > 16 MiB
> >
> > > On node 1 totalpages: 65536
> > >   DMA zone: 640 pages used for memmap
> > >   DMA zone: 0 pages reserved
> > >   DMA zone: 65536 pages, LIFO batch:15
> >
> > 256 MiB
> >
> > > SLUB: Unable to allocate memory from node 0
> > > SLUB: Allocating a useless per node structure in order to be able to continue
> > > SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
> >
> > Probably the 16 MiB in the first chunk is too small to allocate
> > page tables from, especially if it contains the initramfs.
> >
> > What happens if you put the BRP first in the memfile?
>
> Before chipram?
> ---------------------------------
> 0x50000000 268435456
> 2097152

No, as the first FastRAM chunk.
ChipRAM must always be first ;-)

> This one works:
> ---------------------------------
> 2097152
> 0x50000000 268435456
> 0x07000000 16777216
> ---------------------------------

OK, that's what I meant.

> Same as only using the bigram (and I got into the OS just fine, but I
> had to do the installation through qemu)

Yeah, that won't make much of a difference, as it may take a while
before it actually starts using the on-board RAM.

Does the initramfs start working if you restrict the amount of RAM used,
by adding e.g. mem=16M or mem=64M to the kernel command line?
If there is a limitation on memory size somewhere in the code, that may
help identifying it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
