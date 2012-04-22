From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k: correct the Atari ALLOWINT definition
Date: Sun, 22 Apr 2012 10:33:09 +0200
Message-ID: <CAMuHMdWgDL0NqxzobaofXiY0u985zfd6ki12v0VqVNSrysuw-A@mail.gmail.com>
References: <20367.17904.199202.88993@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40651 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798Ab2DVIdK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Apr 2012 04:33:10 -0400
Received: by iadi9 with SMTP id i9so644958iad.19
        for <linux-m68k@vger.kernel.org>; Sun, 22 Apr 2012 01:33:09 -0700 (PDT)
In-Reply-To: <20367.17904.199202.88993@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-m68k@vger.kernel.org

On Thu, Apr 19, 2012 at 00:53, Mikael Pettersson <mikpe@it.uu.se> wrote=
:
> Booting a 3.2, 3.3, or 3.4-rc4 kernel on an Atari using the
> `nfeth' ethernet device triggers a WARN_ONCE() in generic irq
> handling code on the first irq for that device:
>
> WARNING: at kernel/irq/handle.c:146 handle_irq_event_percpu+0x134/0x1=
42()
> irq 3 handler nfeth_interrupt+0x0/0x194 enabled interrupts

Many thanks for fixing this!

I will apply and queue for 3.5, with Michael's Tested-by.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
