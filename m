Return-Path: <SRS0=lrj2=5Q=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BF9C43331
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 05:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B87220748
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 05:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMy/CekJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgCaFHv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Mar 2020 01:07:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36751 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgCaFHv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Mar 2020 01:07:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id g62so1124218wme.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2020 22:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qj0lDrA0cWcUYlEeAHVWGInKxfM5byu8wX0a/vwiLvE=;
        b=IMy/CekJF6uQNjw5jZShDn/NePbI725FweT00DVX4bK3lQh9A6gMJ/qGJtqYqB+JhJ
         hash4y6UzYY7j5LJrGM7Fad1WbamJah7fP4j2xnzHBlHi3dVfI2AqBq2M06zKLQC3z6g
         eI+LPP4IdeYnyeIbA+aDMyUC07CQc5X4CENM3n8mF+9gjpW8xw2L4A17UPYcF1xyEMJV
         angO9FLYhglZlTIlioFAoWmXT1r1n2E71VlW1wPlnutJ/7renAb7FG5yfrkjljYystLC
         HKfLW8yevZk/t2gC27wVfnezTtJdd1MqSgNVORgkuaoB8AL2KnvQ1DCmGHWhJAnYyK6G
         C9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qj0lDrA0cWcUYlEeAHVWGInKxfM5byu8wX0a/vwiLvE=;
        b=TcRLwgfyAKw98Wr6woQnNflkRPSeRtIMSaLF7TTcW98o0PCDgzk3Rwpq1cSi67wXmP
         2FU5eZC/I3BMcA1Vf4f8W/vqahUDQDBPilW0Kd9Pn7GuNHMBcNvgza9gRTM221U4byZ8
         WhrwJjK0Mf3tlqctF/VyUGVhozkxjyWtYPW1hd5gGJKa8/UdatPl3PbrTw8cx+pdiBpv
         ZnBbt1lPLHR/Ky3TOAVQEixwtlEmxC4d0d5x0lUbEC+BovEL38qhNE2aLtw0KYokxN5O
         n3ZPeAFrrmUk1QzeLCtuZAzVHI4l+Nbsm1FoXs6B+ILO6C9WuQaVMYPuXU17pq70bUto
         JffQ==
X-Gm-Message-State: ANhLgQ3xxa1uHr1w0GBKr9rlg5QX0hW6ixXZy9ADSjwXCKZZrbPjqBMp
        gY7XRsRemGHiuVxDhJIjpTfr0cbCEM1EmFbL0os=
X-Google-Smtp-Source: ADFU+vv5KKhTBPuvVzUZJTul7AsVPYiBudXLwHR2PSKRIRIv9w9jZtmDiEgANQp2DjLkaIylIZPJUdpzd3mIHUq63LQ=
X-Received: by 2002:a1c:c257:: with SMTP id s84mr1474350wmf.0.1585631268475;
 Mon, 30 Mar 2020 22:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
 <CAMuHMdVN_v4bp7w2LhqXcnEE05BiswfimK=pVdep5=j31o-jbA@mail.gmail.com>
 <CABq5eXG6VdWxVCX3da3nkwJ_Cha34gK_D+X5MYpYxSh5cZWZAA@mail.gmail.com> <CAMuHMdUCh8G3PGBMFoNn=c98kDbBW7501UuTeV+MnW+Jb7pqjw@mail.gmail.com>
In-Reply-To: <CAMuHMdUCh8G3PGBMFoNn=c98kDbBW7501UuTeV+MnW+Jb7pqjw@mail.gmail.com>
From:   Stefan Reinauer <stefan.k.reinauer@gmail.com>
Date:   Mon, 30 Mar 2020 22:07:37 -0700
Message-ID: <CABq5eXGFiiLYkBJB-sv+nnFzM0U5i9_Kk50EvcLy-W3CxoAUYw@mail.gmail.com>
Subject: Re: BigRAMPlus seems to be detected now
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Mar 10, 2020 at 1:15 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Stefan,
>
> On Tue, Mar 10, 2020 at 4:06 AM Stefan Reinauer
> <stefan.k.reinauer@gmail.com> wrote:
> > On Sun, Mar 8, 2020 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > As well as trying to boot it with the BRP as primary memory (BRP first
> > > in memfile) or sole memory (motherboard RAM disabled in memfile).
> >
> > With BigramPlus as sole memory the system can't seem to deal with the
> > initramfs (see log)
>
> However, according to this log you have both enabled:
>
> > On node 0 totalpages: 4096
> >   DMA zone: 40 pages used for memmap
> >   DMA zone: 0 pages reserved
> >   DMA zone: 4096 pages, LIFO batch:0
>
> 16 MiB
>
> > On node 1 totalpages: 65536
> >   DMA zone: 640 pages used for memmap
> >   DMA zone: 0 pages reserved
> >   DMA zone: 65536 pages, LIFO batch:15
>
> 256 MiB
>
> > SLUB: Unable to allocate memory from node 0
> > SLUB: Allocating a useless per node structure in order to be able to continue
> > SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
>
> Probably the 16 MiB in the first chunk is too small to allocate
> page tables from, especially if it contains the initramfs.
>
> What happens if you put the BRP first in the memfile?

Before chipram?
---------------------------------
0x50000000 268435456
2097152
---------------------------------
[    0.000000] Linux version 5.4.0-4-m68k
(debian-kernel@lists.debian.org) (gcc version 9.2.1 20200203 (Debian
9.2.1-28)) #1 Debian 5.4)
[    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO
FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAU
[    0.000000] initrd: 008517bf - 01000000
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 68952
[..]
[   53.910000] Run /init as init process
[   53.940000] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000004
[   53.940000] CPU: 0 PID: 1 Comm: init Not tainted 5.4.0-4-m68k #1
Debian 5.4.19-1
[   53.940000] Stack from 00821e38:
[   53.940000]         00821e38 00377373 0002c276 000000ff 00000001
400004d8 0081c000 00000004
[   53.940000]         00820000 0000000c 00821ea4 0002db40 0036f405
00000004 00000004 00000001
[   53.940000]         400004d8 0003477c 00032732 008272dc 00821f6c
00821f80 00828f60 00000000
[   53.940000]         00000000 000000cd 00000000 008dc150 0002e182
00000004 00000003 000350fe
[   53.940000]         00000004 0000007c 00000000 00000000 00000000
00000001 00000000 00821fcc
[   53.940000]         00821f6c 00820000 00821fa4 008272a0 00002be2
00820007 000042f2 00821f6c
[   53.940000] Call Trace: [<0002c276>] panic+0xc4/0x296
[   53.940000]  [<0002db40>] do_exit+0x142/0x70e
[   53.940000]  [<0003477c>] do_signal_stop+0x0/0x142
[   53.940000]  [<00032732>] __list_del_entry+0x0/0x24
[   53.940000]  [<0002e182>] do_group_exit+0x48/0x80
[   53.940000]  [<000350fe>] get_signal+0x124/0x490
[   53.940000]  [<00002be2>] do_IRQ+0x26/0x32
[   53.940000]  [<000042f2>] do_notify_resume+0x32/0x4d4
[   53.940000]  [<002e099e>] kernel_init+0x0/0xd2
[   53.940000]  [<00034fb4>] force_sig_fault_to_task+0x30/0x3c
[   53.940000]  [<00002a64>] do_signal_return+0x10/0x1a
[   53.940000]  [<002e099e>] kernel_init+0x0/0xd2
[   53.940000]  [<0000c000>] apollo_irq_eoi+0x10/0x24
[   53.940000] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x00000004 ]---

This one works:
---------------------------------
2097152
0x50000000 268435456
0x07000000 16777216
---------------------------------
Same as only using the bigram (and I got into the OS just fine, but I
had to do the installation through qemu)

I also did some tests, and had Amiga Test Kit running over night,
which couldn't find anything wrong with the onboard fast ram.

Stefan

> Thanks!
>
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
