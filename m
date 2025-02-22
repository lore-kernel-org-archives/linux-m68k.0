Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93046434
	for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Feb 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217337; cv=none; b=McP95jd7D5LxJ46wWazn/E0LkhIo6PfjfFyW6WQWYjqvdqx+gF8ff6Dc0kRzPphO/mA2IUQBnU7pgpuGuuhYO9cJi2WVMPP+avcXX1o7VlSMTWLFmJfx3EofHn06cNGXVCrRVoOsksMVuxfBSN3kiDFdmm4OhJKejqUOaJmKP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217337; c=relaxed/simple;
	bh=7VL6LXZKHPZddpWh4AqeSxV/nmwjJPDuVUJ7sIvggpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brIssC667HrEE5tUUwsqEaL0zJdKvHeYnMPJKRYE9PIdxzTDJKM1MTvro2NqdtoGVz77bysIgGo7hBwclpKML7Wmb1pXgz/krj7lhVtKWTdY89F5mgKrmHrYmuuepMMS3LNl37gy5SqrnX6eiSlTR++y8bJfCmkUGHvLg7kJeqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OZn16iMN; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OZn16iMN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A17E10382D37;
	Sat, 22 Feb 2025 10:42:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740217331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcDOPF+IOHTP8Zszlw+5Q1yQ4fD2yJTF+2USdZFRXkw=;
	b=OZn16iMNzQPZzvTBp1zg7l3LKqWtEPwd6LEXenP1K/IuZxde48G7htbRMG/H2PxCZZlc1K
	t8XFtzskUBVze+dxvHiTcYyYkSUE78m3pi9EvJR2TsU9uptCeLsEZw13pkNfQs06OBW0bg
	S5wl+ekF+5dG1/9mQiYtzQ+ga6nRlWAtqyv88bLzcxI2Y8AgLWASSZTkSYgsaBdWurJx4G
	jXXbMxYk/4E6+mMLFlBB/T3j75xNv6Rj3+YxKSTbTBz0S1l57CCVCrHy2Mc/Eatgq1cUNc
	czTwt+auD4+7ao3VamD3HlF9ihIzRLGHuCY5jmSasM89L9xDRYWbRzOQA/Z9ow==
Date: Sat, 22 Feb 2025 10:42:07 +0100
From: Pavel Machek <pavel@denx.de>
To: cip-dev@lists.cip-project.org
Cc: Finn Thain <fthain@linux-m68k.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [cip-dev] [PATCH 4.4.y-cip] signal/m68k: Use
 force_sigsegv(SIGSEGV) in fpsp040_die
Message-ID: <Z7mb7+BXBDSD4a5G@duo.ucw.cz>
References: <72a512bd5463ee04f4840f49cee2f3c3@linux-m68k.org>
 <960544762.1079819.1739441787128@webmail.strato.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sZ5btrWbNoOlMKR"
Content-Disposition: inline
In-Reply-To: <960544762.1079819.1739441787128@webmail.strato.de>
X-Last-TLS-Session-Version: TLSv1.3


--6sZ5btrWbNoOlMKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Sorry, I saw these five minutes too late. Applied for the next release.

I guess these should go to 4.4-st, but I don't see them there. Did you
forget to push?

Best regards,
								Pavel

> > From: "Eric W. Biederman" <ebiederm@xmission.com>
> >=20
> > [ Upstream commit a3616a3c02722d1edb95acc7fceade242f6553ba ]
> >=20
> > In the fpsp040 code when copyin or copyout fails call
> > force_sigsegv(SIGSEGV) instead of do_exit(SIGSEGV).
> >=20
> > This solves a couple of problems.  Because do_exit embeds the ptrace
> > stop PTRACE_EVENT_EXIT a complete stack frame needs to be present for
> > that to work correctly.  There is always the information needed for a
> > ptrace stop where get_signal is called.  So exiting with a signal
> > solves the ptrace issue.
> >=20
> > Further exiting with a signal ensures that all of the threads in a
> > process are killed not just the thread that malfunctioned.  Which
> > avoids confusing userspace.
> >=20
> > To make force_sigsegv(SIGSEGV) work in fpsp040_die modify the code to
> > save all of the registers and jump to ret_from_exception (which
> > ultimately calls get_signal) after fpsp040_die returns.
> >=20
> > v2: Updated the branches to use gas's pseudo ops that automatically
> >     calculate the best branch instruction to use for the purpose.
> >=20
> > v1: https://lkml.kernel.org/r/87a6m8kgtx.fsf_-_@disp2133
> > Link: https://lkml.kernel.org/r/87tukghjfs.fsf_-_@disp2133
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > [ Pass 'current' to force_sigsegv() as was done prior to v5.3 ]
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >  arch/m68k/fpsp040/skeleton.S | 3 ++-
> >  arch/m68k/kernel/traps.c     | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/m68k/fpsp040/skeleton.S b/arch/m68k/fpsp040/skeleton.S
> > index 31a9c634c81e..081922c72daa 100644
> > --- a/arch/m68k/fpsp040/skeleton.S
> > +++ b/arch/m68k/fpsp040/skeleton.S
> > @@ -502,7 +502,8 @@ in_ea:
> >  	.section .fixup,"ax"
> >  	.even
> >  1:
> > -	jbra	fpsp040_die
> > +	jbsr	fpsp040_die
> > +	jbra	.Lnotkern
> > =20
> >  	.section __ex_table,"a"
> >  	.align	4
> > diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> > index 35f706d836c5..c6f18dc5884b 100644
> > --- a/arch/m68k/kernel/traps.c
> > +++ b/arch/m68k/kernel/traps.c
> > @@ -1155,7 +1155,7 @@ asmlinkage void set_esp0(unsigned long ssp)
> >   */
> >  asmlinkage void fpsp040_die(void)
> >  {
> > -	do_exit(SIGSEGV);
> > +	force_sigsegv(SIGSEGV, current);
> >  }
> > =20
> >  #ifdef CONFIG_M68KFPU_EMU

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17828): https://lists.cip-project.org/g/cip-dev/messa=
ge/17828
> Mute This Topic: https://lists.cip-project.org/mt/111159546/4520429
> Group Owner: cip-dev+owner@lists.cip-project.org
> Unsubscribe: https://lists.cip-project.org/g/cip-dev/leave/8129118/452042=
9/629823354/xyzzy [pavel@denx.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--6sZ5btrWbNoOlMKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ7mb7wAKCRAw5/Bqldv6
8g0dAJsEGzwMUI7bRHyBHG9FKPfCY/B2YwCgjOa145RAANiVX0xZsMEFg2DIBDo=
=LeLN
-----END PGP SIGNATURE-----

--6sZ5btrWbNoOlMKR--
