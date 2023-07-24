Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2193C001DF
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 17:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjGXRhM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 13:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjGXRhL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 13:37:11 -0400
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D545698
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 10:37:09 -0700 (PDT)
Received: from [213.219.164.29] (helo=deadeye)
        by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1qNzUZ-0000fA-IF; Mon, 24 Jul 2023 19:37:07 +0200
Received: from ben by deadeye with local (Exim 4.96)
        (envelope-from <ben@decadent.org.uk>)
        id 1qNzUZ-003dCn-01;
        Mon, 24 Jul 2023 19:37:07 +0200
Message-ID: <c828c0f32beec48e9f7c628fc8cbe2dcfb19cea1.camel@decadent.org.uk>
Subject: Re: [PATCH] m68k: Fix invalid .section syntax
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Date:   Mon, 24 Jul 2023 19:37:02 +0200
In-Reply-To: <CAMuHMdW4deu65FdW7qGSYoQDLWmjqcz_oReQY+GKS-EtxERFJQ@mail.gmail.com>
References: <ZIyBaueWT9jnTwRC@decadent.org.uk>
         <CAMuHMdW4deu65FdW7qGSYoQDLWmjqcz_oReQY+GKS-EtxERFJQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-tIURyyDEzrnNtxz2+Qrp"
User-Agent: Evolution 3.48.4-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 213.219.164.29
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--=-tIURyyDEzrnNtxz2+Qrp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-24 at 14:58 +0200, Geert Uytterhoeven wrote:
> Hi Ben,
>=20
> On Fri, Jun 16, 2023 at 5:47=E2=80=AFPM Ben Hutchings <ben@decadent.org.u=
k> wrote:
> > From: Ben Hutchings <benh@debian.org>
> >=20
> > gas supports several different forms for .section for ELF targets,
> > including:
> >     .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
> > and:
> >     .section "NAME"[, #FLAGS...]
> >=20
> > In several places we use a mix of these two forms:
> >     .section NAME, #FLAGS...
> >=20
> > A current development snapshot of binutils (2.40.50.20230611) treats
> > this mixed syntax as an error.
[...]
> I verified there is no difference in the generated object files with my
> current toolchain (GNU assembler version 2.38 (m68k-linux-gnu)
> using BFD version (GNU Binutils for Ubuntu) 2.38).
>=20
> Do you think it's worthwhile to fast-track this for v6.5, or is it fine t=
o
> queue this for v6.6?

The new version of binutils has been in Debian unstable for over a
month now.  I think this should be fast-tracked.

Ben.

--=20
Ben Hutchings
When in doubt, use brute force. - Ken Thompson


--=-tIURyyDEzrnNtxz2+Qrp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmS+tr4ACgkQ57/I7JWG
EQl1+Q/+KDXC3wnOULul/6eIgJtzXYPMuHHjpft3JEwwGuR6rPU0wh1t0Wyi2j14
A+ZYaS2hfgWouGiZ7tmn5DTAwerMAPlZ96W3o9k6rB2mvlKdHJ5vvoijUtpjzzmS
8FQqZiLlOo5cQdc46/BzPKkLMNqXquaW8qLHlS8tNqwdmT7Az17HLp2dbLT5+VCd
dbzBWIN80E1bX1CaAdiiNKkVZvbAr6LHK1cHIppfoOrxiYp7TE8XQJvjHOfwc11T
BUU5qwoU6r52qI8EWC0llVoG9oPMSB3PFj6+VB6OT4fI2UiHs52f2Qm5+7424kd1
ilNzOhLSVNjqyBjtn1+yWa/GWisBm/tDk8XyviNIuxbwBHdrL/JljNAi9sO5ABbp
brvXXPZCG9bJahMKP8uyJpxDST7Eq8HKJG+X39ubsPtiYWxn3X0YgHyMlvsoCz8m
MMcVu4Fym2iRkiPJ7TFoGw7bqzmT+Z6sBc+JHDff9I3BsQjtJq1S0YMRrW9yB0A3
FvsZudS78eVfvdphlx0b3/GttcmgsZmjamRrpYOw7Y4O/jFS8U6NwDcSp2Stc8Qq
DyFSztlZVayanrGR0cqFgb/fnpHjPDNlr/oTjLOUw4rlUd6KrCUmoW+siDs2YAYk
EQ6azQDUkzlLLD+384wP8Xd/7E9kCRjpdafn9JuzIUTBwmPlbXg=
=ReyT
-----END PGP SIGNATURE-----

--=-tIURyyDEzrnNtxz2+Qrp--
