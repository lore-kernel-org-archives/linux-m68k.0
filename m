Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C023099F
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813358; cv=none; b=Rf/Ijg9kINKGMVSmGMA+6DeY0txFRJS9Yc2u5CdlSEyGNsQDxXwhtMe62PrY6gQlhi/mNfrJMQUvdEJwsfVwrm8QiU/sskxL3cYRUcV1VRAChc1D+PmqfNiIjtcd0bi6D7UTUznziaZX2HHWGCtK05r/O7LY+SdoncuAdbxck9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813358; c=relaxed/simple;
	bh=261kCUmFfg4XSPL8Jhwyp3/T0HkDM18UqVipWeGSM2E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YESkOpL+qds4dwJmK2hKCP1OtR9Ot5FOYx7Nm8Pf5Zrr26OKtW3tENSDEirtJtqJJZVduEsBvCz2BeLTA/zfh5zgJPbjtBtK/aqTaXMq2x8dikhm/xefH4H0hy4gaxpPxs76akYWfxwJfUTPw4x+D59TVDQ8U/fWCxOnjr9eFjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Cj1Z5P+R; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Cj1Z5P+R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s2ZJFt5HQRdJpAcALiZztup16gg+4vn8MGM47FL1/AE=; t=1749813355; x=1750418155; 
	b=Cj1Z5P+R4skLrrpiwdTmcpPEwh8WlU4VIlcSgUZ9+MrWlGzDVVxNlpEkDX1dUAhLmKaL+SkFkmP
	PbCL2c5mqUJY4FGJCGsfbxX08iNAtM0UpgT0HqGfvVdmRLcHABK7eQvcxwLCSOQu1gzmAFrV6NaN2
	h9eIDgrNVcX9vG+ABYd0+3WmIUUnsMfV2eJDP7lu1YElGd4OkGOU8QRcGF7VCJZOAOl9UYX8s5o1s
	gQ2vMLJuW6RmAxrBJVTX65e1swzmdSRZlc+i11/HglXs2bLsLAMudRtO8fSK9FA6Mhe/WBD7YHz1N
	UcBiKdLLW3Wgq8CUbQgrXlyxNazqtWH3YBMg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ2O0-00000000Yq7-41fx; Fri, 13 Jun 2025 13:15:52 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ2O0-00000001M9Q-2xZ3; Fri, 13 Jun 2025 13:15:52 +0200
Message-ID: <fa06e8f58287f413babb5cc0af2a380efe46cf76.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Stefan Reinauer <stefan.k.reinauer@gmail.com>, Stan Johnson	
 <userm57@yahoo.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jean-Michel
 Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k
 <port-m68k@netbsd.org>, debian-68k	 <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 13:15:52 +0200
In-Reply-To: <1625e816-3f04-e700-308e-990f86c9a647@linux-m68k.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	  <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	  <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	  <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	  <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	  <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
	  <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
	 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
	 <1625e816-3f04-e700-308e-990f86c9a647@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Thu, 2025-06-12 at 18:19 +1000, Finn Thain wrote:
> On Thu, 12 Jun 2025, John Paul Adrian Glaubitz wrote:
>=20
> > On Wed, 2025-06-11 at 20:16 -0700, Stefan Reinauer wrote:
> > >=20
> > > Fixing pthreads would probably go a long way. That's where we lost=
=20
> > > about half of our performance.
> >=20
> > This may be accurate, but I'm again not sure how this is related to the=
=20
> > discussion we're having.
> >=20
>=20
> It's related because such changes could impact all of the C libraries and=
=20
> compiler toolchains that you wish to port. So it's an example of a burden=
=20
> created by package archive growth.=20
> https://lists.debian.org/debian-68k/2025/06/msg00048.html

m68k with 4 bytes alignment works fine on NetBSD.

> It's also related because such an enhancement may involve an ABI break.=
=20
> That's why I mentioned threading a week ago.=20
> https://lists.debian.org/debian-68k/2025/06/msg00018.html

Which I don't care about because the current ABI is broken.

> > Finn accuses me that I deliberately slow down Linux on m68k when all I=
=20
> > do is continue to maintain vanilla Debian on m68k.
>=20
> Citation needed. What I have said is, Debian is bloated (in part) because=
=20
> of its dependency graph e.g. the cmake dep on Qt, which you defended.=20
> https://lists.debian.org/debian-68k/2025/05/msg00038.html

I'm not defending that system. I'm saying that I am not going to roll a cus=
tom
distribution of Debian because a few people on this list refuse to accept t=
he
fact that the Linux/m68k ABI is broken and violates the official AT&T spec =
turning
the maintenance of this port more and more into a burden.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
