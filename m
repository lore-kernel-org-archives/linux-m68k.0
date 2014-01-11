From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded interrupts
Date: Sat, 11 Jan 2014 11:39:49 +0100
Message-ID: <CAMuHMdWOcXTZ05pp4V+G5dUnoo5ihv_ZFKoh2AZ=yi30yqXWKA@mail.gmail.com>
References: <1389402091-20815-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:40311 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751100AbaAKKju (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Jan 2014 05:39:50 -0500
Received: by mail-pa0-f42.google.com with SMTP id lj1so5835447pab.1
        for <linux-m68k@vger.kernel.org>; Sat, 11 Jan 2014 02:39:50 -0800 (PST)
In-Reply-To: <1389402091-20815-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Michael Schmitz <schmitz@debian.org>

On Sat, Jan 11, 2014 at 2:01 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Some Atari hardware has no capacity to raise interrupts (e.g.
> network or USB adapter hardware attached via ROM port). The driver
> interrupt routine is called from a timer interrupt (timer D) in
> these cases, using chained device specific pseudo interrupts
> (IRQ_MFP_TIMER1 ff.)
>
> These interrupts will more often than not, return IRQ_NONE as
> there is not always work for the device handler when called.
> Too many unhandled interrupts will result in the interrupt
> being disabled by the stuck interrupt watchdog.
>
> As preferred option to flag interrupts as needing exclusion
> from the watchdog mechanism, tglx added the IRQ_IS_POLLED flag
> for use in such a case. Currently, two interrupts need to use
> this flag. Add more users as needed.
>
> This patch obsoletes the introduction of handle_polled_irq()
> in the m68k tree.
>
> Signed-off-By: Michael Schmitz <schmitz@debian.org>

Thanks, will apply and queue for 3.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
