Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA01885AF
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527720; cv=none; b=EEqfXxIjpG1JPkwxQZoPtFLPlAUve6/UHQ/Dc+bTWnwcWO90Sk/H09sGRCnyTdkS1OJWI9+b2uwDAqnYfgzN/mzlEQjtNdT5Z1sePo9Gv3aMvDJBEiZNQ0+w0UXcovI24nmRIQlO8MNwtt2VWJ2p74BGDq/10AnK+kkWatLv1AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527720; c=relaxed/simple;
	bh=UVgvZLmZkrgw7LuIonQqtzYELULFtUVwB1WYepvcxrg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dwoe3qwzA0nMkZ6xWSepWT7dTdM52rW2GyOP0oAsM1Pt4THwzdHVQcTL+aKWUXodbtoKY5N9OJdr+v/rkf7sQuq3MtDUX9equdKkh4KPTq75l68luF2zdFyExDucw4bPTNgxJcA9z8QvT5p0UNzGTg6Ee7qlppAMPkc6REsPMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=TcZNk1qX; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="TcZNk1qX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iAKAqORezOh17pZh/GlGECSN65RAb/iBgL2VpHq7HBE=; t=1731527716; x=1732132516; 
	b=TcZNk1qX4/TjxdLvPMMfP2hau2TB7lqUE2PjQmYr9ifx4paVSzyuZNdXdYFK9A3Oj/YMJWp5TLn
	tU9uLPUMw2qin/2KiLqnbUvwEkmmplfjlX/h5ljRnk8KYb0kDrEyZ/05QcdJkb9X7ChQVUg8RiO0P
	Sk8dgrRbAOQLbRugDGYetnDQaJVBS6VJ/SvKVkJPtxbci10go41QkVCBfvtuC7v+BLmQnC6mpIGBX
	qS7YbiryLA+TQtaWhBcTjFmGv4GlmOv2SYI+BpxVWIqNSR0zz3Yt3cpc2Fk5TyRPd0JfuMT6GYVlE
	5lJrMphOuNeqYIDRS1Ok4Y/1L5q0aT31i9Bw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBJSL-000000021cA-1KwK; Wed, 13 Nov 2024 20:55:13 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBJSL-00000001LLV-0SPb; Wed, 13 Nov 2024 20:55:13 +0100
Message-ID: <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>, James Le Cuirot	
 <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten
 Glaser	 <tg@mirbsd.de>
Date: Wed, 13 Nov 2024 20:55:12 +0100
In-Reply-To: <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
	 <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
	 <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com>
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

On Thu, 2024-11-14 at 07:36 +1300, Michael Schmitz wrote:
> I didn't say that - just supporting Arnd's point that much of the RAM=20
> constrained old m68k software won't benefit from today's user space.

We're talking about an open source stack here. No one is going to run an
old binary from the 80s on a current system. And if you want to run old
software, you're certainly also not running the latest kernel.

> Development isn't driven by memory pressure anymore, so code bloat is a=
=20
> natural consequence.

But we're not really suffering from bloat. On the contrary, both software
like systemd or Rust-compiled software actually use less memory, not more.

SysVInit uses a huge set of bash scripts where every action involves spawni=
ng
a new shell while systemd does all of that in C. Compiled C code is definit=
ely
faster on an m68k machine than hundreds of shell scripts.

> What such hardware would benefit from is low memory optimized user=20
> space. That's hard to do with Debian, as bloat appears to have crept=20
> into the build dependencies chain (if I understand you correctly).

The build dependencies don't end up on the installed system. For example, i=
f
Java code is used to generate documentation, the Java runtime won't have to
be installed on the target machine. But you still need a working OpenJDK
to be able to build such packages.

> While Debian was the first Linux distribution to support m68k, these days=
=20
> there are other options, maybe some better suited to low memory systems=
=20
> (and I'd consider even 256 MB on Amiga 'low memory' ...).

Again, the problem is not Debian-specific. Heck, it's not even Linux-specif=
ic.

> > > Much as I appreciate Adrian's efforts to keep up with user space
> > > development, I won't be in a position to help with an ABI change.
> > Thanks, I will then just do it myself with brute force or drop the port=
.
>=20
> Sure, you do pretty much all the work on Debian/68k, so you get to decide=
.
>=20
> If this involves changes at kernel level (syscall parameter alignment?)=
=20
> however, my recommendation would be to rather drop the port than end up=
=20
> with new kernels no longer backwards compatible with old user space.
>=20
> Otherwise, I'd not even be in a position to do any kernel testing and=20
> bugfixing (which often requires hardware, not emulators).

I don't buy this argument. Why would your world fall apart if we switch
alignment to 4 bytes. I seriously don't get it.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
