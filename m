From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Driver framework: binding a driver to two devices?
Date: Sun, 14 Aug 2011 21:32:01 +0200
Message-ID: <CAMuHMdUdJvqm+U7EY-p+vmkKyBd7urcRYEfV_6BWU8zqo+b_tA@mail.gmail.com>
References: <CAMuHMdVr9iAyqQJUgHq4gcLg+gp7GxF=sH+SBKBuqVWYymXs8Q@mail.gmail.com>
	<20110814173816.GA10062@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:64461 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754770Ab1HNTcD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Aug 2011 15:32:03 -0400
In-Reply-To: <20110814173816.GA10062@kroah.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Aug 14, 2011 at 19:38, Greg KH <greg@kroah.com> wrote:
> On Sat, Aug 13, 2011 at 10:44:42PM +0200, Geert Uytterhoeven wrote:
>> As Amiga Zorro expansion boards have only one BAR (unlike PCI, which=
 has
>> multiple BARs), several Amiga graphics cards show up as two Zorro de=
vices:
>> one for the graphics memory and one for the graphics controller's re=
gisters.
>>
>> Traditionally, a driver for such a device used
>>
>> =C2=A0 =C2=A0 dev1 =3D zorro_find_device(id1, ...)
>> =C2=A0 =C2=A0 dev2 =3D zorro_find_device(id2, ...)
>>
>> to find the two devices and match them.
>>
>> With the "new" driver framework, the matching with device id1 is now
>> done using a
>> struct zorro_driver with a table of IDs, while the matching with dev=
ice id2 is
>> still done by calling zorro_find_device(id2, ...).
>>
>> Recently (with cirrusfb) it turned out that the call to
>> zorro_find_device(id2, ...)
>> may fail to find the second device. I suspect this happens due to th=
e second
>> device haven't been probed for at the time the zorro_driver for the
>> first device is
>> initialized.
>>
>> I expect this can be fixed by delaying all calls to device_register(=
) in
>> amiga_zorro_probe() until all devices have been detected and added t=
o the array
>> used by zorro_find_device(). But I was wondering whether there's a m=
ore generic
>> way in the driver framework to bind a driver to two devices?
>
> What you really want is the same "driver instance" bound to two devic=
es,
> right? =C2=A0That way the device would operate "knowing" about both p=
hysical
> devices so as to properly control the thing.

Yes, that's what I want.

> Right now, no, there's not a simple way to do this with the driver
> model. =C2=A0USB does this on its own for some devices that need to h=
ave
> multiple "interfaces" (the USB equalivant for a "device") controlled =
at
> the same time, so you might want to look at how that happens (in the
> indivdual drivers, not in the USB core.)

Thanks, I'll have a look at the USB drivers.
Do you know which examples to look at?

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
