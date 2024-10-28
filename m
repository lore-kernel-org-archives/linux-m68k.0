Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D126190660
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102338; cv=none; b=XTpW13bIUipwm9T9T72B9C1wNz6/ddR148nXrsQXq9MMGgOz2OIZA6WmqFswsPZ0XLhxm560VwLPK37+vjOf5nifcES24HZtSahIHNroVHowfZD/z1GD+5gzvuIxtEmM+8Cv++kMkC3TyeziY1W3Rvtzq3M9MUnFHiI7To8F3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102338; c=relaxed/simple;
	bh=yZveF857bTti2/lqv7bu8CD67sMnLXZufh3H1tdb7ig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WlRDqdXZjNtDXc9qOhNwQa83E2ajfPO0uwqVtiHejj3oporRaik4cZ7QLmLm8nKpsg6wgP+mG63meV/ofHLGtZ/aK/3We0W0qrTwO6wtFywADw9u9BNCp3vUtKeY8aISH6l+p6iw9v0fSIe/OMuYvPiXcpxC/QY+/OWt3lSUUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=REsg2eUu; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="REsg2eUu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wXi+AqzdexFgvgObsnD92aTdFY4K2+FbbovIjxQN3ZM=; t=1730102336; x=1730707136; 
	b=REsg2eUutKkrpWrmpLzTGcxvL7ML++vLfo6YRSHFfq/jurFnywmhpTBQGf2RATbpq9XecIHo256
	38xrEZwPhlWX/nfSNN+s9FlgokTslb1K+arEVa3XtuDxonI2uCse6sSv6wSPMp6hzVdHy1j4r43Qe
	tBzrDwimbzXCSZ3S22YBYynOaFO8R0aeoyWu8Ypmx+tAlCRnNVJ8XtU0EpXJjfsvN3v/kJ9SxRJIW
	OV1dlaU4FmDdPNE34mNqd8Fp6BtaLetuIdMcaZisbXjSSCc0LXRUNfq5JCBRBh422Sh5AVNI6usSe
	86d4Di1+8li0IxiCd+IXyk2u9mR7KLYBq3og==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KeM-00000004AYq-2rOs; Mon, 28 Oct 2024 08:58:54 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KeM-00000002C0w-1ueq; Mon, 28 Oct 2024 08:58:54 +0100
Message-ID: <707333a8f10b92fd5c8fb3ad3dd928a5292215d2.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>, 
 Thorsten Glaser
	 <tg@debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>
Date: Mon, 28 Oct 2024 08:58:53 +0100
In-Reply-To: <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>
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

Hi Arnd,

On Sun, 2024-10-27 at 13:15 +0000, Arnd Bergmann wrote:
> On Sun, Oct 27, 2024, at 06:16, Finn Thain wrote:
> > On Sun, 27 Oct 2024, Thorsten Glaser wrote:
> >=20
> > > Finn Thain dixit:
> > >=20
> > > > That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's =
not the
> > > > case on my Linux/i686 system. 4 !=3D 8:
> > > >=20
> > > > struct baa {
> > > >        int a;
> > > >        long long b;
> > > > } foo;
> > >=20
> > > That struct is just 12 bytes for you then?
> > >=20
> >=20
> > Right. i686 and m68k agree on that.
>=20
> The other ones that have misaligned 'long long' variables are
>=20
> arc
> arm (OABI only)
> csky
> microblaze
> nios2
> openrisc
> superh
> i386
>=20
> The 32-bit architectures that use a natural 8-byte
> alignment are
>=20
> arm (EABI)
> parisc
> mips
> powerpc
> riscv
> s390
> sparc
> xtensa
>=20
> m68k is the only architecture supported by linux-6.x that
> does 2-byte alignment, otherwise the two seem to be equally
> common.

Another useful data point. This is the kind of discussion I had hoped for!

Thanks a lot!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
