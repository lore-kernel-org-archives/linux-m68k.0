Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B72AD14
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735951; cv=none; b=FcX/XqIaqpt8RfwONl7jr0S5jEFgmAgsGsmZry/H0P+kRJxa7f3buZm90ayesylVfdFDuuxKgIp8H6NfsmujS9zmKbCZICGDlGlgNs/g0B9JNcRKXDdvIQhxUSvXoXUA6m5gYus6UsN5B42uTXVax9IdASPTdRQ2UjXPhO2Gc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735951; c=relaxed/simple;
	bh=ga1AQvC4a6rq0ra4Oq5F3T9qXeMbo/3XPv/ooa5XFSE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E6riAMRzyRDVvgk+pUDcVm8Y5wxMzM7WlACSXhGdcPzx6qsri1NBC7OH3sBSvfdrVa2VGqlJBgmXpRSpBfIYIHdoUWHiOWuqYOLkzGQ8ztaOtYu108eBhN/yLo/7jQNB3ZKg4io3Y/m1PCZOAugmcrFHLuDjpDieUaTEtVO47bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=JI+NgGxj; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="JI+NgGxj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rXCGTpawti5r86OHfRW4uSfHP3gTNLC6PKy/2+eXop0=; t=1747735949; x=1748340749; 
	b=JI+NgGxj6tKiYG9b22lkauJDMTqaxLYB1LduNR3ZGVs3t+XdMQv+H6tPen2SMA94oLKEjLUG2cm
	C5czHJKtm/n2FsMCif0/UUqI6AGt9INbYSUQbFbqlE+PEoOsSyEDfjpM26Xkfmqqa6uz9fes9yspL
	17UXJDQXkHeesD902jZQiR/amZyuhXVl3BbwMPAwH7r9intER1TkoVFCOuzSN21pzk+fqfHYgp8x+
	CtQMkhJH1JACW1MsPPl9HwdA2/SvfR3IEK0+Yu68xe4k51daG2edB/X/FBgnG3oaZnY4aUil2Sb1z
	U50M/iBzx0vFacW5N69O9PZD/ny33/X65Zaw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHJxQ-00000001Olx-3T3d; Tue, 20 May 2025 12:12:24 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHJxQ-000000044kj-2Nz2; Tue, 20 May 2025 12:12:24 +0200
Message-ID: <0e8c9bdea72c4a0193ac59bdca6f850e2000259a.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Florian Weimer <fweimer@redhat.com>,
  James Le Cuirot <chewi@aura-online.co.uk>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k	 <linux-m68k@vger.kernel.org>,
 Libc-help <libc-help@sourceware.org>
Date: Tue, 20 May 2025 12:12:23 +0200
In-Reply-To: <CAMuHMdWL_VpjR-fL6+iSPET420cUiud-st9mr5TJFB5kB4VieA@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
	 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
	 <CAMuHMdWVjDGYW2SerNV5ov6jX1pPNw_j1=qpawBCJph18_SE2w@mail.gmail.com>
	 <5c9c0b3487a84f5409ea2a83cecaf06c601b51d5.camel@physik.fu-berlin.de>
	 <CAMuHMdWL_VpjR-fL6+iSPET420cUiud-st9mr5TJFB5kB4VieA@mail.gmail.com>
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

On Tue, 2025-05-20 at 12:09 +0200, Geert Uytterhoeven wrote:
> > > What about kernel/userland compatibility?
> >=20
> > What about it? This is about userland.
>=20
> So you don't change the syscall/ioctl/... ABI?

I wasn't really planning on changing this. I just want to fix a longstandin=
g
issue which has caused endless hours of wasted developer time to address th=
em.

> > > > interested in new, "fancy" packages, just don't upgrade or install =
Debian
> > > > Etch or similar. Changing the default alignment does not affect exi=
sting
> > > > software.
> > >=20
> > > What about existing software that is aware the minimum alignment is
> > > 2-bytes on m68k?
> >=20
> > Can you name some cases? I would love to add these to my list.
>=20
> Unfortunately not.
> Grepping for __mc68000__ may find some.

Well, we can just fix them on the go. If I see Debian packages FTBFS with 4=
 bytes
alignment, I can just fix them. So far I have not run into any package that=
 did
not build with 4 bytes alignment but plenty that built with it.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
