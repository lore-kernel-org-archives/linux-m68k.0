Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D52917CA1B
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104865; cv=none; b=pToN6tatikvwM+1KnfnvmKqwM76948/Fok242BolnnAXm1SmfUXiOv8n3XtcjeTN7J3M1j3kriK8SSJVa0QeRABNy+mS4l0xrUgrpTz1hb2UbPEoNN1f70/ZogLBEOT2/uEhlhu9ktB5GcfrCIraV18pXrSQVjT93shrlyvYHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104865; c=relaxed/simple;
	bh=sMWQwW32GHHdsuc739NguxriSDl1LZr3S1XY4LmPjkQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=auhYTlkaXbGz0m7qZudLRgNnW/IvkHQ394TYbhwazfJSlQxfLsnv30350sXv3Q0mCS02PL1JRc4Nz2w34Z2pv137JiIfjgpdGq3Trk/2Hfk99YaF//QRpCUiTDpkm+XfkheBXqXiI/YxV9GwmY35iEhMzN5k2OFiEB2Ptqp4DJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jK3Ftgk1; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jK3Ftgk1"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 23D4A11400F3;
	Mon, 28 Oct 2024 04:41:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 28 Oct 2024 04:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730104860; x=1730191260; bh=KWZVc4dqVFCcbYJe4cfWAerBWrG0
	Pl8BtxVH/u5QVog=; b=jK3Ftgk1z/tjz1lS5rc97LggL6/i3Cacnzw5sOvUWrak
	yGl2jF9MtCj7xKu4hk//lfQbh080n7NY5L5o4yD72VPmwntD+xueLu8piMWhckJJ
	aXLMq39QWG09vOEc7wsOZpRx2elQIHVdx8xPplJkHXJZ3vODxjVPoWFbT9xbFiOg
	OMVdrTIREJEGjkr0VqwadQ3Avck/idBmjiG82pEM2lzuJ1nR3d1Ai562N+S/MOwU
	nUzILu+6LFF/H5O6G3MvKc2Fx5+P8Cb3Sk7AHLnPgAwqEInrxqW4vS3Qcg3RRulo
	yMdOlvbC/K5BLaRnwj+dFqTtqcWkTLOYKdKc0TeKZA==
X-ME-Sender: <xms:HE4fZx6SWi682Ncg0MnuXcA0HkGXoT3t_Jc33CZzfpQJ5VF6z5au6Q>
    <xme:HE4fZ-5GdRtwWcyqeAq0gXR-nFaxzoTZ02Xk3S8L7aKSkCQDfJMyHypQNeYwGFeuz
    EDJfTc0p_PE8w_ehZU>
X-ME-Received: <xmr:HE4fZ4dfcc1GOyPJTK_6FgggcV1iRkuMl_YL6aKFlpdTcoTo2UFQcjjG8z1E_nfD3pzrqM8Z8pSUdUPdHZ9tfupN3v9pd0eRQGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepthhgsegu
    vggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggv
    sghirghnrdhorhhgpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtg
    hordhukhdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehg
    vggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfigrsgeslh
    hinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:HE4fZ6JicLwrQlSQKmdD-sjCIKHzFcoq-o2jQxFT_ZQrrTj_dbXUQg>
    <xmx:HE4fZ1JPE9q4jrgRAF9-NWJ7WiTfkm4CTtUI3NAtewea9I5rujdtFQ>
    <xmx:HE4fZzwO--_lQYWpKOmj7CEljsbgZoCFqPpVF0NvYKLV7N3vexA8SA>
    <xmx:HE4fZxKJnFZzHSsV9jzWTQ6sqjjwIr_GxldUj3gvA3ErS6k1pmiysw>
    <xmx:HE4fZ883Yy2Ys4SMj76_1BJocAvWBfMoZcZoA9ZMz8cvKfvSt7VxABsu>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 04:40:57 -0400 (EDT)
Date: Mon, 28 Oct 2024 19:40:54 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Thorsten Glaser <tg@debian.org>, linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <90616d852357d7489e1404dcf4a9a04f881b4007.camel@physik.fu-berlin.de>
Message-ID: <7c59a9b6-4867-5191-fa72-8b3664aed970@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>   <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
  <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>  <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <90616d852357d7489e1404dcf4a9a04f881b4007.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:

> What ecosystem? Do you honestly care that any hobbyist cares about 
> having to reinstall their retro computers?
> 

The issue is not just old binaries. You made the same mistake in your 
message to Arnd when you said "we're not allowed to fix that [ABI] because 
someone might run an old binary". For some reason you're choosing to 
ignore numerous objections that have been covered on the mailing lists to 
date.
