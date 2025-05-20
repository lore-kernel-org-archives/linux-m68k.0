Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78420C473
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736292; cv=none; b=AZrGztkrs8GiSiGxGiLHtgvFRKyj5tpc3Wa+cibLdrs+YyppTO6rfXRZLzNCZXwkfyJOozfHt8I9gt6KQHwmby3DoCYmfMDeUCnMzZHD2Evq80E8A3Q26qaz/8Ea+31R6THtzSGw7ZmC5dCFyNBzz0OwxSlVzaxleaFkDl9XTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736292; c=relaxed/simple;
	bh=N3dutSsjTJoWxu/TsReCBMsM0TnLJB+2jUKS5u0GbCU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=azGHOotJOd8IZ5+htGW9KrpFyA9zQ1PuUN9Tixo3yaf1YNPRDXRbOpuUWKmbtIHDjpZ2OwgBejSI4HjnHriJLE6QBGmlBXuwJbRyVNiyWafswgVnFy7Ho89rlvkK44L7vv5M6JhgPoaBTHPITDD4uVLXqTPYZdwd94vc3pYqsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hID0/nm1; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hID0/nm1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+f6GVt4D1Jgkor63aUzwjW/GCwDr1HkBJIu1D2iPlj0=; t=1747736290; x=1748341090; 
	b=hID0/nm12e5N1hNQevrPm2VHdjzqseRXBMI8nC70wdtV2/RisSTblIJDG+8VfOqC34/NB5cF+xc
	66WAQnhhVimneAn3p47iIS/kmNmDdVewV/HJajy/m+l/ZgsdV4GWhn+OMyaY2+31Qm2rIxbwrEM6R
	r4y6ORyTylmtqg0aQQ9gpV7j5mkmKmLiFzK6Zh4e2gpLRGChdCthZPZgO2y0/z9Jfv0jOYIa8g7A3
	O2anWM+fDse+8L28eeXGF6dEPIxLpxDIZ/w+8pUpjFDYridnBqM8kronMuqPG2wZ+dlyySX8KSRI3
	ukHec/eaQCL3S4ixyNAJFJkuw1cbqp+GeKGg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHK2w-00000001SNv-2naR; Tue, 20 May 2025 12:18:06 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHK2w-000000046Qs-23HL; Tue, 20 May 2025 12:18:06 +0200
Message-ID: <0f7345713d232c46f241e3b0a9303f76adebbde1.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Florian Weimer <fweimer@redhat.com>, James Le Cuirot	
 <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>, Libc-help
 <libc-help@sourceware.org>
Date: Tue, 20 May 2025 12:18:05 +0200
In-Reply-To: <23cce228-e58c-9c5d-74c7-49b0c77c35b7@linux-m68k.org>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	    <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	    <8734d1kofn.fsf@oldenburg.str.redhat.com>
	   <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	   <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	  <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org>
	 <48411baea4164252cba5635b09325c8acf29f3bc.camel@physik.fu-berlin.de>
	 <23cce228-e58c-9c5d-74c7-49b0c77c35b7@linux-m68k.org>
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

On Tue, 2025-05-20 at 19:55 +1000, Finn Thain wrote:
> On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:
>=20
> > > As for gccgo, has that ever worked on m68k?
> >=20
> > Yes.
> >=20
>=20
> Why is an ABI change needed to get it to work again?

Because software changes over time. Qt used to work with 2 bytes alignment
as well when it had less features.

> > > Other language runtimes work fine on the m68k ABI. Why is Rust=20
> > > special?
> >=20
> > You mean other languages such as JavaScript, Go, Java, Python and=20
> > WebKit?
> >=20
> > No, they don't work fine on m68k.
> >=20
>=20
> Python works -- you patched it yourself! -- it doesn't need a special ABI=
.

Yes, I had to PATCH it. That's the point, Finn.

> As for the Java runtime etc. I've never tried to install them on m68k but=
=20
> I know they were ported to a variety of ABIs with a variety of alignment=
=20
> rules, that do not guarantee natural alignment of integer types.

I see. Since you haven't tested it, it means the bug doesn't exist.

Gotcha.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
