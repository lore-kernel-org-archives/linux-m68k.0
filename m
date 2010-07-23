From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Fri, 23 Jul 2010 14:12:25 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1007231358580.393@localhost>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net> <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com> <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net> <alpine.OSX.2.00.1007221056390.354@localhost>
 <1CC1901B-7E56-4FAF-96A4-8F2F2F5C38A9@bredband.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-2013084441-1279858345=:393"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:56884 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807Ab0GWEQE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 23 Jul 2010 00:16:04 -0400
In-Reply-To: <1CC1901B-7E56-4FAF-96A4-8F2F2F5C38A9@bredband.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-15?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, zippel@linux-m68k.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-2013084441-1279858345=:393
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Thu, 22 Jul 2010, Mattias Engdeg=E5rd wrote:

> 22 jul 2010 kl. 03.05 skrev Finn Thain:
>=20
> > But if you send me some inline asm, I'll patch it into busybox and test=
 a
> > 2.6.34 initramfs for you.
>=20
> Thanks! Try this:
>=20
> void test_postinc(void)
> {
>        double x =3D 0.0;
>        double a[2] =3D {3.5, 0.0};
>        double *p =3D a;
>        __asm__ volatile  ("fneg.d (%0)+,%1" : "+a"(p), "+f"(x));
>        printf("postinc: result %f (expected %f), address %p (expected %p)=
\n",
>               x, -3.5, p, a + 1);
> }
>=20
> void test_predec(void)
> {
>        double x =3D 0.0;
>        double a[2] =3D {-1.75, 0.0};
>        double *p =3D a + 1;
>        __asm__ volatile  ("fneg.d -(%0),%1" : "+a"(p), "+f"(x));
>        printf("predec: result %f (expected %f), address %p (expected %p)\=
n",
>               x, 1.75, p, a);
> }
>=20

I ran this on a PowerBook 190cs:

postinc: result -3.500000 (expected -3.500000), address 0xef8ddcf8 (expecte=
d 0xef8ddcf8)
predec: result 1.750000 (expected 1.750000), address 0xef8ddcf0 (expected 0=
xef8ddcf0)

It is probably not relevant, but I believe that this CPU is free from the=
=20
68LC040 erratum that affects page faults and FPU ops as I've tested for=20
that before.

# cat /proc/cpuinfo
CPU:            68040
MMU:            68040
FPU:            none
Clocking:       32.9MHz
BogoMips:       21.96
Calibration:    109824 loops
# cat /proc/version
Linux version 2.6.34-mac (fthain@nippy) (gcc version 4.4.4 (GCC) ) #5 Fri J=
ul 23 13:32:53 EST 2010

Here's the disassembly:

8007da96 <test_predec>:
8007da96:=094e56 fff0      =09linkw %fp,#-16
8007da9a:=092d7c bffc 0000 =09movel #-1074003968,%fp@(-16)
8007daa0:=09fff0=20
8007daa2:=0942ae fff4      =09clrl %fp@(-12)
8007daa6:=0942ae fff8      =09clrl %fp@(-8)
8007daaa:=0942ae fffc      =09clrl %fp@(-4)
8007daae:=0941ee fff8      =09lea %fp@(-8),%a0
8007dab2:=09f200 5c0f      =09fmovecrx #15,%fp0
8007dab6:=09f220 541a      =09fnegd %a0@-,%fp0
8007daba:=09486e fff0      =09pea %fp@(-16)
8007dabe:=092f08           =09movel %a0,%sp@-
8007dac0:=0942a7           =09clrl %sp@-
8007dac2:=092f3c 3ffc 0000 =09movel #1073479680,%sp@-
8007dac8:=09f227 7400      =09fmoved %fp0,%sp@-
8007dacc:=094879 8009 b25a =09pea 8009b25a <isoformats.7051+0x29>
8007dad2:=092f39 800a 8e04 =09movel 800a8e04 <_IO_stderr>,%sp@-
8007dad8:=094eb9 8000 e564 =09jsr 8000e564 <__fprintf>
8007dade:=094fef 0020      =09lea %sp@(32),%sp
8007dae2:=094e5e           =09unlk %fp
8007dae4:=094e75           =09rts

8007dae6 <test_postinc>:
8007dae6:=094e56 fff0      =09linkw %fp,#-16
8007daea:=092d7c 400c 0000 =09movel #1074528256,%fp@(-16)
8007daf0:=09fff0=20
8007daf2:=0942ae fff4      =09clrl %fp@(-12)
8007daf6:=0942ae fff8      =09clrl %fp@(-8)
8007dafa:=0942ae fffc      =09clrl %fp@(-4)
8007dafe:=0941ee fff0      =09lea %fp@(-16),%a0
8007db02:=09f200 5c0f      =09fmovecrx #15,%fp0
8007db06:=09f218 541a      =09fnegd %a0@+,%fp0
8007db0a:=09486e fff8      =09pea %fp@(-8)
8007db0e:=092f08           =09movel %a0,%sp@-
8007db10:=0942a7           =09clrl %sp@-
8007db12:=092f3c c00c 0000 =09movel #-1072955392,%sp@-
8007db18:=09f227 7400      =09fmoved %fp0,%sp@-
8007db1c:=094879 8009 b295 =09pea 8009b295 <isoformats.7051+0x64>
8007db22:=092f39 800a 8e04 =09movel 800a8e04 <_IO_stderr>,%sp@-
8007db28:=094eb9 8000 e564 =09jsr 8000e564 <__fprintf>
8007db2e:=094fef 0020      =09lea %sp@(32),%sp
8007db32:=094e5e           =09unlk %fp
8007db34:=094e75           =09rts

HTH

Finn
--0-2013084441-1279858345=:393--
