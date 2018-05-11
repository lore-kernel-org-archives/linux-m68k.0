From: Richard Z <rz@linux-m68k.org>
Subject: Re: [parted-devel] Atari label false positives
Date: Fri, 11 May 2018 20:30:55 +0200
Message-ID: <20180511183054.GB4225@rz.localhost.localdomain>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
 <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
 <461cde4a-4cc2-8dce-538d-2c2af21e5ba3@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: "Richard Z." <rdzidlic@gmail.com>
Content-Disposition: inline
In-Reply-To: <461cde4a-4cc2-8dce-538d-2c2af21e5ba3@physik.fu-berlin.de>
Resent-Message-ID: <OCTGseHja0P.A.-RD.AGe9aB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180511183054.GB4225@rz.localhost.localdomain
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Phillip Susi <psusi@ubuntu.com>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Parted development <parted-devel@lists.alioth.debian.org>
List-Id: linux-m68k@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 06:10:37PM +0200, John Paul Adrian Glaubitz wrote:

> According to the documentation, p.43 [1], I think offset $01 should always
> contain either "GEM", "BGM" or "XGM". They don't seem to be optional.

The Atari partitioning tables are also used on the Q40/Q60 which breaks
many some assumptions.. no GEM here but instead one of two Q40 specific
types such as "QWA" or "QBD" in the first slot.
BTW I have never seen a low-case or camel-case string in this place,
this should be also used.

> I guess adding those to atari_probe() should help improve the detection
> quite a bit. But I would have to test that first.

It would, however I am not sure what happens if a hard disk is=20
repurposed from Atari to PC or the other way around partitioning.
There may be some strings or other data left which could be=20
misinterpreted.

> >I think I will at least move atari to be probed after all other labels
> >have failed.

in principle both should be probed, prompting user action if both
find something. They could also return a "score" - based on number of=20
partitions recognised, their sizes and other info to give a hint which=20
one is likely a non-random hit.


Richard

--=20
Name and OpenPGP keys available from pgp key servers


--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWvXhXqs1ukX5mVu3AQJ+8BAAr5/cKo53lUWEnLtYdrcmGhCLzBpjBkCl
TDs4w0ARwF6IhyjUadca+ZSxKa+AJCGFPEPXhuCDaCZO15JEF2j4gChnry0mlAgG
t/GQ7nouJU2Cvi+R5yiOTXMb4b7EzObMYQQhZ+06jrSehNxprRD2DylMUk5bVXev
Fk6CNGygU6hrgCMsOeJTpMRoGWIq01SCTgMml0bUFanr+1wywZGGwFImPo05X0GL
0BLoDvzLLi2ZAlT1k795VzQxrnfMi0biNJ9MlujURYQASCupGHXpBm+xk17/qyNH
dAr25pOHn+3V0JTET93YjdczmFo277YxdpspB/Tleal/E1TQpjh/ureEYIZD3boa
FwZF5pFrbgHBFuf1rRe5sTWgEPtjmM95ja/Wnm8DYE9xkPDBmWGBPCReloZ03UJ4
83LSysORTJdoWqd1ZKOXjfQlYl6WT4CwUBuoytkxLCrgHE9FBGzOZcPZzqdjl9QH
NedCpLm4IE0Hu8+z0kkriOr/ik95bi3AH87Wfn6vhJHuYU0TvmHyA/2WbhYvJY1D
J3ej90afH4n2p0AYCT1znuvvGAGvG8tIKhuJejFV2Q7jaq5U5BmFeMC1K+/G9LKW
Lq4Xna3CE+sFUOP67navW9OdgL8ckPJz3e6oXis/WP9JfsLeH2ZWDpy/SfetBNjc
cOjz1c0ZJaM=
=LINc
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
