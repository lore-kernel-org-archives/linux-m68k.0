From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-m68k.git
Date: Wed, 19 Nov 2008 20:28:59 +1100
Message-ID: <20081119202859.783a97d5.sfr@canb.auug.org.au>
References: <Pine.LNX.4.64.0811182136060.27671@anakin>
	<20081119081951.a1a33403.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0811190942490.27671@anakin>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_20_28_59_+1100_/VGpR_lDW6d8uwZQ"
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0811190942490.27671@anakin>
Sender: linux-next-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, David Woodhouse <dwmw2@infradead.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

--Signature=_Wed__19_Nov_2008_20_28_59_+1100_/VGpR_lDW6d8uwZQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, 19 Nov 2008 09:44:03 +0100 (CET) Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
>
> What's the purpose of your m68k-current tree? There should not be anything
> in m68k#for-linus that's not in m68k#for-next.

I have a set of trees (15 so far) that are just patches pending for the
current release (mostly bug fixes).  These trees are usually empty (since
things get sent to Linus fairly quickly during the -rc's) but it means
that between the time between when the fixes are ready and when Linus
integrates them, people testing linux-next don't have to worry about bugs
that already have fixes.

Having them in a (logically) separate tree, as far as linux-next is
concerned, means that if I have to drop your -next tree for any reason
then the bug fixes can stay.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_20_28_59_+1100_/VGpR_lDW6d8uwZQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkj3FsACgkQjjKRsyhoI8xLJACgp5eS/t4DrMiS+zWSoSeEtI/X
oHoAniE/gO80CkijpMEjQ5cCXrMrfm7r
=Axp3
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_20_28_59_+1100_/VGpR_lDW6d8uwZQ--
