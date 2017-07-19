From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] m68k: Restore symbol versions for symbols exported from
 assembly
Date: Wed, 19 Jul 2017 11:50:01 +0100
Message-ID: <1500461401.27283.2.camel@decadent.org.uk>
References: <20170719000324.GE18698@decadent.org.uk>
         <mvmzic0ztgb.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-oqTKrcMMwMjUoPqyXuTE"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <mvmzic0ztgb.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org


--=-oqTKrcMMwMjUoPqyXuTE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-07-19 at 11:06 +0200, Andreas Schwab wrote:
> On Jul 19 2017, Ben Hutchings <ben@decadent.org.uk> wrote:
>=20
> > diff --git a/arch/m68k/include/asm/asm-prototypes.h b/arch/m68k/include=
/asm/asm-prototypes.h
> > new file mode 100644
> > index 000000000000..4cd692a44c11
> > --- /dev/null
> > +++ b/arch/m68k/include/asm/asm-prototypes.h
> > @@ -0,0 +1,5 @@
> > +extern void __divsi3(void);
> > +extern void __modsi3(void);
> > +extern void __mulsi3(void);
> > +extern void __udivsi3(void);
> > +extern void __umodsi3(void);
>=20
> That doesn't match the actual prototypes.

I know.  But the compiler doesn't care, and their real ABI is extremely
stable.

Ben.

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0- John Levine, moderator of comp.compilers


--=-oqTKrcMMwMjUoPqyXuTE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAllvOVkACgkQ57/I7JWG
EQmLUxAAnFCpjzskSmwqQ5oI8boEph8eHpj4lPW2A9RZeuIIeR41Zqjw/jDLeTcj
y0idIrf3JlweHF/9WOR1oKjR1ctNiGUpz6cWf7bxbW1ZuxpaAX11/SymAXKzfD13
9awXBofDOeiMiLv1ygIDaZF9xJwHNpMAQ1m1WwlbFLNhHW9ADwSr9/wZhpLwoMdX
NwS4XUEJQ0xROQdFRZCdhIFB4JRFJZF6q6O9CuDh6LKZWORBBBspo5hS5xDATwAc
zAdd+bGDclemhyA0/eDv6R/t7Jiulk7z5NHffF8LUvVoPaJk2JbiZIndhro7tGfc
CHlEMa2QabZgLXj48+IcHmtRFs1cCCKAApB763itFDTKl7ec9qSkqwrSKnejPpAt
olkF+pLaXbmGLLFpY23+rhlhcKyawOGBNTo91KLOr7zhQRGDRK1sad3+FN3PGkBF
2oQcPOs24sSvN5GvB/y8cXsem/Ts194GxpZ/M5x+ahOG/+hcwHB/DMrotf8vw7QL
BK6+AR8N6yJVbrXpjZHyQebZ+OnvGIowBtDyHGR10khv5TeLjmkKUbVatfjXOc3z
XupCYYzFGzu0gMnKk3oqYqAcWx/d6RiEpuTOUVy/sNyT/8I1obwuL/9vtljp41EP
7bwVwvafGVLM9ETzPQny+wMfMqI/np461W5kUPqgI1Hc1oeqte4=
=t0NT
-----END PGP SIGNATURE-----

--=-oqTKrcMMwMjUoPqyXuTE--
