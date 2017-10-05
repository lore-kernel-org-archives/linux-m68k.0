From: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Thu, 5 Oct 2017 23:49:52 +0200
Message-ID: <1507237676@msgid.manchmal.in-ulm.de>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
 <CAEQ9gEmFPeibJUANPFbkTJfjyv6hLOG7Wr=ijyfrVSfRkKPEtw@mail.gmail.com>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <fb548f7a-eb98-949b-296c-fd031d8afa5f@physik.fu-berlin.de>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <20171005164054.k3tln4hduzmaw4tb@tack.einval.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5GLnnZ8mDMEwH4V"
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20171005164054.k3tln4hduzmaw4tb@tack.einval.com>
Resent-Message-ID: <waAQyI6u4VB.A.J0B.Qkq1ZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/1507237676@msgid.manchmal.in-ulm.de
To: Steve McIntyre <steve@einval.com>, 877735@bugs.debian.org
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Roger Shimizu <rogershimizu@gmail.com>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org


--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Steve McIntyre wrote...

> On Thu, Oct 05, 2017 at 06:12:46PM +0200, John Paul Adrian Glaubitz wrote:

> >Hmm, ok. Is that currently actually a concern? If I'm seeing that correctly,
> >the "-Os" here only saved us around 200k. Does that already make a difference
> >on armel?
>
> Massively so, yes. Lots of the armel platforms that people care about
> have very limited space for kernel and initramfs.

Indeed. When we (KiBi, Chris and I) discussed maintaining busybox at
DebConf, such size concerns were on the list of things to keep in mind.
For that reason we will enable more applets upon justified request only.

About that particular issue I'd really like to avoid a per-architecture
switch in busybox. It adds complexity and works around a problem
instead of solving it. So please take this to gcc first unless you've
already done so. And let us know if you get the impression this won't
get fixed soon-ish - breaking an architecture still beats packaging
principles.

    Christoph

--e5GLnnZ8mDMEwH4V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJZ1qj/AAoJEMQsWOtZFJL9fl0P/jtWoFMlZBo0Y0Qu1asyBxog
dImIvwdXvYqRUqUhXp7nh39/U3ygJNse92LA0BzExjge6p4A37xtgLcKdWJQrMtY
ENw2mldiseAUK2hXBkpESUwOg+sMqSkMRJSHKeiTHcJ1aUAhrm24InaprttiU6cC
uE/lY7WjAEbWE/P//GWKq5T+SfOOiuiHfYBCkc4hZrv9NTVpEOK5RZMb50qjSP0z
kBQXh2JqM81pazrtLb+NZEeee82+ZT+SlUz5IYOnvoo6ag8+NtWYufn3Zsa00bn4
2fZlV17rVolHxVCuJOF2YsSSBMuK75q24+7cknk0R2FE+opkO3npUIwT5fWlrowU
1Kyc07EhYBHcsAs3K+o4Dq5kaWsuu30KjajVCQDldSnOJgejjurlYTg9SM1w3/Lu
L/d0pdv84OWSdfXKC3JXL8JTRSgnTB8GwKEEZfCEo4IgOQR8oeQvGHD31znVG/Rg
6imx87TEb2gnokdHGOw6PiVhX/3ln8uzO/CXr8iVJ11ORS8zJZn0Tk5DhRJ+RVKs
5LSNr6bfQJCTCYKijh5HE6+L9JIiFsaeq7pEcW9F6KblXx8xn+LKsC0Ac4eufGsv
AyRCnQmtKY90Ot7+v3fOuDiRX3nFUi/iaHvYaaVbiWcLQLCNpSJUZb2tzEkoNayI
QANbvnz+HXMTixyTFnDK
=OaQr
-----END PGP SIGNATURE-----

--e5GLnnZ8mDMEwH4V--
