Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C38460
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730009787; cv=none; b=YkFvEJ70wfqYtvgZ9DLvQBCG5jL9FJkgyjKvRtemu90GlUVNpS2EcdzNnvT+Gnvlqapp3sUcAKFd+OJ8Xxaan/+5joQDlTtfrIzRRUFxOdKfgthqgmjttymGt3x3/8qS+/efE07cy2Bwo3ETi80cecBHGU6dyDIoBRnPfcodsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730009787; c=relaxed/simple;
	bh=CMvUwpLHSjze4rG5bLMSh+tJqCHI+cyWIvGUSaGD3Mo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Obl3aZdyabyBN0kU3MN9I1JHN8XNrJZKPQ4eshAj9BBtMUSsOALSu73JdQPpMkbDzOgt9UiVABfr+Lx42lGO74mFR91HK87qkMesb2QPdxJZ0ekVa388RvzNWyrfQ0H0VzxM0l9/sP+Ci8hfqWJqkr+tp2HhpgH96KNDNonqKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UQ5CG1Y/; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UQ5CG1Y/"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 42F2A13801A0;
	Sun, 27 Oct 2024 02:16:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 27 Oct 2024 02:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730009781; x=1730096181; bh=4HToySgij6M1/udFPkWCEq6xirkL
	yL6eEK/2sECuBK4=; b=UQ5CG1Y/YOQilSsE6II9sy7FpeLCqfb4pcPX6c1NuLP2
	VQ/NgRVNlQKi0IPFMLKC+ecZD+GM910keHypLYOtqRdu8ZPVq+A8YXqb/Wld/26U
	GUIBD7EP3ink1nwXgy4JjHevKETJks5QlJyD5iIwRmztSqpT+RC51MhnVA4gGdti
	/BMYq8jBV1xx+dXJWPQ3cO+ZzgFcliLL9Dor6NQV7ky/PqzAO3o0R1XGDL2OcOUm
	JL6la0PSaRIuNXci1IwxqjRdz33O0kgO3OsTFL8Yv2jxHbkyb4/PZeV735IZF12l
	CTFNLlZnHDnFC9ZKhpk6hMxQCywC3OW3aXUnVVbpjw==
X-ME-Sender: <xms:tNodZ9SUM2wzKw54Tn3bu9cizsZNvxO6sDsgkX6GgYk2nOQwvxLrsQ>
    <xme:tNodZ2zyEr0gcfz2i2kkeYzqQURG87djdPnV2N9fAcZKU2r4k2Ph-yqdJBN5rbYhH
    hOPZda3p3UzjDO41EE>
X-ME-Received: <xmr:tNodZy2YzqGdl0Wfal1CZ6FAHoIfeHgONoCa9c6cT0kWwCT0yTiOLZi6eUqL0fSki4_-58dpZqBEQpM_e5amUWGZcXWNwpBALoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejhedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeen
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepvdffgfethefffeeuleeihfegvdegleegfeek
    gfdtgfegjefgiedtledvgeeugeevnecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehl
    ihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepthhgseguvggsihgrnhdrohhrghdprhgtphhtthhopehglhgr
    uhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehlih
    hnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvggs
    ihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheptghhvg
    ifihesrghurhgrqdhonhhlihhnvgdrtghordhukhdprhgtphhtthhopehsrghmsehgvghn
    thhoohdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrgh
    dprhgtphhtthhopehstghhfigrsgeslhhinhhugidqmheikehkrdhorhhgpdhrtghpthht
    oheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:tNodZ1ClDhaq6-D5mzaxrL3TCRlGAWTS9sfefXF44NIYGX0D00lVNg>
    <xmx:tNodZ2gHxo5mWDGz43B3iqvLl72RxAqCmNHoLKO6QM2d5NNfaRA_Tw>
    <xmx:tNodZ5ozvzmRehzzOrHd7ZMoXnVmBaij-bVvmTZtbwBuwXd6XwFQPA>
    <xmx:tNodZxjmWu_fA4RGaqeaksw4p5FfdJTco_Dh2VtR9mb0FUgAikFK3w>
    <xmx:tdodZ_Xlt773CEpBuDnubXW9tfm-jJXnmZp9f8lK1EHv3udMRkMfvlrJ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Oct 2024 02:16:17 -0400 (EDT)
Date: Sun, 27 Oct 2024 17:16:11 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Thorsten Glaser <tg@debian.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
Message-ID: <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org> <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
 <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1515558812-1730009771=:29"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1515558812-1730009771=:29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Sun, 27 Oct 2024, Thorsten Glaser wrote:

> Finn Thain dixit:
>=20
> >That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's not t=
he
> >case on my Linux/i686 system. 4 !=3D 8:
> >
> >struct baa {
> >        int a;
> >        long long b;
> >} foo;
>=20
> That struct is just 12 bytes for you then?
>=20

Right. i686 and m68k agree on that.

> That=E2=80=99s possible on i386 but almost nowhere else, and has multiple
> penalties on i386 even (cacheline split, loss of atomicity, merging
> of accesses, possible cross-page split,=C2=A0=E2=80=A6).
>=20

Well, the GCC manual says the Power architecture also has ABI variants=20
with differing alignment rules.

https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/RS_002f6000-and-PowerPC-Optio=
ns.html#index-malign-natural
https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/x86-Options.html#index-malign=
-data-1
https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/x86-Options.html#index-malign=
-double

> Of course, in this case, the software author ought to have made the=20
> padding explicit or, better, sorted the struct members. But if all did=20
> that we wouldn=E2=80=99t have this problem.
>=20

Right. And I don't think the problem is going to go away. One solution=20
that is sometimes raised is better tooling. I'm not sure how that would=20
work. Perhaps a better solution would be language changes to allow a=20
struct definition to be qualified with an explicit data model.

> >> More importantly, and relevant for Qt, struct baa is also 8-byte=20
> >> aligned...
> >
> >If the struct itself is not naturally aligned, it too will eventually=20
> >break someone's assumption of natural alignment.
>=20
> No, structs are not naturally aligned but aligned to the max() of the=20
> alignment of its members. Natural alignment is only applied to primitive=
=20
> types.
>=20

Makes sense.
---1463811774-1515558812-1730009771=:29--
