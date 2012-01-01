From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [m68k] partial success but does not boot: 3.2~rc7
Date: Sun, 01 Jan 2012 23:53:45 +0000
Message-ID: <1325462025.13595.189.camel@deadeye>
References: <Pine.BSM.4.64L.1201012102110.20109@herc.mirbsd.org>
	 <1325460465.13595.179.camel@deadeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qm0r94sO7IOrYWHlcEDs"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:43325 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751033Ab2AAXx6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 18:53:58 -0500
In-Reply-To: <1325460465.13595.179.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


--=-qm0r94sO7IOrYWHlcEDs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-01-01 at 23:27 +0000, Ben Hutchings wrote:
> On Sun, 2012-01-01 at 21:16 +0000, Thorsten Glaser wrote:
[...]
> > =E2=80=A2 work and fail
> >=20
> > This is for debian-68k, linux-68k and debian-kernel:
> >=20
> > ARAnyM =E2=80=9Cconsole=E2=80=9D output of a working (3.0) and failing =
(3.2) boot,
> > for your debugging pleasure. I can run arbitrary tests against the
> > failing kernel, as long as they=E2=80=99re limited to [LILO].Args or ma=
ke
> > it boot ;-)
>=20
> This is presumably triggered by enabling CPU topology information in
> sysfs on UP systems.  This is a Debian patch for 3.2
> (features/all/topology-Provide-CPU-topology-in-sysfs-in-SMP-configura.pat=
ch) but has been accepted upstream for 3.3.
>=20
> My guess is that on m68k get_cpu_sysdev(0) returns NULL and thus
> topology_add_dev() passes an invalid pointer into sysfs_create_group().
> So either m68k (and maybe some other architectures with no SMP support)
> need to be fixed or the CPU topology code needs to allow for this.

None of these architectures appears to call register_cpu():

    c6x frv h8300 m68k microblaze openrisc score um xtensa

and therefore they will all panic at boot following this change (commit
ccbc60d3e19a1b6ae66ca0d89b3da02dde62088b).  So either I can try to fix
them or else it must be reverted for now.

Ben.

--=20
Ben Hutchings
Humour is the best antidote to reality.

--=-qm0r94sO7IOrYWHlcEDs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATwDyCue/yOyVhhEJAQpX7RAAvjhjOkfqiMEBI8tWnZUHUnGUiwfmoIQs
/WUCMQGCU9NI6OTPstDKooXCl+wPr3vSNQ5DoCFrK9kR7DJSQ0/qAvSCNiOyyynU
EhOwvVOkbr/meP6a8DJSd7Jer+Nsa8fvgeQKmzhbR/Qzj0DqSybZUXfze0qKtVdx
lmJ/1jL3bRV+MITB4cF/OicLmuXHkWyGK1+OOlqf3ngVdT9eCh4uFdRR5sSHXoeT
pIbyGlVxulTSPc1zVIaYvw3HOdbmfdlkINA7Azf/QpOWAxCYkB9/QTCu6SH3AI2I
dsous/AVZ4339/uytwL99YPTx0/Bc2iok2ZZZsTh7TYICcfx6Ead295eAgAEpjJn
JFC/Ko3H3RposXStX4x7TvKStQy8hBWK7xNN7nv9MinoZ3ZUHqim4fYMfg/ms3jl
QXGTVRvKj9cfkXuUV1DA9SRyKErxSREDKjQH6spihX98kijg+a35YSd1mA8lbbvK
kDVR4oTwEnHIhc2Rb7AYUNaPpQ73NQB5fCWJ4AqnmUopBxsC4Trbe06rmeOlN3Tq
CXAFHs8pP3aAIqc3L0EcCgZtLzqDHgziC/zv7o3Htafl/Qgg5fJSPCvZ554vKwDw
TO+TDp6geVajEGvKsOY+MMVegP4VzaisMwmXQIQpgrMhE/tbpN5RcVuefr1qz4rf
BnH15zCzfx0=
=+qAR
-----END PGP SIGNATURE-----

--=-qm0r94sO7IOrYWHlcEDs--
