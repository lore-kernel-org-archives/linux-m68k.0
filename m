Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE86218DF7B
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 08:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102979; cv=none; b=c5Dytkd//wclWBlkvntS6cRQ0mSS98Ke4PwcLCSpnzadpPjNuHJUpc6PpC2n0+7q2ckVN2fjUn+3qm434nyA5G0cX/Cb1oyFVu/JGdDsdVtSTSOlkd8bh/3gFrpnalQLZWYYfSAwxESQTm38lIwX3PrlpLhJ+ouWlXXyvED0a78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102979; c=relaxed/simple;
	bh=O4km5XB1XVJnxE5yI/Lyrguun/b6LNP/9qYbN+rR5oM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8ILLsapwwKv0GZhtOwZoeOKXvHWk8RggxFmUJfISdqFu+vUoVxxNteJrsP0EGXyIpH5obILeCA7cMN2a4ycelwzgcAppiVPBJbIi1pKXbgcyizJAJ3tycRiBAlmpCpyeBmTLetm8ODQis2iy8WvAmWV2v4MfvXdGyl1ydHyvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Atua3C3C; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Atua3C3C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mg8uxi0V/ThAttolegcMrl3GGSz/ZfAowvSWiHXo1gk=; t=1730102976; x=1730707776; 
	b=Atua3C3CZY9h/TWmZdhNrAkW/n4V1/sYA0JyBhzcv6/OOiEJh8yNWMPfJtowY3xyhEuburWgbS6
	n5aTXLza++x5nM7vWpu5ITHFmK2xo2YekMYR6fmgI0L//o4G+YjjjwCe+XozAh3lvZlxgItzA6wjI
	lzVfDx3OKZnaDeZjt2Ve9wNA+yRzNzS5Nznsmk9PrJsPwNuYQQuyVkusz/PFYIejDRqve5XxBcdFY
	0M5hULyAjFeyv19j7As89ltBBMwjFyPOP+miFK0NDxLAcUDtlf9V2wKF2RA3QGX/KOFr0Q2CWizB0
	NarD6y/Lnlx34tTsfH2MXhK3OuC5bjKjtnyw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5Kog-0000000069K-3uh8; Mon, 28 Oct 2024 09:09:34 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5Kog-00000002Doj-2xsc; Mon, 28 Oct 2024 09:09:34 +0100
Message-ID: <325daee024e5290959c5147346602ac7f0089474.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Thorsten Glaser <tg@debian.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
 debian-68k <debian-68k@lists.debian.org>, James Le Cuirot
 <chewi@aura-online.co.uk>, Sam James	 <sam@gentoo.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab	 <schwab@linux-m68k.org>
Date: Mon, 28 Oct 2024 09:09:34 +0100
In-Reply-To: <f2377db5-2b39-0e58-4d22-1caee7e8e6a3@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
	 <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
	 <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
	 <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
	 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
	 <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>
	 <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>
	 <f2377db5-2b39-0e58-4d22-1caee7e8e6a3@linux-m68k.org>
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

On Mon, 2024-10-28 at 15:51 +1100, Finn Thain wrote:
> You talk about "applications ... being written". Well, two days ago I=20
> mentioned several groups of applications: (1) core packages that accept=
=20
> alignment patches, (2) packages whose developers shouldn't worry about=
=20
> small systems anyway, and (3) packags I am concerned about i.e. the ones=
=20
> actually required by Debian/m68k users (which will presumably lead to=20
> disto bug reports, if they didn't already -- hence my question about bug=
=20
> reports which remains unanswered).

As I said before, it's about (transitive) build dependencies and the fact
that more and more packages are being rewritten in Rust.

Here is the current top of the list of packages that won't build on m68k
because of the 2-byte alignment issue:

   2814 cargo:m68k
    900 ghc:m68k
    261 gccgo-14:m68k
    241 libqt5core5a:m68k
    181 architecture-is-64-bit:m68k
    117 libglib2.0-0:m68k
     81 libcompiler-libs-ocaml-dev-0a396:m68k
     81 golang-go:m68k
     71 wx3.2-headers:m68k
     57 qt6-base-dev:m68k
     57 python3:m68k
     46 libamd2:m68k

Are you going to fix these for me?

> > For Debian, we have superh and i386, out of these.
>=20
> Is your concern merely for Debian's package archive stats?

It's not about stats, it's about reverse dependencies.

And, to be honest, I'm started to get tired of this discussion. If there is=
 not
going to be an agreement here, I will either drop the m68k port from Debian=
 or
use the brute-force method with Chewi's patch.

I don't have the energy anymore to justify myself regarding this anymore.

> What interests me is portability and code reuse in general. That is the=
=20
> basis on which I would send alignment patches to upstream projects.

Upstream projects do not take patches which fix code on m68k. They don't ca=
re.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
