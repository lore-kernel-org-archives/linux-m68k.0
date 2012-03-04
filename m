From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Single host/multiple hwifs vs. multiple hosts?
Date: Sun, 4 Mar 2012 13:15:12 +0100
Message-ID: <CAMuHMdX1iwCwH+NXF7wP+pTMZzkUiR+DOrjjrVFWmtQUsktC=w__24723.8295888112$1330865081$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-ide@vger.kernel.org
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi all,

I'm wondering what are the differences between adding a single IDE host=
 with
multiple hwifs vs. adding a separate IDE host for each hwif?
Do both ways work?

I'm asking because I want to convert the Amiga Buddha IDE driver to the=
 new
driver model, using Multi Function Devices (many Zorro expansion cards =
contain
multiple devices):
  - A Catweasel expansion card would have:
      * 2 Buddha IDE MFD cells,
      * 1 Catweasel floppy MFD cell.
  - A Buddha expansion card would have:
      * 3 Buddha IDE MFD cells.
  - An X-Surf expansion card would have:
      * 2 Buddha IDE MFD cells,
      * 1 8390 Ethernet cell.
Registering a separate IDE host/hwif for each IDE MFD cell would be eas=
ier to
handle than a single IDE host with multiple IDE hwifs.

Thanks in advance!

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
