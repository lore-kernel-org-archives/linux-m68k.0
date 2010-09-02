From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 0/5] tty: move stuff around
Date: Thu, 2 Sep 2010 22:12:26 +0200
Message-ID: <AANLkTinUjfWqEdOQoomR=TZnQEsiGj1wxvbv5c_MtZKp@mail.gmail.com>
References: <1283115995-4734-1-git-send-email-arnd@arndb.de>
	<201008302333.22447.arnd@arndb.de>
	<20100830232800.3cb768fc@lxorguk.ukuu.org.uk>
	<201008311126.45190.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201008311126.45190.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Greg KH <gregkh@suse.de>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>, Roger Wolff <R.E.Wolff@bitwizard.nl>, "Michael H. Warfield" <mhw@wittsend.com>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Aug 31, 2010 at 11:26, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 31 August 2010, Alan Cox wrote:
>> > drivers/char/tty_* =C2=A0 =C2=A0 =C2=A0-> tty/*
>> > drivers/char/{vt stuff} -> tty/vt/
>> > drivers/char/hvc_* =C2=A0 =C2=A0 =C2=A0-> drivers/tty/hvc/hvc_*
>> > drivers/serial/* =C2=A0 =C2=A0 =C2=A0 =C2=A0-> drivers/tty/serial/=
*
>>
>> There are dead bits in there too we should prune 68xxx stuff mostly
>
> Geert, can you comment on the 68k serial drivers? Which
> ones are to stay, which ones can get phased out?

I don't know much about which drivers are still in active use. People
don't really
tell me ;-)

=46WIW, if I use my Amiga's serial port, it's just for a serial console=
, in case
all else fails (last time I needed that was several years ago).

We have 3 "classes" of serial drivers:

  - generic_serial-based:

      o MVME147_SCC
      o MVME162_SCC
      o BVME6000_SCC
      o A2232

    All of these were marked BROKEN lately due to generic_serial,
while there's even a
    new ATARI_SCC under "active" development...

  - plain drivers/char:

      o SERIAL167
      o AMIGA_BUILTIN_SERIAL

  - drivers/serial:

      o SERIAL_PMACZILOG (Mac)

    Sun 3/3x support might be (re)added to SERIAL_SUNZILOG

On Mon, Aug 30, 2010 at 15:00, Alan Cox <alan@lxorguk.ukuu.org.uk> wrot=
e:
> Please don't convert stuff to serial_core - it's got some horrible
> problems with adapting to the new locking model, its buffering model
> pre-dates kfifo and all in all serial_core needs a rewrite not more u=
sers.

=46unny... so "fortunately" we never found time to move the m68k serial=
 drivers
to driver/serial/? Long live procrastination ;-)

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
