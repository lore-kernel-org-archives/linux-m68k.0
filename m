From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: any affs image
Date: Tue, 05 Jun 2012 11:18:13 +0300
Message-ID: <1338884293.2507.40.camel@sauron.fi.intel.com>
References: <1338815624.2507.15.camel@sauron.fi.intel.com>
	 <CAMuHMdVi7qxd+=XSEMz7=nKEng-2v1q479h4_nzG8faJVKqozQ@mail.gmail.com>
	 <1338880477.2507.19.camel@sauron.fi.intel.com>
	 <CAMuHMdWB2xaNdugrmgQDnJpqc7-TVrLL9fPBXGav0SgMVwAxdA@mail.gmail.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-tZwOks05UK0eomP6S+u2"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWB2xaNdugrmgQDnJpqc7-TVrLL9fPBXGav0SgMVwAxdA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org


--=-tZwOks05UK0eomP6S+u2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-05 at 09:50 +0200, Geert Uytterhoeven wrote:
> Hi Artem,
>=20
> On Tue, Jun 5, 2012 at 9:14 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> > On Mon, 2012-06-04 at 21:21 +0200, Geert Uytterhoeven wrote:
> >> > do you happen to have an affs disk image, by any chance? I need to m=
ake
> >> > few changes in the affs file-system in the linux kernel but and I wo=
uld
> >> > like to test them. But unfortunately, I was not able to find any wor=
king
> >> > way of formatting my dist to affs.
> >>
> >> http://www.xs4all.nl/~zippel/affstools-0.1a.tar.gz contains an mkaffs =
tool.
> >>
> >> Hope this helps...
> >
> > Hi, thanks, I tried it and it worked neither for files nor for block
> > device nodes, I do not know why. But I've found a different mkfs.affs
>=20
> Strange. I did try it yesterday (without mounting the result, though).
>=20
> Did you pass a volume name as second parameter?

Actually not, the --help output looks like this:

$ ./mkaffs --help
Usage: mkaffs [OPTION...] devicefile name

and I thought that "devicefile name" means "/dev/vda", I did not figure
out that "name" is another argument.

I decided that it is a piece of old and non-working code and did not try
to look at the source code, but I probably should have to.

Sorry for the noise.=20

--=20
Best Regards,
Artem Bityutskiy

--=-tZwOks05UK0eomP6S+u2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzcDFAAoJECmIfjd9wqK0V/kP/jYgQeavzqZZ4RwbyBNjDrBE
/MH5XHLvmhY1GL2B/y3RdgubrG9FOhb+UwhVkCQQNw1PNa975Hcb6QRQs1JfBiVo
PHaX7ltEkGvWSuDMXwnZvlJO6gUi+oHpqOi76s1UtY5xgRCLuumlvw6k/PXlTYDY
pCrnZNVlNlZtoBL+bUXu7G5Sk6lpHfsH+Ehz3/pGq2vvRGAx0wn/brZHxvam06QB
BwkRv1NbOcVauMIAucOwKsMjkO05PpCh/GlP0VQ/HZa9vcuOcNvY+UUiQeQ7T0Nz
Yyl5YGESZIH1AuR8gRAIPRMbFVMRCVq941LJM8X6pLXp6IMD8MhUFj6OnQCBjtcc
1CxkpvWAzduSZq28O3UJrV3dYWyD5kkKVXNmdQLrN4ZsARlljUTAe8Wkej3Sp4P1
FxuvtlWhqjRD9wS4O/dkZ6+eDKOlnOmiT1H0gx/CRJlbix0QINGT6r0tEtPtXpmZ
zlMOk346wskFP+KIBSaUQr1L/sXpyjTxypQ1W0N+IXgDKAiB//uMDybZLAFFMDFy
LzpMauTlq5+KWH+nGsznh1iR+108z5j0zU8tYXSX0toTIbHCb0c7+Stwmcy0oOlY
mL3A1Ux6oBMt5zIJpK9z3tRBjaQFcNFYCyEMOzn4idB9dZP3mK9skHzED+Pox4I7
sI0zu1HVoyOpRSuTv0Wx
=y8dh
-----END PGP SIGNATURE-----

--=-tZwOks05UK0eomP6S+u2--
