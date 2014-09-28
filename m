From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] USB: isp116x: Fix EtherNAT if !CONFIG_ATARI_ROM_ISA
Date: Sun, 28 Sep 2014 11:39:14 +0200
Message-ID: <CAMuHMdWNQvB9QfidZBnHZznF-UH3Sgsr79YdhkW_H-W9P5Ni8A@mail.gmail.com>
References: <1410687560-10169-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:46350 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070AbaI1JjQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 28 Sep 2014 05:39:16 -0400
Received: by mail-lb0-f179.google.com with SMTP id 10so15576974lbg.24
        for <linux-m68k@vger.kernel.org>; Sun, 28 Sep 2014 02:39:15 -0700 (PDT)
In-Reply-To: <1410687560-10169-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Sun, Sep 14, 2014 at 11:39 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Commit eece8a651c96a2a3 ("USB: isp116x: isa_rom_*() calls should depend
> on CONFIG_ATARI_ROM_ISA") broke USB on EtherNAT if CONFIG_ATARI_ROM_ISA
> is not set, as USB on EtherNAT requires byte-swapped I/O accessors.
>
> Add a separate #elif section for Atari without ROM port ISA to fix this.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> To be folded into "m68k/atari: USB - add ISP1160 USB host controller
> support"

Applied to master, folded on m68k-queue.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
