Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48617BB1A
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 23:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731539534; cv=none; b=fqyEETdm1bnEWpH0OhfgjPrCojFSVS6CYmEQBINzDLBlB2FN0sftrH+D002mHdxVSqldpRiZcsL5t+KqYPk9aupHAtVCjdvKLIevIrtfxQHL22qGKBmUZDg7wuh27Dpe09UIPa0kQ3NThVlG+YRENi8TYbtST6BXyKMZAAzNc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731539534; c=relaxed/simple;
	bh=EE0y6PtYq4LX9M8j6/xKMS5dPPrDx5LhCzDOlBqrLco=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KRJQBFm2gOqDH/olyY4UnGB09OpnFtwsI0Xbbn64k1eqFHIVeTYFSGYk4c3yrHn7gTURYWZ5KERf0kGQOc+AQS4ba0dl9y25XAtlOtjR8V8K2dvT8cWMUCrnGhIhYUhW0FrLOa/buCq/U0UKjo9dC46mwsrIT2q/dwFxlSQYH+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MfAMItFG; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MfAMItFG"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A308713800F3;
	Wed, 13 Nov 2024 18:12:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 13 Nov 2024 18:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731539530; x=1731625930; bh=Rw5/Nz8JKRo3eIqvVH5Uwg18CemnpP8YabS
	+h6KoSu8=; b=MfAMItFGw+xWTNcTWi3fTZ3n3MRSWwYO/oGjyUi05PCM4QzJ/AG
	VCnmwY5x5jscZ6RfsUAJXqSywPHpJ7W4R4Ew/HOgcP5AXTMSk2pJw++kLQ1AXk47
	0FRMcv/2BppOvJdGKWMajxV9k2LcZq67W6rXpJt98eKiTMqzvh+6674TEA9XDKI8
	MiC6XQCW4EPJfTOv0FWhzpGTS7oUFtNP1rylbKepNW/ho3RaVtQ3FBoyKlwQWlkr
	gcmt07xkhUmoXamGQ2Oyc98JcnkHsVfBZYNQlIegyOdyZrSzJuiVYjt0gOZHH2ax
	RWFYkEd0jpqqM1RAXlQkmIun6fJVyLqmNUw==
X-ME-Sender: <xms:STI1Z2fwq7qGPoiQzeEEj6xvXE1W8AGk4OX8fGFKmLtK-y27vf934A>
    <xme:STI1ZwMCHC7XsuBHNWf8HasM-Q9FmdO5XxLeDiI7-eO9tyZUbpsCyqqFM-DAziCKP
    3QpfSlS81rpBwIGo40>
X-ME-Received: <xmr:STI1Z3jl3zf0ur1XVD9AqcaG7D71qlP0E2SkifiSCuhHEObYOvR00hBsL4tjill7KgEOU8P8bHJkv4JTmX8Y2cNoNuPI7IzKroo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddugddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeefffff
    tdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghr
    tghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsih
    htiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehstghhmhhi
    thiimhhitgesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdrug
    gvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrgh
    dprhgtphhtthhopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghp
    thhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghrtheslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:STI1Zz_wAdJp0qmcRmqSqwRz7s0GhVpX_fShz7xG5udHzJWoXUOjoA>
    <xmx:STI1ZyupA4HlkmZ7J8632syB1kz24GofkFcpJWQ3KhtZSoqkfY7l9A>
    <xmx:STI1Z6FFFvdqRbU_XDOVJ2v84P9GNIYAvHpFQy0aRvnJ7ATrLyKpnQ>
    <xmx:STI1ZxPdE3inIl4VTfrAtBniCz2E-GfhIaJSwIO64W7aT9pUWFmHFA>
    <xmx:SjI1Z8Ke_--MOHhNvtvDKebdDSNCvcN-AESHMCLCwvZiKwsGO09irWGD>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Nov 2024 18:12:08 -0500 (EST)
Date: Thu, 14 Nov 2024 10:12:28 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <50be1cf2bf065fbfd20d5b8c27cad4b9be9469fc.camel@physik.fu-berlin.de>
Message-ID: <5b674409-07a0-8d57-4ca1-5efb37c83a2a@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>  <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>  <de1adc92-f1e9-81fd-9406-7148e8213e4c@linux-m68k.org>
 <50be1cf2bf065fbfd20d5b8c27cad4b9be9469fc.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 13 Nov 2024, John Paul Adrian Glaubitz wrote:

> 
> > 3) among all 680x0 developers interested in the NetBSD ABI
> 
> The alignment issue affects NetBSD as well.
> 

My experiments showed that my NetBSD/mac68k system aligns int struct 
members like my i686 system does.
