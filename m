From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 14:41:13 +0200
Message-ID: <CAMuHMdW2e=9fPV921+9pny=jfcC_goMiPxnk9_NmowSpnVB2XA@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
	<87txae2dt4.fsf@igel.home>
	<20140331235216.GA2109@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
	<alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:62937 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751564AbaDAMlO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 08:41:14 -0400
Received: by mail-pd0-f170.google.com with SMTP id v10so9549383pde.29
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 05:41:13 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Finn,

On Tue, Apr 1, 2014 at 2:23 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> but I have some memories of interleaved banks and such...
>
> There are some Mac models with memory controllers that do interleaving. I
> don't know whether interleaving is relevant here.

I meant that if you have e.g. 16 MiB of RAM, but it's split in 4
chunks of 4 MiB,
you don't have 8 MiB in the first chunk.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
