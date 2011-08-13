From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Driver framework: binding a driver to two devices?
Date: Sat, 13 Aug 2011 22:44:42 +0200
Message-ID: <CAMuHMdVr9iAyqQJUgHq4gcLg+gp7GxF=sH+SBKBuqVWYymXs8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

As Amiga Zorro expansion boards have only one BAR (unlike PCI, which ha=
s
multiple BARs), several Amiga graphics cards show up as two Zorro devic=
es:
one for the graphics memory and one for the graphics controller's regis=
ters.

Traditionally, a driver for such a device used

    dev1 =3D zorro_find_device(id1, ...)
    dev2 =3D zorro_find_device(id2, ...)

to find the two devices and match them.

With the "new" driver framework, the matching with device id1 is now
done using a
struct zorro_driver with a table of IDs, while the matching with device=
 id2 is
still done by calling zorro_find_device(id2, ...).

Recently (with cirrusfb) it turned out that the call to
zorro_find_device(id2, ...)
may fail to find the second device. I suspect this happens due to the s=
econd
device haven't been probed for at the time the zorro_driver for the
first device is
initialized.

I expect this can be fixed by delaying all calls to device_register() i=
n
amiga_zorro_probe() until all devices have been detected and added to t=
he array
used by zorro_find_device(). But I was wondering whether there's a more=
 generic
way in the driver framework to bind a driver to two devices?

Are there any PCI devices that show similar behavior?
I know some PCI drivers look up data in DMI tables, but that's not
really the same.

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
