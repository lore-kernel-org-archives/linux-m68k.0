Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA926AEC
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304409; cv=none; b=U2JDMDfO8zm7szlmsMQvAdsFJ84l2HoIsCXjgb70Nb7QFfWimaVp4QUQ5PXWBFhVDW/5gxOY/LYf8yRPatoxZE53SfSU/Xm7tnROpysHtWOg4tEvcxzyfatyUYyOQxh05zxjST5Xrk9f5DrL+8iz5TXVgxnaKZnP0u6skNx0GNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304409; c=relaxed/simple;
	bh=fGUH0rkZ4gPJc4GfJfm1x02hEFE/xexD8z3IB09KNjQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OEMRGcy3aMYGMqr9uEv46QDcLOkn4hYf5Z4khZr4BNj/81TJY8sG8kOOBXe493I9V9+CD0ZVd3m0BP7j+gWcHbSCUll/PfjHd3ndIO3zAGea70DWcyE3qYHKyAmnqx4gDw8Oory9ilcph674mi1SyACC9XVqAb1/LM6tQ6yA8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=aKJUmsae; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="aKJUmsae"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qrTDweqX6lai/HjWFku9mL/SCAnxRT6icwG1foOVOog=; t=1749304407; x=1749909207; 
	b=aKJUmsaeJVeHFHVqX+JCmxVqXv2WYil63BjZOERCCpv4F5SMnIA8gYRomboiMqso8M2wqT7y97R
	UBewwjNLiexZ2dOw1M1whW3DWBZx84ial87lBIMsleIj8jse3M0znKtvIW6v7QZehgkYEjMtb1UkR
	TR8PZ5xx5J2V73yRvfOr8J9rnjQ4elFawB106OLykecVSHrVQFDi2qyCwhKwCmMnLRv5Hw5LGPBkH
	RQxFHtURJ4/wXvsL8mHmkeNHBw+XOw0eJ32vXHAt7QpnPIIpdeX5FBFjrhd0EKBjl0OAAjTy8qenq
	wAunPa75ea/aeCSqsM/X3qHiF+DPCrUmNImQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNtzB-00000001w5m-0shj; Sat, 07 Jun 2025 15:53:25 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNtzA-00000003TjP-42Me; Sat, 07 Jun 2025 15:53:25 +0200
Message-ID: <9675ae888f3793c6c997ed2757928f2b019ac7a5.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>, Anders Magnusson
	 <ragge@tethuvudet.se>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 15:53:24 +0200
In-Reply-To: <87ldq3ajsa.fsf@igel.home>
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
		<87sekbq3f8.fsf@linux-m68k.org>
		<cb873001-0287-4a60-a793-07b553d92224@tethuvudet.se>
	 <87ldq3ajsa.fsf@igel.home>
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

On Sat, 2025-06-07 at 13:11 +0200, Andreas Schwab wrote:
> On Jun 07 2025, Anders Magnusson wrote:
>=20
> > The paper copy of the "System V Application Binary Interface" for 68000
> > that I have here says that all pointers should be aligned 4 bytes (figu=
re
> > 3-1).=C2=A0 Nothing else.
>=20
> And how is that relevant?

That's an odd question to ask. You can't argue with the ABI specification w=
hen
you can just make up your own one. And it's not that I haven't done extensi=
ve
testing for that.

My tests have shown that Amiga Unix based on SVR4 using ELF binaries uses 4=
 bytes
alignment. If that isn't a representation of the official ABI then I don't =
know
what is.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
