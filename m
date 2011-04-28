From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Thu, 28 Apr 2011 03:35:38 +0100
Message-ID: <1303958138.3032.443.camel@localhost>
References: <1303317178.2587.30.camel@mulgrave.site>
	 <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com>
	 <20110421220351.9180.A69D9226@jp.fujitsu.com>
	 <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com>
	 <alpine.DEB.2.00.1104211500170.5741@router.home>
	 <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
	 <alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com>
	 <4DB3840F.3060503@gmail.com>
	 <alpine.DEB.2.00.1104251355410.31884@chino.kir.corp.google.com>
	 <4DB63349.3070808@gmail.com>
	 <Pine.BSM.4.64L.1104261049350.4851@herc.mirbsd.org>
	 <BANLkTin3BmJpuzUyBWV1B38oVMDbXe=fbw@mail.gmail.com>
	 <Pine.BSM.4.64L.1104271509560.29189@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="=-KVVmUA3mLY3Mc0VDXjK3"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:53492 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751510Ab1D1Cfr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 27 Apr 2011 22:35:47 -0400
In-Reply-To: <Pine.BSM.4.64L.1104271509560.29189@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian Kernel Team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


--=-KVVmUA3mLY3Mc0VDXjK3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-04-27 at 15:11 +0000, Thorsten Glaser wrote:
> Geert Uytterhoeven dixit:
>=20
> >Fixed those up, applied, and will send to Linus for 2.6.39-final.
>=20
> Attached patch
> =E2=80=A2 synchronises the 0009-* patch against what will be in 2.6.39
>   (no changes in the patch area, only in the patch metadata)

OK.

> =E2=80=A2 adds the series/5 file which seemingly was forgotten
[...]

Duh, I have it here but didn't check it in.  I'm normally so diligent
about running 'svn st' to check for untracked files...

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-KVVmUA3mLY3Mc0VDXjK3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATbjSeue/yOyVhhEJAQq40xAAzE9HA8ETTsHlI7qiB2JvM8kbVQQFjZ91
vrwqzR0ojP4Qa61oyFIKMiGqcERnVojQY4pKiR2dmaua/aLIxakKJy7F9u0lgD7J
CC8qHpO5YCnoUFHzun5JW1CksCty+T9nlXMThvV/kyuhyJBLzUT0pgEtVu5ixBBR
Sj4pl21RcaiEdH/xNX1AVG9cFVVwGtCJPhTNwfXfikU8izvtVewmyF1O7WmkNWYt
OhzYuMp5PYerPlbTDRDf/OFkxaQCKhMjaiVyjAzSt2pR6dfVqyniYtxnTz6nX3CC
Y/DU5cpTL+LesdEfRcGDhlE1jzQSivMae2D/oT700KIBUzUQyu3fa8gk5rmiJQNn
MBv8zSWDjgaovHwwN5/dSaOOpZ4jRKN3hDw7lwhtn0qiekYfyIHWnwUD+vp3vmF9
eD6OzZc3XTNtlqCwQJ9Ccof81TMMuI0And4sH4m5iVEd3liT6D8J63dZtrzCzK6f
k1JWT/wjFoAPftcHLnGFmti+n+YszO7E8bFrRv1/xTe3DHD7bIT6VWoo9WsUoFgN
+0GzXqnPEuFTI/b83j1A2eqsCKJKQMv7zIcmrxJlL7QwmoQL7Yw9sFMYYGxVq+fM
/8T7YMwf7L1cuCsf4plgGA6PcYkshlY4OqU/fv7Y32Xy65QOHYdVLIDIBe5unLCM
yhvAsUoSrfM=
=SnW5
-----END PGP SIGNATURE-----

--=-KVVmUA3mLY3Mc0VDXjK3--
