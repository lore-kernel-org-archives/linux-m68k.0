Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88502690CB
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641309; cv=none; b=OJyqZgQlf9T7iCoh4+tLA3PurQftBQGgtpnPZ/xAhleAiaeHf5wup9jyYOb6Cu7N1eOKXWJHzbE3sY3GqQK6AfwWI4pl3o5Ip8Tb72Fz0Ky1iYmUPMuBnOHyEf6NFeG+P9pJUt0doiMvG5LeqlHmpnQ5HDFARt/TBQFfaztFnd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641309; c=relaxed/simple;
	bh=Zllp2rDMyqdALUU8i8AkLSF87ogAkX8j1+EFBeFl2g0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NQcMB71P1DqwBf86W/oh4uHdNzqZs1b2sjsu7z2KhtQ5zWQaj6SRBRNV9NALrw01B4CFryny6oYGUa0mKLtlmeb/4xJl1SQd2dYL35OWTr0KtI3ORO2Ul0bohKctdSxrtR/LK3gVJ7Rodr5mGELrTOK60jJOLN9FSdQ/Ez1HvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=gJ/p/WzL; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="gJ/p/WzL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sis+rPhgrGsERsF3/osqFiVbFi4KXVHU37DfT+wJStk=; t=1747641306; x=1748246106; 
	b=gJ/p/WzLYVVijC04EVzmWB0SM3pqfm9QgiqUxxXLvnNoFloKyHKNByQXuhwLGMQEAxqyrPwSVw+
	l/p2HSTibrVBR4ZDqcJ8i2wh3QQzF/4jqpsk+7mgPlLE5tIriekdfX8V0CaNxucgnPw5qTJFac2U2
	lMCagxZ/VP9NvKoyaFHY+opkBIeryhT8xHv1fS8PjjjIY2pX5i+S6Thgc2qcpvqaI2O7qc/EMzTnh
	CYN3k98pOQyaEaEYizQuMIGfDsk9WeKdufP8h9GSxMvxBjscTQP6RyOrs+d6m7F+f/AShM6tJj1bc
	plSyv0licLKGu8eSyv2lH+zZLaeG1bxdWjVw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uGvKq-00000003lhg-2mO3; Mon, 19 May 2025 09:54:56 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uGvKq-00000002tpj-1kLM; Mon, 19 May 2025 09:54:56 +0200
Message-ID: <75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Antonio Vargas Gonzalez <windenntw@gmail.com>, James Le Cuirot
	 <chewi@aura-online.co.uk>, libc-help@sourceware.org, debian-68k
	 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 19 May 2025 09:54:55 +0200
In-Reply-To: <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
	 <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
	 <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Geert,

On Mon, 2025-05-19 at 09:42 +0200, Geert Uytterhoeven wrote:
> > AmigaOS doesn't use ELF though, it uses COFF. And Amiga Unix, which use=
s
> > ELF, has a default alignment of 4 bytes as specified by the AT&T ABI.
>=20
> Initially Linux didn't use ELF either, but a.out.

Yes, the same applies for NetBSD. This also becomes obvious that the
NetBSD header on m68k is called "netbsd-elf.h", instead of just "netbsd.h".

> SunOS4 (based on BSD) did use 2-byte alignment on m68k, so I am still
> surprised NetBSD didn't follow suit.

When NetBSD still used a.out, it actually used 2 bytes alignment. They
switched over when they switched from a.out to ELF, see:

https://wiki.debian.org/M68k/Alignment

> SunOS5 (based on SVR4) no longer supported m68k.

True. I would now be really interested to find out what my Sony NEWS
machines use on m68k. According to Wikipedia, it's based on SVR4, so
I assume it uses ELF with 4 bytes alignment, see:

https://en.wikipedia.org/wiki/UNIX_System_V#SVR4

There is also an Atari Unix which I would like to test as well.

> I expect (the history of) the gcc sources would tell you more about
> the default alignment on other (legacy UNIX) OSes supporting m68k...

Good idea. I will do that. My assumption is that on Linux, GCC developers
actually just forgot to switch alignment from 2 to 4 bytes with the switch
to ELF unlike NetBSD.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
