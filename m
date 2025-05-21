Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19C847B
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 00:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747786451; cv=none; b=jnLb93oKpF5vfewPcuzHxeRizMHZIGlfiiwU7fw15IIPZf/KwBbF/naFv6oTFjudDy3TJ0Gv8PyILiuLUIdHCMNJNYrI1iFtt8OEpFsCZ77DECAJji2mo5ogpIaOlblRGY7a27amxnyi/kc5Zg1EuGlMETZWFm+RLaksBP+jY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747786451; c=relaxed/simple;
	bh=up1/9MFBfOyZ0jiCFUlXLVDOvYR1WTYQiQMlUmAKyak=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VBs6eVeP4xW4O3vuz6sjGZCb9476IwtEC73FjnJ2vMzknV1aOnOIibn0q/p4/6c7JNC6hj+8jWhbCcHh7QVD6709tWsGfHGRBWdYjfpk42CmUoIB+k3Zt/GTBjaqJkIExyjSbrMs3XsvdW01f+MG58SEOvC0NZw1dAivzP2dqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PJKiFml1; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PJKiFml1"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 056DC11400E7;
	Tue, 20 May 2025 20:14:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 20 May 2025 20:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747786447; x=1747872847; bh=rTmuqUHVWPXOlqX3KB154W50QwX1saC7rpm
	7vADVfLk=; b=PJKiFml1fpATgqZ3Mf2sjeptIfnvPX8Wkw6WEEXQLTEGwL1Wgxw
	xdgzyFBqZyqU80LTvR+h8HgpW+lfAPu76mBjtelsld9GT/eSOrjpJ8FZ03gH35Sj
	OlQo/GqGHVrhXyUXWucSg/WoC9JBQ9ThIWBuesz0lCUH87dBPjhokKL1BqDbmSQE
	vy0OreG/4aXI0qByvsINqf9gYEdEXQ0BI2wm1FgBE0UQ//GY/wAv1RuPrJC6VeR6
	v1Yps++ue6EZrVshDLaaJrwXZVu8+r1N/p0McozQ9IDwYTGGXG/iPbQlESh+VOQX
	8kloAJsjqI6RTEW4AxYJzYaxxSji1URBPvw==
X-ME-Sender: <xms:zhotaOF9A4BzFGjUkSntWfejU9x_3Z6WXQDJIOdxCdD7UG4mZC4H3w>
    <xme:zhotaPXa9hUhI54a8f2EFf4Z6RkGibbjX0ipP5ekTKk5Ey1tbJS5mjrCyS0sN1LaA
    bqN820uyl3zMMzUD10>
X-ME-Received: <xmr:zhotaIKwD2rS5qEnMHmPbZkMXg2siWSgOwxwzrPQ4VcSuyk9cxwC8C-b75fqPZM_P7ZYk9V20i1P9SbStntUVvMsBURyyYOoG6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduiedvucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhf
    gggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinh
    eslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeetffegffevhfff
    tdetudeujeeuhfevjeffuddvheekgeduvddthfethefhgfegudenucffohhmrghinhepgh
    hithhhuhgsrdgtohhmpdguvggsihgrnhdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtth
    hopehffigvihhmvghrsehrvgguhhgrthdrtghomhdprhgtphhtthhopegthhgvfihisegr
    uhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghpthhtohepuggvsghirghnqdeikehkse
    hlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstgdqhhgvlhhpsehsoh
    hurhgtvgifrghrvgdrohhrgh
X-ME-Proxy: <xmx:zhotaIFf_vkNnK_KoJXt2eHNFrdBg6dFPGBEHIdVb2YAuGIFby6piA>
    <xmx:zhotaEVUTCA2mKtIpjOtnRVRBN13VxSLndAceXMYnkqhtPzYgMedxA>
    <xmx:zhotaLN7uFoAB8NQy5-yTn2YH8EtZisC20Q8zMK-Vml2KBQyNkisww>
    <xmx:zhotaL0OURUnXOZa0H1qrFUKKo7kH7XWsFYmZH9Sagxi06rwYKSQhA>
    <xmx:zhotaHQ67ztt1kNUpCum_8lGM23nBPLaTX1nulvy0YraRj-KMgUD_smL>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 20:14:03 -0400 (EDT)
Date: Wed, 21 May 2025 10:14:37 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Florian Weimer <fweimer@redhat.com>, 
    James Le Cuirot <chewi@aura-online.co.uk>, 
    debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <cca24c0938cda58d8079c23553d789685b410847.camel@physik.fu-berlin.de>
Message-ID: <e96bb74d-fde2-9d51-8f29-bd367d31e3b9@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>      <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>      <8734d1kofn.fsf@oldenburg.str.redhat.com>     <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
     <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>    <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>    <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org>   <48411baea4164252cba5635b09325c8acf29f3bc.camel@physik.fu-berlin.de>
   <23cce228-e58c-9c5d-74c7-49b0c77c35b7@linux-m68k.org>  <0f7345713d232c46f241e3b0a9303f76adebbde1.camel@physik.fu-berlin.de>  <64b646df-509b-579a-34d4-aa947774aaf7@linux-m68k.org> <cca24c0938cda58d8079c23553d789685b410847.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:

> On Tue, 2025-05-20 at 21:03 +1000, Finn Thain wrote:
> > Yes, and then you declined to send your patch upstream, and a Debian 
> > developer picked up my patch instead.
> > 
> > When I worked on this, I discovered that your patch was inadequate, 
> > that the problem was not the m68k ABI, and that you threw away a good 
> > opportunity to improve the upstream project.
> 
> And, did your patch get merged upstream yet?
> 
> https://github.com/python/cpython/pull/127546
> 
> It's still open which proves my point. And that's just one of many 
> projects that are affected by the alignment issue as you can see from my 
> list.
> 

You've never reviewed the patch. What is wrong with it?

> > > > I know they were ported to a variety of ABIs with a variety of alignment 
> > > > rules, that do not guarantee natural alignment of integer types.
> > > 
> > > I see. Since you haven't tested it, it means the bug doesn't exist.
> > 
> > No it means I never had a need for those languages on m68k. Does a bug 
> > exist if no-one executes it? How many actual users are there for the 
> > Debian/m68k JVM, besides Debian porters?
> 
> How many actual users in production exist on Debian/m68k except hobbyists?
> 
> You're using an argument that works for both sides.
> 

No, my argument was that you have failed to identify those packages that 
actually need porting.

> > > 
> > > Gotcha.
> > > 
> > 
> > I assumed the bug may exist, but when I asked about it, you evaded the 
> > question.
> 
> I have created a wiki page for this exact matter:
> 
> https://wiki.debian.org/M68k/Alignment
> 

All you have said is that upstream codebases refuse to improve their code 
and that's why an ABI break is needed. This makes no sense at all.
