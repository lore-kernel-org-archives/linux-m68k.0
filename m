From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] tty: Mark generic_serial users as BROKEN
Date: Tue, 3 Nov 2009 10:01:42 +0100
Message-ID: <10f740e80911030101ka895b11ie3e02a39762f5e97__7858.70777112922$1257239325$gmane$org@mail.gmail.com>
References: <20091030220949.GD11297@kroah.com>
	 <1256940813-11610-1-git-send-email-gregkh@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1256940813-11610-1-git-send-email-gregkh@suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, stable <stable@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Fri, Oct 30, 2009 at 23:13, Greg Kroah-Hartman <gregkh@suse.de> wrot=
e:
> From: Alan Cox <alan@linux.intel.com>
>
> There isn't much else I can do with these. I can find no hardware for=
 any
> of them and no users. The code is broken.

Can you please also mention in the changelog what exactly is broken?

BTW, in response to your patch I received (private) email from people
who actually
have m68k MVME boards in active use. So marking it broken may be
called a regression...

Thanks!

> Signed-off-by: Alan Cox <alan@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> ---
> =C2=A0arch/m68k/Kconfig =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---
> =C2=A0drivers/char/Kconfig | =C2=A0 =C2=A06 +++---
> =C2=A02 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 29dd848..ecdc19a 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -561,7 +561,7 @@ config HPAPCI
>
> =C2=A0config MVME147_SCC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SCC support for MVME147 serial ports=
"
> - =C2=A0 =C2=A0 =C2=A0 depends on MVME147
> + =C2=A0 =C2=A0 =C2=A0 depends on MVME147 && BROKEN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is the driver for the serial p=
orts on the Motorola MVME147
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boards. =C2=A0Everyone using one of=
 these boards should say Y here.
> @@ -576,14 +576,14 @@ config SERIAL167
>
> =C2=A0config MVME162_SCC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SCC support for MVME162 serial ports=
"
> - =C2=A0 =C2=A0 =C2=A0 depends on MVME16x
> + =C2=A0 =C2=A0 =C2=A0 depends on MVME16x && BROKEN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is the driver for the serial p=
orts on the Motorola MVME162 and
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0172 boards. =C2=A0Everyone using on=
e of these boards should say Y here.
>
> =C2=A0config BVME6000_SCC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SCC support for BVME6000 serial port=
s"
> - =C2=A0 =C2=A0 =C2=A0 depends on BVME6000
> + =C2=A0 =C2=A0 =C2=A0 depends on BVME6000 && BROKEN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is the driver for the serial p=
orts on the BVME4000 and BVME6000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boards from BVM Ltd. =C2=A0Everyone=
 using one of these boards should say
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 08a6f50..6aad99e 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -323,7 +323,7 @@ config SPECIALIX
>
> =C2=A0config SX
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Specialix SX (and SI) card suppo=
rt"
> - =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD && (PCI || EISA =
|| ISA)
> + =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD && (PCI || EISA =
|| ISA) && BROKEN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is a driver for the SX and SI =
multiport serial cards.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Please read the file <file:Document=
ation/serial/sx.txt> for details.
> @@ -334,7 +334,7 @@ config SX
>
> =C2=A0config RIO
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Specialix RIO system support"
> - =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD
> + =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD && BROKEN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is a driver for the Specialix =
RIO, a smart serial card which
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drives an outboard box that can sup=
port up to 128 ports. =C2=A0Product
> @@ -395,7 +395,7 @@ config NOZOMI
>
> =C2=A0config A2232
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Commodore A2232 serial support (=
EXPERIMENTAL)"
> - =C2=A0 =C2=A0 =C2=A0 depends on EXPERIMENTAL && ZORRO && BROKEN_ON_=
SMP
> + =C2=A0 =C2=A0 =C2=A0 depends on EXPERIMENTAL && ZORRO && BROKEN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0---help---
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option supports the 2232 7-por=
t serial card shipped with the
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Amiga 2000 and other Zorro-bus mach=
ines, dating from 1989. =C2=A0At

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
