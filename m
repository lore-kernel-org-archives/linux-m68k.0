From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: linux-m68k.git is back
Date: Thu, 13 Oct 2011 09:22:13 +0200
Message-ID: <CAMuHMdV4BEVPKBG7=-vvZ9fjEsaFjq+8Aw11XstqxpSfR8_1NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi all,

linux-m68k.git is back, in the usual place:

http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git

Interesting branches:
  - master: main development, containing accepted changesets,
  - m68k-queue: (almost) identical to master, but nice changesets
rebased on top of
    the latest v* tag (incl. release candidates) from Linus (I don't
follow stable),
  - for-linus: What I will ask Linus to pull in this merge window,
  - for-next: What's destined for the next merge window,
  - for-*: What's destined for a specific merge window. The latest over=
lap with
    for-linus/for-next,
  - m68k-v*: State of m68k-queue when v* was current.

master and m68k-v* are never rebased. m68k-queue and for-* are rebased =
when a
new v* comes out.

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
