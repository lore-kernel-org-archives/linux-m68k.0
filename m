From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][M68K] implement futex.h to support userspace robust
 futexes and PI mutexes
Date: Fri, 17 May 2013 11:02:22 +0200
Message-ID: <CAMuHMdVnTz=zq2qP+vgiCQpOze_VttwrogynNy+QcdRAdfz8ag@mail.gmail.com>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<87y5bem1wf.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:63229 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273Ab3EQJCW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 May 2013 05:02:22 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx1so3350382pab.41
        for <linux-m68k@vger.kernel.org>; Fri, 17 May 2013 02:02:22 -0700 (PDT)
In-Reply-To: <87y5bem1wf.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Mikael Pettersson <mikpe@it.uu.se>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas, Mikael,

On Fri, May 17, 2013 at 10:44 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Geert, please push this to 3.10.

Thanks for bringing this under my radar. I completely forgot about this patch,
sorry about that.

This also needs removal of "generic-y += futex.h" from
arch/m68k/include/asm/Kbuild. I'll add that.

Andreas: Can I add your acked-by?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
