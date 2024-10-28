Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02A1925A3
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105382; cv=none; b=gdwdOQKbR0tsX/qrYHMz0XhRPiFN+mKxre4GHt5cpt+URS52SsWmpBiV2SY/aAsq/mZVCT9GQpF7Dnz/7ePIziNsFcMEfHSth8hxIY6djE8eMkkQg4MGG6Bnod285Roc1BO3nJmlowefTZsB/ooaYY+nn/uFWDkQKf8vaCX9H/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105382; c=relaxed/simple;
	bh=1bM0E46oW2gPAhgwuvyZGZmcXHkLii5EH2n3ETAXnUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UKBtmJk8KmgtvBTmCifDLRwdu/A9XsK5PDQy+u++RBlda5loff+R3KnxUYndlQNoI18E9NVX9z6eG3B1lslWDMEf8pLe1T54FxvhP8JMm5WTX97dxRAy8WHmiYRu6UXSadZY5BEuIPolvX4MSAF44JqbkuwIBukvLNQZUfWRrng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hTbv5k53; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hTbv5k53"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 159142540110;
	Mon, 28 Oct 2024 04:49:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 28 Oct 2024 04:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730105378; x=1730191778; bh=NwiQZkH5JUcnM3UVrrIlq7Hfki8f
	eJ/BIz2D5atDp1E=; b=hTbv5k53NU3vJCzr6w2GeGxdCPBh49QfLk8T3N/C7iy7
	FVb2ZA/nMIzJbURJnVKYpJ+dR/P4whJ1KPzMY0kVJOKMWSPpBIABmtYQHJqSdrfZ
	c7+WIP+ZBpu6L8g/1Itw+XjB1bCHqHoeS/oQcBt8+bpZNc88KwFKoMS4fu3sCnry
	B+lETsxNrCWmtWbP5GswloGACibTPrUo3S9hRu7FDIATGeEeGAe1yX2gzc8cLg0s
	1PwV4bQyDZ8mB5myYrXp8V1lrMxYUmQJQvfJVWYpZ4yakdejB0vEnda9wXW5V4iD
	uqvj4tnsRGbgq9hQomT8BWDT3Itd1bQfdDsvtNcNuw==
X-ME-Sender: <xms:IlAfZ0YFyvMe-l2DTqiZd5TjcDCb76sqgTLNXC96l1Ytr-5P21n2CQ>
    <xme:IlAfZ_Y-Pyb709T9bek9S263c3-y_zIUD7gvylvXFqiQrZTftCTrDhrgqB-sa8sfk
    zKtXfxAELlqi7ggPmM>
X-ME-Received: <xmr:IlAfZ-8qp3F9osje8LgvY4bRYDRfRNMEITwNrf5CE9_vwSVbdPVOfnJHLQCvOHmw0OsLjzMLIQQlRDnp64cgM5gsD1_T2e_DcdU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejjedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepthhgsegu
    vggsihgrnhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpth
    htoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtth
    hopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghpthhtohepshgr
    mhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:IlAfZ-pt969cOHgNLCT-CLyzkDtQQGo-LGWNeysEd6uJajniTPCVUQ>
    <xmx:IlAfZ_rMFbXekKthd1PsTrbP8w6t_tRWe5C7C6W280cEu8UH4RKJ6g>
    <xmx:IlAfZ8R-z_M9vSau5ji0_0aN44ITrvDXG9fGk9GigZRAkTVaclzfnQ>
    <xmx:IlAfZ_qiioJZ1UGuAOZWWB6F5ZOKU-pgjVpIpbRESgVkorUpNSLxog>
    <xmx:IlAfZzetwnXRP_PowduLjnBIbCLpQGWdGqi461VBN-7ybl9woG79SZcF>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 04:49:37 -0400 (EDT)
Date: Mon, 28 Oct 2024 19:49:35 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Thorsten Glaser <tg@debian.org>, Arnd Bergmann <arnd@arndb.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <325daee024e5290959c5147346602ac7f0089474.camel@physik.fu-berlin.de>
Message-ID: <8d01228e-d6c6-6d10-f60d-b353b341e4b4@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
  <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>  <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>  <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>  <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>  <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
  <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>  <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>  <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org>  <f2377db5-2b39-0e58-4d22-1caee7e8e6a3@linux-m68k.org>
 <325daee024e5290959c5147346602ac7f0089474.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:

> On Mon, 2024-10-28 at 15:51 +1100, Finn Thain wrote:
> 
> > You talk about "applications ... being written". Well, two days ago I 
> > mentioned several groups of applications: (1) core packages that 
> > accept alignment patches, (2) packages whose developers shouldn't 
> > worry about small systems anyway, and (3) packags I am concerned about 
> > i.e. the ones actually required by Debian/m68k users (which will 
> > presumably lead to disto bug reports, if they didn't already -- hence 
> > my question about bug reports which remains unanswered).
> 
> As I said before, it's about (transitive) build dependencies and the 
> fact that more and more packages are being rewritten in Rust.
> 
> Here is the current top of the list of packages that won't build on m68k 
> because of the 2-byte alignment issue:
> 
>    2814 cargo:m68k
>     900 ghc:m68k
>     261 gccgo-14:m68k
>     241 libqt5core5a:m68k
>     181 architecture-is-64-bit:m68k
>     117 libglib2.0-0:m68k
>      81 libcompiler-libs-ocaml-dev-0a396:m68k
>      81 golang-go:m68k
>      71 wx3.2-headers:m68k
>      57 qt6-base-dev:m68k
>      57 python3:m68k
>      46 libamd2:m68k
> 
> Are you going to fix these for me?
> 

Are you the only user?

Seriously though, thanks for providing data. Now, if you would link to the 
upstream refusals for CPython and golang, I'll do what I can to help.
