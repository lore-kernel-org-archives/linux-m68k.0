From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: [PATCH] m68k: amiflop: *ptr incremented past 0x4489
Date: Fri, 13 Feb 2009 09:07:56 +0100
Message-ID: <20090213080756.GA1008@Redstar.dorchain.net>
References: <4992E3EE.2020308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from RedStar.dorchain.net ([212.88.133.153]:53784 "EHLO
	Redstar.dorchain.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751431AbZBMIYS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Feb 2009 03:24:18 -0500
Content-Disposition: inline
In-Reply-To: <4992E3EE.2020308@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Roel Kluin <roel.kluin@gmail.com>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 11, 2009 at 03:42:54PM +0100, Roel Kluin wrote:
> With while (*ptr++ != 0x4489) { ... } *ptr will be incremented past 0x4489
> after
> the loop.

Yes, that is on purpose. The magic bytes of 0x4489 are a sync
mark, the interesting stuff always starts afterwards. The whole
decoding routing uses the current pointer the way that it always
points to the next unprocessed position when it arrives at the
next segment of decoding. I'd rather have this consistent in the
whole driver.

Bye,

Joerg

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmVKlwACgkQjY4+4PdzvOC0fgCfXKO+U7iKzB7zr8ELcINxEgpH
CGMAn1BfBjOtNAgtMu6nxpNo5g8ivn0X
=eF0h
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
