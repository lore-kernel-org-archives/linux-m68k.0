Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2444171D2
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 00:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747787348; cv=none; b=uTaJCBUUP8n53yRcY1LCcfkIrFhV15xfdXxjdAsblR/QfnrjVCr/8UQYlrxffomKM0CMSYR9r1B1WZ0hSkIqE9JVO68rfHE3V/b/uSAf5w/s6aGffAQwnYNBxnN1jNObn/MMw53dM0mdaaWtGIPlUEobXyXlZVGN8jnvnbpcQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747787348; c=relaxed/simple;
	bh=QX3JcngWjhsyN+40JoUJf7ZKSeiL+5dy+F/p2l4ZJlY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B4M6WzL1XRzg8Z7OhYCADZ1BRdbZlkXvjblYMx5OL139kfQfq2QxzIZs+QQSIhcXntNTC/7ud2hJDGzs0RNWS8OmZ3wmvILxJ+Or+mCeSI49gsMSDvdflJwEV/d+9ihsMTanesSIRVPeA1U+EO82/+Wr5g7mxlgB9Ymu5eXL9xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m923NjdQ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m923NjdQ"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B98061140135;
	Tue, 20 May 2025 20:29:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 20 May 2025 20:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747787344; x=1747873744; bh=FMi8BcXROLonD4io2tdfHepX3vs0/njQkVE
	KltRdRY4=; b=m923NjdQ9QTBjPRWcnC0mcDvy7IGAujjTP/aPzCBA6jr6lNJJPd
	Oy5g5zeYq0GeGPFeG+5Hoo6gVDYquxv126Mw7IizTlq8loTeTN5/214Og/5syJNX
	miIWak4dmz4Oo2QfQFop39Ze0ZDYjIbyp8WymD++K42RlNJ9LoepBnanH+tZzune
	JXxWjdGzgA2aUMldgwK9oUAgyIJOBfzhNDDOcfjhkmVZZoUTl+YP66Ii2wLbgcBL
	/ktedwBf6MDSYELcBxsSNs/puyxWy78AviuvhIfFn8tEP1/I4uXHrY6LeOdmRX7l
	oMQvQgiZgtdVGp/TG3ZAjaTsic844aL71Jw==
X-ME-Sender: <xms:Tx4taGboFp_b3XiSl3D6_ju7DeKmASHRiKTbi2tFn5ZAAkWqiO9j1Q>
    <xme:Tx4taJaziksAmD0ereASbMAeXr6MOw68UbOlGHCPnHISBv1i9N2HgtLxp0oG9qK_5
    4-aKlrikenAyJC42lw>
X-ME-Received: <xmr:Tx4taA-TD2GbQ7GpgvzOQUsFvHatrghYYtPW4KLwOduK842GTx0j5E-po5OjJdCk11jc4JyHQN3UTqeF4mVj91VsS61MQj_TC2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieehucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhf
    gggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinh
    eslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefg
    ueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdp
    rhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhope
    hffigvihhmvghrsehrvgguhhgrthdrtghomhdprhgtphhtthhopegthhgvfihisegruhhr
    rgdqohhnlhhinhgvrdgtohdruhhkpdhrtghpthhtohepuggvsghirghnqdeikehksehlih
    hsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstgdqhhgvlhhpsehsohhurh
    gtvgifrghrvgdrohhrgh
X-ME-Proxy: <xmx:Tx4taIqDeCoocs4IzjhnF_Q6yQU44dBYF6LV3kIgqhvxBupbkUCh0Q>
    <xmx:Tx4taBrC-YaVm3qktYx-u8nkqXNiUYy1_fTeI0AjqXC4clER6B-EnA>
    <xmx:Tx4taGSdmdkUQKpGksIrrMnHLQFzeKg8v6CXPptwnk9D0QsY6HMyWQ>
    <xmx:Tx4taBptney35YzmvPRqESKAeGNma_z68-NUzMGQu6P7EhHg8Toqnw>
    <xmx:UB4taDLkVqQ4Q1zt3CzTJ5s7eVwHRE4YwTh76qtTUUFC-r8Wr3rNAdhA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 20:29:00 -0400 (EDT)
Date: Wed, 21 May 2025 10:29:35 +1000 (AEST)
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
Message-ID: <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
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

> 
> And I really don't want to keep patching stuff forever manually and 
> upload it to Debian unreleased. It's a pure waste of time which is 
> better spent on fixing actual bugs.
> 

As I pointed out years ago, you need to stop wasting effort on packages 
that aren't relevant anymore, due to bloat.

I've also pointed out before that there is plenty of scope for novel tools 
to automatically identify the kind of pointer abuse that you are 
apparently unwilling to work on.

> I really don't understand why people that claim to be interested in the 
> m68k port constantly block any kind of changes that would actually 
> improve the port and prepare it for the future.
> 

And here's another thing you need to understand: there is no future for a 
port that has no porter willing to identify relevant packages and send 
patches upstream.

But, if it's not already dead, you will kill Debian/m68k if you break the 
ABI contract.

Nevermind removing that characteristic which provides it with a unique 
advantage, being a smaller memory and cache footprint.

And before you get upset, I'm not saying this is your fault. The demands 
of your distro apparently don't match the demands of the platform. Nothing 
new there for microcontrollers.

Try to see the big picture. All ports will suffer the same fate as this 
one: fewer users, commercial irrelevance, reluctant contributors and 
bloated packages.

The relevance of m68k is now the way in which we respond to those 
challenges. If the best that any port can hope for is ABI breakage, we've 
failed.

One does not age gracefully by pretending to be young. m68k does not 
contribute anything by becoming the same as every other 32-bit big-endian 
platform.
