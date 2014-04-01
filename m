From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 10:23:59 +0200
Message-ID: <CAMuHMdXvN8MYqy81jjHpBDaNcbnS2dyWPWYMwak=9SA=9XPQBg@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
	<CAMuHMdWrg6dwwdY3WsMUqFG8V6s_PWguT6W5wkSPJrkORstvOw@mail.gmail.com>
	<533A6D43.30403@biophys.uni-duesseldorf.de>
	<CAMuHMdX4erc4mAQAOiyL3D-CYoLCembqq_zmcLK7LuUT7hxAcg@mail.gmail.com>
	<533A74FB.606@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:56007 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751156AbaDAIYA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 04:24:00 -0400
Received: by mail-pa0-f50.google.com with SMTP id kq14so9441963pab.23
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 01:23:59 -0700 (PDT)
In-Reply-To: <533A74FB.606@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Tue, Apr 1, 2014 at 10:12 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> While poking around in head.S, I came across a comment that stated the
> second page at the start of the kernel is used for the kernel page dir -
> that is the second page of virtual address space (FastRAM, in the case we
> care about here), not physcial address space, right?

The kernel is loaded in the second page of RAM. Initially, this page just
contains a few branches and the bootinfo versions. The code jumps to
_start, and the second page is reused for the kernel page dir:

ENTRY(_stext)
        bras    1f      /* Jump over bootinfo version numbers */
        .long   BOOTINFOV_MAGIC
        .long   MACH_AMIGA, AMIGA_BOOTI_VERSION
        ....
1:      jra     __start

.equ    kernel_pg_dir,_stext

.equ    .,_stext+PAGESIZE

ENTRY(_start)
        jra     __start
__INIT
ENTRY(__start)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
