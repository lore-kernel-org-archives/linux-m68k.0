From: =?utf-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: Atari 4 MiB kernel limit
Date: Fri, 19 Jul 2013 18:09:43 +0200
Message-ID: <B0542264-17B0-464E-9EF7-D5F52FD7B4B8@2013.bluespice.org>
References: <alpine.DEB.2.10.1307191630490.14572@tglase.lan.tarent.de> <CAMuHMdXh9NHMeqVck23aXco0m1N9qHkB7L9vAd7Rva4mh1ePcQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <CAMuHMdXh9NHMeqVck23aXco0m1N9qHkB7L9vAd7Rva4mh1ePcQ@mail.gmail.com>
Resent-Message-ID: <U2Zvx9nP6bC.A.4PB.AUW6RB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Funny enough I currently got problems with load the kernel on Arrakis, an A3=
000, although I already reduced the memory from 128M down to 64M with no suc=
cess.=20
It ran wirh the same setup for months now, until I shut it down for cleaning=
 today.

--=20
Ingo J=C3=BCrgensmann

http://blog.windfluechter.net
http://npbhro.de


Am 19.07.2013 um 17:49 schrieb Geert Uytterhoeven <geert@linux-m68k.org>:

> On Fri, Jul 19, 2013 at 4:31 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
>> does the limit apply to just the kernel image
>> (plus some margin) or is the initrd also subject
>> to that restriction?
>=20
> That's a very good question ;-)
>=20
> The 4 MiB limit only applies to early startup, in arch/m68k/kernel/head.S.=

> Initrd is accessed later, in arch/m68k/kernel/setup_mm.c, so I'd expect it=
 to
> not fall under the limit.
>=20
> Of course, better try it to be sure ;-)
>=20
> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68=
k.org
>=20
> In personal conversations with technical people, I call myself a hacker. B=
ut
> when I'm talking to journalists I just say "programmer" or something like t=
hat.
>                                -- Linus Torvalds
>=20
>=20
> --=20
> To UNSUBSCRIBE, email to debian-68k-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.=
org
> Archive: http://lists.debian.org/CAMuHMdXh9NHMeqVck23aXco0m1N9qHkB7L9vAd7R=
va4mh1ePcQ@mail.gmail.com
>=20
