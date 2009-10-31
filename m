From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH 1/1] tty: Mark generic_serial users as BROKEN
Date: Sat, 31 Oct 2009 14:38:38 +0100
Message-ID: <10f740e80910310638l33d387f1hd4758a9af0657fcf@mail.gmail.com>
References: <20091030220949.GD11297@kroah.com>
	 <1256940813-11610-1-git-send-email-gregkh@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:58802 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757768AbZJaNie convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Oct 2009 09:38:34 -0400
In-Reply-To: <1256940813-11610-1-git-send-email-gregkh@suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org

---------- Forwarded message ----------
=46rom: Greg Kroah-Hartman <gregkh@suse.de>
Date: Fri, Oct 30, 2009 at 23:13
Subject: [PATCH 1/1] tty: Mark generic_serial users as BROKEN
To: linux-kernel@vger.kernel.org
Cc: Alan Cox <alan@linux.intel.com>, stable <stable@kernel.org>, Greg
Kroah-Hartman <gregkh@suse.de>


=46rom: Alan Cox <alan@linux.intel.com>

There isn't much else I can do with these. I can find no hardware for a=
ny
of them and no users. The code is broken.

Signed-off-by: Alan Cox <alan@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
=C2=A0arch/m68k/Kconfig =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---
=C2=A0drivers/char/Kconfig | =C2=A0 =C2=A06 +++---
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 29dd848..ecdc19a 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -561,7 +561,7 @@ config HPAPCI

=C2=A0config MVME147_SCC
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SCC support for MVME147 serial ports"
- =C2=A0 =C2=A0 =C2=A0 depends on MVME147
+ =C2=A0 =C2=A0 =C2=A0 depends on MVME147 && BROKEN
=C2=A0 =C2=A0 =C2=A0 =C2=A0help
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is the driver for the serial por=
ts on the Motorola MVME147
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boards. =C2=A0Everyone using one of t=
hese boards should say Y here.
@@ -576,14 +576,14 @@ config SERIAL167

=C2=A0config MVME162_SCC
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SCC support for MVME162 serial ports"
- =C2=A0 =C2=A0 =C2=A0 depends on MVME16x
+ =C2=A0 =C2=A0 =C2=A0 depends on MVME16x && BROKEN
=C2=A0 =C2=A0 =C2=A0 =C2=A0help
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is the driver for the serial por=
ts on the Motorola MVME162 and
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0172 boards. =C2=A0Everyone using one =
of these boards should say Y here.

=C2=A0config BVME6000_SCC
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SCC support for BVME6000 serial ports"
- =C2=A0 =C2=A0 =C2=A0 depends on BVME6000
+ =C2=A0 =C2=A0 =C2=A0 depends on BVME6000 && BROKEN
=C2=A0 =C2=A0 =C2=A0 =C2=A0help
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is the driver for the serial por=
ts on the BVME4000 and BVME6000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boards from BVM Ltd. =C2=A0Everyone u=
sing one of these boards should say
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 08a6f50..6aad99e 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -323,7 +323,7 @@ config SPECIALIX

=C2=A0config SX
=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Specialix SX (and SI) card support=
"
- =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD && (PCI || EISA ||=
 ISA)
+ =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD && (PCI || EISA ||=
 ISA) && BROKEN
=C2=A0 =C2=A0 =C2=A0 =C2=A0help
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is a driver for the SX and SI mu=
ltiport serial cards.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Please read the file <file:Documentat=
ion/serial/sx.txt> for details.
@@ -334,7 +334,7 @@ config SX

=C2=A0config RIO
=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Specialix RIO system support"
- =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD
+ =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_NONSTANDARD && BROKEN
=C2=A0 =C2=A0 =C2=A0 =C2=A0help
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is a driver for the Specialix RI=
O, a smart serial card which
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drives an outboard box that can suppo=
rt up to 128 ports. =C2=A0Product
@@ -395,7 +395,7 @@ config NOZOMI

=C2=A0config A2232
=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Commodore A2232 serial support (EX=
PERIMENTAL)"
- =C2=A0 =C2=A0 =C2=A0 depends on EXPERIMENTAL && ZORRO && BROKEN_ON_SM=
P
+ =C2=A0 =C2=A0 =C2=A0 depends on EXPERIMENTAL && ZORRO && BROKEN
=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option supports the 2232 7-port =
serial card shipped with the
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Amiga 2000 and other Zorro-bus machin=
es, dating from 1989. =C2=A0At
--
1.6.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.html
Please read the FAQ at =C2=A0http://www.tux.org/lkml/



--=20
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
