Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101E3C64ED6
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 12:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjB0Mbn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 07:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjB0Mbm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 07:31:42 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FA11DB87
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 04:31:41 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id l18so5223099qtp.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 04:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZE49h/xx2na11+72fA8MaajfvIfG6NPkGUrwLA/hvDM=;
        b=yPNJ+MKo2z7hP+p2p9fKi0vwL+/tM/e0FSDL1T4qPvUjVY+y7XU00USXSsVLt8tWzH
         ccsjISgehoXwxbXQi0nnkVcdCVXL2LVX3US2yQenE66GpcbPhv4vbKwfO7WhY82mPvzH
         /9dcMyr/bVKjROBuHuk0a2em4asCgbs0+iPzTUpRlHmaCSQbVUwOD/hgz6PPBCXDF4B4
         iZZR6kXLUFfyeKea2Hwk3O9Y9CZDKZga68VOpn84L1kAAno5jQHqVxR0DSdP9dRXp4Gj
         jItcQayEm2NbO6+Y82/4IK7+VfAOkhLrQ+4IdMnRe03lc4V1KzHmh8OgVsprJvgdiRCV
         E5Zg==
X-Gm-Message-State: AO0yUKWQGIpq39K+kimvig7cGGjWQBcwxHJjDBTlsiN+dRc5QcupnoIj
        56tmkmkoTqUGcFbbPIhda4KbwQVF/z0QDw==
X-Google-Smtp-Source: AK7set9eYH1zxCLxD629cuVFMe7FLPDb7TOQysqW9kIhAR7mVU/6d+5u/MbnUv+sXWLTSTZUuzGxjQ==
X-Received: by 2002:a05:622a:1a94:b0:3bf:ca3d:673c with SMTP id s20-20020a05622a1a9400b003bfca3d673cmr12190208qtc.2.1677501099822;
        Mon, 27 Feb 2023 04:31:39 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h10-20020ac8776a000000b003b9b8ec742csm4593040qtu.14.2023.02.27.04.31.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 04:31:39 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536cd8f6034so170242677b3.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 04:31:38 -0800 (PST)
X-Received: by 2002:a05:6902:18c2:b0:8ed:3426:8a69 with SMTP id
 ck2-20020a05690218c200b008ed34268a69mr7432794ybb.1.1677501098382; Mon, 27 Feb
 2023 04:31:38 -0800 (PST)
MIME-Version: 1.0
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
 <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com> <30ad3b65-c43c-4389-e8af-b53705833146@linux-m68k.org>
 <CAMuHMdV47vKvJyYV1fw9R66piT-73Q5=CiUwZ-RWa_XAgsJH+g@mail.gmail.com>
 <2159d5c6-ee10-06e6-8085-831914ceccce@gmail.com> <Y/yVSM5Mi/Qdc2N1@kernel.org>
In-Reply-To: <Y/yVSM5Mi/Qdc2N1@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Feb 2023 13:31:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk+D1jDEFn1aSmNwKR08jc3wKeynE8Nkvf71T8cSZV4w@mail.gmail.com>
Message-ID: <CAMuHMdWk+D1jDEFn1aSmNwKR08jc3wKeynE8Nkvf71T8cSZV4w@mail.gmail.com>
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On Mon, Feb 27, 2023 at 12:34 PM Mike Rapoport <rppt@kernel.org> wrote:
> On Mon, Feb 27, 2023 at 10:42:34PM +1300, Michael Schmitz wrote:
> > Am 27.02.2023 um 21:26 schrieb Geert Uytterhoeven:
> > > FTR, here is the diff of the dmesg between good and bad:
> > >
> > >     +initrd: 07f61166 - 08000000
> > >
> > > This is wrong (note the 6 trailing zeros), as phys_to_virt() is not
> > > working correctly yet (module_fixup() is called from paging_init()).
> > >
> > >      Zone ranges:
> > >        DMA      [mem 0x0000000007400000-0x0000007fffffffff]
> > >        Normal   empty
> > >      Movable zone start for each node
> > >      Early memory node ranges
> > >        node   0: [mem 0x0000000007400000-0x0000000007ffffff]
> > >      Initmem setup node 0 [mem 0x0000000007400000-0x0000000007ffffff]
> > >     -initrd: 00b61166 - 00c00000
> > >
> > > This is correct (note the 5 trailing zeros).
> > >
> > >     -pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> > >     -pcpu-alloc: [0] 0
> > >      [...]
> > >     +Unable to handle kernel access at virtual address (ptrval)
> > >     +Oops: 00000000
> > >     +Modules linked in:
> > >     +PC: [<002c11be>] memcmp+0x2c/0x5c
> > >     +SR: 2700  SP: (ptrval)  a2: 003bd560
> > >     +d0: 0035eb83    d1: 07fffff8    d2: 002c1192    d3: 000000e6
> > >     +d4: 000684e8    d5: 00447000    a0: 0000000c    a1: 07fffff4
> > >     +Process swapper (pid: 0, task=(ptrval))
> > >     +Frame format=7 eff addr=003bbfbc ssw=0505 faddr=07fffff4
> > >     +wb 1 stat/addr/data: 0005 00447000 07401000
> > >     +wb 2 stat/addr/data: 0005 000000e6 000684e8
> > >     +wb 3 stat/addr/data: 0005 003bbfb4 002c1192
> > >     +push data: 07401000 002c7d82 07401000 074a2cf4
> > >     +Stack from 003bbfb4:
> > >     +002c1192 000000e6 002c7d82 00428eda 07fffff4 0035eb7f 0000000c 00447000
> > >     +000000e6 000684e8 00447000 07401000 074bec08 07401000 074a2cf4 07fffff0
> > >     +00440406 00000000 00428322
> > >     +Call Trace: [<002c1192>] memcmp+0x0/0x5c
> > >     +[<002c7d82>] _printk+0x0/0x18
> > >     +[<00428eda>] start_kernel+0x80/0x5b0
> > >     +[<000684e8>] pcpu_alloc+0x88/0x3b4
> > >     +[<00428322>] _sinittext+0x322/0x9b0
> > >
> > > On Mon, Feb 27, 2023 at 7:30 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > > > On Mon, 27 Feb 2023, Michael Schmitz wrote:
> > > > > I wonder whether Finn's memtest patch merely exposed another MM bug
> > > >
> > > > A kernel patch may be easier than a bootloader patch (even if this is a
> > > > bootloader bug) particularly if it affects multiple platforms.
> > > >
> > > > A partial revert of my patch (below) will probably avoid the issue, but
> > > > with the side effect that use of memtest will clobber the initrd.
> > >
> > > Which we can avoid, by moving the ramdisk handling inside paging_init().
> > >
> > > > The initrd and memtest features aren't usually needed together. At the
> > > > time when I needed the memtest feature I did not have confidence in the
> > > > hardeare. An initrd wasn't very useful at that point.
> > > >
> > > > diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> > > > index 3a2bb2e8fdad..92f1b9268dff 100644
> > > > --- a/arch/m68k/kernel/setup_mm.c
> > > > +++ b/arch/m68k/kernel/setup_mm.c
> > > > @@ -326,6 +326,8 @@ void __init setup_arch(char **cmdline_p)
> > > >                 panic("No configuration setup");
> > > >         }
> > > >
> > > > +       paging_init();
> > > > +
> > > >  #ifdef CONFIG_BLK_DEV_INITRD
> > > >         if (m68k_ramdisk.size) {
> > > >                 memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
> > >
> > > Presumably something in memblock_reserve() relies on having
> > > called paging_init() before?
>
> memblock_reserve() does not rely on paging_init() as it operates on
> physical addresses and it does not care if memory was already registered.
>
> What does rely on paging_init() it's phys_to_virt() in the line after
> memblock_reserve():
>
>                 initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
>                 initrd_end = initrd_start + m68k_ramdisk.size;
>
> So to have both memtest and initrd we'd need something like
>
>         memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
>
>         paging_init() {
>                 /* setup page tables and memblock */
>                 early_memtest();
>         }
>
>         initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
>
> or
>
>         paging_init(); /* without early_memtest() */
>
>         memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
>         initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
>
>         early_memtest();

Of course... /me bangs his head against the TFT for not having
realized before the values saved into initrd_{start,end} are not just
for printing in the pr_info() line...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
