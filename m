From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Fwd: [PATCH] m68k/irq - use polled IRQ flag for MFP timer
 cascaded interrupts
Date: Sun, 22 Dec 2013 12:51:05 +0100
Message-ID: <CAMuHMdU_nCwV9yDQdyknWWFTSTX329rKz6MixvcUWYZLwVmwZQ@mail.gmail.com>
References: <1387611538-18305-1-git-send-email-schmitz@debian.org>
	<1387611538-18305-2-git-send-email-schmitz@debian.org>
	<CAMuHMdWirPo7HSsBiLdQDKdMmP4sjKEhcB1hfW0HabhkpQ-Jxg@mail.gmail.com>
	<m238llp255.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47241 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060Ab3LVLvH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Dec 2013 06:51:07 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so4357252pbc.33
        for <linux-m68k@vger.kernel.org>; Sun, 22 Dec 2013 03:51:05 -0800 (PST)
In-Reply-To: <m238llp255.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Dec 22, 2013 at 12:15 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> What does that fix?

This uses the infrastructure support in commit
b39898cd4077f4b6ec706e717c938751c34e1dc4 ("genirq: Prevent
spurious detection for unconditionally polled interrupts"), which replaces

    m68k/irq: Add handle_polled_irq() for timer based soft interrupts

in our tree.

This is to be folded into

    m68k/atari: use polled interrupt handler for timer D interrupts
    m68k/atari: use dedicated irq_chip for timer D interrupts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
