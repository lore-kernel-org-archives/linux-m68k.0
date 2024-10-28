Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D118C90A
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101793; cv=none; b=UY1XloNvok5tGE7/jPlhtg9XY6qczH4eXpYYvR40McNLliIYm6UNd6aGCuVXTYGwygTFEMEwqYLTn3Msfwzk4yU1tL+tka15dHIa2fEh+AJxlFmwGhCB5Qmez+mmvFoG9j3ZMF4fOfhx74F6ODAZ56HtUuYYftvh694W8I+erIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101793; c=relaxed/simple;
	bh=nV6rVe3JhWbfb2vGZmvZL+veY8u4x+1IXmzruGlZbqs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uUX5VTXei7Ids8m7zckPnhD88ohxoOr761gkfnr669gLz4z8KDw3phLNlyv96Je0hy23C7861sbOVLrOK3H0VdRZ7RL/+d8rTOnCYzEbkSU7Xda3Qkd1qhzMJxh4az+/N4axUxGP5Q8GM5G+nEzVIz6xYfRduOMByQs35vsjS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=apLASb86; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="apLASb86"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9X3gsFKgUUPOyNC01Pr5Y/t4FxAcSSSd0yqw3of1ERI=; t=1730101790; x=1730706590; 
	b=apLASb86c7+AyDpa2DUcO18m3irMleqTipgeDDzYZqgkBFKX2CDkfQv0XMQR2ubgS9sfCfyexKl
	zgx+dwhnF+58dcLk6XsnskzqOmYGwc8mkIhS9DTKJBbLw0bQlmw2fmz4c+a/KVVvgnRRaC43czz9B
	5L6vXzPfjN/ArveCAkpmZMH6B78tzmxoMchYzm/w63b7hmcTUOfkRw52esFsJMbDskwPWvMACWsJT
	1cTYkYNvwcy2zpXRq/EkopC30RqqtJf+a7a5mEjKuAlQEOH8Lcb00J9ELrXbKSEgvotJAbiZqG6Lo
	bRMMHiP2WB1m/EB9CrPvst87u/ZYx1E3QSLA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KVZ-000000044CA-0Qff; Mon, 28 Oct 2024 08:49:49 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KVY-00000002AQv-3fuH; Mon, 28 Oct 2024 08:49:49 +0100
Message-ID: <e33755c0bb8577dfc8d396f45f07af639a66a75a.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thorsten Glaser <tg@debian.org>, Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Oct 2024 08:49:48 +0100
In-Reply-To: <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
	 <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
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

On Sun, 2024-10-27 at 03:08 +0000, Thorsten Glaser wrote:
> > I think that's overstating the case. Alternatives to rust are available=
=20
> > and will be for the foreseeable future. Most notably,=20
>=20
> That=E2=80=99s not the point. Google, for example, are aggressively fundi=
ng
> people to throw away perfectly working code and rewrite it in rust,
> or to at least add rust to projects. librsvg has been such a case for
> some time already, python-cryptography is, but now we=E2=80=99re losing e=
ven
> freetype (!!!) and, possibly, even the Linux kernel.
>=20
> > https://gcc.gnu.org/wiki/RustFrontEnd
>=20
> That=E2=80=99s assuming it can build the same stuff the same way so it ca=
n
> be used in packaging.

Again, it isn't just about Rust. Virtually every relevant project requires
32-bit alignment these days, including CPython. I assume that CPython is
nothing that anyone here would call exotic or killing open-source, no?

> https://buildd.debian.org/status/fetch.php?pkg=3Dpython3.13&arch=3Dm68k&v=
er=3D3.13.0-1&stamp=3D1728344123&raw=3D0

> > I expect alignment assumptions like that will end up putting more=20
> > platforms in the same predicament in future.
>=20
> No, all the other platforms use natural alignment.

Yup, m68k is the only port in Debian with these issues.

> > "Natural" alignment is meaningless in the context of portable data
> > structures, as they exist without reference to any particular integer
>=20
> Yeah, but in practice, all we have is ILP32 and LP64; the Windows=C2=AE
> world has LLP64 in addition. And natural alignment just means that
> all the data types=E2=80=99 alignment is their size. (Which kind of makes
> sense, so you can read them without getting an unalignment trap on
> SPARC or so.)
>=20
> > Q. What is the size of this struct, assuming baa.b is naturally aligned=
?
> >=20
> > struct baa {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int a;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long long b;
> > };
>=20
> For ILP32, LP64 and LLP64, it=E2=80=99s 4 (a) + 4 (padding) + 8 (b) =3D 1=
6 chars.
> More importantly, and relevant for Qt, struct baa is also 8-byte
> aligned, and malloc(3) results are usually 8=E2=80=91 or even 16-byte ali=
gned.
>=20

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
