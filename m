From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: m68k: kernel/up.c:16: error: dereferencing pointer to
 incomplete type
Date: Fri, 13 Mar 2009 14:20:33 +1100
Message-ID: <20090313142033.d69d9d2e.sfr__6441.05614997006$1236914560$gmane$org@canb.auug.org.au>
References: <10f740e80903120608v314be360u30911fa003ab5ebc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Mar_2009_14_20_33_+1100_Yt3vwrjjHNWEpdTS"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <10f740e80903120608v314be360u30911fa003ab5ebc@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org, michael@ellerman.id.au

--Signature=_Fri__13_Mar_2009_14_20_33_+1100_Yt3vwrjjHNWEpdTS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 12 Mar 2009 14:08:57 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> I can't seem to reproduce the compile failure of kernel/up.c on m68k,
> as shown on
> http://kisskb.ellerman.id.au/kisskb/buildresult/186066/:
>=20
> | kernel/up.c:16: error: dereferencing pointer to incomplete type

When kisskb gets an error in building a kernel, it tries to bisect the
problem starting from a known good kernel.  The above error occurs
during the bisection process not when building the original kernel.  I
guess we need to be a bit more careful when reporting the errors.  Sorry
about that.

It was actually building commit
"[ad33ea3a8d2ec324dc0f46b6ae404d824d2b349b] bnx2x: Missing mask when
calculating flow control", I think.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Mar_2009_14_20_33_+1100_Yt3vwrjjHNWEpdTS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm50QEACgkQjjKRsyhoI8xMagCguZru8KMKipN45xXgIkxFHGtw
k9QAnRyYOjPCG9QwohO4YXVVVnvEP2kV
=EeCD
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Mar_2009_14_20_33_+1100_Yt3vwrjjHNWEpdTS--
