Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB10BA33
	for <linux-m68k@vger.kernel.org>; Mon, 23 Jun 2025 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660492; cv=none; b=hANu0GMWTGFbPeMgOrep0diqDxjhjlkX+wEUzHt7YF5xpbTTowvQKBFAzrgzDeOmyMVG34eHkM1gNbtRcxhn706GKYIQCcHGiKvm/gpTVfikWxD+vX/U1p/dKn51trxJHSuluPF2UR5B5Svc8CwbVRwzTUAjZncOGk14Gh3uPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660492; c=relaxed/simple;
	bh=9R/Zgcz2o3JNoG76sFMuPizcSdmuPrWQ+gnUxip13aQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFYsPm+CnaH1RzY9oQjMOZHetKbKLY4Y+xQ6HWE0PoPzMAmI4a+1PPJnhHFEbWDqKkRBaBXhBVVGIk/QBypbQjuxDa8ov5Bz8SC/37C4vYj3BjLumdq+La4NBYaXiOZN3J0/vlRGzeN3gVVAagTpJZZN4QYBUtSrQsIqfN0VQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=fmZp8p8n; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="fmZp8p8n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/fIxhjaIRZ8eeBrkGANKSiRaMn8uuZ4cmfeVvqBSIdM=; t=1750660489; x=1751265289; 
	b=fmZp8p8nxYZ1OwQ81t2mcy9Bvlr9818WT0is8BPbIT1Cj4KON7PB/GJTHzyC5qsKPBfnW9Hv9n3
	kfbiEZbNU9yYOtZaqdezwXLBK6GVTEqut/5B6TlsUb86i9NQpzhlw+MsnCMGQsucQ63jElgyo/f0p
	vFLOjERCFehV4yqAyJO0b1HyW7vvUTZuGhdCe4ggXNH139emt15zhBLjoKhFga7SVYzAgxhlMKCf0
	EZWoUHMy0ZokHIrKd120eKOwuDpkxZV7RhFPgjk+DAoTaO1qL5TDKTFUkkYwNqS368tYqLmbtLuus
	oSGx6ji+EmCU+M09F4p9RmpIM71aeZK8EbyA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uTalM-00000003veV-2tFX; Mon, 23 Jun 2025 08:34:40 +0200
Received: from dynamic-077-011-053-058.77.11.pool.telefonica.de ([77.11.53.58] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uTalM-00000000VKi-228T; Mon, 23 Jun 2025 08:34:40 +0200
Message-ID: <bbb25ec4b69994977c26ea9c7fc375f406ee4708.camel@physik.fu-berlin.de>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
 "debian-68k@lists.debian.org"
	 <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org"
	 <linux-m68k@vger.kernel.org>
Date: Mon, 23 Jun 2025 08:34:39 +0200
In-Reply-To: <17105089-d9dc-4a87-b531-e47989aa765f@helsinkinet.fi>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
	 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
	 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
	 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
	 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
	 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
	 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
	 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
	 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
	 <17105089-d9dc-4a87-b531-e47989aa765f@helsinkinet.fi>
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

Hi,

On Mon, 2025-06-23 at 01:13 +0300, Eero Tamminen wrote:
> On 16.6.2025 18.39, John Paul Adrian Glaubitz wrote:
> > To summarize:
> >=20
> > - the ELF header provides provides the e_ident and e_flags fields which=
 could be
> >    used for identifying a Linux/m68k system using the 4 bytes alignment=
 ABI
> > - MIPS uses e_flags for differentiating its ABIs
> > - PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x00=
 (SysV ABI)
> > - qemu-user needs to be patched to deal with the changed alignment (inc=
lude/user/abitypes.h)
> > - the kernel needs to be patched to deal with the changed alignment (ar=
ch/m68k/kernel/signal.c)
> > - NetBSD uses an emulation layer which allows 2 bytes alignment a.out e=
xecutables on an
> >    ELF system with 4 bytes alignment
>=20
> So Linux could eventually have similar emulation layer for 2-byte=20
> aligned ELF binaries (I don't see point in a.out support)?

Not sure why this would be required? I don't expect anyone to download m68k=
 2 byte binaries
to install and try to run them on a 4 bytes system.

> > - glibc needs to be patched in sysdeps/m68k/utmp-size.h
> > - gcc needs to be patched in gcc/config/m68k/linux.h (BIGGEST_ALIGNMENT=
 to 64, EMPTY_FIELD_BOUNDARY
> >    and STACK_BOUNDARY to 32, see netbsd-elf.h)
> > - the glibc and gcc testsuites should be run in a 4 bytes alignment to =
check for regressions
> >=20
> > Anything else I'm missing?
>=20
> - ELF loaders for kernel, its modules and user-space need to be patched=
=20
> to reject ELF binaries with wrong ELF flags

I will check whether the kernel performs any checks on the ELF format on mo=
dules.

> - Full test-suites run also for other important projects which e.g.=20
> include m68k / CF asm code

As I have already said, I am working on rebuilding the full archive with 4 =
bytes alignment
and I have already built an initial set of packages without problems. I wil=
l set up a local
wanna-build and MiniDAK instance next to automate the rest of the package b=
uilding.

> - Changes tested to work as expected _both_ with 2- and 4-byte alignment=
=20
> builds

The 2 bytes alignment port will be abandoned in Debian anyway, so I expect =
to eventually
stop working without me constantly testing it

> On 18.6.2025 15.27, John Paul Adrian Glaubitz wrote:
>  > On Wed, 2025-06-18 at 22:21 +1000, Greg Ungerer wrote:
>  >> The bulk of the instruction set is the same. Asm code will look total=
ly
>  >> familiar to anyone who knows m68k :-)   One notable difference is tha=
t
>  >> there is a more limited set addressing modes for some instructions.
>  >
>  > True, but you won't be able to run any classic m68k binaries on ColdFi=
re
>  > and the other way around, are you?
>=20
> Besides binaries that use just the common instruction subset between=20
> m68k / CF, the individual m68k instructions can be emulated, or whole=20
> program can be run under m68k emulation (something more light-weight=20
> than user-qemu).  See e.g. ACP:
> https://en.wikipedia.org/wiki/Atari_Coldfire_Project#Compatibility
>=20
> It all depends on how much there's value in running older binaries which=
=20
> have no sources available, or haven't been rebuild for some other=20
> reason.  On ACP there was more reason than on Debian...

That's my main argument the whole time: There is no value in running old De=
bian binaries
on m68k as we have the source for everything and can just rebuild packages.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
