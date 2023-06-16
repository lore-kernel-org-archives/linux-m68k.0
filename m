Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1EAEB64D8
	for <linux-m68k@archiver.kernel.org>; Fri, 16 Jun 2023 15:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346074AbjFPPgq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 16 Jun 2023 11:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345783AbjFPPgk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 16 Jun 2023 11:36:40 -0400
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF5735AB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jun 2023 08:36:12 -0700 (PDT)
Received: from [213.219.167.32] (helo=deadeye)
        by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1qABUg-0003L8-O9
        for linux-m68k@lists.linux-m68k.org; Fri, 16 Jun 2023 17:36:10 +0200
Received: from ben by deadeye with local (Exim 4.96)
        (envelope-from <ben@decadent.org.uk>)
        id 1qABUg-006ZlI-0l
        for linux-m68k@lists.linux-m68k.org;
        Fri, 16 Jun 2023 17:36:10 +0200
Date:   Fri, 16 Jun 2023 17:36:10 +0200
From:   Ben Hutchings <ben@decadent.org.uk>
To:     linux-m68k@lists.linux-m68k.org
Subject: [PATCH] m68k: Fix invalid .section syntax
Message-ID: <ZIyBaueWT9jnTwRC@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5DM8Jkck0e0SMJ7i"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 213.219.167.32
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--5DM8Jkck0e0SMJ7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Ben Hutchings <benh@debian.org>

gas supports several different forms for .section for ELF targets,
including:
    .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
and:
    .section "NAME"[, #FLAGS...]

In several places we use a mix of these two forms:
    .section NAME, #FLAGS...

A current development snapshot of binutils (2.40.50.20230611) treats
this mixed syntax as an error.

Change to consistently use:
    .section NAME, "FLAGS"
as is used elsewhere in the kernel.

References: https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Dm=
68k&ver=3D6.4%7Erc6-1%7Eexp1&stamp=3D1686907300&raw=3D1
Signed-off-by: Ben Hutchings <benh@debian.org>
---
These changes are compile-tested only.

Ben.

 arch/m68k/fpsp040/skeleton.S       | 4 ++--
 arch/m68k/ifpsp060/os.S            | 4 ++--
 arch/m68k/kernel/relocate_kernel.S | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
index 439395aa6fb4..081922c72daa 100644
--- a/arch/m68k/fpsp040/skeleton.S
+++ b/arch/m68k/fpsp040/skeleton.S
@@ -499,13 +499,13 @@
 	dbf	%d0,morein
 	rts
=20
-	.section .fixup,#alloc,#execinstr
+	.section .fixup,"ax"
 	.even
 1:
 	jbsr	fpsp040_die
 	jbra	.Lnotkern
=20
-	.section __ex_table,#alloc
+	.section __ex_table,"a"
 	.align	4
=20
 	.long	in_ea,1b
diff --git a/arch/m68k/ifpsp060/os.S b/arch/m68k/ifpsp060/os.S
index 7a0d6e428066..89e2ec224ab6 100644
--- a/arch/m68k/ifpsp060/os.S
+++ b/arch/m68k/ifpsp060/os.S
@@ -379,11 +379,11 @@ dmwls:	move.l		%d0,(%a0)		| store super longword
=20
=20
 | Execption handling for movs access to illegal memory
-	.section .fixup,#alloc,#execinstr
+	.section .fixup,"ax"
 	.even
 1:	moveq		#-1,%d1
 	rts
-.section __ex_table,#alloc
+.section __ex_table,"a"
 	.align 4
 	.long	dmrbuae,1b
 	.long	dmrwuae,1b
diff --git a/arch/m68k/kernel/relocate_kernel.S b/arch/m68k/kernel/relocate=
_kernel.S
index ab0f1e7d4653..f7667079e08e 100644
--- a/arch/m68k/kernel/relocate_kernel.S
+++ b/arch/m68k/kernel/relocate_kernel.S
@@ -26,7 +26,7 @@ ENTRY(relocate_new_kernel)
 	lea %pc@(.Lcopy),%a4
 2:	addl #0x00000000,%a4		/* virt_to_phys() */
=20
-	.section ".m68k_fixup","aw"
+	.section .m68k_fixup,"aw"
 	.long M68K_FIXUP_MEMOFFSET, 2b+2
 	.previous
=20
@@ -49,7 +49,7 @@ ENTRY(relocate_new_kernel)
 	lea %pc@(.Lcont040),%a4
 5:	addl #0x00000000,%a4		/* virt_to_phys() */
=20
-	.section ".m68k_fixup","aw"
+	.section .m68k_fixup,"aw"
 	.long M68K_FIXUP_MEMOFFSET, 5b+2
 	.previous
=20

--5DM8Jkck0e0SMJ7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmSMgWoACgkQ57/I7JWG
EQnv9Q/5AQu2uKZmxeKUjmrs3UBATDI1FPc2DHTSRcyZ1rwctR/wrr/7Fe3QVBCx
wVpuU9oxiZlKNCNMo9ngQ0UJyH/M7LGkUQ3lj1KKDaMdNUdqMJXWV8m+CTvjEJUA
o5ocPASP8N0abILOwACfODDhUfvUu+ljmxOg1vjUFbhfTr4uGD4gEWSlSJwxLFsr
Zj7YnGaLaCku32HvmJoO1pPDU3bVFbPflNw8H+Q0chgIcg+0tzVP8kSl11KU4px2
NyAPvYTQxEseD6PjxgjyfsexEaOFUIVnJPHJeJ34yJ33cmMRb4eICdZCkOMN3ji6
3iu5ctF9WPbAkYJLRJ+qx6R8u8PtpeUbbL1eFqXrXLSMAOQ6tohAQmbMukSPMJpj
eceNhym7Vjw7voEogZXvKHNghc2aZecQ+VLOuVyK1pgPBZfY5tT+vWjevjSuUZit
fvGy4t9Q+vxDtXWqYHbdc2fqRAtR+SKKbtWYatIEd7XuSmQo7zDEuzuR92ly9q3r
6Wip7MivsEAfWTMqsb/sge4sphQPYZj/RhiqPxVU5kyn87709SYQel1/rqyKLDFA
Li0wZLgDUrnw3o0tZYHLECcA6GvJZylghL6vgwt4X+I1rpXAauo/9cE7QiULmPx+
qwrgLMaEFcmSvztph/xzHP+5ItodHMFczmmo3349H36VKNsQ7xs=
=ur9M
-----END PGP SIGNATURE-----

--5DM8Jkck0e0SMJ7i--
