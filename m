Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C8264F9D
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734353; cv=none; b=Ilw/5Hb5Hw0QSvsaygIKf24dmGQJrMZzTRxmMevK2DYO17HG+vw6OZe81R1NzQxR3jOR4g67rZstOati6Omg9E4/bhfh17BYf3IcRbutpdQmDNMYLg1z5y+Mtc+Futipu5vQCGenQla6djTLFQEh9QVd6jEg8ANw3n4PzrhPL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734353; c=relaxed/simple;
	bh=ss6Zo8aZreJ9xGkrX9GP2j3DEG7UdlCmhoew245hrF0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pkoYMDoNslA4attWe94X+J6cWjvBGcSNftuQg8qM9JWAtM9X1dMOysFCiI/DvvBwaYC4UrbF4XZF1WmToWIjDgfq3V++1ncBl0Lj9/G9mm61LSwsDZ8s9ULt6NatZKdwQEZYhEtBS3pNopPZ87sibSpo5utWSagdVY/QaSZbH2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sG0jM9a3; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sG0jM9a3"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1B9221140136;
	Tue, 20 May 2025 05:45:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 20 May 2025 05:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747734350; x=1747820750; bh=4bAZJyS12/Zj2WmeVWtThaSSRm2oTIolb+G
	f4Lv/1ps=; b=sG0jM9a3n5BJDpWrfJFY1Vz+gLgENu7e3MogQIyeuD9sn8sjmQ8
	MMy1pimyGQVta7DGLO5Q+bAhS0ltICm8fQ4AjEDfKaEUP7llSvhBlQ25yvHnTyLR
	OJcrEQofXimzSwxicRNUinKQFdLEcAAlI0ng6XRw0gKL7C1dtVP0kJxJLOO7VmFq
	SO1NYS0gmUUMjFvV5HYCye/EYl3mcgJUnrVkW3fI8kXWGDmpFHZyTsWa46S0cTwk
	7y2U491shaA6ClWEMOY8eisQefMec4oNGqNnE4jTjVmQrZl26XXnLbSx+N/i+3cn
	/cWNSpSm4G5IVPqR3fZo6U+T1Y5RW7ajSeQ==
X-ME-Sender: <xms:TU8saG2hkkEIMLIs18TIxJZS32-QnyY7DfKOoKdmdo6HpDUyhxsc_w>
    <xme:TU8saJHF6EYKNvrYjJcedSB6bIrs5iKXvK-Z-5uqZqllGIc8EqM54zjr9eyrcj_BN
    P4gqtzrO44xRZcsDsA>
X-ME-Received: <xmr:TU8saO68qClbYZlgQ-n-JruS-le6WUJjtPvykgIjkLmMRdT4iyu_DPOPW9nMsp0ipl3dIhwzxw5J2pGRwGFA6NkCbseS_YvsvzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdefledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddv
    necuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheike
    hkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffek
    feffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhn
    sggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruh
    gsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehgvggv
    rhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehffigvihhmvghrsehrvg
    guhhgrthdrtghomhdprhgtphhtthhopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgt
    ohdruhhkpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihgstgdqhhgvlhhpsehsohhurhgtvgifrghrvgdrohhrgh
X-ME-Proxy: <xmx:TU8saH2x4SrSfudePbLBJxu_LLZHfHr0nNquU8NMlZwQNAoLbX67zw>
    <xmx:TU8saJGkDkk5ge6OER_09XV55UCmEletb4ZtIvBLk7Ajz1qBe0fhZg>
    <xmx:TU8saA_0qDe4FjK-8L1hQttec4vngbpUkd-i4kj6mPi73u1TwOYSRw>
    <xmx:TU8saOn1pvB_KP7fD3Lyod9TNhqS7t-Gx6ifEqJH5KPKu2DoIHJtKw>
    <xmx:Tk8saPmL6sX0AGww1xT995uhcrpzh2w_d7PKIkhsTZqQ0GlYcY5567nd>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 05:45:46 -0400 (EDT)
Date: Tue, 20 May 2025 19:46:20 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Florian Weimer <fweimer@redhat.com>, 
    James Le Cuirot <chewi@aura-online.co.uk>, 
    debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
Message-ID: <0d6414b6-539a-91bb-2aed-867e24816ca9@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>  <8734d1kofn.fsf@oldenburg.str.redhat.com>  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>  <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:

> The fact is that software is moving forward 

Right. That's why we now have "Qt for MCUs". The Qt developers aren't 
trying to sell Qt 6 into a market that doesn't have sufficient compute 
power. And yet, for some reason, that's what you're advocating. You seem 
to think that the Debian archive has not grown since Debian etch. I don't 
get it.
