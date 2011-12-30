From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Fri, 30 Dec 2011 18:06:13 +0100
Message-ID: <1325264773.13595.133.camel@deadeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-P3uJrSCEqYGaucbRNutn"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50582 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750877Ab1L3RGi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 30 Dec 2011 12:06:38 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: aufs-users@lists.sourceforge.net, Thorsten Glaser <tg@mirbsd.de>, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


--=-P3uJrSCEqYGaucbRNutn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AUFS_NAME is only defined in aufs_type.h but pr_fmt may be used in
headers included before aufs_type.h.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This should fix the build failure reported in
<http://lists.debian.org/debian-kernel/2011/12/msg00460.html>.

An alternative change was proposed in
<http://lists.debian.org/debian-kernel/2011/12/msg00482.html>.

Ben.

 fs/aufs/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/aufs/Makefile b/fs/aufs/Makefile
index 58ad988..9594b8a 100644
--- a/fs/aufs/Makefile
+++ b/fs/aufs/Makefile
@@ -5,7 +5,7 @@ include ${srctree}/${src}/magic.mk
 # enable pr_debug
 ccflags-y +=3D -DDEBUG
 # sparse doesn't allow spaces
-ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func=
__,__LINE__,current->comm,current->pid'
+ccflags-y +=3D -D'pr_fmt(fmt)=3D"aufs\040%s:%d:%s[%d]:\040"fmt,__func__,__=
LINE__,current->comm,current->pid'
=20
 obj-$(CONFIG_AUFS_FS) +=3D aufs.o
 aufs-y :=3D module.o sbinfo.o super.o branch.o xino.o sysaufs.o opts.o \
--=20
1.7.7.3



--=-P3uJrSCEqYGaucbRNutn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATv3vhue/yOyVhhEJAQqEhw//R1nicBJLWAnV/uUxEGQAQHKBqhMJY6LJ
T0l+9QIEB9JBd2XKpzP6MNuu6vnx7rRA7fhVv3scP0ppmq0QW5VPEuXeEXwhLFBh
u2upAKCPH9pOIqNoVnRKms3UWk6/0eSMQntSwPvJYFU7vkAoJ65ZpkpI1U9BSFHg
ORa1Y0JoJmnHIezQUBBlcPy04EJFntpgNPScPjX9qiPB3M7re5TL6MeJ3dbEE6mD
RNl8bLcXJFwy2kiiqStQfhUi5GOKafC1rGC7eqq6kNwmTJTFh9SSsLAuK8PDtcSH
Yj+Cgk6/4LKGYs+N7xoCbtTQo115OqOj2r+diFYSYcrDGCW/1vCqZ2zdzzkTsC9m
WoDd55o2+bADwciozagAewbMlQrJK13+aFUOCTWSl2ETcImubTDOJZn/DbVuWuYP
IddrZVAP/4PfwQ3H3vABBQSyzUCPtcthiy+Tc5o6+nCU/35HP46PQRb/J1UgIi3d
xaO4CCs07viILBsktxRIt3uRBkr+uC/F3dOycFnKey5+S0D+O+9xpbtFxvIqwZ1R
Yt7qoMlAG8Kwou7+CbYfMIlcJCBN5GKysYGaB8yzVl16kJRijk3pJmhfTznSlS05
UBMWSS+A/alCEwT+ukaFy6RoUhKCKVBEhQKSVjJn9Lfh6RyjhOF//f1WTYjRK/wu
FAalrT5S2ms=
=zF9P
-----END PGP SIGNATURE-----

--=-P3uJrSCEqYGaucbRNutn--
