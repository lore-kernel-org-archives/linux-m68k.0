Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365D1179954
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502423; cv=none; b=O//Fez4zJYprwh3hgif91upRZoAauVg693S7hQd2AEOvq9It1KPBJtL1aFKAAd5mi0M6FEVHN4T0hcIeu4clCENy6AqEHVLq0TYRJGUh76fKUdvfP8PWiqQLaY/1YZORLS2UXrFE6VNFZlYd6/jsBKSP0+DOVQDCZhXfzTa0zdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502423; c=relaxed/simple;
	bh=6NdAPyQCb+wk9yIgjfOrtf5BXM8Cs4/wpnwFLMKVSwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Za5qPO9ZRwyfQPFT/FhsHEzNsCguYs/WQCedPFvOnk1kkUVS6R/EurMxFj3zAVCBc6PoZKDFGaTyc21Z8/rBYV64Axc2nc3R6kJ4Mk0o1gMXBOrJA3+ast7eYO/Ftl4cGjRfVDUh1DvwAX+sHOulDlhaDNmFKz8aHQTaDiMRKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=gtEQlsql; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="gtEQlsql"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wCgHqVsZzBmRgjaLapSy0Bm7wgTtQH9nl983nQiHOEM=; t=1731502421; x=1732107221; 
	b=gtEQlsqlxDRLw9bqGbE2cYXMLGP41sAisrcgWQyAFMoXnv+lODuEPrIrr1UU2GAj4I3xbFXo6xE
	AlOaT034EAgjL+S9IK/ocwSF3BRGLFtmg05GKMNxrfMq4nKJqRtxWoTMUAbp94VDEW16fvwNsq83W
	dNEXl3fHbelO0NAockaWp11ns2/Ot2m9Rfg1sBkyQd88WNX32R2PXriOG8Exv4fs0Od0bwvYloxS7
	0qVMRjGvOUInYlTXGj9sX0ww3WKjoOzqRnzQ+YtBnU2Qc2Q9gJvh+cqU+Xp22V2HfFqYgUElSGh3b
	DGzwVoIuUHNHRSPmNhOCQPs+vG/nK8jHEoSQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBCsN-00000003Ywb-17DY; Wed, 13 Nov 2024 13:53:39 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBCsN-00000000Bh3-09NJ; Wed, 13 Nov 2024 13:53:39 +0100
Message-ID: <2414fe9be8e6b1339c178678d4c58be3f160db6d.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thorsten Glaser <tg@debian.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k	 <linux-m68k@vger.kernel.org>, debian-68k
 <debian-68k@lists.debian.org>,  James Le Cuirot <chewi@aura-online.co.uk>,
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 13 Nov 2024 13:53:38 +0100
In-Reply-To: <8d01228e-d6c6-6d10-f60d-b353b341e4b4@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	  <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	  <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
	  <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
	  <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
	  <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
	  <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
	  <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>
	  <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>
	  <f2377db5-2b39-0e58-4d22-1caee7e8e6a3@linux-m68k.org>
	 <325daee024e5290959c5147346602ac7f0089474.camel@physik.fu-berlin.de>
	 <8d01228e-d6c6-6d10-f60d-b353b341e4b4@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Mon, 2024-10-28 at 19:49 +1100, Finn Thain wrote:
> > Here is the current top of the list of packages that won't build on m68=
k=20
> > because of the 2-byte alignment issue:
> >=20
> >    2814 cargo:m68k
> >     900 ghc:m68k
> >     261 gccgo-14:m68k
> >     241 libqt5core5a:m68k
> >     181 architecture-is-64-bit:m68k
> >     117 libglib2.0-0:m68k
> >      81 libcompiler-libs-ocaml-dev-0a396:m68k
> >      81 golang-go:m68k
> >      71 wx3.2-headers:m68k
> >      57 qt6-base-dev:m68k
> >      57 python3:m68k
> >      46 libamd2:m68k
> >=20
> > Are you going to fix these for me?
> >=20
>=20
> Are you the only user?

I am the one who does all the work on Debian/m68k.

> Seriously though, thanks for providing data. Now, if you would link to th=
e=20
> upstream refusals for CPython and golang, I'll do what I can to help.

I honestly don't have to justify myself towards you. I will use the Christm=
as
holidays to make a decision. I will either drop the m68k port from Debian o=
r
just perform a forced switch.

I don't care anymore what you're posting here. You're just wasting my time.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
