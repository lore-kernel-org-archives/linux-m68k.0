Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B05C7619A
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Mar 2023 06:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjC0Gy0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Mar 2023 02:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjC0GyZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Mar 2023 02:54:25 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0967449E1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 23:54:24 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-545cb3c9898so76447507b3.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 23:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679900063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plGagUYftpQsBMlgM/JV9TOX4wd7CVXkYQp42T82V/8=;
        b=2h29r27TV5kR1/B8ePpPihSrbH8h7qO+30iCdEho3Ba6X12ZxLllEa/UGCpMlGdeQz
         q5yvOq+6Dtx1H+2iAHTLVemc8xGrONwYJuIpKXlgNciGrWmJzooRgU30sGufAUqwiGdO
         jlPi/Ch9LOBFCe4RpBGN3FD+EWkTVd4LLMeCLT70CmRUbqNE5Ou388xV2801SQY9O1a4
         nWYwostgViNQahQ/cNvKzMr/sbJxjX3JgMVG5YK8kMM9+94x+2wA5LXK/0Dbyaz/y8iu
         VQ+3tXKGMTHhKD4ClMvaSh6PCxuoeDqOWNw5XXOzFf9NzOtwbZOPXhK3DX/iuEpDG3el
         hS7Q==
X-Gm-Message-State: AAQBX9el6d2fKY2Rnnaq7ndSfgeSA1DdXjoNSAI312y2Al9SQbNKTPlV
        F8ctKQEhiyy6ugIwMMvftNwrnnlc51LzJg==
X-Google-Smtp-Source: AKy350azZLxgW41HXuYDX1sklXOrg+5vdxLgANN4+9chdWCxSm3OHBp0bKa2qYZyNzhzFwZG/4MKXg==
X-Received: by 2002:a81:5dc4:0:b0:541:95f0:32e0 with SMTP id r187-20020a815dc4000000b0054195f032e0mr11877405ywb.36.1679900062842;
        Sun, 26 Mar 2023 23:54:22 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id p69-20020a81b148000000b00545a08184e0sm1822410ywh.112.2023.03.26.23.54.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 23:54:22 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5419d4c340aso151154647b3.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 23:54:22 -0700 (PDT)
X-Received: by 2002:a81:ec08:0:b0:545:6250:58ec with SMTP id
 j8-20020a81ec08000000b00545625058ecmr4492770ywm.4.1679900062009; Sun, 26 Mar
 2023 23:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <fa0774b8-3ed2-8b87-defd-17fbb492922f@linux-m68k.org>
 <ca000c1c-899a-fa5a-90f5-d44682e54740@linux-m68k.org> <1fe7014b-84c5-2229-9b26-d57a3e4e3ddb@linux-m68k.org>
In-Reply-To: <1fe7014b-84c5-2229-9b26-d57a3e4e3ddb@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 08:54:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+m5er5twbKX6cE6FQ35sypSmaRFAJ+Npi8venS9gJDw@mail.gmail.com>
Message-ID: <CAMuHMdV+m5er5twbKX6cE6FQ35sypSmaRFAJ+Npi8venS9gJDw@mail.gmail.com>
Subject: Re: gdb failure: "core file format not supported"
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, Mar 27, 2023 at 2:47 AM Finn Thain <fthain@linux-m68k.org> wrote:
> I wasn't able to add the linux-m68k list to the bug report Cc list.
>
> I'm forwarding this as I don't know the answer to Tom's question...
>
> On Sat, 25 Mar 2023, tromey at sourceware dot org wrote:
>
> > https://sourceware.org/bugzilla/show_bug.cgi?id=30273
> >
> > Tom Tromey <tromey at sourceware dot org> changed:
> >
> >            What    |Removed                     |Added
> > ----------------------------------------------------------------------------
> >                  CC|                            |tromey at sourceware dot org
> >
> > --- Comment #1 from Tom Tromey <tromey at sourceware dot org> ---
> > This is probably a regression due to this patch:
> >
> > commit 3eba3a011a89c75c10bd1860eee4589e65697165
> > Author: Tom Tromey <tromey@adacore.com>
> > Date:   Mon Sep 14 08:30:10 2020 -0600
> >
> >     Various m68k fixes for gdb
> >
> >
> > When I debug gdb I see it decides this core file is
> > GDB_OSABI_SVR4, not GDB_OSABI_LINUX.  This happens
> > because m68k_osabi_sniffer takes this branch:
> >
> >   if (elfosabi == ELFOSABI_NONE)
> >     return GDB_OSABI_SVR4;
> >
> > From elf/common.h:
> >
> > #define ELFOSABI_NONE         0 /* UNIX System V ABI */
> > #define ELFOSABI_HPUX         1 /* HP-UX operating system */
> > #define ELFOSABI_NETBSD       2 /* NetBSD */
> > #define ELFOSABI_GNU          3 /* GNU */
> > #define ELFOSABI_LINUX        3 /* Alias for ELFOSABI_GNU */
> >
> >
> > So I guess one question is why this core file isn't marked
> > as ELFOSABI_LINUX.

Only PA-RISC and the remoteproc core dumper seem to use
ELFOSABI_LINUX?

    arch/parisc/include/asm/elf.h:#define ELF_OSABI         ELFOSABI_LINUX
    arch/parisc/kernel/ptrace.c:    .name = "parisc", .e_machine =
ELF_ARCH, .ei_osabi = ELFOSABI_LINUX,
    arch/parisc/kernel/ptrace.c:    .name = "parisc", .e_machine =
EM_PARISC, .ei_osabi = ELFOSABI_LINUX,

    include/uapi/linux/elf.h:#ifndef ELF_OSABI
    include/uapi/linux/elf.h:#define ELF_OSABI ELFOSABI_NONE
    include/uapi/linux/elf.h-#endif

    fs/proc/kcore.c:                                [EI_OSABI] = ELF_OSABI,

    drivers/remoteproc/remoteproc_elf_helpers.h:
hdr->e_ident[EI_OSABI] = ELFOSABI_NONE;

Or perhaps it's set originally somewhere else, but overwritten on
m68k (and a few others)?

    arch/arm/kernel/ptrace.c:       .name = "arm", .e_machine =
ELF_ARCH, .ei_osabi = ELF_OSABI,
    arch/hexagon/kernel/ptrace.c:   .ei_osabi = ELF_OSABI,
    arch/m68k/kernel/ptrace.c:      .ei_osabi = ELF_OSABI,
    arch/mips/kernel/ptrace.c:      .ei_osabi       = ELF_OSABI,
    arch/mips/kernel/ptrace.c:      .ei_osabi       = ELF_OSABI,
    arch/mips/kernel/ptrace.c:      .ei_osabi       = ELF_OSABI,
    arch/nios2/kernel/ptrace.c:     .ei_osabi = ELF_OSABI,

Does this work on other architectures?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
