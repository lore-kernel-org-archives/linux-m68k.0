Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987D15AAC1
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 22:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535303; cv=none; b=cf2hTJeQUcbxLiEj710eZQuVxN5hQX4lfO7YAhJcz4vmpF6/IeuBypRC3IbV2/83pkbrz0q2+wPs06N5BgZqGee/rey6s7QQyTTxR75k/mBs6DxvZtvQNOLdeXo1rSnWY4PwXYD31UG9NqsMq76vPLWdvvzzcZRBGvravk/yFSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535303; c=relaxed/simple;
	bh=TxYqS2p7DE9+lChIwf67W24ma4Ufzv18iMUPrSRxK5c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PSRqCkKtV+kXBbL6vEoK5AKn2irBm3Cumx2aPwQHn64f6CmbUKB+Bzdma5L3KcpHeah85anGl1tdEpDTwXi3hKIc3U+J7IR0s1nZj5dlj4yX6OR7NLS+2G9C6Nwab6x4oDx1Es+wz8P0JLjAwzpKnwUCPY3k4Fzi/pnjlm46HKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LrAi6Hgf; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LrAi6Hgf"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 1CEF813801F8;
	Wed, 13 Nov 2024 17:01:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 13 Nov 2024 17:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731535299; x=1731621699; bh=+x7S+sxWJy6jUiajYBJutoRAiea2bUawPPm
	IwkZjZZE=; b=LrAi6HgfpygNvGMS6p8CtxNXkdbtsD89zAxguvHIuWkHd6qw6nF
	wTj3pOov1UcdvgaLHB56Kkan6u65WEOFl/LEbfResEiAvPIEQldAe4F4jsDOrlSs
	OSZ0rULVZcIJbKvaTnXl8C1jJYDk6cgavojc94xvX/VgUaqY6HDwTdv9xuI49iM3
	5xVyJz0ARZ9XYN/e57QH84W6dsqohzUcEG+qpK/R5gm8dPpH/RntIhqio+DioSqv
	R/paWxKJuDMAw5qe1WNyut7GGdJ5TEXAShApxszkXZoOzggFQLUUM3bfjcwXW1z1
	Eni40tBXb6xIrVUDbPsi8R6Q2qNjNaGjosQ==
X-ME-Sender: <xms:wSE1Z6xL-0L_LE7ZM2ykeoL_QkZwnfK8qWl2aFQGenYuVxk1taB5fg>
    <xme:wSE1Z2TcgX1TOOT6FKxsZXM5TuLW_L6SaYxD5DXlGI-oiSU4JspTAUbdnZ1xWz1Oy
    rsx-zy55Q4yb-H2_Yg>
X-ME-Received: <xmr:wSE1Z8UG3fc6Neky4Hypr9tmietHjHK0A_BiKtq0PSLwz32c76b8JFnEOaHADB46oZkt7l3q5yg54xx5heKiLEvzYYT1O5il9P4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddtgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsih
    htiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehtghesuggv
    sghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggs
    ihgrnhdrohhrghdprhgtphhtthhopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtoh
    druhhkpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgv
    vghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlih
    hnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:wSE1ZwhMsHXVA5u5NbOPGFcnZKBySJzFq6J2tiaO9m3Sgy2f_2qXtw>
    <xmx:wSE1Z8BTA8QsshMpJMooZntzfKdCQnHJiH3ORp_FuOIANydBrhdY6Q>
    <xmx:wSE1ZxLFj6i9LAikCD_0i6nGJ5oTakwSQSQylvRLjro272gGpNVHgg>
    <xmx:wSE1ZzCmeqvarrXpcMpNt0rVYX5u2DrTHsQeILR9GUl-QwfjGBdcFw>
    <xmx:wyE1Z40qH9JUpMwxWCpcVMK-Xy3sCTR9fft9J7o1FscJOTT7YnjeRqiA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Nov 2024 17:01:34 -0500 (EST)
Date: Thu, 14 Nov 2024 09:01:58 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Thorsten Glaser <tg@debian.org>, linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <9a8839fafacc0e89816626b40a4167ad6f0fb47f.camel@physik.fu-berlin.de>
Message-ID: <905d0935-7b74-9eb9-04e6-553ccb538930@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>    <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>   <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>   <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
   <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>   <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>  <90616d852357d7489e1404dcf4a9a04f881b4007.camel@physik.fu-berlin.de>  <7c59a9b6-4867-5191-fa72-8b3664aed970@linux-m68k.org>
 <9a8839fafacc0e89816626b40a4167ad6f0fb47f.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 13 Nov 2024, John Paul Adrian Glaubitz wrote:

> On Mon, 2024-10-28 at 19:40 +1100, Finn Thain wrote:
> > On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:
> > 
> > > What ecosystem? Do you honestly care that any hobbyist cares about 
> > > having to reinstall their retro computers?
> > > 
> > 
> > The issue is not just old binaries. You made the same mistake in your 
> > message to Arnd when you said "we're not allowed to fix that [ABI] because 
> > someone might run an old binary". For some reason you're choosing to 
> > ignore numerous objections that have been covered on the mailing lists to 
> > date.
> 
> I have only seen real objections from your side. Everyone else agrees 
> that future development of the platform is not feasible without making 
> the switch.
> 

I'm interested in what people have to say. I'm not interested in who says 
it. Hence, your concept of "everyone else" is irrelevant to me.
