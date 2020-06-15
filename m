Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F06EC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 09:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E12A206B7
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 09:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="WtnSF+xY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgFOJcv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 05:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729280AbgFOJcu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Jun 2020 05:32:50 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E749CC061A0E
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 02:32:49 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id q2so8950740vsr.1
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ze7ekSclcfB6v2GWSBh01lEwbZQSh4xk3PT2qxDHEiQ=;
        b=WtnSF+xYCijow6jkP+URmJemnr7n6IJZgJMRq1Z8RaJVJmFMWIdPuEWhwjVqXgPXbi
         J3PI0XvAJPcKXIR0z2Xtm0tnWaLcZK66bI4Z9zcPZzCboA+NqYBRRYL6arKJS0drxIAN
         CljxSVuYA/coE2zP3a+MXp+A81sg7mPTbtX/7ff3H8NAI/5y44AlFL7TjfzoZOQK4W4X
         dr0yOiGlFPh7ib7qMKAYNAe3V/NO9tsiQg7biAOXJkQ3HntHdQuXiUVzIIe6FGVHgdNe
         VotZIUfjFclgYS+ngpGl7btOS7hK2NN+yjesnNlitR2pl9EYE8qNVjuZeAaO07lV2XtZ
         3Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ze7ekSclcfB6v2GWSBh01lEwbZQSh4xk3PT2qxDHEiQ=;
        b=ZlfXMQbZ5H2PGKhmZ1JDBdw/65oPDFQxGqbScD5vtR1DuK2HhZl39WttSTdIJGHW4j
         Z/ElQ0u16wrHO8XQjNjrkggmhi+Qck+u4VdDdQFhq0O3KZGeeNV5Ic8T5HFKXpeLxMx5
         8zmteHptPE7FcQsuQR3KXMFYkG+rkeSmWq3MIogPiCW+ZYY6ngfvkmYl1m3y089kK+dc
         QRONVzlQhMf/4vld/OBuXBb6D79wOzw4F2ANEpL3AbOLYumiTmbPPh5Fm1rYlDKixEFI
         X/UrVH5mCJhanSFPIHlR7obsJSq1vmew+ZjyOy2HGAWREHGeJ+SXvA+vpehBfNgPijy/
         l74A==
X-Gm-Message-State: AOAM533AXHA/SgZbxqsz745SllucqCo/Fe+LMvXiKrCGhANgrnl4Moid
        lagcxRA51qZgzab+Opg5xB3aIK2j3qq0if51w2JqC8YJ
X-Google-Smtp-Source: ABdhPJwbsCKvoJ7bOp+fyzWQDDnc6vXCb6/dYvGVisngyetTcwG5UJlORKQuyYh3OadO0U6XQ8dg7SDT2h1NXG8tVvM=
X-Received: by 2002:a05:6102:10ca:: with SMTP id t10mr17915748vsr.237.1592213568132;
 Mon, 15 Jun 2020 02:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200614225119.777702-1-angelo.dureghello@timesys.com>
 <20200615062613.GA7811@linux.ibm.com> <CALJHbkA=T0z2-jfHr5QWnH6NCZ3ha9b0wxkxgDU5g8LK_tcVtA@mail.gmail.com>
In-Reply-To: <CALJHbkA=T0z2-jfHr5QWnH6NCZ3ha9b0wxkxgDU5g8LK_tcVtA@mail.gmail.com>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 15 Jun 2020 11:38:49 +0200
Message-ID: <CALJHbkAJJi=j3Bgba-VDCknkfzuH-aoFgz5q2Y86JODEadvb2w@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: fix node memblock init
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

tested also no-mmu on mcf5441x, i think the fix itself works.
I think i am not in the recipient list of your new patch,
so i leave you my tested-by for no-mmu here.

Tested-by: Angelo Dureghello <angelo.dureghello@timesys.com>


Then, i see something else wrong when mounting ext4 (sdcard). It seems
to be totally unrelated,
will investigate and help as soon as i have some time.

[   15.930000] EXT4-fs (mmcblk0p2): recovery complete
[   15.940000] EXT4-fs (mmcblk0p2): mounted filesystem with ordered
data mode. Opts: (null)
[   15.950000] VFS: Mounted root (ext4 filesystem) on device 179:2.
[   15.980000] devtmpfs: mounted
[   15.990000] BUG: Bad page state in process swapper  pfn:20127
[   15.990000] page:47f804e0 refcount:0 mapcount:1 mapping:00000000 index:0x0
[   15.990000] flags: 0x0()
[   15.990000] raw: 00000000 00000100 00000122 00000000 00000000
00000000 00000000 00000000
[   15.990000] page dumped because: nonzero mapcount
[   15.990000] CPU: 0 PID: 1 Comm: swapper Not tainted
5.7.0stmark2-001-14991-ge6ff2d647c68-dirty #181
[   15.990000] Stack from 402e1ed4:
[   15.990000]         402e1ed4 40217bfa 40217bfa 4004fb4e 47f804e0
40216578 40216548 402dc2b4
[   15.990000]         00020127 ffffffff 47f804e0 4004fbcc 47f804e0
40216578 00000001 47f804e4
[   15.990000]         4005037e 47f804e0 0000020a 47f72000 ffffffff
40260000 47f804e0 47f72c10
[   15.990000]         47f72c10 47f804e0 00000000 402e1f40 402e1f40
400504f8 4024d208 00000001
[   15.990000]         47f72c04 47f804e0 401bee84 4005228a 40052b90
40050f82 47f804e0 00000000
[   15.990000]         402102d0 40052c52 47f804e0 00000000 00000000
4025cfda 400215dc 40057246
[   15.990000] Call Trace: [<4004fb4e>] bad_page+0xb4/0xd4
[   15.990000]  [<4004fbcc>] check_free_page+0x5e/0x6a
[   15.990000]  [<4005037e>] free_pcppages_bulk+0x7e/0x10c
[   15.990000]  [<400504f8>] free_unref_page_commit.isra.126+0x6e/0x7c
[   15.990000]  [<401bee84>] memset+0x0/0x80
[   15.990000]  [<4005228a>] __free_pages+0x0/0x14
[   15.990000]  [<40052b90>] adjust_managed_page_count+0x0/0x32
[   15.990000]  [<40050f82>] free_unref_page+0x46/0x50
[   15.990000]  [<40052c52>] free_reserved_area+0x90/0xcc
[   15.990000]  [<400215dc>] complete+0x0/0x2e
[   15.990000]  [<40057246>] kfree+0x0/0x138
[   15.990000]  [<401bf056>] kernel_init+0x0/0xd2
[   15.990000]  [<40002eec>] free_initmem+0x1c/0x24
[   15.990000]  [<4024e000>] set_reset_devices+0x0/0xa
[   15.990000]  [<401bf06a>] kernel_init+0x14/0xd2
[   15.990000]  [<400018c8>] ret_from_kernel_thread+0xc/0x14

I have the prompt anyway here.

Regards,
angelo


On Mon, Jun 15, 2020 at 11:16 AM Angelo Dureghello
<angelo.dureghello@timesys.com> wrote:
>
> Hi Mike,
>
> On Mon, Jun 15, 2020 at 8:26 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > Ho Angelo,
> >
> > On Mon, Jun 15, 2020 at 12:51:19AM +0200, Angelo Dureghello wrote:
> > > After pulling 5.7.0 (linux-next merge), mcf5441x mmu boot was
> > > hanging silently.
> > >
> > > memblock_add() seems not appropriate, since using MAX_NUMNODES
> > > as node id, while memblock_add_node() sets up memory for node id 0.
> > >
> > > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> >
> > The fix is correct, but it is not complete as nommu should be also
> > fixed.
> > I've updated your patch with nommu fix [1].
> >
> > [1] https://lore.kernel.org/lkml/20200615062234.GA7882@kernel.org
> >
>
> Thanks a lot !
> Will try the no-mmu fix also in short.
>
>
> > > ---
> > >  arch/m68k/mm/mcfmmu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> > > index 29f47923aa46..7d04210d34f0 100644
> > > --- a/arch/m68k/mm/mcfmmu.c
> > > +++ b/arch/m68k/mm/mcfmmu.c
> > > @@ -174,7 +174,7 @@ void __init cf_bootmem_alloc(void)
> > >       m68k_memory[0].addr = _rambase;
> > >       m68k_memory[0].size = _ramend - _rambase;
> > >
> > > -     memblock_add(m68k_memory[0].addr, m68k_memory[0].size);
> > > +     memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
> > >
> > >       /* compute total pages in system */
> > >       num_pages = PFN_DOWN(_ramend - _rambase);
> > > --
> > > 2.26.2
> > >
> >
> > --
> > Sincerely yours,
> > Mike.
>
> Regards,
> angelo



-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
