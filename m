Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFC2040A7
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712730; cv=none; b=TjrbymvViJmKkY5XGZzDwwWMX2P/PPOX2BwD9baAdlvIajV2cb8V700iKwTmKdabXBAzsjOLetpbSF5l72nl073dsmpPdUA56Nut0I38s5DrW3A/ZGpoKzdmt/N6BUbCGYXr/VBgPh1oQoj9TN2KsZCfrNE2auzmUsnJ6ZCXsmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712730; c=relaxed/simple;
	bh=ye8PkrmvY2n3dcn9ndCk5Jbu240xmP+WcT/JTbQwnrM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jAtJU9I1H6DiqjObtISitbTsRvK7KSJfniNX1AxQVWlomLgvX7OaOto8hkxXRUysyvlHBoIaZaEaDfrJjxBHNx3A/3RgTEDQ/TJTVPE1XNnlyOscGExH+yqCeLg8qf1gQgYVuwPYxpIu4YHUOSwEzhbvQvehcFpYyooZFTLSA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=XBsNDRO+; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="XBsNDRO+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uu50dlDsKCc2uXuMFquWeQFeD5bj70jp6J1usDMlPiQ=; t=1749712726; x=1750317526; 
	b=XBsNDRO+HGaWl8txCHwCA7bWPUNyoBZrMrZS9OP5BmPVHFiywz8gl8VCbeysc3vnAEvXacnsKAX
	6ZdQ3N6PTnnPtp++YzTqm9rtHMivm3KMliwI/zw1Xa6ELFXgotgLBfYkZXtVV43h/uBhicF4GYrjJ
	xReri9bGWetiJeAsUBAK6dOLZo3dpS2nMebjvMfSj2KWJtnk/0XUj/ZBMRUtz3lhsrUBaCPB0QXYs
	OvtvaTGKkiODopmuaJ0DURKYYUiPtR3y3va3+QNvRUvlGPZkP/smwSM1sGJe2+cf9GO7bLEAEWXRs
	+bapTajIG5mq4j/UrkaGz3ICRhECd/Sv9Cjg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uPcCx-00000002NYK-0w8E; Thu, 12 Jun 2025 09:18:43 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uPcCw-00000000bIU-46Zq; Thu, 12 Jun 2025 09:18:43 +0200
Message-ID: <89247655be6ac93710ebc1573a9f08ec293706f2.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Thu, 12 Jun 2025 09:18:42 +0200
In-Reply-To: <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
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

On Thu, 2025-06-12 at 11:54 +1000, Finn Thain wrote:
> On Wed, 11 Jun 2025, John Paul Adrian Glaubitz wrote:
>=20
> >=20
> > I'm not sure what you are trying to say here. The fact that your=20
> > computer is too slow for modern Linux distributions is unrelated to the=
=20
> > alignment discussion.
> >=20
>=20
> Sorry, Adrian, but you can't have it both ways. Either you support small=
=20
> systems or you don't. Debian's documentation says of m68k:
>=20
>     This architecture covers Amigas and ATARIs having a Motorola 680x0=
=20
>     processor for x>=3D2; with MMU. However, the port is still active and=
=20
>     available for installation even if not a part of this official stable=
=20
>     release and might be reactivated for future releases.
>=20
> https://www.debian.org/doc/manuals/debian-faq/compatibility.en.html#arche=
s
>=20
> There is no mention of fast emulators. Yet that's all you're targeting=
=20
> now.

This is old documentation, I'm not sure why you think this is an argument.

> Debian needs to fix this, so that those users/developers who are=20
> interested in small systems can colaborate effectively without being=20
> mislead.

Debian doesn't owe anyone anything. There a number of people who work on
Debian Ports in their free time and they are free to decide how they spend
their free time. Your arguments are really getting desperate.

It's also absurd that you think that switching the alignment to 4 bytes wil=
l
make the port considerably slower when the contrary is the case and NetBSD
developers on this thread have explained several times that they don't have
any issues with 4 bytes alignment. Heck, even Amiga Unix uses 4 bytes align=
ment.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
