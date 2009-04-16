From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Thu, 16 Apr 2009 10:01:43 +0200
Message-ID: <1239868903.12777.25.camel@petr>
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
	 <1239862075.12777.14.camel@petr>
	 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Michael Schmitz p=ED=B9e v =C8t 16. 04. 2009 v 09:45 +0200:
> There's something wrong with the Atari FAT option code then - this is=
 what I get=20
> with atari=3Dyes on the first of your partitions (128MB?):

255 MB, IIRC (same sector/cluster size as 128 MB)

> FAT (before atari): FAT bits 0 clusters 32622 sectors 65280=20
> FAT (option atari): FAT bits 12 clusters 32622 sectors 65280=20
> FAT (after atari): FAT bits 12 clusters 32622 sectors 65280=20
>=20
> The GEMDOS option code picks a 12 bit FAT even though it should clear=
ly fit into=20
> a 16 bit FAT.=20

I don't know what you mean by "before/after atari" but it's clearly all
wrong. FAT12 is on floppies only... Besides that how could 32622 value
fit into 12 bit number?

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
