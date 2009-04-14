From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Tue, 14 Apr 2009 10:39:41 +0200
Message-ID: <1239698381.2049.25.camel__34845.050404738$1239698513$gmane$org@petr>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
	 <1239696787.2049.8.camel@petr>
	 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Michael Schmitz p=ED=B9e v =DAt 14. 04. 2009 v 10:26 +0200:
> > > At the very least, the default should be changed to atari=3Doff o=
n modern systems=20
> > > like the CT60:
> >=20
> > Why? How is the CPU accelerator related to disk filesystem?
>=20
> Only in so far as no one would want to use 16 or 32 MB partitions the=
se days.=20

Well, many years ago it used to be suggested to create a smallish boot
partition and then larger data/application partition(s). I think the
reason for this was that some of the early Atari disk drivers used to
loose the first partition's contents occasionally.=20

Anyway, the point is that even these days you can encounter a small
partitions on Atari.

BTW, does it mean that there is a problem with mounting small GEMDOS
partitions in Linux (<32 MB?)? And at the same time you can't mount
larger partitions because of the logical sector size limit (>511 MB)?

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
