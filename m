Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039C194080
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101645; cv=none; b=n5vpmywHkRCZBCKed4606YYPsMICgrEuh/qhyHR1/IuagCMrXikL9epvddWmZxyWlcJbOrJsKcUf0xpur3/5BvRn61zNX4CzaN77DTouWdTN77mUlJaHMXi2WfVnoy9QfP7ppg44Km+dGK50qKPWfe5OnaeBn34XWOzwuzvmvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101645; c=relaxed/simple;
	bh=95Zo9XwvCYVQp0P/bgbPSu8EtixFggfboQOBvX3DknY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cns3MROZE6zwCm8cDfff5YejL1+lohyX3+LXgNcb9plusbhDm04QRUvLdphHIDsR51j/C7BNMsiFhV2VUrmCC+ltMIZiLLfkmkFdxHf6oNDdm6ZfL66JzDKN3o+tL/NSsSsl6VZTRj0cjaOUpfgbBqTl3tTd/7mVzUM8JqwF9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=OfNVIu67; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="OfNVIu67"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gfANkNEKkRyKy/EcLCESNgGv8GFOPSR6OCf6nQw4Es=; t=1730101643; x=1730706443; 
	b=OfNVIu67Yj/l3pAMxniVWasEWmVYIAISZEqQbMiEUDiRbEQO/xBvodIYcW4gywv/6YdASx3qDWk
	scxqZSql9fsdH42pKrMfgbz7aC6YPIppb2HcIkXZWUkFQPRRB4er1e+f3pWcI+NkQl0IBwtlrGE/C
	Xj/ZrTGmAAqXZsGsW7n9wBlDApX6pwc9gsAlUE7jRe9WJl1sjIEBw2iorKqEVGGVJ6zcVg+5eARAN
	mQwtsBqWONaM5SfK49AS7peNA83RzAytbt2IOTN7wbUsvTxeQL96/OhqJWT9VU9jh3ZHHErDnIzDc
	J0H6dI69m9iT4btHm8WjjfJX2wk37aHd5xkA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KTB-000000042SQ-1iye; Mon, 28 Oct 2024 08:47:21 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KTB-000000029kv-0mHN; Mon, 28 Oct 2024 08:47:21 +0100
Message-ID: <90616d852357d7489e1404dcf4a9a04f881b4007.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Thorsten Glaser <tg@debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Oct 2024 08:47:20 +0100
In-Reply-To: <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
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

On Sun, 2024-10-27 at 13:49 +1100, Finn Thain wrote:
> I think that's overstating the case. Alternatives to rust are available=
=20
> and will be for the foreseeable future. Most notably,=20
> https://safecpp.org/draft.html

It's not just about Rust:

> https://people.debian.org/~glaubitz/alignment-meme.jpg

> I agree with your sentiment though, in that rust generally gets a lot of=
=20
> funding and hype. Even if the Rust Foundation doesn't care about=20
> supporting the backend for m68k, there is still a way for non-commerciall=
y=20
> viable platforms to collaborate. In particular,=20
> https://gcc.gnu.org/wiki/RustFrontEnd

This is getting off-topic.

> > > Absent the right conditions, perhaps it is best focus limited porter =
and
> > > developer effort on patching only those packages that are really requ=
ired.
> >=20
> > I tried my hand at Qt5. About 20 man-hours in I essentially gave up,
> > and that was without even getting to something I could put to a
> > compile and runtime test.
> >=20
>=20
> I take your point about the amount of effort required (and the lack of=
=20
> resources). The answer may be to share the work better by enabling more=
=20
> collaboration.

The "collaboration" currently means me doing 100% of the Debian/m68k work.

> It appears that NetBSD/m68k has naturally aligned ints. Perhaps you could=
=20
> look at adding kernel support for their ABI, and get access to Qt and LLV=
M=20
> that way, without impacting the existing ABI and its ecosystem.

What ecosystem? Do you honestly care that any hobbyist cares about having
to reinstall their retro computers?

> BTW, it has long annoyed me that two different 68k Mac bootloaders exist,=
=20
> one each for Linux and NetBSD, which are duplicated effort, and have=20
> different sets of bugs. To my mind, this is another good opportunity to=
=20
> collaborate and avoid wasted developer effort (perhaps by dual licensing)=
.

Again off-topic.

> > =E2=80=9CNatural=E2=80=9D alignment of data types has essentially becom=
e a requirement=20
> > these days, and m68k is the only true outlyer (i386 could in theory, bu=
t=20
> > the Unix psABI designers were sensible enough to not do it).
> >=20
>=20
> I expect alignment assumptions like that will end up putting more=20
> platforms in the same predicament in future. "Natural" alignment is=20
> meaningless in the context of portable data structures, as they exist=20
> without reference to any particular integer unit. It is because your=20
> struct patches improve portability that I'd expect those patches to remai=
n=20
> acceptable upstream.
>=20
> Q. What is the size of this struct, assuming baa.b is naturally aligned?
>=20
> struct baa {
>         int a;
>         long long b;
> };

We're dealing with today's software and not something that exists in 50 yea=
rs.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
