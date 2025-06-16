Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9F20F09A
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088370; cv=none; b=TI5LtUXgYmnW0cS7Oj4XHSIyAqkIriYgXq7OY/ZCMJ0bGHS1eWfwAZkTMLmtehoQJVZXVHE7fij3mSn1YBiqMCybTA7lPKF8abXrofch4EypsyVpI0dlfGmQkDa/UMBW5+6PERtY/FpuW5cRTPXRpYsT55OaZ6SyosKEUl9uHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088370; c=relaxed/simple;
	bh=wTs9PvnK+crjJTf9ibbXUQswAVVkNPykEOMGE887p6Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HR8/h5reO6wG+TbrcjOgm08oNzHOiDAoIikwGTnQFceEyjDjWJnm85VC3V4n+LMp9D2jxiXkAuvGlGjgnFYGvZC1Q4J2KaMoQTWrQqTJLcfaLqHV+xwS9pvq9o36wKleNiIh7CpkPLfDCiZYp0RQVOzsE3ch/+9u07ADxHmtO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=RFAQHOHW; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="RFAQHOHW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ERVhdRzh6ZFj216OKzS3ijsGEb46a58FndlrqkCltHk=; t=1750088367; x=1750693167; 
	b=RFAQHOHWzUyaZclf3TibG/flrQwpBsug61CXAxoX0+YtwfgkYT7BAHmjDl0oAbF+FPtGcvaku4w
	Uv7+2wkRSJs73pQ/XOU5jD8kxAuG2AywJF/SDIZlXzuJY6sb0RE3bsTCkHAyKjlpHxaxiyViCM1kR
	8hY9TjnGFIItTLhUsgFDqblVi1rgVo2crDN6gXCEQpB+HurXVR1aa17Ct9ax1iV8SlEE5h6EA24Oe
	ZsMNaeEiAW8yrZMjPydMia9fZ63eNB0krlKRLrtGxc7zIBPeO3tjh/cfCYWlQoaHNd056N51u+bUu
	ZTWQ11HtPCoFoAcrZ3Rl4RJdDft7vnq0FuBg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRBvg-00000001lTy-3eEe; Mon, 16 Jun 2025 17:39:24 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRBvg-00000001GRr-2dmw; Mon, 16 Jun 2025 17:39:24 +0200
Message-ID: <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
Subject: Preliminary results -  was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
 "debian-68k@lists.debian.org"
	 <debian-68k@lists.debian.org>, "linux-m68k@vger.kernel.org"
	 <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 17:39:24 +0200
In-Reply-To: <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
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

Hi Geert,

On Mon, 2025-06-16 at 14:29 +0200, Geert Uytterhoeven wrote:
> Hi Adrian,
>=20
> On Mon, 16 Jun 2025 at 14:21, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > I wrote that message on Friday. Odd that your email client claims it wa=
s sent today.
> > Besides that, I would like to point again at what John Klos wrote in re=
ply to Finn [1].
>=20
> The increased email traffic during the Linux kernel merge window
> causes lots of delayed email :-(

Hmm, I see. Let's cool this discussion down a bit and summarize what we got=
 so far:

To summarize:

- the ELF header provides provides the e_ident and e_flags fields which cou=
ld be
  used for identifying a Linux/m68k system using the 4 bytes alignment ABI
- MIPS uses e_flags for differentiating its ABIs
- PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x00 (Sy=
sV ABI)
- qemu-user needs to be patched to deal with the changed alignment (include=
/user/abitypes.h)
- the kernel needs to be patched to deal with the changed alignment (arch/m=
68k/kernel/signal.c)
- NetBSD uses an emulation layer which allows 2 bytes alignment a.out execu=
tables on an
  ELF system with 4 bytes alignment
- glibc needs to be patched in sysdeps/m68k/utmp-size.h
- gcc needs to be patched in gcc/config/m68k/linux.h (BIGGEST_ALIGNMENT to =
64, EMPTY_FIELD_BOUNDARY
  and STACK_BOUNDARY to 32, see netbsd-elf.h)
- the glibc and gcc testsuites should be run in a 4 bytes alignment to chec=
k for regressions

Anything else I'm missing?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
