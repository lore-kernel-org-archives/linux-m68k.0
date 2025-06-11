Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69A221262
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627849; cv=none; b=Qf7s3AlEB8JYGGpaBlJNER9kRq/yhxEedXk6PuCTFKhSQZcZ5Q1pAzimwoYT7UbOxg0HMlvZd7K206zf5OUAX795EH4pBBHChdQoDNw2xsm/ywxpMqY3QKiC2aHkTavXRHESWMauQ8EWRWbS8MVJNQYEdL1yJybEXwinBgtLUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627849; c=relaxed/simple;
	bh=lvXKc6pRHjUc9KB+OUOgfU5TlTSqUrVE+TVK39e6Kbc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SPkwwvWu6r9lM7S4O2EkoVgqKDTFrCulSaefxtWbEOT7fIxlKDlB/RGrNf7QcMY7CKs1N3BjS91kvZsBus3yzsjPLQIyMlzvmCNuXmSKVFeUNsCfb38gVOpVNs8rJ7IPgJVeCzIxevP4WD6v+UtPg8J40b/+X639ltucBD09dVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=GfHv7zBm; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="GfHv7zBm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QWzEi8QY7fKCPIhfXdcaEtBa+BdCk+JRvf2xAhDTXmQ=; t=1749627846; x=1750232646; 
	b=GfHv7zBmnQ32io5B4FmUgX8u56IK0j07psKBtj8qEYWBWxAJtCfSpN7TPTwqcnz77a8KWvETj+U
	scjjNCdCl2Wka0LFNIDZOrEXekoQFW8dJ6IujSBVrRVTNSEPvqCREz0+RsTioGpBiYPlpFBZ08iRY
	qSJklgtsThVnAlCzgJDIsSfRsPcXKJd8dRl/094SRrYM/4enILGz8+cVbeHOT6U9N5u4g0JhAU7cu
	QcYNFDdtsXqc8XcCA8GGF3z66UQCPG0ZNjrTni7KXIWbgPSteRsQrPDwtXOD9v4KZa3GKgwW3hvZv
	2yQEVJ7/txhNLDhi+XzMM0YtLNqAcp07c11g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uPG7v-00000002FWK-1QrX; Wed, 11 Jun 2025 09:44:03 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uPG7v-00000000lnX-0TRR; Wed, 11 Jun 2025 09:44:03 +0200
Message-ID: <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Wed, 11 Jun 2025 09:44:02 +0200
In-Reply-To: <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
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

On Tue, 2025-06-10 at 21:04 -0600, Stan Johnson wrote:
> On 6/10/25 5:26 AM, John Paul Adrian Glaubitz wrote:
> > ...
> > On m68k, on the other hand, the user base is so small and insignificant=
=20
> > that the costs for introducing the change are negligible and the profit=
s=20
> > for making the change strongly outweigh the disadvantages.
> > ...
> As part of that "small and insignificant" user community, I can say that
> making things too complicated or difficult will be detrimental,
> especially affecting new users.
>=20
> Look at it from the perspective of a new user today on m68k systems. I
> still remember the joy of being able to get a Linux 2.x kernel working
> in Debian 3 on an ancient Mac IIci or SE/30. Now as the complexity
> grows, I can't do much of anything useful with an old m68k Mac other
> than log in (text only), edit a few files and download a few things from
> the public Internet. Almost everything related to an end-user's updates
> of a Debian or Gentoo distribution has to be done in QEMU or
> cross-compiled. Users don't want to be berated or invited to feel bad or
> lazy for wanting old things (e.g. mac-fdisk or dump/restore) to continue
> working on old systems, or for wanting old programs to continue to work.
> Treating users well, even if they aren't as good at programming as you
> are, will make them want to be part of your team, not just part of an
> insignificant user base of a product that you provide.

I'm not sure what you are trying to say here. The fact that your computer
is too slow for modern Linux distributions is unrelated to the alignment
discussion.

As previously stated, NetBSD uses 4 bytes alignment and runs fine even on
68010-based systems. In fact, using a 4 bytes alignment will actually
improve performance as it's the natural alignment the hardware uses.

The change is necessary to unbreak a lot of critical packages which are
required to continue maintaining the port. As a user, all you have to do
is reinstalling your system which I think is reasonable to expect.

If you are overwhelmed with modern software options for your old Mac, you
can just install an older Debian version and be happy with it. There is
never a guarantee that an a modern release of Debian is supported on old
hardware.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
