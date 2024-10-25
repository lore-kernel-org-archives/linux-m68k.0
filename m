Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2A18BB9A
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847891; cv=none; b=K6EyuVG8RvIZkHmTHSWvtapqBRqp9ogqe4rSik0cXbgFYFZa0e2Gzhhv+QoOmUqHPZ5FOxzc+i9cLNUl9CSfcMFfnHNOUOHwTrcQMjH5VdP9WBSZZhPHcbK6APq/+N2kgk0/gwVL1rvqxfXmKw9XIQVcbDyjriaH4K5DmIOACtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847891; c=relaxed/simple;
	bh=AJH6hDAWhl3WCTNAieHj9Gtpkj4NpbkXbMKwzWGFRfM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OnKaKhK/QQ0R7L2kUL/6qDK8nQ5DNI41YrruJeuvtkgjsX2cx4N3raCc/NZRRK/VQ99qcJ9xE2Nt3fDX8hVU0QSg1EOesFEwSjxcDEe0lHuIhZQexn4jsOwUhrge3Mk7ScctRREYxFjG4V9oNh4gIWHeqq3yOIhsQ1PH9ossAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=RQwSeYIf; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="RQwSeYIf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WTVLGftvyCjYBAzXskaG5Ptco9BVHYTeZUIym1zreVU=; t=1729847887; x=1730452687; 
	b=RQwSeYIfzfcRigED2ZbHF3SYqs530SHpqA3a2Y8kOFQxYT2wFiLEX3J8r/AscY37pChpLL0SOnl
	V3WC9hJqzVd9AeYLteOPqxD22BuJ5s0zVAv4BP+TtVOsmH8qRI67wmgWx8fSGuHEtaSrS/Dj509Ie
	NbNZ8j9HpQ1hg7Adb+1o9tIZLx77gfP99K57DpqJkTjmidTabTaI2I0vxC57zqxXCLpXQBE9W565x
	dR8JcjIc4oCNIQOSjAdexMkReJQ4zIHGZAWbDn/P6MXNan7CDu2xv7TKIaIuX4zeG+6okLu6cYhC+
	TGeWyANtwDP1Dp4z4INOzhX2Moecu35VkROw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t4GSJ-00000002cdZ-2mdG; Fri, 25 Oct 2024 11:18:03 +0200
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t4GSJ-00000003ec2-1rlv; Fri, 25 Oct 2024 11:18:03 +0200
Message-ID: <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Thorsten Glaser	 <tg@mirbsd.de>
Date: Fri, 25 Oct 2024 11:18:02 +0200
In-Reply-To: <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
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

On Fri, 2024-10-25 at 20:06 +1100, Finn Thain wrote:
> On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:
>=20
> > the m68k port has reached the point where switching the default=20
> > alignment from 16-bit to 32-bit is inevitable as the number of packages=
=20
> > affected by alignment issues have become too large. It even includes=
=20
> > Python 3.13 these days.
> >=20
>=20
> Are there any bug reports you could link to, in support of the "too large=
"=20
> claim?

The following packages require 32-bit alignment:

- mold
- LLVM
- gccgo
- Qt5 (several packages affected)
- Qt6 (several packages affected)
- OpenJDK (all versions)
- Python >=3D 3.13
- Rust

Those are the most important projects from the tip of my head, but they are=
 already
the biggest blockers. There is no chance that the upstream maintainers will=
 adjust
their packages for 16-bit alignment, so these will be forever broken on m68=
k if we
don't switch.

I understand that this might be a painful transition, but I don't see any o=
ther way
to keep the m68k port alive in the foreseeable future unless we fix this pr=
oblem
which keeps blocking the port.

You can see how the Debian m68k port has been falling behind because of the=
 alignment
issues in these statistics: https://buildd.debian.org/stats/graph-ports-big=
.png

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
