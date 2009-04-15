From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Wed, 15 Apr 2009 07:56:06 +0200
Message-ID: <1239774966.20245.4.camel@petr>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
	 <1239696787.2049.8.camel@petr>
	 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
	 <1239698381.2049.25.camel@petr>
	 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Michael Schmitz p=ED=B9e v St 15. 04. 2009 v 03:25 +0200:
> > BTW, does it mean that there is a problem with mounting small GEMDO=
S
> > partitions in Linux (<32 MB?)? And at the same time you can't mount
> > larger partitions because of the logical sector size limit (>511 MB=
)?
>=20
> Small partitions I can mount as regular MSDOS FAT (-o atari=3Dno) onl=
y, unless=20
> they are <32 MB (in which case it's a 16 bit FAT with few enough clus=
ters to be=20
> treated as 16 bit FAT by the Atari FAT patch).

I don't think I understand it.

What if I created a disk image with 15, 31, 63, 127, 255 and 511 MB
partitions and sent it to you? Would you please list what partition
sizes are mountable with _and_ without the Atari FAT patch that we are
discussing here? That could finally clear it up (for me at least).

> What disk driver did you create these partitions with?

HDDRIVER, so it should be fully AHDI compatible.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
