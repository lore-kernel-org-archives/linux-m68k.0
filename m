From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: SCC - Move Atari serial driver to staging
Date: Mon, 31 Oct 2011 19:58:11 +0100
Message-ID: <CAMuHMdWVchre0g6dE1j_s-+Wc3n17uifQLH6kRfJ9Q2DKfqBLQ@mail.gmail.com>
References: <alpine.DEB.2.00.1103201010001.13805@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103201010001.13805@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Sun, Mar 20, 2011 at 10:11, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Cfr. commit 4c37705877e74c02c968735c2eee0f84914cf557 ("tty: move obso=
lete and
> broken generic_serial drivers to drivers/staging/generic_serial/")

As generic serial is gone too, cfr. commit
bb2a97e9ccd525dd9c3326988e8c676d15d3e12a ("Staging: delete generic_seri=
al
drivers"), I'll remove the atari_scc driver. It has to be resurrected a=
s a new
preferred-type-of-serial-driver-of-the-day driver anyway.

You can still get its core logic from the eternal git history, though.

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
