From: =?iso-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Sun, 20 Oct 2013 12:25:50 +0200
Message-ID: <59784485-0680-414F-A9FB-5FDD84C9C2BF@2013.bluespice.org>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet> <CAMuHMdUkgQFBg8GJf6xsCVJ0_ciVs+HvtySh8YnvAeVHp8jS4Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <CAMuHMdUkgQFBg8GJf6xsCVJ0_ciVs+HvtySh8YnvAeVHp8jS4Q@mail.gmail.com>
Resent-Message-ID: <yGIi-okuMUI.A.XCF.0_6YSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, tuomas.vainikka@kopteri.net, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Am 20.10.2013 um 12:10 schrieb Geert Uytterhoeven =
<geert@linux-m68k.org>:

> However, the addresses and the code above don't match the kernel image =
in
> linux-3.12.0-rc4-amiga-m68k.tar.gz?
> Can we get the image somewhere?

I can give you access to the VM with the (patched) kernel source where I =
crosscompiled the image. Just send me your SSH pubkey...=20
When it helps, here's the binary tarball: =
https://silverhaze.org/public.php?service=3Dfiles&t=3D4701b07462fbbe06516b=
9433f3084e4c

> Apart from that, since the division is:
>=20
>                /* be careful ... don't want any overflows */
>                u64 factor =3D scmd->device->sector_size / 512;
>                do_div(start_lba, factor);
>                do_div(end_lba, factor);
>=20
> (yes, the "u64 factor" is the issue without Andreas's fix), it could =
still be
> an ESP bug, if scmd->device->sector_size turns out to be less than 512
> (e.g. 0).


At least this time the filesystem survived the kernel crash. Maybe =
Michael can have a look at the source as well when the sun rises in =
*.nz... ;)

--=20
Ciao...            //      Fon: 0381-2744150
      Ingo       \X/       http://blog.windfluechter.net


gpg pubkey:  http://www.juergensmann.de/ij_public_key.asc
