Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F51DEFE5
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731530976; cv=none; b=rHJkXUIbXCb6TbAx2HhTimH19qpdw+C85rHej09Xs3nPtWYxGf9zeR4RZwuk9PYHPeUHBgGAySj7cy0PDdHr960nM54+oHc3juzFulD/Ss5S0a0UBG0bkHwM0Ed8UfFCNeoejhuZnvLmjWa3D1i0oF5Zb4J83AUFVNNUpKT8wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731530976; c=relaxed/simple;
	bh=+0ec6NSEvSW4rXHO+FBpGknLdCrxdXnXkOUCVJs6U3c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=omqWJGD5Ym84YUFlbFhi4Ax5CkdU/EOMxp7RE1Ro1sftGvZrKO4is0TbMQP9ZMwoo1AAkAi1Rc66hhWwW4YhLapmZp4se7chzeDUT/o8wwhkNDRgkzTrClxGVogJzj9oHfPG9LqLgd5HyCFWI0mKd99GrMfZGlASVQlrAawPKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=EGP8ED2y; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="EGP8ED2y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZEBDE+/PDGi3mRRpBGoMEN7xzRnb3lcWjJHOUNcNbOo=; t=1731530972; x=1732135772; 
	b=EGP8ED2yCs0YwwfyOM2sv7eWqmOmwrB4DRqc27IwiSWkLJXoAaG12WpoxO9rQp5D6hcuRAbR86J
	Nvv2fGZ7pSO8iG7283tzLieCcvB83/z8Ffxx0gT+fvwTfRnN0y+JyjmIn+xeghjR4LlwCqlYJmCpQ
	l+Nh7l1ls3nzF/LRIv+uLoa3rFR0V1B39EtxYb6a+HjaIeVJP/fq2hb6KDFQ1JuVVcn+RQKhtINFg
	efDasd+YyprF+Zqo5pq4WOaD/326aU4hQqSmN6SOGmf5xHbSD6TYDgw/QqMzFU6yIJyPLF3998ZYJ
	w8wOZRLYMWsYxax7OTTtYFlC6u/eDD2D5s6A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBKIs-00000002G9P-2jUT; Wed, 13 Nov 2024 21:49:30 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBKIs-00000001YiJ-1imO; Wed, 13 Nov 2024 21:49:30 +0100
Message-ID: <39db0e0595db46dbc8eed7e6076372a6dc7ce38e.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>, James Le Cuirot	
 <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten
 Glaser	 <tg@mirbsd.de>
Date: Wed, 13 Nov 2024 21:49:29 +0100
In-Reply-To: <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
		 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
		 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
		 <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
		 <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com>
	 <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
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

On Wed, 2024-11-13 at 20:55 +0100, John Paul Adrian Glaubitz wrote:
> > Sure, you do pretty much all the work on Debian/68k, so you get to deci=
de.
> >=20
> > If this involves changes at kernel level (syscall parameter alignment?)=
=20
> > however, my recommendation would be to rather drop the port than end up=
=20
> > with new kernels no longer backwards compatible with old user space.
> >=20
> > Otherwise, I'd not even be in a position to do any kernel testing and=
=20
> > bugfixing (which often requires hardware, not emulators).
>=20
> I don't buy this argument. Why would your world fall apart if we switch
> alignment to 4 bytes. I seriously don't get it.

If your concern is that you won't be able to build a small userspace anymor=
e,
then you should keep in mind that you will always be able to do that with t=
he
help of Buildroot or Toybox.

FWIW, the suggestion to update the kernel ABI came from Geert, not from me.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
