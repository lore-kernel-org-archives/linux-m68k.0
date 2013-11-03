From: =?iso-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Sun, 3 Nov 2013 23:10:57 +0100
Message-ID: <A97EB404-8FFB-45C0-8ABF-D811B415A46A@2013.bluespice.org>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet> <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de> <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com> <335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de> <9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de> <5cbf031e8c962394a34615d18977f609@muaddib.hro.localnet> <b3074c40e5912f4260968bc02276f356@biophys.uni-duesseldorf.de>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
Content-Type: multipart/signed; boundary="Apple-Mail=_C5B07763-0D86-4DA4-9A5A-6A7EF24D4059"; protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([31.172.31.194]:52387 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754503Ab3KCWLJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Nov 2013 17:11:09 -0500
In-Reply-To: <b3074c40e5912f4260968bc02276f356@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, tuomas.vainikka@kopteri.net


--Apple-Mail=_C5B07763-0D86-4DA4-9A5A-6A7EF24D4059
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Am 03.11.2013 um 07:55 schrieb Michael Schmitz =
<schmitz@biophys.uni-duesseldorf.de>:

> any further news on this one?

Well, not really, I think... but this might be good news. ;)

Yesterday there were two media sense errors on /dev/sda on Spice =
(A3000/040 with Warpengine, so no ESP), but I guess that's a real media =
error, especially because sda2 is an AFFS partition I had mounted.=20

Nov  2 02:03:29 spice kernel: [629303.810000] sd 1:0:0:0: [sda] =
Unhandled sense code
Nov  2 02:03:29 spice kernel: [629303.820000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:29 spice kernel: [629303.830000] Result: hostbyte=3DDID_OK =
driverbyte=3DDRIVER_SENSE
Nov  2 02:03:29 spice kernel: [629303.840000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:29 spice kernel: [629303.850000] Sense Key : Medium Error =
[current]=20
Nov  2 02:03:29 spice kernel: [629303.880000] Info fld=3D0x7b1d0
Nov  2 02:03:29 spice kernel: [629303.890000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:29 spice kernel: [629303.900000] Add. Sense: Unrecovered =
read error
Nov  2 02:03:29 spice kernel: [629303.910000] sd 1:0:0:0: [sda] CDB:=20
Nov  2 02:03:29 spice kernel: [629303.920000] Read(10): 28 00 00 07 b1 =
d0 00 00 01 00
Nov  2 02:03:29 spice kernel: [629303.970000] end_request: critical =
medium error, dev sda, sector 504272
Nov  2 02:03:30 spice kernel: [629303.980000] Buffer I/O error on device =
sda2, logical block 240944
Nov  2 02:03:30 spice kernel: [629306.740000] sd 1:0:0:0: [sda] =
Unhandled sense code
Nov  2 02:03:30 spice kernel: [629306.750000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:30 spice kernel: [629306.760000] Result: hostbyte=3DDID_OK =
driverbyte=3DDRIVER_SENSE
Nov  2 02:03:30 spice kernel: [629306.770000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:30 spice kernel: [629306.780000] Sense Key : Medium Error =
[current]=20
Nov  2 02:03:30 spice kernel: [629306.800000] Info fld=3D0x17c220
Nov  2 02:03:30 spice kernel: [629306.810000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:30 spice kernel: [629306.820000] Add. Sense: Unrecovered =
read error
Nov  2 02:03:30 spice kernel: [629306.830000] sd 1:0:0:0: [sda] CDB:=20
Nov  2 02:03:30 spice kernel: [629306.840000] Read(10): 28 00 00 17 c2 =
20 00 00 01 00
Nov  2 02:03:30 spice kernel: [629306.890000] end_request: critical =
medium error, dev sda, sector 1557024
Nov  2 02:03:30 spice kernel: [629306.900000] Buffer I/O error on device =
sda2, logical block 1293696
Nov  2 02:03:30 spice kernel: [629309.590000] sd 1:0:0:0: [sda] =
Unhandled sense code
Nov  2 02:03:31 spice kernel: [629309.600000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:31 spice kernel: [629309.610000] Result: hostbyte=3DDID_OK =
driverbyte=3DDRIVER_SENSE
Nov  2 02:03:31 spice kernel: [629309.620000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:31 spice kernel: [629309.630000] Sense Key : Medium Error =
[current]=20
Nov  2 02:03:31 spice kernel: [629309.650000] Info fld=3D0x7b1d0
Nov  2 02:03:31 spice kernel: [629309.660000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:31 spice kernel: [629309.670000] Add. Sense: Unrecovered =
read error
Nov  2 02:03:31 spice kernel: [629309.680000] sd 1:0:0:0: [sda] CDB:=20
Nov  2 02:03:31 spice kernel: [629309.690000] Read(10): 28 00 00 07 b1 =
d0 00 00 01 00
Nov  2 02:03:31 spice kernel: [629309.740000] end_request: critical =
medium error, dev sda, sector 504272
Nov  2 02:03:31 spice kernel: [629309.760000] Buffer I/O error on device =
sda2, logical block 240944
Nov  2 02:03:31 spice kernel: [629312.540000] sd 1:0:0:0: [sda] =
Unhandled sense code
Nov  2 02:03:31 spice kernel: [629312.550000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:31 spice kernel: [629312.560000] Result: hostbyte=3DDID_OK =
driverbyte=3DDRIVER_SENSE
Nov  2 02:03:31 spice kernel: [629312.570000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:31 spice kernel: [629312.580000] Sense Key : Medium Error =
[current]=20
Nov  2 02:03:31 spice kernel: [629312.610000] Info fld=3D0x17c220
Nov  2 02:03:31 spice kernel: [629312.620000] sd 1:0:0:0: [sda] =20
Nov  2 02:03:31 spice kernel: [629312.630000] Add. Sense: Unrecovered =
read error
Nov  2 02:03:31 spice kernel: [629312.640000] sd 1:0:0:0: [sda] CDB:=20
Nov  2 02:03:32 spice kernel: [629312.650000] Read(10): 28 00 00 17 c2 =
20 00 00 01 00
Nov  2 02:03:32 spice kernel: [629312.700000] end_request: critical =
medium error, dev sda, sector 1557024
Nov  2 02:03:32 spice kernel: [629312.720000] Buffer I/O error on device =
sda2, logical block 1293696

Otherwise it looks good. No appearance of "Whoa" so far:=20

spice:/home/ij# zgrep -i whoa /var/log/syslog* /var/log/messages*=20
spice:/home/ij#

akire:~# zgrep -i whoa /var/log/syslog* /var/log/messages*
akire:~#=20

I would like to stress akire a little more with a running buildd, but =
Aurelien didn't add Spice & Akire yet to w-b the last two weeks...

--=20
Ciao...            //      Fon: 0381-2744150
      Ingo       \X/       http://blog.windfluechter.net


gpg pubkey:  http://www.juergensmann.de/ij_public_key.asc


--Apple-Mail=_C5B07763-0D86-4DA4-9A5A-6A7EF24D4059
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJSdsnxAAoJEBUi7ZnYRSedxbUP/2q1Lvev1ZaaGrIa1qwqB8bU
EpPyX5F+GUgnOdOQFbBZYxSw8gNJocxNpX6e9ncLWJdnjVQ2Hs5OTENuQun1rv18
HmovhvsvCJ3Ty4ZwyCzENCckThQB7EVxT5qAWC5e+UkY7Ahdk3lMTh4ggZ27Waz/
BhVzCoYTiJlOD2asoxPW2Xw4pS30WWIpZZkG5WsZsCJvdYoSE4gtAS1NZQ+HHHwP
FY3EHQKf9gUV65LSrxw3lLm5lLR2Ok2oOoZyyyh0aicmUM6HfDZAXnhlqq0+sqCj
RTFEGJlS+Rx7rWw4kyLlvAaSn/CwVQ23c9GvQTq2mRxYzQl+7A54N7z1qQGo4KOQ
3gi4+wUB3D2HakfWWWICqrM8MlrKYm8QsIZmWuMC2c4riRUiugEilSmH8lAJPX4g
OxGHddcsv2d5UZp665j1y1rgXTyhnFU3lkyZIKuLFEX2Up6f9j1zTq+gMxuF1k5d
z4+/JE1mQi9x0gJPeBp6RSlODMhJKXqOPbkSd2PI9JdEt4bUJaFFkQLP/sDOVEFA
XKQeL6HjIy0Sd/UHb/5/JlDLZPDSkMDEflC0r2pqHQ6J4INRTVS3sf/yuV7iDR6v
9KzpGZAuUvmehXxv1UO7g1TuMRtv+YiUcCTDG4SHLubHerVIpDPI6HsDkz7/ZlDp
3I3pywQ+ZFmiTt8KBptW
=ZAmi
-----END PGP SIGNATURE-----

--Apple-Mail=_C5B07763-0D86-4DA4-9A5A-6A7EF24D4059--
