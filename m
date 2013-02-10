From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 12/17] [m68k] Atari: remove unnecessary cruft from Atari
 interrupt setup
Date: Sun, 10 Feb 2013 17:03:48 +0100
Message-ID: <CAMuHMdUf6NrQYr=QbdJJ+Oy_xoPyh7oeQYF7em5ga+aSC+Tf4Q@mail.gmail.com>
References: <20130131002846.CA263360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f170.google.com ([209.85.210.170]:63029 "EHLO
	mail-ia0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754799Ab3BJQDt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 11:03:49 -0500
Received: by mail-ia0-f170.google.com with SMTP id k20so5782210iak.1
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 08:03:48 -0800 (PST)
In-Reply-To: <20130131002846.CA263360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:28 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Remove unneccesary calls to m68k_setup_irq_controller() and m68k_irq_startup_irq() from the
> Atari interrupt setup.

To be folded into [PATCH 10/17] [m68k] Atari: use dedicated irq_chip
for timer D interrupts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
