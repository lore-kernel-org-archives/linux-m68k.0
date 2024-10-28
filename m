Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B6191F73
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101222; cv=none; b=TMddLbeuA/3E0fTRqR3qY21R6I9ZoKRXGZO6m+RDEs8UOwCBo4NfIKkyj2qji/v1T3D8Bah0rXfNtlPAWg9ag8C/LZY3rKiYylcSEXX6tGlPp6tzS7H1M0PfXFUYOVDDCo/xWc0uS2j+cRswDFM/mItjVlT1UI/3fR6QUl9OTkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101222; c=relaxed/simple;
	bh=szdGhpb+9qtkaXGgP0ZBrMNQpjRsijQ1dm2u0VhV5mA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVcuhcvFtnJk/Nnh8N/gemE2neqpETy/uXHIuakzBWzRDWcf1/zekRKiMkaQj9iNCp7YXBFQXH7Ba1S9bbHwDma0ze/MKYfkxignBNQRsVvDzY3wNeSxYsPweDMwiIhFhFWQKxuXoI9oQpwe9kb7MsPY6d6QcyPvRLuFuTsYJ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ohTgGSdn; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ohTgGSdn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H3SwTDiNbIDHIcelG9ia3+yqIMrR2uAiVxMTMqhvQsE=; t=1730101219; x=1730706019; 
	b=ohTgGSdnWDg9CS5dCNk8aPZ/h3rq7OFFMC2oiHzTyaL8691LERngByGwk8Er1W/Z+ILmqufzRmV
	6tGJIINaHwQ4U8nmrKsw/JTQAxYioHl9jTTYZe8t2i2IrmquQCt/IhHkTW2rl6epWdZWi/a5L43+j
	NVejwAe/CaE5EDwNPvFiB/VGrbQTJtzs2+MwaCPJeFUKGwSwC8p+uIryPGsiAaaVIknANdI9jj0KJ
	yrVDbmm0hf+hYhjtoFfRIaWnSVL+6lZuNb+QHlV/sHVY/61G7xDnGI7UzjY2E8DPMiPXpAltXbu7n
	NrBx77v0JraEf4lngPPmUTEdrIi/C6TvtlUA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KML-00000003zE6-0wl3; Mon, 28 Oct 2024 08:40:17 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KML-000000027x5-00xF; Mon, 28 Oct 2024 08:40:17 +0100
Message-ID: <762f5be0aec0c50b2589ebbd60c6d104f9871526.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Thorsten Glaser	 <tg@mirbsd.de>
Date: Mon, 28 Oct 2024 08:40:16 +0100
In-Reply-To: <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
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

On Sat, 2024-10-26 at 18:31 +1100, Finn Thain wrote:
> > The following packages require 32-bit alignment:
> >=20
> > - mold
> > - LLVM
> > - gccgo
> > - Qt5 (several packages affected)
> > - Qt6 (several packages affected)
> > - OpenJDK (all versions)
> > - Python >=3D 3.13
> > - Rust
> >=20
>=20
> That seems to imply that someone requires that those packages are ported.=
=20
> But without a bug report from such a user, to say the package is broken o=
r=20
> missing, one must question the real requirement.

People have tried this in the past and it was an endless effort. It's not t=
hat
it hasn't been tried. And there is zero chance that any of these projects a=
ccept
such patches to support unusual alignment.

It's not that I'm not speaking from experience having maintained the m68k p=
ort
in Debian the past 10 years. The Gentoo folks will tell you the same.

> > Those are the most important projects from the tip of my head, but they=
=20
> > are already the biggest blockers. There is no chance that the upstream=
=20
> > maintainers will adjust their packages for 16-bit alignment, so these=
=20
> > will be forever broken on m68k if we don't switch.
> >=20
>=20
> I'm curious to see such a refusal in context, presumably as a result of=
=20
> patch review, in an upstream project bug tracker.
>=20
> I'm not actually expecting to see good patches refused by core projects=
=20
> like Python. (Note that MicroPython is available for commercially active=
=20
> CPUs like the PIC16 family, which are 8-bit processors with 16-bit addres=
s=20
> bus.)

Why does my word not count here? It's not that this problem is new.

You can also ask Andreas who maintained openSUSE on m68k for a while and
had to carry lots of local patches.

> If upstream QT or Java developers decide that their software is "not for=
=20
> us", they may well have a point. Those packages are not installed on my=
=20
> m68k systems, FWIW.

This is isn't just about runtime dependencies but also build dependencies
which is why I linked the statistics page in Debian. A lot of packages in
Debian/m68k can currently not be built because they have a transitive
dependency on Rust, OpenJDK, Qt, GNOME and so on.

> OTOH, as I've said before, if upstream developers (like Arnd) are looking=
=20
> ahead to 128-bit platforms then they will be paying attention to alignmen=
t=20
> rules. They should be inclined to favour explicit struct definitions over=
=20
> implicit alignment, don't you think?

Debian just transitioned all of their 32-bit architectures to time64_t exce=
pt
for i386. Do you know why they did that even though 128-bit CPUs are practi=
cally
around the corner?

> > I understand that this might be a painful transition, but I don't see=
=20
> > any other way to keep the m68k port alive in the foreseeable future=20
> > unless we fix this problem which keeps blocking the port.
> >=20
> > You can see how the Debian m68k port has been falling behind because of=
=20
> > the alignment issues in these statistics:=20
> > https://buildd.debian.org/stats/graph-ports-big.png
> >=20
>=20
> I could imagine a viable transition to a new ABI driven by widespread use=
r=20
> demand or involvement. But not by distro stats or maintainer preference.

Well, I'm doing the work, so I get to make the decisions here, no?

> Absent the right conditions, perhaps it is best focus limited porter and=
=20
> developer effort on patching only those packages that are really required=
.

Thanks, but I tried that and it doesn't work. I don't want to continue spen=
ding
hours on trying to figure out how to fix alignment problems and then maybe =
send
an email here and there to just never get an answer.

You're somehow implying that I'm requesting this change because I'm just la=
zy.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
