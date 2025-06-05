Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F01F181F
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105760; cv=none; b=qIFiOPgP54aKLGuSNaspN9C2JHMHdH0tPCK9a5PeXruwvgbXIRJffr3RkfnqP89dHmKRKJgxW9lF7ti6Ve/IAU7Cui8l9REtaiFz9GVeQ9yNfkqOWMI/dETp8ZJgfJsHqZNf9zEpUa9hphk/w7o8+eFH6glIP9cqz88ctKL2AfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105760; c=relaxed/simple;
	bh=jQve5/gWdzWzuYGKQ/juSEuPxCf+f86POOqWH1w4ZW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QALwu0YfjHZ3T8t9gM19RRoOn6T+rPITPLhQeCNTj1FYMipxyH0WHYx9+B7ZHZmaCL0RdYyTbu6f2Kev5ZWXHrNQqFfUlXbISlQoF5pi06zDYNrvuH+Jlut7/rj24QqrnV5xMow22EhiAcB31fT4R81wWqcTwBv+v8wnijoFuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=FX2X4JBK; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="FX2X4JBK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5AH1fl57GhfseWmtrOoaceTtq4fe9UdWthlb1v+uxgo=; t=1749105755; x=1749710555; 
	b=FX2X4JBKhO6Pq2Kb3+HeGitPEaaGxWpfYrksXWb+fA6TbWEuMVQP1rmefllD02qQXZP+jtFgwy4
	QGvqQCUpyJRXrxGaQwRfrFM8QYydSxINS4khPHqyQ5c4sz/4ajJXtCxPaQH5tlmnlZfX2tx8L+fVu
	0NkOi8/JRIe+KYmTySh3OceRiYEb3OkKxrVAnvPIHNE4aIB4VMCoTpNSzn1S1Vxs9Udi4U1KmgNQX
	SIP2ND529JSuZvZns0QJPkYRhhVf2XKYIKc6lmUyCznyBog6Qg86lDK7YL9/fRmzMnbo2nWGQa9Wu
	Tsx/UL6trsw0EYHLOc9z0jNEvsLtJSCl+81A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uN4G5-00000003xA6-1tmK; Thu, 05 Jun 2025 08:39:25 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uN4G5-00000003FJP-0xEZ; Thu, 05 Jun 2025 08:39:25 +0200
Message-ID: <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k
	 <port-m68k@netbsd.org>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>
Date: Thu, 05 Jun 2025 08:39:24 +0200
In-Reply-To: <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
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

Hi Jean-Michel,

On Thu, 2025-06-05 at 08:24 +0200, Jean-Michel Hautbois wrote:
> I tried to patch gcc-13 with this BIGGEST_ALIGNMENT set to 64. I am=20
> using buildroot+uclibc-ng on a Coldfire (mcf54418).

Thanks a lot for testing! Such contributions are highly appreciated.

> Everything build fine, except the kernel:
>=20
> In function =E2=80=98siginfo_build_tests=E2=80=99,
>      inlined from =E2=80=98restore_sigcontext=E2=80=99 at arch/m68k/kerne=
l/signal.c:684:2,
>      inlined from =E2=80=98do_sigreturn=E2=80=99 at arch/m68k/kernel/sign=
al.c:775:9:
> ././include/linux/compiler_types.h:542:45: error: call to=20
> =E2=80=98__compiletime_assert_351=E2=80=99 declared with attribute error:=
 BUILD_BUG_ON=20
> failed: offsetof(siginfo_t, si_lower) !=3D 0x12
>    542 |         _compiletime_assert(condition, msg,=20
> __compiletime_assert_, __COUNTER__)
>        |                                             ^
> ././include/linux/compiler_types.h:523:25: note: in definition of macro=
=20
> =E2=80=98__compiletime_assert=E2=80=99
>    523 |                         prefix ## suffix();=20
>          \
>        |                         ^~~~~~
> ././include/linux/compiler_types.h:542:9: note: in expansion of macro=20
> =E2=80=98_compiletime_assert=E2=80=99
>    542 |         _compiletime_assert(condition, msg,=20
> __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro=20
> =E2=80=98compiletime_assert=E2=80=99
>     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond),=
=20
> msg)
>        |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:50:9: note: in expansion of macro=20
> =E2=80=98BUILD_BUG_ON_MSG=E2=80=99
>     50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: "=20
> #condition)
>        |         ^~~~~~~~~~~~~~~~
> arch/m68k/kernel/signal.c:621:9: note: in expansion of macro =E2=80=98BUI=
LD_BUG_ON=E2=80=99
>    621 |         BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x12);
>        |         ^~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:207: arch/m68k/kernel/signal.o] Erro=
r 1
> make[4]: *** [scripts/Makefile.build:465: arch/m68k/kernel] Error 2
> make[4]: *** Waiting for unfinished jobs....
>=20
> This is a 6.14.
> Any idea about this ?

It looks like this check needs to be patched:

	BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x12);

The source code in arch/m68k/kernel/signal.c contains a lot of hard-wired o=
ffsets
which will probably have to be adjusted.

You can try changing 0x12 to 0x14 and see if that fixes it.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
