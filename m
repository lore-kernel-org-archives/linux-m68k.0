From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: [PATCH] amiflop: get rid of sleep_on calls
Date: Tue, 9 Dec 2008 09:26:08 +0100
Message-ID: <20081209082608.GA10651@Redstar.dorchain.net>
References: <1228755578-26069-1-git-send-email-aeb@debian.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from RedStar.dorchain.net ([212.88.133.153]:44192 "EHLO
	Redstar.dorchain.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753215AbYLIIxd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Dec 2008 03:53:33 -0500
Content-Disposition: inline
In-Reply-To: <1228755578-26069-1-git-send-email-aeb@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Bombe <aeb@debian.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 08, 2008 at 04:59:38PM +0000, Andreas Bombe wrote:
> The replacement for the unconditional sleep_on() in fd_motor_on() is a
> complete_all() together with a INIT_COMPLETION() before the mod_timer()
> call.  It appears to me that fd_motor_on() might be called concurrently
> and fd_select() does not guarantee mutual exclusivity in the case the
> same drive gets selected again.

Selecting the same drive repeatly does not matter. The selected
drive is the one the next command or transfer applies to.

It is possible to select one drive, start the motor, select the
next one, start the motor, as long as as trasnfer is tried until
the drive is up to speed (either by signal or the timeout)

At first glance, the patch looks ok.

Bye,

Joerg

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk+K6AACgkQjY4+4PdzvOAInQCeMimYOg9/ZFRn12nvlSWMcEp+
IA0AoIOMiGFlazwfBeE1iOpdDjNgGmGG
=BNAn
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
