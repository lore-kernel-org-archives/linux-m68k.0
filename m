From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Thu, 16 Apr 2009 08:07:55 +0200
Message-ID: <1239862075.12777.14.camel@petr>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
	 <1239696787.2049.8.camel@petr>
	 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
	 <1239698381.2049.25.camel@petr>
	 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
	 <1239774966.20245.4.camel@petr>
	 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Michael Schmitz p=ED=B9e v =C8t 16. 04. 2009 v 01:38 +0200:
> > What if I created a disk image with 15, 31, 63, 127, 255 and 511 MB
> > partitions and sent it to you? Would you please list what partition
> > sizes are mountable with _and_ without the Atari FAT patch that we =
are
> > discussing here? That could finally clear it up (for me at least).
>=20
> I'm happy to do that. Can you please specify what parameters (logical=
 sector=20
> size, number of sectors per cluster) the partitions were generated wi=
th?

Atari GEMDOS and Atari partition programs always use 2 sectors per
cluster. Since FAT16 can hold max 32k entries you can compute the rest
of information from this (example: 63 MB partition needs 2 kB clusters
to fit into 32k cluster limit so the logical sector size for 32-63 MB
partition needs to be 1 kB).

> Yup - did AHDI use particular values for logical sector size and sect=
ors per=20
> cluster that we'd need to make sure will still work?=20

See above - 2 logical sectors in a cluster. That is actually the only
difference from MS-DOS where they stick with fixed logical sector size
and are adding more sectors to a cluster, IIRC.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
