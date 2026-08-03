Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E83AE715
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Aug 2026 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747402; cv=none; b=m/66rDhkCdmSyAGCWWDvfyRsQC3JJZBfMnlLcIoufBnVt3gaE3zsidhIUoy29dGvXCYkMffRlMhHIAzdiPsDYotY5MtVWJ5e+kDgToxe8aNUoUV9xjtVCfVIx338Kff3mIIvNqlU+2sHAwXdyl2U8VSuj8zkyx8jDJWixAaIVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747402; c=relaxed/simple;
	bh=BDLq/NoxaYwiIRYWEvn+qvnTLUCmawEluucBEKLoL+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGrvtgKA/gzHrO3JM65vMbtgk4VphGjDrMFuwiZ+BZZx7ZsTV1uRfR+dRtY6IkdyQ8xqMOnegW9sSUUnmvKgOB2/S66AraP7eed4qVK1p+zaCNA7G6muR4aHuKx+m6Mklb+q5xppXcCQMWy2g5uxWoP96xKfIOFp+PZf3fZlzCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B66iWkS3; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B66iWkS3"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id D75DC4072D;
	Mon,  3 Aug 2026 08:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 328501F000E9;
	Mon,  3 Aug 2026 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785747400;
	bh=2B2uvBuClTnbKM5Zvf3swHERAIfkSTELMLfTlRW2teU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B66iWkS3bvxZW9r8tk/hyCJlICqllWCppy+HFQ/quPWxrsIzL5kIRc5nnmfMPd8sC
	 gUpRmnRM9JjTN1vchNUPzHOK9TAxMQo47m2mw26y/E7T3YOMj2eCldBWZoGjqBuylM
	 SkNV3jhGy3jBmOLmzjSQvg9dSCrQFD4Z84HVSyR5uHWO3U0LM1XqZov8vpb/ibQ2a6
	 1vjxC10iVM7h1BydPemQFwBE/CKbPoizND00OJ/KUMvV08LOIOR8E3PFDXmELE3RU/
	 hx+4nS3lKRMlmda6rGJDx4FEp7U5nGqSo9dtkPthlsrwB/9TLTVtCJS9hm6odBtACP
	 Qce3EZdmDi78A==
Date: Mon, 3 Aug 2026 10:56:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gao Xiang <xiang@kernel.org>, 
	Michael Bommarito <michael.bommarito@gmail.com>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Define NR_CPUS to 1
Message-ID: <anBXIAqwllKX-Sxx@monoceros>
References: <20260731094950.1988084-2-ukleinek@kernel.org>
 <CAMuHMdVGKX=3cfOrLWp1uSHX76xf1-=C0+GVCXkA8JTqNPg-ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xm5bakmko2rqbza"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGKX=3cfOrLWp1uSHX76xf1-=C0+GVCXkA8JTqNPg-ew@mail.gmail.com>


--4xm5bakmko2rqbza
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] m68k: Define NR_CPUS to 1
MIME-Version: 1.0

On Mon, Aug 03, 2026 at 09:58:14AM +0200, Geert Uytterhoeven wrote:
> Hi Uwe,
>=20
> Thanks for your patch!
>=20
> On Fri, 31 Jul 2026 at 11:50, Uwe Kleine-K=F6nig <ukleinek@kernel.org> wr=
ote:
> > This fixes a Kconfig warning
> >
> >         fs/erofs/Kconfig:137:warning: range is invalid
> >
> > which originates from EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS using
> > NR_CPUS which up to now didn't exist for ARCH=3Dm68k. All other
> > architectures define this symbol, so fix the outlier.
>=20
> Apart from the Kconfig warning, this also
>   1. Breaks pressing "ENTER" in "make oldconfig" to apply a sensible
>      default value, just repeating the question ad infinitum instead
>      (the default is 16),
>   2. "make olddefconfig" sets it to literal NR_CPUS, which is invalid, to=
o.
>=20
> > Fixes: c9b47e6b2311 ("erofs: cap LZMA stream pool size")
> > Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
>=20
> > --- a/arch/m68k/Kconfig.cpu
> > +++ b/arch/m68k/Kconfig.cpu
> > @@ -549,6 +549,10 @@ config CACHE_COPYBACK
> >  endchoice
> >  endif # HAVE_CACHE_CB
> >
> > +config NR_CPUS
> > +       int
> > +       default "1"
>=20
> While this does fix the issues on m68k, I don't think this is the
> right fix:
>   - NR_CPUS depends on SMP on most architectures, so you do not get
>      the "range is invalid" warning on non-SMP, but NR_CPUS is zero.
>     Hence I managed to reproduce the two issues above (albeit 2 with
>     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D0) with a non-SMP
>     ARM config.
>   - Kconfig logic using NR_CPUS typically includes a check for SMP, too.
>=20
> So I think EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS should be fixed
> instead.

Agreed, probably it should depend on SMP, too.

Thanks for your feedback
Uwe

--4xm5bakmko2rqbza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpwV7kACgkQj4D7WH0S
/k4trwgAkwblevNimVZBgYfsHYEmsQ0zcz8tpUcW2SdiHTgqxgbfG3JUfNGhuXkC
8eZMDfl2hSuERqhKbfUyU4pccEpjYSwwFMe26wyAcQKpDwkaONjbHdA3nBbVuxy5
lVj1YOp469FEwhMxGWEEjrjaKOZSMOoR3Xi59YNKCtxlwJbUxnVxui+BRsohuvE0
bnGWDs8Dc5phlheHkuI8SnCsNVboufj4BqY9nQ8iOmNroQylrMbYKL9S4CMjHkeV
dgOsb/MZErv5hKtUxqUrsDZ7ouy+a/A9gL65+HucXP63pVWIDq+QIZE+Ctq8NHod
C1v2kh4VDQwzXZ0xEBicynvHFbjUww==
=TiFt
-----END PGP SIGNATURE-----

--4xm5bakmko2rqbza--
