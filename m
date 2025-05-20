Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494921C9E4
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739615; cv=none; b=lAoyDvzrlktu9klAsLoY70RuZeenmP6x3YlwmWr+zEhD7b36zYebh9BgG5wuRojOoSZhNdnlITCyTzUEw9/zm0C9VvcFUfXcpn7bFN8Qxp+LeEJ8jsN+Ktv2riZRib/Z6YFZ0fkY2G4K4GoO3FgRXwHCX/A9009qbfC/4svWv04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739615; c=relaxed/simple;
	bh=Xetw7jh+gtBEloP6t+jH7Hkwp188F46O8vjcDpYI+NY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Eiodk2YnfTXz1QsHTfKYNkUA38K6jozfDAsgoywCuztsnQDFa8C2jTXFnFOS4hIKem1jJTYLd4YSfyhA95fnItUsl+wy0tp5HXREn+28NM1c8U9Z2xLSrL7L8YhEWnEf/BDd6U7/dAC6EzuJPsJ+jEUVUcqTz27H+n4rUe4IBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=o9gh0NyN; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="o9gh0NyN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3pe1KPDEAwwLh6wnOaBMcY1IsUlPFQ2f25Fz6Z6l0nY=; t=1747739612; x=1748344412; 
	b=o9gh0NyNOtCS9HbfEeuswbeedwIyG1JZRi417w0cCHD+zmNcwms6boqMFV2T0V2YQLD3SzmWVxx
	oSF38GzNFI/oMD1DtG7EBFaMqibiU1HSxVpCCWBt7nPTXX1ytXbBRXQErwpOBb1zBDFKq0/tlFiWo
	HjfuBdlBPiXshslTnupFV9KO+pJIDTI7dGUprp1UMeVEKoQpYy7PjfDeOEBito6JN0VIYtdeuTt5I
	0+s6JdAX5xdWhY+khNsqpEFOBeiGWWdBWJgVrojDbl3ljCQTGVlcaZRWXx8iHf7B/umWM2SdXJqT4
	NL6yT3NdBZiIL2ciMPQ5lHKQDV9un5r1RglQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHKuW-00000001pTc-17jk; Tue, 20 May 2025 13:13:28 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHKuV-000000006QP-49mG; Tue, 20 May 2025 13:13:28 +0200
Message-ID: <cca24c0938cda58d8079c23553d789685b410847.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Florian Weimer <fweimer@redhat.com>, James Le Cuirot	
 <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>, Libc-help
 <libc-help@sourceware.org>
Date: Tue, 20 May 2025 13:13:27 +0200
In-Reply-To: <64b646df-509b-579a-34d4-aa947774aaf7@linux-m68k.org>
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
	 <0f7345713d232c46f241e3b0a9303f76adebbde1.camel@physik.fu-berlin.de>
	 <64b646df-509b-579a-34d4-aa947774aaf7@linux-m68k.org>
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

On Tue, 2025-05-20 at 21:03 +1000, Finn Thain wrote:
> Yes, and then you declined to send your patch upstream, and a Debian=20
> developer picked up my patch instead.
>=20
> When I worked on this, I discovered that your patch was inadequate, that=
=20
> the problem was not the m68k ABI, and that you threw away a good=20
> opportunity to improve the upstream project.

And, did your patch get merged upstream yet?

https://github.com/python/cpython/pull/127546

It's still open which proves my point. And that's just one of many projects
that are affected by the alignment issue as you can see from my list.

> I'm not talking about improving the m68k experience, I'm talking about=
=20
> improving correctness, re-usability, portability and readability of the=
=20
> source code upstream.

Which ignores the fact that hardly any upstream project cares about these
points. And if this was really about adhering to standards and specs, you
would not ignore the fact that the current ABI used on Linux/m68k violates
the official Unix SysV ELF ABI from 1990(!).

> > > As for the Java runtime etc. I've never tried to install them on m68k=
 but=20
> > > I know they were ported to a variety of ABIs with a variety of alignm=
ent=20
> > > rules, that do not guarantee natural alignment of integer types.
> >=20
> > I see. Since you haven't tested it, it means the bug doesn't exist.
>=20
> No it means I never had a need for those languages on m68k. Does a bug=
=20
> exist if no-one executes it? How many actual users are there for the=20
> Debian/m68k JVM, besides Debian porters?

How many actual users in production exist on Debian/m68k except hobbyists?

You're using an argument that works for both sides.

> >=20
> > Gotcha.
> >=20
>=20
> I assumed the bug may exist, but when I asked about it, you evaded the=
=20
> question.

I have created a wiki page for this exact matter:

https://wiki.debian.org/M68k/Alignment

I have posted the link so many times that I don't believe you when you clai=
m
that you have missed it.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
