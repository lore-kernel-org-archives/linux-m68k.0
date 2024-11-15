Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB093C39
	for <linux-m68k@vger.kernel.org>; Fri, 15 Nov 2024 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731630241; cv=none; b=I0crufH0S1Lb3lpLG6Fwj0+ByMUcUC5k4tdOBT9aZCy4BolW3BTtGTA+B3LVBt69eaV5OPfcmiVLO4Vv+s0aSHCb4fUp+T/PUk0YICd8P8dUFsJVqYREC4P61WdJAGB9Ss5HetQF4CMfXoy0FyLnsHZhKHvUMjZbwc2uTYWFPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731630241; c=relaxed/simple;
	bh=z6RP3AFeHnx0TEKjcVC9iENH5ejauVqW3o2mWOVkRoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=agf6RJpYYibJZ6v1rByCrp6lboE+pkTkOcCPfh1ccoBeDh2rV023ebdN7lQbgGFofi8QJ2qUcnfu1Txb7ScLQwgeYuYEGE+SLrmCPJvVeYQvg/QSUCGbxopEm1fwckvNFn9K0Yn44tDV4wB8zyPbWnH6RxMqWBv5zq08oyRgXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Uo569mOC; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Uo569mOC"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7926C114021E;
	Thu, 14 Nov 2024 19:23:56 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 14 Nov 2024 19:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731630236; x=1731716636; bh=a6YOonJrOvm98DAlpYLIOwjLu3QgTTjxgzd
	PTqFYkDE=; b=Uo569mOCorKz/lk+/rbaDVQi2Qd8KAucMDoV85N1y507UIweub/
	DO7ZjwRDvTOVVkUI4uV8UNm96mXtxdr0xIW2K1R9TeYR+faOwkkkpt5yq+8cwNr4
	NHv+LxqgjS93nFyUu9SR/K7K6q+Z5vYpBuvvYl/eHo6dr9Rf16nmkoo6DyW2gA7u
	F8uQDRgirLIut+HdOmaYhi3vyVu8ub/kB6XWYFm2vgQLf3PT8a5lm6JeOfI2hL9S
	P/9IlralRNkQc3kdFQ8NOsOJ/xliUtQ/Mg3B0/LhrxdMjEfW7yJYJCm0T3/B9bWb
	4GuOI/jF1AfnH+5vDeczi+mcjs5NuFScwfg==
X-ME-Sender: <xms:mpQ2ZwplMk2GyNUkjTntO7umo1rL5BG7zpaGCA90Sw4WGldW49JDbA>
    <xme:mpQ2Z2odaj5Os838VTwXJ9D17-he9N8yxsnNcNfOFw3AKMVsPiIBohFm7HcLK4OUo
    lfq__LhqYcWnhbE9Bs>
X-ME-Received: <xmr:mpQ2Z1MatOqjf3mKHxxumD_lfG4PqMSiRo0752TzeAz-qUSkaJbTTU7ho7XvOKzrc9kZD7BntWcjjeUTNi4WlurV8bSLrj28wKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvdefgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepleefkeelgffgteekudekveffgfdvueehteffkeel
    tdefjeetleeijeetheegleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghr
    tghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrtheslh
    hinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepthhgseguvggsihgrnhdrohhrghdp
    rhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvg
    dprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpd
    hrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukhdprhgtphht
    thhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehstghhfigrsgeslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:mpQ2Z34zvUFNlQtkyRR9jPyuEdiz-HfTX-V-pG_MFx2F__nJbHtxOQ>
    <xmx:mpQ2Z_7kPfIFpGzMHiyianQR6a6C-kdFOGyj7pR4-o66vVMnYRFP8A>
    <xmx:mpQ2Z3hQJZ-Rpr8LcchxEyYtF0CktOgi_LGXIrZ3_zrcJsezrT6ldg>
    <xmx:mpQ2Z56kbPrKR4UMZyfNHYa5PazOS-UWWT24ma8mSeESOxglb6vX2g>
    <xmx:nJQ2Z5s9OkVqvYjLhN3u2bMT0Q8j7KHUsSLmofuxn2QsWUAaP8cT2xfK>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Nov 2024 19:23:53 -0500 (EST)
Date: Fri, 15 Nov 2024 11:24:14 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Thorsten Glaser <tg@debian.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <CAMuHMdV4T1jELrZJbyxkYDo4MSfm=2CGCz2tJ6DqOqjjiN5_AQ@mail.gmail.com>
Message-ID: <d4e59a96-9d1e-94ca-313a-b577338d9d6f@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org> <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org> <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org> <CAMuHMdV4T1jELrZJbyxkYDo4MSfm=2CGCz2tJ6DqOqjjiN5_AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1382659859-1731630254=:29"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1382659859-1731630254=:29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Thu, 14 Nov 2024, Geert Uytterhoeven wrote:

> On Sun, Oct 27, 2024 at 7:16=E2=80=AFAM Finn Thain <fthain@linux-m68k.org=
> wrote:
> > On Sun, 27 Oct 2024, Thorsten Glaser wrote:
> > > Finn Thain dixit:
> > >
> > > >That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's n=
ot the
> > > >case on my Linux/i686 system. 4 !=3D 8:
> > > >
> > > >struct baa {
> > > >        int a;
> > > >        long long b;
> > > >} foo;
> > >
> > > That struct is just 12 bytes for you then?
> >
> > Right. i686 and m68k agree on that.
>=20
> On i686 (i.e. gcc -m32 on amd64):
>=20
>     __alignof__(long long) =3D 8
>=20
> but
>=20
>     sizeof(struct baa) =3D 12
>     __alignof__(struct baa) =3D 4
>=20
> ???

My i686 compiler agrees with your compiler. Whereas on Linux/m68k,=20
__alignof__(struct baa) =3D=3D 2. On NetBSD/m68k I get,

sizeof(struct baa) =3D=3D 16
__alignof__(long long) =3D=3D 8
__alignof__(struct baa) =3D=3D 8

> Isn't the alignment of a struct the largest alignment of any of its membe=
rs?
>=20

Sometimes...
---1463811774-1382659859-1731630254=:29--
