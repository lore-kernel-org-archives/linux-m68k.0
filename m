Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062D30B515
	for <linux-m68k@vger.kernel.org>; Tue,  6 Jan 2026 21:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735059; cv=none; b=mZ22f5R2JX/d8PcW0ChVhtYHASbaJ1GGvWeuSviJIxvZ68SgbX7cqy7bHTeTxIrfVj6x6KN9Rg+5qj1xEnLgIbgzloXC/GdMZVw6x+UjLEIUsM/fL47q6wiLYa8ckfOPu0+bCeeuk8jdnk33CNByVyPolGm0kG/p/FBGBaDHu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735059; c=relaxed/simple;
	bh=8i6s5EG+Ru9Pf4t9kAp04LDwfvSCa2ra/vToKD9DAss=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QSKAf3+VsBqN7LjiQr7R7nAgHx6pkzP0C9KtgW1b54v3zcZkQ/lvOhq1N2FYxGrq7EQ9V2ZCH4ElmC1R1n2GSsKZzbBoGOYM+upcEMUd+Y+Ol/u0w629bQrvOAGgfoYyK+KK8pw+M/dH+d5KdI+7Zh2ZPTqpvlwGvS69lUKoRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=T0mhZrG2; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="T0mhZrG2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=D3LYBasIMcWS3g3NqrDpofvoP23WaPCRT3Opbatgbo8=; t=1767735056;
	x=1768339856; b=T0mhZrG2opuVK971PUVyM9GvC9I/+SCfPevmzm2FGr/qV7jIVJ7fo3mL4xUIr
	EMwrengVwqxOwyOjCl/DAdx2hsllktlXr5V2YWa997cKneeMcQxn1VCo7i7Y6Rq2JeUZIXZft+tNg
	5kz80u+DmZy9ORSj0oajL3rAF+8H41tgyltz5Bw/akAQ2RtmAb3fYkt+KljRaU6qGHiwEJbuVeHwd
	q5FqkFUqq4awR0AHiFytFi/xvfGuVCb1k3Rd95bQzmZgToaALGfu+7UHYGNSM5BKfViUUWclKxZfe
	gd98YTYwNdnIVQo+kjDAKimR0WFE9PCJH7wrS4Op7iHHUX2doQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vdEdf-00000001ZDT-0teg; Tue, 06 Jan 2026 22:30:51 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vdEde-00000003wA7-48ll; Tue, 06 Jan 2026 22:30:51 +0100
Message-ID: <d76f9d10a60c0ac07bdd136ca1466c2f754086d9.camel@physik.fu-berlin.de>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Kolbj=F8rn?= Barmen
	 <linux-m68k@kolla.no>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "port-m68k@netbsd.org"
	 <port-m68k@netbsd.org>, "debian-68k@lists.debian.org"
	 <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org"
	 <linux-m68k@vger.kernel.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>
Date: Tue, 06 Jan 2026 22:30:50 +0100
In-Reply-To: <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
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
	 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no>
	 <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
	 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Arnd,

On Tue, 2026-01-06 at 16:37 +0100, Arnd Bergmann wrote:
> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> > > On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:
> > >=20
> > > Does this patch exist somewhere? I ask because I am migrating to
> > > 32bit-aligned userland (https://www.gentoo.org/downloads/#m68k) and t=
he
> > > gcc provided fails building kernel, stopping at arch/m68k/kernel/sign=
al.c
> >=20
> > I haven't created that patch yet as my work on this effort is currently=
=20
> > paused. However, it should
> > be straight-forward to update the asserts in the kernel code.
> >=20
> > According to Geert, Arnd Bergmann made some changes to the kernel uapi=
=20
> > that would allow the kernel
> > to be built with either alignment. Not sure what the current state of=
=20
> > things is.
> >=20
> > Let's CC Arnd to find out.
>=20
> I have these patches in my work-in-progress tree, and I still
> plan to submit them upstream, but haven't made any progress on
> it since I talked to Geert about it last month.
>=20
> See below for my current working version against roughly v6.18,
> which replaces all the implicit padding in uapi header files
> with explicit padding.
>=20
> What I do here is a combination of changes:
>=20
>  - add -Werror=3Dpadded to the header checks to catch any
>    implicit padding on any architecture
>  - add __uapi_arch_pad8 for any 8-bit pad that is the
>    same on any architecture
>  - add __uapi_arch_pad16 for any 16-bit pad that is the
>    same on any architecture other than m68k
>  - add __uapi_arch_pad32 for any 32-bit pad for
>    padding between __u32 and __u64 on all architectures
>    that naturally align __u64
>  - add __uapi_arch_pad_long between __u32 and long
>    (or pointer) on 64-bit architectures
>  - a few more specialized macros for less common corner
>    cases
>  - annotate structures as __uapi_arch_align to force 16-bit
>    alignment on m68k and larger alignment elsewhere,
>    regardless of -malign-int
>=20
> I've tested this by running the header check on all
> architectures, and running the abigail tests to ensure
> the ABI is unmodified (abigail is currently broken on a
> few architectures).
>=20
> With all the patches applied, we get two benefits:
>  - m68k kernels have a consistent ABI with and without
>    -malign-int, so kernel and userspace can use
>    different setting here, and we can eventually change
>    the kernel to always use -malign-int
>  - Any new patches that introduce implicit padding in the
>    uapi headers break the build and get fixed before they
>    cause problems. Almost all the instances I've seen
>    are unintentional.
>=20
> I have started splitting up the change into individual
> commits that explain the padding, but it will take more
> work to get through the entire patch, plus any additional
> changes for review comments.
>=20
>=20
> The diffstat is
>=20
>  407 files changed, 2433 insertions(+), 754 deletions(-)
>=20
> and I think this touches around 1500 structures, though
> most files only have a single one.

Wow, that's really impressive! Thanks a lot for working on this!

I will definitely give it a try.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
