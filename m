Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFAA28A1E9
	for <linux-m68k@vger.kernel.org>; Tue, 10 Jun 2025 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554799; cv=none; b=eqvtHTOChM1/FGdgU1eOhQoD+3lbAyGz24WpK+6BJ8bfRLsKQ/igoTWk67/AOv9bZcsU7XkqzyGXPyc6RVXPaoqI59M6rSDfTPC+Tx0/VG6137BuHQoCzC+kop2s0A05VJkogeD+Iyct2UlJ7K6KWopgHlYvrFijCzSCmkCl4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554799; c=relaxed/simple;
	bh=AVXVGhCQTCmGxRJcX1V3zA42oc3xVpPDLepPNTJEVZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nmSGfYiDtunZt3VUabeKdrJYAX/zbC2DsCp/Kw0mOi0nuuT9AAhzjTsPiPDgwGoWymGGNLVRGPA+F1QR3frIFftPSbevncG5npRxZjP76CqHbFw7Y4AVzd9x0FSoQFlZlCkApfkeEI/LFmBD80Or/2cR5jFdK6sEVLHAvHGCHY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=bE4a2nwh; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="bE4a2nwh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f+pXUsAnDhLdEaUODUT+boiFhUfydBC07FaxP99p0fs=; t=1749554796; x=1750159596; 
	b=bE4a2nwhU7i35Y4Qwxr+47pS5lhxxJf44iubYfw3Ui+inFBpBSH8kuykfYnk3/y8+fNrhr1UNSS
	MXPKWD/R85ChVYLxP7UgF9lxPH0VVEMsSIMdKKwf5UaYzHxSwJV2otHVVFpb/g/aXZj26F1swnrre
	EQltUwGqi5tWqotsXSdEgApxHUMWqHujRy6e/c3d45Day5JCawNwr8RjfSyd+8U4DH3ni2aRolwND
	BMRt10vpnWpcpiJkftEB68+ExbCWi4VFq9wXWdvCTDR08bEpmQ5I+ZCVhckjxQsLYWGu58JtAAGsk
	cC0Z6mP5lcVSJ8bSFEak4UL3CxfLqC7fMA5g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uOx7i-000000010qC-3o8i; Tue, 10 Jun 2025 13:26:34 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uOx7i-00000001O6F-2l5l; Tue, 10 Jun 2025 13:26:34 +0200
Message-ID: <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Tue, 10 Jun 2025 13:26:34 +0200
In-Reply-To: <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	   <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	   <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	   <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	   <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	   <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
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

On Sun, 2025-06-08 at 11:10 +1000, Finn Thain wrote:
> > Furthermore, we're still talking about a hobbyist platform here which=
=20
> > hasn't been in production use for more than ten years. It doesn't reall=
y=20
> > matter whether we break the ABI or not.
> >=20
>=20
> By the same argument, since Debian is comprised of volunteers and=20
> hobbyists, it can be ignored by corporate-sponsored organizations, such a=
s=20
> the Rust Foundation, and by upstream maintainers employed by for-profit=
=20
> companies. Yet they don't ignore us. Why do you think that is?

There is a clear difference between architectures that are actively used in
production as compared to architectures that are used for hobbyists project=
s
only.

We couldn't push such changes on x86_64, for example, because there is huge
worldwide userbase meaning that introducing such an ABI-breaking change wou=
ld
come at a huge cost. On m68k, on the other hand, the user base is so small
and insignificant that the costs for introducing the change are negligible =
and
the profits for making the change strongly outweigh the disadvantages.

Please don't pretend that you don't see a significant difference here. Your
argument is dishonest and you're just trying to derail the discussion.

> > And it's not like there isn't strong case for making this change. As I=
=20
> > have tirelessly explained, the current port with 2 bytes alignment is=
=20
> > simply no longer feasible since an increasing number of packages either=
=20
> > require 4 bytes alignment or require Rust.
> >=20
> > These include more and more fundamental packages such as coreutils, the=
=20
> > kernel or various Python packages such as python-cryptography. It's=20
> > simply not an option to continue on the current path as it has become a=
=20
> > dead-end.
> >=20
>=20
> Every CPU architecture is a dead end. This observation is as old as=20
> Moore's Law.

Yes, and we all have to die some day. What's the point of bringing up this =
argument?

You are arguing in hyperboles which clearly shows you're not interested in =
a serious
discussion. Why are you even participating here?

> > I don't see the point in maintaining something that becomes increasingl=
y=20
> > useless because more and more packages are no longer buildable.
>=20
> That's because you still haven't identified those packages in the Debian=
=20
> archive which actually need porting.

I have posted that list several times already: https://wiki.debian.org/M68k=
/Alignment

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
