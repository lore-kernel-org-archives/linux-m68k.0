From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: switch to using asm-generic/hardirq.h
Date: Sun, 19 Sep 2010 18:32:08 +0200
Message-ID: <AANLkTimx=kV5x2M3R34eUwTjAJU-F+PceZfvrhAJLQtx@mail.gmail.com>
References: <201009070500.o8750l71006902@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:34101 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934Ab0ISQcJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Sep 2010 12:32:09 -0400
Received: by iwn5 with SMTP id 5so3535846iwn.19
        for <linux-m68k@vger.kernel.org>; Sun, 19 Sep 2010 09:32:09 -0700 (PDT)
In-Reply-To: <201009070500.o8750l71006902@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Tue, Sep 7, 2010 at 07:00, Greg Ungerer <gerg@snapgear.com> wrote:
>
> Hi All,
>
> Is there any reason that the m68k arch cannot use the generic
> hardirq.h support?
>
> It looks to be the same, unless I am missing something.

Unfortunately it's not that simple: the m68k core doesn't use the
generic hardirq
code yet. Fixing header files it not enough.

> If it can then it is simple to merge the non-mmu and mmu
> versions of hardirq.h.

yeah, one more reason to migrate to generic hardirqs...

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
