From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Avoid soft-lockup warning after mach_power_off
Date: Mon, 21 Aug 2017 11:58:35 +0200
Message-ID: <CAMuHMdXVA=6+__K45wppJQdPbiYM73eX7H8K30imF6mg2f-FrA@mail.gmail.com>
References: <alpine.LNX.2.00.1708121021120.1762@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33579 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751894AbdHUJ6g (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2017 05:58:36 -0400
Received: by mail-pg0-f68.google.com with SMTP id n4so8206998pgn.0
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2017 02:58:36 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1708121021120.1762@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Aug 12, 2017 at 9:12 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Disable interrupts for power-off, like other platforms do. This prevents
> meaningless warnings from the soft-lockup detector on models with a power
> supply unit not under software control.
>
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thank you, applied and queued for v4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
