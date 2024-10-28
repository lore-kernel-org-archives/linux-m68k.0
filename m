Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B26F1D8E16
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102025; cv=none; b=e15ElKaAy3PMxaGboVBnUv7zHzHViuO6TmQRhd6NlHtlTgbZ/CAwM0FYy0Nq4j+szCzExYIqhhL7RGn54qH/joyj5w1AfAd5wdp9rmhtFia7BUBtOpH2TVat82jSuMASi/wVi/Bu5bbmmRK2lUn8DTgprTUHrV/JPFPriIlekeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102025; c=relaxed/simple;
	bh=7naiGko5DE4VIPsz+3MRHNIKAGU8gljW9RW0506AtJM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PLDF+2SsinTrcsje4RMj8UzdSuMegZ19gUt/QVhqGLPAnvmpoZhFaxm7APqb2wFd6COwF/nDJwQDWbTMVAYWNcHN6S3SoyUSsjVMy4zws/VTu76WS2G0RMcl9dgh12BJxl51jmDmQJSUdxUJDHtWxydiL/zJyVqBVNfiEnV8ih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=FXyaBw0U; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="FXyaBw0U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=26H4BwkDn6vk9cqKYRHy9b6BqkP9gJakl/PpwBdKSho=; t=1730102023; x=1730706823; 
	b=FXyaBw0UI7bmJJoT862IaFMQZJp5tKTSVICN7sLZj4B9CeURDMYrMgTUZC9QRtNUpX9qxTMyE/N
	BixsU2RkR0aOoBLAvRLenbYb/RezUyLTndSNvmzIPQfxTMRgBhs+ZiU2JilunNMOId5MiHhXvfMxM
	jY3z+qr0tmDnYydRz62GxEUVimm5z13ox3zV3KZq3NvclOMlbcsbMjT+JvokcCpD0Nr+JP9M7pLjZ
	a8t6iaNzlNRfghGCM+wgwgT7qBzIeWCRUT7N4XB00ueXjg24bd8Dr3gQYKVdlZZnGs+LDcJZzVIqZ
	9PmX0Bt97LYRmcBFABoE2Q9Bed00XdftNAcw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KZJ-000000047Up-0hA2; Mon, 28 Oct 2024 08:53:41 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KZI-00000002BAv-3wze; Mon, 28 Oct 2024 08:53:41 +0100
Message-ID: <ea6d4638a566bc8fec8cf18075cab472d4ba313a.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Thorsten Glaser <tg@debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Oct 2024 08:53:40 +0100
In-Reply-To: <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
	 <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
	 <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
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

On Sun, 2024-10-27 at 14:47 +1100, Finn Thain wrote:
> On Sun, 27 Oct 2024, Thorsten Glaser wrote:
>=20
> > > https://gcc.gnu.org/wiki/RustFrontEnd
> >=20
> > That=E2=80=99s assuming it can build the same stuff the same way so it =
can be=20
> > used in packaging.
> >=20
>=20
> Not an assumption. I simply pointed out an opportunity for collaboration,=
=20
> because I see the primary problem facing the m68k port is a lack of=20
> resources.

There is hardly anyone to collaborate with. Plus, the problem is that 99%
the upstream projects will not carry any patches that unbreak their softwar=
e
on m68k.

> > > I expect alignment assumptions like that will end up putting more=20
> > > platforms in the same predicament in future.
> >=20
> > No, all the other platforms use natural alignment.
> >=20
> > > "Natural" alignment is meaningless in the context of portable data
> > > structures, as they exist without reference to any particular integer
> >=20
> > Yeah, but in practice, all we have is ILP32 and LP64;=20
>=20
> ... for now.

Sorry, but this a moot argument. Arguing with what could be in 50 years isn=
't
helpful here if it just intended to quench the discussion.

> > the Windows=C2=AE world has LLP64 in addition. And natural alignment ju=
st=20
> > means that all the data types=E2=80=99 alignment is their size. (Which =
kind of=20
> > makes sense, so you can read them without getting an unalignment trap o=
n=20
> > SPARC or so.)
> >=20
>=20
> That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's not th=
e=20
> case on my Linux/i686 system. 4 !=3D 8:
>=20
> struct baa {
>         int a;
>         long long b;
> } foo;
>=20
> > > Q. What is the size of this struct, assuming baa.b is naturally align=
ed?
> > >=20
> > > struct baa {
> > >        int a;
> > >        long long b;
> > > };
> >=20
> > For ILP32, LP64 and LLP64, it=E2=80=99s 4 (a) + 4 (padding) + 8 (b) =3D=
 16 chars.
>=20
> So natural alignment is portable if you first assume a data model. But th=
e=20
> struct definition itself is not portable, since it doesn't specify a data=
=20
> model.
>=20
> > More importantly, and relevant for Qt, struct baa is also 8-byte
> > aligned...
> >=20
>=20
> If the struct itself is not naturally aligned, it too will eventually=20
> break someone's assumption of natural alignment.

All this discussion doesn't help solve the real world problems with the m68=
k port.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
