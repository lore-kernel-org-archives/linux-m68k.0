Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0507A5B5AB
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jan 2026 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767917459; cv=none; b=SDI222dj8+ussMJ3i9luKseBxVza0S5Eoft8gCOT5v7MH+UJlcAPDrj5K8WbqLdXY0XP6i54QSeHZ4HdFm6SsJCVD1+bKnl9Ufj1hCXNf+4a9zgBcb0lh+aoEeOzawcwzCKsPkrCKrsXPw7+u0PFuUD1wqlQUdhThxAb0E8nJsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767917459; c=relaxed/simple;
	bh=VDfmRwZvDBtkz645VSmCBc22tU4McnrBcKilmrIO8b8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BE+Unsm18Q806E89GdOw3/7nxUq5N5HjhGJ7+EjIQYAVU5BsUSP0+7RVIYPLYghqXhVdgB7e6GXlSg4SwzTwgzvaw5FpYwsJrRg9dqef178D2bNOnNg4oZvQkAS+aqxd1QjL2H8t6a6TPz8qSGmEsB7FiZjykk/jOojBUfg9sms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bPnWn1cs; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bPnWn1cs"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 04AEA140011F;
	Thu,  8 Jan 2026 19:10:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 08 Jan 2026 19:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767917456; x=1768003856; bh=bDIhVd4/7LgmAS+Ml6RiUC9jU1aqHYtA337
	roeqNsfk=; b=bPnWn1csDULOwnw2/KheSWMGk9va/FTwu5GSW+HMhNo8rRHBBIk
	h89k5lbEivr9zET59dCZGYA2VCP7BLhUxypmVqFVJsAs+NoGJ55ncdxnhozl8Q5N
	DoEkDWwkeLcffLCIrv47GqqS0DJBh9zopQJvaNtgtxYodrV1tu3/dI8Tv6nX72z1
	Y0ddQnVyxxGY2eQ0TDHzDVPtuMqRLctbxIX8qBYgGOUIy8M4VNBnxYpiRcuLjoDs
	nw7BcHcD8P7f1M0vYJC5iI+bwhS9dgTp0thsAtRIxVehrIKCV9gFW1iavYNMbkPO
	PDptHqaKDNgpM2CrRDDmtZY5uotYLlnWnAA==
X-ME-Sender: <xms:j0dgaWg35HMNu_3UxxdwDQxVbOMTYTh5euj5u9YZ9YaXcwjMcEWRTg>
    <xme:j0dgaU0V837bLPoro87ZCAFTeMQAokUKlBI6eH4WLv1g9o1zxfOhChOJrN0PAaCKt
    j9PgM6U_ID1_z8rGT7H_X-PNq-9c9fjRb_HZRPY3JpkhT32uaIIBZE>
X-ME-Received: <xmr:j0dgaYh14IhoSQ5QfFTWKAPaYrWYK5y2TGYhk-gyIzRegOlfMob5bX-R7PFyDsEC6Q68hog-rv11Ccb6-zvcEQmNDnhJK3E7zc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdejfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuh
    dqsggvrhhlihhnrdguvgdprhgtphhtthhopehsthgvfhgrnhdrrhgvihhnrghuvghrsegt
    ohhrvggsohhothdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidq
    mheikehkrdhorhhg
X-ME-Proxy: <xmx:j0dgaceIIIlFxD3w1j2OIYWTWJUWeLfOkgHP1iG8XFHkUjSCpa1WEw>
    <xmx:j0dgaTkaHM8cSzYkkTZpQ4eT7-EfUJDwxWmsvev9PAFdZbicwcdwKA>
    <xmx:j0dgadtGPyRiVhWezAnuIiGD_kATG5IHfYHuaG3CvrYSfLCEH2Weig>
    <xmx:j0dgaR-AkCc3CYeKcOnMD5UOGXm6VGkwk531hQ-RSs6oAumUcDmfOA>
    <xmx:kEdgaXyCXgf2BOKrNIin6fPG18p-4DGY-ioYETELMmVU8rS2pRTRJiMQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 19:10:52 -0500 (EST)
Date: Fri, 9 Jan 2026 11:10:46 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Stefan Reinauer <stefan.reinauer@coreboot.org>, geert@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64
 implementation
In-Reply-To: <c68424f1589a2f666f643c7dfc4268b3c8e06068.camel@physik.fu-berlin.de>
Message-ID: <4832d56b-59f4-0285-1565-54a20b0dbdac@linux-m68k.org>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>  <20260108060533.3891380-5-stefan.reinauer@coreboot.org>  <3252e3e6-5eb4-3cba-9113-09e3febcc953@linux-m68k.org>  <CABq5eXHitcC-zWkYNVi0zCvqpo-y1BBNUDU=6HtZWES7VBY26g@mail.gmail.com> 
 <7b9db499-6dda-551f-a1a7-97740503cca3@linux-m68k.org> <c68424f1589a2f666f643c7dfc4268b3c8e06068.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 9 Jan 2026, John Paul Adrian Glaubitz wrote:

> On Fri, 2026-01-09 at 09:39 +1100, Finn Thain wrote:
> 
> > How much of it is AI generated?
> 
> can you please not treat contributors like this? This is not okay!
> 

Your response is strange. I take it you feel that AI is evil, such that my 
question was some kind of slur (?) I suppose you could twist my words that 
way (given certain values you appear to have embraced) but I'd prefer that 
you didn't do so.

> I'm always glad to see people contribute new features to the m68k port 
> and I would appreciate if reviewers could be welcoming to such 
> contributions.
> 

So you are OK with contributions authored using AI? Are you OK with 
disclosure?
