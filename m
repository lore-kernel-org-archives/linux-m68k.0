Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA99101C8
	for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980270; cv=none; b=B1hZRFz1lDc0MyQ+pbjoQsZNvyOe4Ica22H91e4yBzsednwvmnfuXXIbLwgSyVbwheNi3F2QskB9I1+GpOPBtZo22IQR8vfteko9hPhVzKCfnX6k62eetSaUO81IEeObr4f9Ji9YIhGaH4M+qdTIW3kCU1TPdltKgWhUPLAEfc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980270; c=relaxed/simple;
	bh=3joII0Av/cCZId+QZhKr/fCGXjSEKodOfgUkfjbd4VU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W1PZxfnyLLgrCPgvkjlpAou2ciHe4ztgKpps82IiVLrf4piHvPwFqXkFinIRGYCPS5I9Kk52CHaqWFdT06bcoQX0QV4zEtO2cKfmkNompwr+UN5B7i0+sKOlgsI80o+gORcmieUuX/WqRgwsQJ9Hhj1YB5UARcnpGF3rJzN5qHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (2001-4dd7-f55b-0-21d-e0ff-fe77-c17b.ipv6dyn.netcologne.de [IPv6:2001:4dd7:f55b:0:21d:e0ff:fe77:c17b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 8B4D01000AD;
	Sat, 26 Oct 2024 22:04:18 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 38CFB143472; Sun, 27 Oct 2024 00:04:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 328E1141D48;
	Sun, 27 Oct 2024 00:04:18 +0200 (CEST)
Date: Sun, 27 Oct 2024 00:04:18 +0200 (CEST)
From: Thorsten Glaser <tg@debian.org>
To: Finn Thain <fthain@linux-m68k.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
Message-ID: <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 26 Oct 2024, Finn Thain wrote:

>> The following packages require 32-bit alignment:
>>
>> - mold
>> - LLVM
>> - gccgo
>> - Qt5 (several packages affected)
>> - Qt6 (several packages affected)
>> - OpenJDK (all versions)
>> - Python >=3D 3.13
>> - Rust
>
>That seems to imply that someone requires that those packages are ported.

Yes, we do. Rust especially is killing the entire FOSS ecosystem.

These all are conditio sine qua n=C5=8Dn when it comes to continuing
Linux/m68k, as a whole.

>Absent the right conditions, perhaps it is best focus limited porter and
>developer effort on patching only those packages that are really required.

I tried my hand at Qt5. About 20 man-hours in I essentially gave up,
and that was without even getting to something I could put to a
compile and runtime test.

=E2=80=9CNatural=E2=80=9D alignment of data types has essentially become a =
requirement
these days, and m68k is the only true outlyer (i386 could in theory, but
the Unix psABI designers were sensible enough to not do it).

bye,
//mirabilos
--=20
<igli> exceptions: a truly awful implementation of quite a nice idea.
<igli> just about the worst way you could do something like that, afaic.
<igli> it's like anti-design.  <mirabilos> that too=E2=80=A6 may I quote yo=
u on that?
<igli> sure, tho i doubt anyone will listen ;)
