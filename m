From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: any affs image
Date: Tue, 05 Jun 2012 10:14:37 +0300
Message-ID: <1338880477.2507.19.camel@sauron.fi.intel.com>
References: <1338815624.2507.15.camel@sauron.fi.intel.com>
	 <CAMuHMdVi7qxd+=XSEMz7=nKEng-2v1q479h4_nzG8faJVKqozQ@mail.gmail.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-dOUOTo2DAoM38ChqEYWx"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVi7qxd+=XSEMz7=nKEng-2v1q479h4_nzG8faJVKqozQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org


--=-dOUOTo2DAoM38ChqEYWx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-04 at 21:21 +0200, Geert Uytterhoeven wrote:
> Hi Artem,
>=20
> > do you happen to have an affs disk image, by any chance? I need to make
> > few changes in the affs file-system in the linux kernel but and I would
> > like to test them. But unfortunately, I was not able to find any workin=
g
> > way of formatting my dist to affs.
>=20
> http://www.xs4all.nl/~zippel/affstools-0.1a.tar.gz contains an mkaffs too=
l.
>=20
> Hope this helps...

Hi, thanks, I tried it and it worked neither for files nor for block
device nodes, I do not know why. But I've found a different mkfs.affs
which actually works. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-dOUOTo2DAoM38ChqEYWx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzbHdAAoJECmIfjd9wqK0JQoQAJK9OX3RPzyHuuDSB2bx4P1f
JFOfQOzUKlgLEEz89SJmavvQrA1ofOGsVhuqPi6RnB0Myb7AHpIkTI1ZCJ0Rp+7r
NIQCA9hAfm0qe/O+nbx66i3KPnCQ3Q/AFoCpJz/fwhwI8DilKtDy0pps+KlN0f47
tF4x/n2AemQluW7ihjkyula78XV3lacmGETDaBgipbqq/jyefhoXgMQ5APich+sJ
GOI7Nl5P27qiJIlJ6YRyKI5dPvQJx9afXa1vBtE5hp9fuhKTL57cHqzlL89I3Dlz
B47oI+/U5N7QaB+hIWTN/EjQ1Tl1/hpTpaVKn2/i9ENtwtj2CHwDO55KRkUgZMo7
dsqgBoeUadchhYpBDpJ5c7nn0rkfhBDnVqLY7trOOpgQyZeUJqvTNA2lyuj0dnR7
VKjpm6eBeSWfG52d15SXrGRe/GmItYNDoRvBkFZXbfWLU0xhICz5Nk+rvXzAbsew
cJtNDEziUx/geOudCKskQOf4DgjhEpoFO0x9oWo+wdR+Z5Ja8shtoU65VcQvMFbP
vCChRs1GGbrFLDyXhYdJ6L9gL4BCc2GJ1Z6JU6u7BuGNqpMXmCyeiRU88e+zyWCi
WbneE5MxZ1YuA9qKbbNUohSgj5HOTHcquqpp7s6Q6d9qJXfmnILNBIVy9IC3o5gf
P97LtE6/LLa6HKMxePAJ
=9F5r
-----END PGP SIGNATURE-----

--=-dOUOTo2DAoM38ChqEYWx--
