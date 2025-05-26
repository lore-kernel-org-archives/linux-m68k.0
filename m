Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089EDF9E8
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 18:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285417; cv=none; b=t8WrpBK407tiDsf1EsYP4FmQEzgT/k4DzbGJyqG+VAWfaBEPBELljXxCCfTMihZhi4XSI7u+swGRLm45VS67981qkWJSVfgIS9y6yShWRzFSKrmYXEosXDUautynwNV7OkkpKI8ApG/5tlswvuPxc54HunRByHXf5mbAOto/DfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285417; c=relaxed/simple;
	bh=bZhfNf7rke56UM6bWjzHkRBIfAU13PA9btUMlplX/Fc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mr+MerMb/4rA8mTwD/pMhI6ttpIt77gwWBWeLt6G2nypEfWE6s5M9N5oBku2oOOvSntuK8cTP6rpKCluyxg5YRH6LAKG5OsmiUa1mwa3qrIn8Qtp3b8jJPH3b/ANnzMvfZG8w/C6skqizC/DPROaUqALpmR0I8BslqlLKkA4DSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=D01rwTs6; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="D01rwTs6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BStHAIsh85iEjv1zPXcvs+nht52CaH0W4b4jOGicZuQ=; t=1748285415; x=1748890215; 
	b=D01rwTs6K1cuFmIKKffWP07RCuFE6gYMyOn7PoTiTd75Fi6KDDrPYdOiXpZRqqq9MjENcb+ExiM
	BhocbFN5pZF2aKuXb1mXUgHFOGseJuERBataXMrgcY25/wzZI0wLhaXMuv/eDhh5AKCbv8li52z84
	405OzfJIdYmeZdqZkAknP8xYfAjJPYLqIDqRYphopuDJiQuFZJlIUIQyag3e6tRo4SfBLq/EeNr9z
	rBI0cJEuXquhZ04EJKcSU7q7sOjscuvbWAHj2em0ob2lVg09cG9AxPN09OEAKx9bYcUUYvqgBZ8In
	eWFnr0S6eKOSRUl5eSoCe1Jmctx5n/axkxOQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uJcto-00000003BG3-3jkG; Mon, 26 May 2025 20:50:12 +0200
Received: from dynamic-078-054-122-178.78.54.pool.telefonica.de ([78.54.122.178] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uJcto-00000002vhS-2s4z; Mon, 26 May 2025 20:50:12 +0200
Message-ID: <db71b12ac8ad8dabce6b0781e42e1fc2d5fbc0fe.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jason Thorpe <thorpej@me.com>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 26 May 2025 20:50:12 +0200
In-Reply-To: <D8AE0197-8FE8-4986-9B1F-09B802BE5DEE@me.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <D8AE0197-8FE8-4986-9B1F-09B802BE5DEE@me.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Jason,

On Mon, 2025-05-26 at 11:25 -0700, Jason Thorpe wrote:
> > On May 26, 2025, at 8:05=E2=80=AFAM, John Paul Adrian Glaubitz <glaubit=
z@physik.fu-berlin.de> wrote:
> >=20
> > Now I'm wondering whether why some types on NetBSD such as double have =
8 bytes
> > alignment on a 32-bit system. Does anyone know the reasoning for that?
>=20
> Because that=E2=80=99s what is specified in the System V ABI for m68k.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://m680x0.github.io/ref/sysv-m68k-abi-=
part1.pdf
>=20
> See Figure 3-1.  =E2=80=9Cdouble=E2=80=9D and =E2=80=9Clong double=E2=80=
=9D are explicitly 8-byte aligned.

OK, that clarifies it, thank you!

FWIW, I have scanned the whole SysV ABI specification in case someone needs=
 it:

https://people.debian.org/~glaubitz/m68k-sysv-abi.pdf

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
