Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AFEEB64D7
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jun 2023 11:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjFWLmY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Jun 2023 07:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFWLmX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Jun 2023 07:42:23 -0400
X-Greylist: delayed 451 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Jun 2023 04:42:22 PDT
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E5C1987
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Jun 2023 04:42:22 -0700 (PDT)
Received: by lug-owl.de (Postfix, from userid 1001)
        id 8BA1A42081; Fri, 23 Jun 2023 13:34:37 +0200 (CEST)
Date:   Fri, 23 Jun 2023 13:34:37 +0200
From:   Jan-Benedict Glaw <jbglaw@lug-owl.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] m68k: Fix invalid .section syntax
Message-ID: <20230623113437.4iqjixlw7eryolqt@lug-owl.de>
References: <ZIyBaueWT9jnTwRC@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h7nz5csw3iqgzu4z"
Content-Disposition: inline
In-Reply-To: <ZIyBaueWT9jnTwRC@decadent.org.uk>
X-Operating-System: Linux chamaeleon 5.14.0-0.bpo.2-amd64
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy listeners explosion
 sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you.
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--h7nz5csw3iqgzu4z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, 2023-06-16 17:36:10 +0200, Ben Hutchings <ben@decadent.org.uk> wrot=
e:
> gas supports several different forms for .section for ELF targets,
> including:
>     .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
> and:
>     .section "NAME"[, #FLAGS...]
>=20
> In several places we use a mix of these two forms:
>     .section NAME, #FLAGS...
>=20
> A current development snapshot of binutils (2.40.50.20230611) treats
> this mixed syntax as an error.

I stepped into this as well, and think it's a bad thing to break
working code along with giving a bad error message:

[mk all 2023-06-23 08:34:34] # AS      arch/m68k/fpsp040/skeleton.o
[mk all 2023-06-23 08:34:34]   m68k-linux-gcc -Wp,-MMD,arch/m68k/fpsp040/.s=
keleton.o.d -nostdinc -I./arch/m68k/include -I./arch/m68k/include/generated=
  -I./include -I./arch/m68k/include/uapi -I./arch/m68k/include/generated/ua=
pi -I./include/uapi -I./include/generated/uapi -include ./include/linux/com=
piler-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -fmacro-pre=
fix-map=3D./=3D -D__ASSEMBLY__ -fno-PIE -m68040    -c -o arch/m68k/fpsp040/=
skeleton.o arch/m68k/fpsp040/skeleton.S=20
[mk all 2023-06-23 08:34:34] arch/m68k/fpsp040/skeleton.S: Assembler messag=
es:
[mk all 2023-06-23 08:34:34] arch/m68k/fpsp040/skeleton.S:502: Error: junk =
at end of line, first unrecognized character is `#'
[mk all 2023-06-23 08:34:34] arch/m68k/fpsp040/skeleton.S:508: Error: junk =
at end of line, first unrecognized character is `#'
[mk all 2023-06-23 08:34:34] make[3]: *** [scripts/Makefile.build:374: arch=
/m68k/fpsp040/skeleton.o] Error 1
[mk all 2023-06-23 08:34:34] make[2]: *** [scripts/Makefile.build:494: arch=
/m68k/fpsp040] Error 2
[mk all 2023-06-23 08:34:34] make[1]: *** [scripts/Makefile.build:494: arch=
/m68k] Error 2
[mk all 2023-06-23 08:34:34] make: *** [Makefile:2026: .] Error 2

> References: https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=
=3Dm68k&ver=3D6.4%7Erc6-1%7Eexp1&stamp=3D1686907300&raw=3D1
> Signed-off-by: Ben Hutchings <benh@debian.org>

As per pers.comm. with Geert:

References: http://toolchain.lug-owl.de/laminar/jobs/linux-m68k-virt_defcon=
fig/34
Tested-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>

MfG, JBG

--=20

--h7nz5csw3iqgzu4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCZJWDSgAKCRAdvV51g5nh
u1huAJdRZFQDMZtiXe/qnZtCWovlmpS+AJ4l9POIs4oxL3qDIoXDbCcxCqyJ1Q==
=Akks
-----END PGP SIGNATURE-----

--h7nz5csw3iqgzu4z--
