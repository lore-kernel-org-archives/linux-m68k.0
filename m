Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C932F433E
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749778520; cv=none; b=mbSH0eDhfXNQLcht4X7vKRTSeXIHDDaK6xydcuhCTX9YjjKAf30xnlaLhJLnZl2irHvKR/9r2SlvC57sr0qSngr6Co+fHgpXWjL0exIshumVLu2y6K9OS55f5pt1fcVvCd8Gx3ufbh7NMaTQhfK8Snr14oqdZQipCs/QLy96awo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749778520; c=relaxed/simple;
	bh=XRWBynHnjJyO+n273thIEqyLy4g3kR1Nnn3YPNb8gi8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l7LdsHbp3sZeqtl6hyD+3FcrAr2jSi7Vwv+8RZeVYFt3Hl16HxaLSBlCVce0fgNqEM635NP2wpfYJDbrTv5KWEsRro6Y0xarl910pgDa93hfFxqxkWkJIap8ifNzWiFjIuw0fefGen2hDCkHxEPRybJTf96QfEQG520ENAk1tOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G1vTzJLm; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G1vTzJLm"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1339E25402A7;
	Thu, 12 Jun 2025 21:35:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 12 Jun 2025 21:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749778516; x=1749864916; bh=BAsukKmOBVaoM6PEVXgoWXAp08DfpQVMOr2
	dDWScVlY=; b=G1vTzJLmy8PINOLxqDLlqls2LMDc1RgHmkr9JUXpaQlhECWy/U5
	knzA7lvD4l3/8sKBo+K2zMWz4akj5rk/Dnw1tee+4qomXVxeHnxl8Xp9ovceebs0
	qy9CSLzBTjitRzX8wLuUnNjEJ+jHcAAyhXa0WoMCTXvtcTTQqMnUivaP9mnGvJnR
	lyeSiySSm0JSfalulfmbjMCa4OAVeVwlV5jDS30Log5vNbGVh9urjTY4Wjag2IpA
	3/YcGMciFgGG9sVT8MDlxTMppNXCClsgfvAMwZ6fzK/YMyH0aZSlPZsDA/nmkTDZ
	G6Uc8hhNI7t27mNNn98ODD8XMYP93DMeR1A==
X-ME-Sender: <xms:U4BLaCtXI9JGXVNmMKTwnW_8wloP8n9myfm213ffmjF-ZbBwW2-Zmw>
    <xme:U4BLaHfb9ibK2BPQ1MIYrcJlHJB2mhtUNPPMFP5Wybsqsztr90yFZuahGWS4-zfv8
    qBbrl5DPGDyGE1vfFw>
X-ME-Received: <xmr:U4BLaNyzXNv5J2bTBvPIN-_-H4h9P9WMytc9tnZXi_NJo20NM1qPs6LEaxcSr9fMIFQbr8AnmuDgvO-LBjUYG9K4cpAbRvYubFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduieeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohgrkheshh
    gvlhhsihhnkhhinhgvthdrfhhipdhrtghpthhtohepghhlrghusghithiisehphhihshhi
    khdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhooh
    drtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgh
    dprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtphhtthho
    peguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:U4BLaNOow4vOpe5Z5_4cDYHx5EotDJ25sNvFXUD1-ZoSwqbsTB1s9A>
    <xmx:U4BLaC84xCSlPaJF6yscF4cKMEE1ydBuVPbLU6bsczXxnSMUXYyCww>
    <xmx:U4BLaFXCQABQFC8r1XiaYd7AYjP6YojndAtVpyVw9tIIVkfmaP_LWA>
    <xmx:U4BLaLetJJlU1GdsyiYjkf59htNIuOsWU7C2ixrfqCctzJ-K375lig>
    <xmx:VIBLaNTLBbVaAV_gepi4qkiNqvJP5RdbTSMDRVCbsn7_d4dwoemnrNTV>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 21:35:13 -0400 (EDT)
Date: Fri, 13 Jun 2025 11:36:01 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Eero Tamminen <oak@helsinkinet.fi>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Stan Johnson <userm57@yahoo.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
Message-ID: <d3a8ab8a-3be5-8f04-8b7c-07ff7e103e35@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de> <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com> <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de> <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de> <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi> <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de> <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 12 Jun 2025, Eero Tamminen wrote:

> It's been used e.g. to optimize upstream ScummVM, so that subset of its 
> game engines work OK even on 32Mhz 030

And therein lies the rub -- to identify those workloads which should be 
measured and to afford each one a suitable weight in your decision making. 
That's why this was always political. You can argue (with the benefit of 
hindsight) that Andrea Schwab's solution always had technical 
deficiencies. I would argue that it is a huge success regardless.
Thanks, Andreas!
