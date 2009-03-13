From: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: m68k: kernel/up.c:16: error: dereferencing pointer to
 incomplete type
Date: Fri, 13 Mar 2009 21:18:20 +1100
Message-ID: <1236939500.11012.1.camel__20889.269168447$1236939611$gmane$org@localhost>
References: <10f740e80903120608v314be360u30911fa003ab5ebc@mail.gmail.com>
	 <20090313142033.d69d9d2e.sfr@canb.auug.org.au>
Reply-To: michael@ellerman.id.au
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-FqRXnL4imdIu6mPHI218"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090313142033.d69d9d2e.sfr@canb.auug.org.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org


--=-FqRXnL4imdIu6mPHI218
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-03-13 at 14:20 +1100, Stephen Rothwell wrote:
> Hi Geert,
>=20
> On Thu, 12 Mar 2009 14:08:57 +0100 Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
> >
> > I can't seem to reproduce the compile failure of kernel/up.c on m68k,
> > as shown on
> > http://kisskb.ellerman.id.au/kisskb/buildresult/186066/:
> >=20
> > | kernel/up.c:16: error: dereferencing pointer to incomplete type
>=20
> When kisskb gets an error in building a kernel, it tries to bisect the
> problem starting from a known good kernel.  The above error occurs
> during the bisection process not when building the original kernel.  I
> guess we need to be a bit more careful when reporting the errors.  Sorry
> about that.

Yeah sorry that is confusing.

Should be fixed now.

cheers

--=20
Michael Ellerman
OzLabs, IBM Australia Development Lab

wwweb: http://michael.ellerman.id.au
phone: +61 2 6212 1183 (tie line 70 21183)

We do not inherit the earth from our ancestors,
we borrow it from our children. - S.M.A.R.T Person

--=-FqRXnL4imdIu6mPHI218
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm6MusACgkQdSjSd0sB4dLKpQCcDFqcv/G/LtZ8GmY8huWW9c+1
4mkAnjB7AIDKWzjEHSmc8F91YRQuLP2e
=gX5W
-----END PGP SIGNATURE-----

--=-FqRXnL4imdIu6mPHI218--

