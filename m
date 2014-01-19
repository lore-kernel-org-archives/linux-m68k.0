From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] net: smc91x: Remove accidentally introduced casts
Date: Sun, 19 Jan 2014 11:13:17 +0100
Message-ID: <CAMuHMdWBwoHVZaHJEVF9LsZDtJaBL0MnM=_RvkgvGjKC9Ur5+w@mail.gmail.com>
References: <1390126252-14672-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:45493 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751614AbaASKNS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Jan 2014 05:13:18 -0500
Received: by mail-pa0-f54.google.com with SMTP id fa1so5821950pad.41
        for <linux-m68k@vger.kernel.org>; Sun, 19 Jan 2014 02:13:17 -0800 (PST)
In-Reply-To: <1390126252-14672-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

On Sun, Jan 19, 2014 at 11:10 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> arm/lpd270_defconfig:
>
>     drivers/net/ethernet/smsc/smc91x.c: In function 'smc_rcv':
>     drivers/net/ethernet/smsc/smc91x.c:490:3: warning: passing argument 5 of 'smc_pxa_dma_insw' from incompatible pointer type [enabled by default]
>     drivers/net/ethernet/smsc/smc91x.h:423:1: note: expected 'u_char *' but argument is of type 'u16 *'
>
> Introduced by commit afb3df11f1c8925811a1087f2351b0738a3146a2 ("m68k: Atari
> EtherNAT warning fixes").
>
> Remove two casts to fix this:
>   - The first cast was in the !CONFIG_ATARI case, so it didn't matter for
>     us anyway,
>   - The second cast is for a pointer parameter we don't do arithmetic
>     operations on, so it's also not needed.
>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied to master, folded into "m68k/atari: EtherNAT - ethernet support
(smc91x)" on m68k-queue.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
