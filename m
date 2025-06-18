Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED31CD1E1
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216695; cv=none; b=A5UGv1j7WfK9Kflf2wRodLvhALbWNlHybRHlUgirZDlwqFXhCnB5M4bE/O2JF5DLWZ24lunUBiP2RXVIK9S8BrFMZgKLIeEAhJtMZhQx5kMfoManeLyEZllGXgVv8q8hwbKKptYWUz8K0Gl5wAGA0bGkXLErcxNTeIMv1Yajmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216695; c=relaxed/simple;
	bh=dQrP23vip4ITfQG3UsfNRvL3eQqHdhkPXLgcwqk0spE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MfDeCtg77FZ9R/bxUPQWm/Va7wAXFimEalyTLFI8dsnXHMomts9avTF3bHF8M/qTlgySqbGRnc8uKR26kJEzEiBpmQIpJTpbmLDXoTzBml5mOp5B2pzJlB/V2xDvtoqrWbyFrKhwHiOg/wP7HS0geTPYAPvGtOCr79R7aEAMle8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M30KQcE0; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M30KQcE0"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AC9BE25400E0;
	Tue, 17 Jun 2025 23:18:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 17 Jun 2025 23:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750216690; x=1750303090; bh=Sl4eA/7Pzhsev48e5yBWF82Uesylx4nG2rk
	gPHQy9Ck=; b=M30KQcE0oInPn+IdTNR2Wq2nh6+VTRIU+V4ogmmSASasbgersFK
	L/ugQg/H0L5hq7fQbM/CjIqZxOlsN+HUwYIGbGSFbjWM7j21H6Rke4qWFgU1S6V5
	VgUPOmcRB91KJKpOcYv+LEqigqLUbHEjj6hYMY18wQaTBx/nVXpzAWs7d4xb0mlk
	BLccbBt4ppdwJ3aebXgmaNg3AunjPgv9qM7SvoRjJWKhAwxvd52JzF9+mLbLmg3s
	CLv46ElKnHqSMpvIVfjZdWDYtNs7G4KMrxRVZv2HXD/rUrXuoqgTLsw/SmVxoA+B
	/lAlvebe3n7KVZnAYgKKDUMSjj4p7ybjJww==
X-ME-Sender: <xms:8S9SaAiVPzwtcuO62vz4e_mBElq5oDV9PTnaFC6_mIKiYdpU4kIgAw>
    <xme:8S9SaJDATWL_XVn0m0J_OCFiw9sXlM_vq4vTclt2egAYUbvV19CWHSVA3VXy-NBtv
    pK1ytWEzBqifZL3fLk>
X-ME-Received: <xmr:8S9SaIG1PBIDr4dpoS8NLUdzYuIHOm8zRmpIK1Ygexc7hdYPfaecw3pmhu0xHu3gtmtX8FbEjGgY0yYhi_L84XSUV9eVWxXDK0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeevvdeluedufedtledtgedtueefheekheekjeeg
    geekgeelhedtheeitedvffegleenucffohhmrghinhepfihikhhiphgvughirgdrohhrgh
    dpshhouhhrtggvfigrrhgvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhr
    phgvjhesmhgvrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthesvhhivhhivghrrdgvuh
    dprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdgu
    vgdprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtphhtth
    hopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthht
    oheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8S9SaBSausSi-3iqJt5wCCi8AX59j1WEQ4U5s8MzFmTydIG5h71G-g>
    <xmx:8S9SaNxWlQhaYbTs6qJaT6e1Kn9yrYHHGK_vZlAkKRlW4OCRg-Rz7A>
    <xmx:8S9SaP4_Vi-na0tXH3g78z29tAGWapcJQViYtq8c4KS2840-5RneDQ>
    <xmx:8S9SaKwE_VmEGRpHvxg7HewhV_sc3SIn7EsMtV3afMCYpp1CUeh_ew>
    <xmx:8i9SaHrWsKkUvPw3eQt_wrXJx3HbPWH2q3S14RfVx9bkfA2KVoLfyx1J>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 23:18:06 -0400 (EDT)
Date: Wed, 18 Jun 2025 13:19:01 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Jason Thorpe <thorpej@me.com>
cc: Laurent Vivier <laurent@vivier.eu>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com>
Message-ID: <daeee4ff-ff27-27ef-7e6f-71ccd556f6d2@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de> <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com> <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de> <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu> <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de> <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu> <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu> <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de> <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu> <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=-14638117741461144186175021674129

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---14638117741461144186175021674129
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Mon, 16 Jun 2025, Jason Thorpe wrote:

>=20
> > On Jun 16, 2025, at 2:10=E2=80=AFAM, Laurent Vivier <laurent@vivier.eu>=
 wrote:
> >=20
> > I think you need to change the ABI type in the ELF header:=20
> > https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
>=20
> 4-byte alignment binaries should have ELFOSABI_SYSV (0) (since that ABI=
=20
> spec is where the 4 byte alignment comes from).  If Linux/m68k is=20
> already using that, then those binaries are broken by definition.
>=20
> Let=E2=80=99s hope existing Linux/m68k binaries are using ELFOSABI_LINUX =
/=20
> ELFOSABI_GNU (3) (sorry, I don=E2=80=99t have any handy to check).
>=20
> If the existing binaries correctly label themselves has having the=20
> Linux-specific ABI, then this is trivial and there=E2=80=99s no reason to=
 use a=20
> note to differentiate them.
>=20

Do you know of a good solution for this open bug?
https://sourceware.org/bugzilla/show_bug.cgi?id=3D30273

---14638117741461144186175021674129--
