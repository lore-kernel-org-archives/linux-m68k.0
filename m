From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Tue, 9 Apr 2013 22:55:43 +0200
Message-ID: <CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:45227 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762739Ab3DIUzo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Apr 2013 16:55:44 -0400
Received: by mail-ie0-f181.google.com with SMTP id 17so9026596iea.26
        for <linux-m68k@vger.kernel.org>; Tue, 09 Apr 2013 13:55:43 -0700 (PDT)
In-Reply-To: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Sat, Apr 6, 2013 at 2:26 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> here's my rewrite of the Atari patch series for upstream submission -
> the only changes are to patches 9 and 12.
>
> The USB patch no longer disables the chip interrupt in the interrupt
> handler - it turns out this wasn't necessary at all. It also does away
> with direct writes to the EtherNAT interrupt control register, and uses
> enable_irq() and disable_irq() instead. The probe code has become a lot
> cleaner as a result.

Thanks, I applied all of them, with some minor changes:
  - Changed one instance of ATARI to ATARI_ETHERNAT in
    drivers/net/ethernet/smsc/Kconfig, for consistency,
  - Split too long comments,
  - Made platform device structures and isp1160_delay() in
    arch/m68k/atari/config.c depend on the appropriate CONFIG_* symbols, else
    you get unused warnings from the compiler if CONFIG_ETHERNAT and/or
    CONFIG_ETHERNEC are not set.

I also updated your old series for the m68k master branch to the
latest corresponding
version for upstream, so master == m68k-queue.

Please send the patches for drivers/net and drivers/usb to the net resp. usb
mailing lists, to collects acks and comments.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
