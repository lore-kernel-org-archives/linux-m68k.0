Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA7273F9
	for <linux-m68k@vger.kernel.org>; Tue,  6 Jan 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709424; cv=none; b=UPS45pDuZZ+aokHWzwuNBsAzbn/Vy5kDPzkkI14u3Ye7oGolRyhV60AnJ8NQtfzHDimFNcmltrHfeHgri11W27mglmP45aYC1zak5CsVCOaHuvojchuxA/Rv/DGc6988cca0bT83VSZ2aN50F/bxPzsa2qMGpNOMUDHkexzlIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709424; c=relaxed/simple;
	bh=JogBTqccoO+KkL6tsA1bQ/2FuVBMhDdnPwuc99ht41o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qs9QJgRY2mWV1fgfVHZT2Y2DTULBiSUtHoO7gL09MLbnjuEpFSN8inoPgbFOqQrCV0O+DcYwO+wP0Xo7o9F1JiOvVKedjKP1qgHdnR13i4ts0sCOZmLawPYu/6MZZ63+p4XFzujip20eCJupU2M8GvK3pJPZs3yQRaOAkTGQWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=BzrGELte; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="BzrGELte"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=EW22cWh0LMGU4yusVk11xVsa2qGbobY68az3QHbVRAg=; t=1767709420;
	x=1768314220; b=BzrGELteI9hmVF40vKzu3yLrVUqXNkj0BdlwS9YzVt1y8ox6GM+4cWxIMiSt9
	lu4A+88jeK4gfQsZ12dERpVaDbO+I/Ww6MMbNYbgBStfNe7BnlQIYaq6j6MiPn+ql1YORrFRfR2A9
	HZekEYVZz6IQpopQtqmJzYlMVB3txXYNqnBt4uRRdQJHwfJgiwkoN0MM8fIL0iPaXJ9UnZpskPlYZ
	sYVYIam6VzxEPJMHDXJCyLVMd7tR6YZl5tt1X3BHKewBCYsZlUQx/k+Yv3IfE113adLC9EqX2N1NP
	iP5KHXpaNd3Bc+H5aFV8dxLygmS9lNesR7/YG7865o4NKygj3g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vd7yD-00000003muL-0ik0; Tue, 06 Jan 2026 15:23:37 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vd7yC-00000002i0Q-3uSd; Tue, 06 Jan 2026 15:23:37 +0100
Message-ID: <4f659cd47f55d7688a50f5c34066db638333b963.camel@physik.fu-berlin.de>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: =?ISO-8859-1?Q?Kolbj=F8rn?= Barmen <linux-m68k@kolla.no>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "port-m68k@netbsd.org"
	 <port-m68k@netbsd.org>, "debian-68k@lists.debian.org"
	 <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org"
	 <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Date: Tue, 06 Jan 2026 15:23:36 +0100
In-Reply-To: <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
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

Hi Kolbj=C3=B8rn,

On Tue, 2026-01-06 at 14:40 +0100, John Paul Adrian Glaubitz wrote:
> Hi Kolbj=C3=B8rn,
>=20
> On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> > On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:
> >=20
> > > To summarize:
> > >=20
> > > - the ELF header provides provides the e_ident and e_flags fields whi=
ch could be
> > >   used for identifying a Linux/m68k system using the 4 bytes alignmen=
t ABI
> > > - MIPS uses e_flags for differentiating its ABIs
> > > - PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x=
00 (SysV ABI)
> > > - qemu-user needs to be patched to deal with the changed alignment (i=
nclude/user/abitypes.h)
> > > - the kernel needs to be patched to deal with the changed alignment (=
arch/m68k/kernel/signal.c)
> >=20
> >=20
> > Does this patch exist somewhere? I ask because I am migrating to
> > 32bit-aligned userland (https://www.gentoo.org/downloads/#m68k) and the
> > gcc provided fails building kernel, stopping at arch/m68k/kernel/signal=
.c
>=20
> I haven't created that patch yet as my work on this effort is currently p=
aused. However, it should
> be straight-forward to update the asserts in the kernel code.
>=20
> According to Geert, Arnd Bergmann made some changes to the kernel uapi th=
at would allow the kernel
> to be built with either alignment. Not sure what the current state of thi=
ngs is.
>=20
> Let's CC Arnd to find out.

FWIW, please feel free to amend this page [1] in the Debian Wiki if you stu=
mble across any problems.

Adrian

> [1] https://wiki.debian.org/M68k/Alignment

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
