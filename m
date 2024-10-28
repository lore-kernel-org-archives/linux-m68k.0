Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66951474DA
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102612; cv=none; b=MS5EA0H4ubKSKZmRjYPeQWGeaMAL/LRsGeS5jShpuyk7DEZodSe/dk67zLgZovw5/WMsC3ZiKFaJDozn593NIE53OP9e89gb9tT7UG0ScrgIHlU4GATi/EdHZKwCLQ75DLo5T0kJktpL/BathPBAhVckGIS1VBg596DQdgh9+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102612; c=relaxed/simple;
	bh=oHON0wjGnvsTbWZiY8xJXNxw0jnOLan2/J47+HyA5Mw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgijeQAoUlf1928+AjyFNhC5JWnNDJnmBP0m/Tox/UUVMzAJvCDWPyQW4BEf0YtN5c4Fi8WFJV/BDEm3QHJIWQhu+3NjXFHVB2N1i3Gzovwmuzgb92Z/7G2WeN5ydjDBKL7/1n2iYo5RDUkkeYSPQSHQyqzHhBGhqsAQbiubZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=TSFWSm1i; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="TSFWSm1i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cWiMQwVir3lTITfi+c5xoTqd6b61oHidDLVmuV39bYw=; t=1730102609; x=1730707409; 
	b=TSFWSm1iCsHnJAw+jCSjl6Audc/3GYRv1vbh3KZgyBYjElHa5h7XO1cOr8WqBYh72dPhCyh9z6j
	1ZxNykeLlXekoiLZkOwASsRjpg2LNCPA31uxGCbki4W+B9VNnJqtwCpgYMKw8iNlHSEyVaLU1S+8A
	kPsrzO9xZ7/BjECsy/fanExZoNDos3Ny8Y8XxL7/dkycdJiTJHX9wGE0Cx54DazEeYJVJGj+J+mJb
	azyKvDN4d6uGrDcyhbSAfSAcKmqCn5JcOG35JJA+Dmllalj+Kzxtd0dKvDTx7s15RjQEEAefjNySU
	mz9H+sGpI92RUBP8Zhiu8IiE9G7lyLjp6vNw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5Kil-000000002HV-4B1t; Mon, 28 Oct 2024 09:03:28 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5Kil-00000002CnL-3Dhw; Mon, 28 Oct 2024 09:03:27 +0100
Message-ID: <aba54d2b46a1e08f578e008d084463c7257aaba3.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thorsten Glaser <tg@debian.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-m68k
 <linux-m68k@vger.kernel.org>,  debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James	 <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab	
 <schwab@linux-m68k.org>
Date: Mon, 28 Oct 2024 09:03:27 +0100
In-Reply-To: <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>
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

On Mon, 2024-10-28 at 04:07 +0100, Thorsten Glaser wrote:
> On Sun, 27 Oct 2024, Arnd Bergmann wrote:
> > On Sun, Oct 27, 2024, at 06:16, Finn Thain wrote:
>=20
> > > Right. And I don't think the problem is going to go away. One solutio=
n
> > > that is sometimes raised is better tooling. I'm not sure how that wou=
ld
>=20
> No. You don=E2=80=99t understand the problem: applications are being
> written that require natural alignment for at least 32-bit and
> smaller quantities, some possibly for all quantities even. We
> need these applications to work, and we cannot redesign them
> (it=E2=80=99s common for them to store flags in the lowest pointer bits
> and do other awful things).

Yep, that's exactly the problem. Plus, the maintainers of 99% of the upstre=
am
projects don't care about the alignment peculiarities of the Linux/m68k por=
t.

> Could you please, if you cannot believe it yourself, accept the
> word of those actually doing the porting that it is direly needed
> in the current Linux ecosystem. Thank you.

Agreed 100%.

> > > > That struct is just 12 bytes for you then?
> > >=20
> > > Right. i686 and m68k agree on that.
> >=20
> > The other ones that have misaligned 'long long' variables are
> >=20
> > arc
> > arm (OABI only)
> > csky
> > microblaze
> > nios2
> > openrisc
> > superh
> > i386
>=20
> Okaaay. So, all =E2=80=9Cold=E2=80=9D platforms or with low distro suppor=
t.
> For Debian, we have superh and i386, out of these. It is
> entirely possible that Qt et al. can work with this, but
> these all have natural alignment for quantities =E2=89=A4 32 bits.

I'm not aware of any serious issues with alignment on i386.

i386 was the original target for 90% of the software in Debian, so if
there are issues, developers have already addressed them.

> Does Gentoo support more of them? Debian used to have arm
> OABI, but that=E2=80=99s ages ago. I know things like OpenADK support
> them, but that is very chiefly embedded.

Currently, Gentoo supports i386 out of that list.

> > The 32-bit architectures that use a natural 8-byte
> > alignment are
> >=20
> > arm (EABI)
> > parisc
> > mips
> > powerpc
> > riscv
> > s390
> > sparc
> > xtensa
>=20
> That=E2=80=99s majoritily represented in Debian. And ideally, we=E2=80=99=
d
> use that for all new architectures.
>=20
> I have a feeling that GCC=E2=80=99s -malign-int will only push us
> into the former. I have no idea whether it=E2=80=99s feasible to
> also change GCC for this; that will probably depend on both
> the other =E2=80=9Cwhat parts of the toolchain need changing=E2=80=9D and
> whether GCC can be switched with little effort.

Did you see how Chewi implemented 32-bit alignment? He actually didn't
use -malign-int but directly patched GCC itself, see:

> https://marc.info/?l=3Dglibc-help&m=3D169303990426196&w=3D2

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
