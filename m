Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44BD18562F
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502317; cv=none; b=FhHNhN98STebsx1H1U0+37eYDn0ar3bL+H2Lsgur+AiQX0ESPoddFnMrBSxtlsBSO8nRH1iVkKhZcDCP32DEnT9irYhdACYvBxCIuLD9JjzWmwDutD3/1+M3SrpN2DkHe610m7FNCQXd8S3L2ci90PEOdBCWjxaBPW70lFkYJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502317; c=relaxed/simple;
	bh=97MyUyGDKI4IJq+iws7d3XKuc1CTqlrlMV4dYqtsUes=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qWwQ1gBihCqTUghclqeEaVgKWtdELlk9KbbQd8/g8AX+OlDvZKGPpUzqZvUlCtGmi/J/wK5RuewmpKiKYVlWF1FQvkhHGrTHzAk8OcB5huxjg1mJWNJPUTqjSXKmQCNJIMCnAeywD9eYjYQERzy3Y9/KyAFTR1j3fGX+TWCFUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=cBYLVTeT; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="cBYLVTeT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=asxA2lC8UTet6bSp5Y/rucFZ+3H1Yupvye+Jq5aMk48=; t=1731502315; x=1732107115; 
	b=cBYLVTeT7mgd9aJcDNHx0rwxgaL4xmJ6/s/QreDpmDSDXUXzetQevNLLwrlcJQE0OAgU+UxXPS0
	MOdoMDBml7ysYmGy4uLrLH0H7V91wb20T7frWcNJa9crt5pPDnWEX/4f+lXBLY6KpAYqOMKk9aYCR
	EODy1mL+CK/hYI9XZHeQ5Ubv3bqUDk/DsBtDsLjTsPRZzV3UKeuBYT1CGTQY8hEWxarZn0PJ+Y1Gk
	V8HRX+rUtPQ/TIT3teQb74D/K4X3BVHFJciNCtpTvoT6fHz6eFwhraIbkVfYxfyCpn/cIVt55h4Ss
	Aa5puSgd9MgvlCvK5piUsBbnJhYoURXiItwg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBCqe-00000003YAy-43Lb; Wed, 13 Nov 2024 13:51:52 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBCqe-00000000BC0-2z1M; Wed, 13 Nov 2024 13:51:52 +0100
Message-ID: <5c964099caf2798c64d9b8219df8237a02e497cd.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thorsten Glaser <tg@debian.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k	 <linux-m68k@vger.kernel.org>, debian-68k
 <debian-68k@lists.debian.org>,  James Le Cuirot <chewi@aura-online.co.uk>,
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 13 Nov 2024 13:51:52 +0100
In-Reply-To: <d195e1a1-94d0-6aa7-2193-5f7212829b8e@linux-m68k.org>
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
	 <aba54d2b46a1e08f578e008d084463c7257aaba3.camel@physik.fu-berlin.de>
	 <d195e1a1-94d0-6aa7-2193-5f7212829b8e@linux-m68k.org>
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

On Mon, 2024-10-28 at 19:44 +1100, Finn Thain wrote:
> On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:
>=20
> > > For Debian, we have superh and i386, out of these. It is entirely=20
> > > possible that Qt et al. can work with this, but these all have natura=
l=20
> > > alignment for quantities =E2=89=A4 32 bits.
> >=20
> > I'm not aware of any serious issues with alignment on i386.
> >=20
> > i386 was the original target for 90% of the software in Debian, so if=
=20
> > there are issues, developers have already addressed them.
> >=20
>=20
> And they did so without needing a new ABI...

Because on i386, the original ABI designers didn't make the mistake to enfo=
rce
an unnatural alignment.

Honestly, what exactly do you expect to achieve with messages like this?

If you want me to just drop the port, then just say it.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
