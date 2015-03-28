From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: arch/m68k/mac/oss.c:51: bad for loop ?
Date: Sat, 28 Mar 2015 15:18:50 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1503281442270.20021@nippy.intranet>
References: <DUB128-W48788F7BD62EB2FDF776C79C090@phx.gbl>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463806400-430061473-1427516330=:20021"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <DUB128-W48788F7BD62EB2FDF776C79C090@phx.gbl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Binderman <dcb314@hotmail.com>
Cc: "funaho@jurai.org" <funaho@jurai.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463806400-430061473-1427516330=:20021
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Fri, 27 Mar 2015, David Binderman wrote:

> Hello there,
>=20
> arch/m68k/mac/oss.c:51:21: warning: iteration 16u invokes undefined=20
> behavior [-Waggressive-loop-optimizations]
>=20
> =A0=A0=A0 for (i =3D 0; i <=3D OSS_NUM_SOURCES; i++) {
> =A0=A0=A0=A0=A0=A0=A0 oss->irq_level[i] =3D 0;
> =A0=A0=A0 }
>=20
> Maybe better code
>=20
> =A0=A0=A0 for (i =3D 0; i < OSS_NUM_SOURCES; i++) {
> =A0=A0=A0=A0=A0=A0=A0 oss->irq_level[i] =3D 0;
> =A0=A0=A0 }

I agree. A quick look at arch/m68k/include/asm/mac_oss.h suggests (if not=
=20
confirms) that this is a bug. I will send a patch though I won't be able=20
to test that on suitable hardware as I'm out-of-town.

It is interesting that the compiler needs -Waggressive-loop-optimizations=
=20
in order to detect the out-of-bounds array access. I suppose the loop has=
=20
to be unrolled before the array index is checked.

Thankyou for the static analysis!

--=20

>=20
> Regards
>=20
> David Binderman
>=20
---1463806400-430061473-1427516330=:20021--
