From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Fri, 16 Dec 2011 16:48:13 +0000
Message-ID: <1324054093.2825.282.camel@deadeye>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZgRtaGLXzLuR57nFBRVJ"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:32901 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752164Ab1LPQs1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 16 Dec 2011 11:48:27 -0500
In-Reply-To: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>


--=-ZgRtaGLXzLuR57nFBRVJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-12-16 at 14:42 +0000, Thorsten Glaser wrote:
> Hi,
>=20
> a build of linux-2.6 (3.2~rc4-1~experimental.1) with gcc-4.6 (to
> check whether we can switch to it for the kernel, too) fails:
[...]
> /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/arch/m68k/inc=
lude/asm/hardirq.h: In function 'ack_bad_irq':
> /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/arch/m68k/inc=
lude/asm/hardirq.h:23:2: error: expected ')' before 'AUFS_NAME'
> make[7]: *** [fs/aufs/module.o] Error 1
> [=E2=80=A6]
>=20
> The cause isn=E2=80=99t hard to figure out:
>=20
>     I /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/arch/m6=
8k R21  <40   C1  384 |180 115|73 14:39
>    21 static inline void ack_bad_irq(unsigned int irq)
>    22 {
>    23         pr_crit("unexpected IRQ trap at vector %02x\n", irq);
>    24 }
>=20
> (pbuild26252)root@ara5:/ # fgrep AUFS_NAME /tmp/buildd/linux-2.6-3.2~rc4/=
debian/build/source_m68k_none/fs/aufs/*
> /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/fs/aufs/Makef=
ile:ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__f=
unc__,__LINE__,current->comm,current->pid'
>=20
> This, to me, looks like cpp abuse in aufs, but I=E2=80=99m not a kernel
> programmer (Linux or otherwise).

Maybe, but it should work just as long as AUFS_NAME is also defined in
advance.  Not sure why that's not also provided on the command line, or
why other architectures get away with it.  Maybe they just don't use
pr_*() in headers.

Ben.

--=20
Ben Hutchings
Computers are not intelligent.	They only think they are.

--=-ZgRtaGLXzLuR57nFBRVJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATut2Tee/yOyVhhEJAQp9+hAAmqyVd6l2VGaqN1SAtH2wcMpqLGKwSnjl
lFZwEPz7ney8Xjt9WkoQDFvxlbgl/AOZKQvox4jWM9GbUz9NcaCEOqGUv+Vcg0Bv
S0am5hXuc2eXhYffHEN0WFANL1NtwroQgjoKM+DI7pT7e/XorTNE3pJybsG/cB38
FBBcSW/cOlDPVrf5k/DZmFf1r9jLInqYbHFXNd5fb/Mg1PBJUEstgmhzyITXISru
z3LhELbL6Qz8J4a1O2jL9gs8Wph7bCw4s9TZBVvKscb9uHZ19VzSUXze3rsnPTuD
9lUVfbZaeuHv9j4QSuoBt9Je/klbMZK3qNMmhUzXtn9HKlQQFw8+g+dFdMOIoKmC
orgaYrIiwXTsGfOBGfb+HfZLv340NKlPwA4PwRE8gJv1ZktBNqKX/N64LmE5eaDW
AzcQwV5ZVMSJ3zk71QT8rPB93K0EHkEPvQ6QXj1xX3GtrvcuQv/LN0UROW5VTYj8
OQacEcZsdo+ynTpZ9UXFD4USYtb1J2g1RNQ4XSnjFHvH0GGGqlNGT6gpk+i4kYIy
FQCUjS8hUYjXEvR7H/eqSfhfpq/baPMVbibIsmU0GNM4DVPGIxzpGDDo3VxUjt5A
QIRQheaFzPX+P9A4k9kHeBsLb63LrKBniTg+FFfgVvirG/ZJxbDM7bJctfmnid05
P5+wa6XSTuY=
=jqS1
-----END PGP SIGNATURE-----

--=-ZgRtaGLXzLuR57nFBRVJ--
