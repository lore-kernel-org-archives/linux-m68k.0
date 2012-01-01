From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [m68k] partial success but does not boot: 3.2~rc7
Date: Sun, 01 Jan 2012 23:27:45 +0000
Message-ID: <1325460465.13595.179.camel@deadeye>
References: <Pine.BSM.4.64L.1201012102110.20109@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ALfsSJiQoGjbqh+fVAO9"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:43156 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751033Ab2AAX14 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 18:27:56 -0500
In-Reply-To: <Pine.BSM.4.64L.1201012102110.20109@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


--=-ALfsSJiQoGjbqh+fVAO9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-01-01 at 21:16 +0000, Thorsten Glaser wrote:
[...]
> =E2=80=A2 patches/0006-Bastian-Blank-do-not-error-out-when-kernel-wedge-r=
et.patch
>=20
> This is _from_ waldi via IRC:
>
> 18:10=E2=8E=9C<mirabilos> kernel-wedge install-files 3.2.0-rc7
> 18:10=E2=8E=9C<mirabilos> could not find kernel image at /usr/share/kerne=
l-wedge/commands/install-files line 103,
>      =E2=8E=9C    <KVERS> line 2.
> 18:11=E2=8E=9C<mirabilos> make[2]: *** [install-udeb_m68k] Error 2
> 18:11=E2=8E=9C=C2=ABwaldi=C2=BB ich dachte die fehler werden ignoriert =
=E2=80=A6#
>=20
> 19:03=E2=8E=9C<mirabilos> find: =04ebian/kernel-image-3.2.0-rc7-atari-di'=
: No such file or directory
> 19:03=E2=8E=9C<mirabilos> kernel-image-3.2.0-rc7-atari-di will be empty
> 19:03=E2=8E=9C<mirabilos> find: =04ebian/nic-shared-modules-3.2.0-rc7-ata=
ri-di': No such file or directory
> 19:03=E2=8E=9C<mirabilos> nic-shared-modules-3.2.0-rc7-atari-di will be e=
mpty
> 19:03=E2=8E=9C<mirabilos> hrm.
> 19:03=E2=8E=9C<mirabilos> waldi, was ist da kaputt?
> 19:03=E2=8E=9C<mirabilos> ich wars nicht
>=20
> I just wonder why this seems to have been needed in the first place.

It is quite possible that m68k kernel udebs have not been built for some
years, though the configuration has been updated along with other
architectures.

The module list for nic-shared-modules on m68k looks wrong in that there
are several driver modules listed there; those belong in nic-modules or
nic-extra-modules.  If m68k doesn't have any network drivers using the
library modules such as mii then the package should be disabled by
removing the module list file.

> 18:50=E2=8E=9C<mirabilos> -rw-r--r-- 1 root root 1845989 Jan  1 18:32
>      =E2=8E=9C    /var/cache/pbuilder/build/cow.937/tmp/buildd/linux-2.6-=
3.2~rc7/debian/linux-image-3.2.0-rc7-atari/boo
>      =E2=8E=9C    t/vmlinuz-3.2.0-rc7-atari
>=20
> $sourcedir wrong? $installedname wrong?

Did you also build the amiga and mac flavours?  The kernel-versions file
for m68k lists all three flavours.

> No idea whether this should be committed.

Hell no.  We must either fix or remove the kernel-wedge configuration
for m68k.  (I already did the latter for alpha.)

[...]
> =E2=80=A2 work and fail
>=20
> This is for debian-68k, linux-68k and debian-kernel:
>=20
> ARAnyM =E2=80=9Cconsole=E2=80=9D output of a working (3.0) and failing (3=
.2) boot,
> for your debugging pleasure. I can run arbitrary tests against the
> failing kernel, as long as they=E2=80=99re limited to [LILO].Args or make
> it boot ;-)

This is presumably triggered by enabling CPU topology information in
sysfs on UP systems.  This is a Debian patch for 3.2
(features/all/topology-Provide-CPU-topology-in-sysfs-in-SMP-configura.patch=
) but has been accepted upstream for 3.3.

My guess is that on m68k get_cpu_sysdev(0) returns NULL and thus
topology_add_dev() passes an invalid pointer into sysfs_create_group().
So either m68k (and maybe some other architectures with no SMP support)
need to be fixed or the CPU topology code needs to allow for this.

Ben.

--=20
Ben Hutchings
Humour is the best antidote to reality.

--=-ALfsSJiQoGjbqh+fVAO9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATwDr8ee/yOyVhhEJAQreThAAilc7ABEGVArjIi3cn9qJqP3J5oHfgPJ5
w5jAPoCyZwP/xcu+K64nGOGhVDmsrM9P2mguGmp/Mp7kugBl8Nj0aXe1GhmEbaY2
aqhzc2zuGos/BLM7q2yb9pXHuu5Q1VLJ55EbX/pzyisgNq2dzGKmLw5Wt8F1A5t7
i94ynAJHnlttuKkYr3Q82kb+/jxEQNnDFEX0mVtguFfqIFobjfAtl8uVzMxdOWMT
bRuI1wHOKj7DDEi0a6oU05eTJbjZXe4EA+d4IYqwa5kkepJg9A9ptsL1hggR33nu
Xo6NL817A3iSFXIoJlxJ5anulIiXIR2tSJDHNAjIxDg+JOBQzgV+dARN6q3O1KeJ
uODtaNb4QsyLEkIQCIuNH9yo/ObRU9riuphnNo5a+fBMMi7ytDyQ8ixEvaoGoWFy
QiJ9K6aRp6QnX/vB4jFmff115YL6wZk2EoGjO7LMPEuNVQ9smv3Lh8YvL/U4S/Sw
NvwkdWWWd/SwHCKEPrFnl+9p397bHdPgUvPfy6qkB+KvBuZHv1WEAdljqTPIxxbl
nYsM7YuHj3Dkq4GK02IRg3g4HOgWfJJKFuu7IEe2D0uqeAUhYgKdN4rp6bS9xkbX
qy3ZN2Junkzh5K2QV7fQ9q4TAOX2us0CcKKegxXx0Tu/O26LjsDGFsVumpluQrcZ
g+9t626PIHg=
=7VaH
-----END PGP SIGNATURE-----

--=-ALfsSJiQoGjbqh+fVAO9--
