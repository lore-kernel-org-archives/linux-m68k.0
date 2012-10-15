From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH 1/4] Add linux/io.h to make it compile
Date: Mon, 15 Oct 2012 16:39:55 +0200
Message-ID: <20121015143954.GA16696@frolo.macqel>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com> <20121015135829.GA3961@frolo.macqel> <1512C13C0C5EA947AE50B9B9AC314F470343F024@ATLAS.pactenovation.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([194.78.208.39]:24568 "EHLO smtp2.macqel.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781Ab2JOOkD (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 15 Oct 2012 10:40:03 -0400
Content-Disposition: inline
In-Reply-To: <1512C13C0C5EA947AE50B9B9AC314F470343F024@ATLAS.pactenovation.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <smarcel@pactenovation.fr>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hello Stany,

On Mon, Oct 15, 2012 at 04:06:47PM +0200, Stany MARCEL wrote:
> Hello Philippe,
>=20
> It does not compile with my config (MMU on), io.h header is missing f=
or __raw_* operations.

Actually, the problem seems to be more in the .h files, that should
provide the same set of macros/functions regardless of CONFIG_MMU
or not.

I have a similar problem with out_be32 available from asm/io.h in
CONFIG_MMU mode, but not without CONFIG_MMU.

Greg, Geert ?

Best regards

Philippe


>=20
> But it might compile with MMU disabled.
>=20
> Regards
>=20
> -----Message d'origine-----
> De=A0: Philippe De Muyter [mailto:phdm@macqel.be]=20
> Envoy=E9=A0: lundi 15 octobre 2012 15:58
> =C0=A0: Stany MARCEL
> Cc=A0: linux-m68k@vger.kernel.org; gerg@uclinux.org
> Objet=A0: Re: [PATCH 1/4] Add linux/io.h to make it compile
>=20
> Hello Stany,
>=20
> On Mon, Oct 15, 2012 at 02:54:37PM +0200, Stany MARCEL wrote:
>=20
> > [PATCH 1/4] Add linux/io.h to make it compile
>=20
> You could probably be more precise in your patch title :)
>=20
> What error message did you get without your patch ?
>=20
> I compile m54xx_wdt.c without CONFIG_MMU without error.
>=20
> Best regards
>=20
> Philippe

--=20
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Brux=
elles
