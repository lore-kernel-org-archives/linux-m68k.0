From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k: Update defconfigs
Date: Thu, 5 Jan 2012 10:52:26 +0100
Message-ID: <CAMuHMdVN470=RBQMHZ9PQ_rNCVbS4gD0+5P654YdxrBR3aqotA@mail.gmail.com>
References: <alpine.DEB.2.00.1201042252450.15625@ayla.of.borg>
	<Pine.BSM.4.64L.1201042220180.16408@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:49301 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115Ab2AEJw1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 04:52:27 -0500
Received: by wibhm6 with SMTP id hm6so207839wib.19
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jan 2012 01:52:26 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1201042220180.16408@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>, Finn Thain <fthain@telegraphics.com.au>, Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

On Wed, Jan 4, 2012 at 23:22, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>> =C2=A0 =C2=A0CONFIG_SERIAL_CONSOLE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: y . . . . . . . . . . y
>
> This is something I'd like to see, if it is possible from
> the hardware: ARAnym=E2=80=99s emulated parallel port for debugging
> is unidirectional (printing only), so, in headless mode,
> you get no console at all (for logging in to fix the network,
> see that it hangs in fsck, etc).

I think ARAnyM's emulated serial port can do this, but we no longer hav=
e
an Atari SCC driver.

=46inn, Michael: as pmaczilog uses platform devices, it can be made to =
work
on Atari, too?

> Do the other devices not have a serial port?

We lost all serial drivers during the last few years, except for
amiserial (which
we may loose in the future, too, as it does things the serial core peop=
le
don't like / consider unsafe).

See e.g.
  - 51c9d654c2def97827395a7fbfd0c6f865c26544
    ("Staging: delete tty drivers")
  - 4a6514e6d096716fb7bedf238efaaca877e2a7e8
    ("tty: move obsolete and broken tty drivers to drivers/staging/tty/=
)
  - bb2a97e9ccd525dd9c3326988e8c676d15d3e12a
    ("Staging: delete generic_serial drivers")

We only regained pmaczilog for mac.

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
