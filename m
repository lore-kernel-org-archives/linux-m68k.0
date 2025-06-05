Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5ED1F3FE8
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106588; cv=none; b=Zg86Dd8V4BVnaKqNQNnwkVU9vJnKspCWi/84teX0wicpleWqBwVA9597KkkcXXmDbxoz1qVnTySaxkQiKRx3UxIE2FGulLoGfMfnH7krLb/Got6PCcrnnJDTLgaoMAze2CtYYP9xTHcy1XIxytTVASOL5I+DfKnQ59hnV2ujBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106588; c=relaxed/simple;
	bh=r0of+TopCYlsqoq+q3TOUyXH54yhfie/Yl3KnphudHs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZSRnNShkd7f1Ggymjc5cmlOo/l+CmdlplPbai/sV/vb9z0pW+CyfYjAJke/1tEbqxgy5bNDi76RJ04vwhbMiQnk3KKSOUsZiI3Gf+dRaDnZe98qeChh6gXRCJSCNEbgFWOg8KXE/CHsnD/Ewzj2umb03FQB/rzhr7DzO7fhqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=QF4s1++M; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="QF4s1++M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D5McY93bJGv9BvGrr/wByBY5xBhd+Z1KS40VsCI8pIM=; t=1749106585; x=1749711385; 
	b=QF4s1++MQYb1DARDdYD/cqXdnrldHxjwLTSZu1Qq+HnhviYveKFCEsW18EuMqTsWsYknBreXVox
	BYhSUBk51jjrrpc+SEXJkWKA+4crpoZofbEgcEm4226PcPyeJ/c5mf0p/oX3lSpIzlsLRiav3DMIE
	DFPM5UDTK0wJuY4WSRA8UldQh2+x12ybtzn4kvmDL0+NCjlhOc3xD7/M+8KGDDwF3UJRWHvEqi3U3
	xl+jG5VeopxmLjn2pbLZmUKxZIARPUXUAWinF+bian8xaJ0OqTg8s0kjZ2kOPJS6qbThp+uwMuoe3
	kxr304/dvHZxPGz2HEGcMwEBm8OMKkOlLaRg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uN4WV-000000042AP-3DG8; Thu, 05 Jun 2025 08:56:23 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uN4WV-00000003Ibz-2Ijg; Thu, 05 Jun 2025 08:56:23 +0200
Message-ID: <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k
	 <port-m68k@netbsd.org>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>
Date: Thu, 05 Jun 2025 08:56:22 +0200
In-Reply-To: <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
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

Hi Jean-Michael,

On Thu, 2025-06-05 at 08:50 +0200, Jean-Michel Hautbois wrote:
>=20
> I had to change three offsets:
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index e628b859ef21..5b8ef98565c2 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -618,11 +618,11 @@ static inline void siginfo_build_tests(void)
>          BUILD_BUG_ON(offsetof(siginfo_t, si_addr_lsb) !=3D 0x10);
>=20
>          /* _sigfault._addr_bnd */
> -       BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x12);
> -       BUILD_BUG_ON(offsetof(siginfo_t, si_upper) !=3D 0x16);
> +       BUILD_BUG_ON(offsetof(siginfo_t, si_lower) !=3D 0x14);
> +       BUILD_BUG_ON(offsetof(siginfo_t, si_upper) !=3D 0x18);
>=20
>          /* _sigfault._addr_pkey */
> -       BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) !=3D 0x12);
> +       BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) !=3D 0x14);
>=20
>          /* _sigfault._perf */
>          BUILD_BUG_ON(offsetof(siginfo_t, si_perf_data) !=3D 0x10);

OK, great. This is valuable information.

> The kernel is booting, so, I suppose it is working :-).
> Now, I can't send a patch fixing the offsets like that, as it depends on
> the BIGGEST_ALIGNMENT value...

Yes, please send a patch. I don't expect it to be accepted immediately, but
it will help us spur a discussion on the necessary changes in the kernel.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
