From: Rolf Anders <rolf.anders@physik.uni-augsburg.de>
Subject: Re: debian installation
Date: Wed, 30 Sep 2009 00:23:40 +0200
Message-ID: <20090929222339.GA44326@everest.Physik.Uni-Augsburg.DE>
References: <alpine.OSX.2.00.0909050045330.383@silk.local> <4AA2684E.1080009@codesourcery.com> <alpine.LNX.2.00.0909122039160.6219@nippy.intranet> <4AAC7CB6.2060400@codesourcery.com> <alpine.LNX.2.00.0909141827440.25347@nippy.intranet> <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com> <8259f0250909280700p7c28e82cye8b507d42427df25@mail.gmail.com> <alpine.OSX.2.00.0909290020580.412@silk.local> <8259f0250909280744t69991f25pb6a498775c57482d@mail.gmail.com> <8259f0250909290245n7328cae1nfe88cf6a2582ebf3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail0.RZ.Uni-Augsburg.DE ([137.250.121.11]:63459 "EHLO
	mail0.RZ.Uni-Augsburg.DE" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699AbZI2WpD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Sep 2009 18:45:03 -0400
Content-Disposition: inline
In-Reply-To: <8259f0250909290245n7328cae1nfe88cf6a2582ebf3@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2009 at 11:45:27AM +0200, mike wrote:
> Is there a problem with slip?
> When i do ifup sl0 i get siocsifflags no such file or directory

You probably need to run slattach first, which is in package net-tools.
You also need kernel-support for slip (CONFIG_SLIP).

Greetings,

Rolf

--=20
gpg public key: http://www-2.physik.uni-augsburg.de/~andersro/gpg-key.txt

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (AIX)

iD8DBQFKwojq8miTphsXxhgRApoGAJ9F0vvXriXODw9an7fj6S9a46OYpQCgj/Ue
yy3SWfAJ3vqZ2PHvQigz3Zo=
=aOIn
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
