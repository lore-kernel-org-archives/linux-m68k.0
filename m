Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596DBA3F
	for <linux-m68k@vger.kernel.org>; Sun,  8 Jun 2025 01:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749345004; cv=none; b=JJUAWlsRLbcJaik9F09zAs9YcrbCZmizKgNAPwbBKZgydyis0egy7lq4ez2e5JNHJAkoJkW5l7Ao2UBnBSTZq0OVEk5r+t2NyBM/XJFoSKVAkNTmIGM8PMbvCNwF5NGGH7vRB6ku6gNtcHRqm5/wKnA3X3i1EeUNaRNBmfqmsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749345004; c=relaxed/simple;
	bh=fo7iXYL0y1yCtxXFGBxuYSdez0mMnCLTfjNbyYT3ErQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hWN4cgVZhqyiq2XdjhzbGTU4aLJ/zMXB2lVxyKdcPvH82+StFFcEECv+HZMZzOEDWB1XKvkmyHb+gzL8U+cKTJNoixLmmw7Lor0E4n4j61pipew4/y8Lv2AxsE0B6pDgr3SZ3uh3Rb97RXRiohpEijNNFs5tZ7SY2ROLMb2Qwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IkD44bpM; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IkD44bpM"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C3E9111400D1;
	Sat,  7 Jun 2025 21:09:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 07 Jun 2025 21:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749344999; x=1749431399; bh=8qB74uePzWEsKAaP1Gw283juFkUYchbx+Jy
	no5AnM3s=; b=IkD44bpMiY6sLKUoI3zwQMhHgd2C1B7Oi2W60N5A+EG4aoqJn44
	ArriWd5HtGsb+Kf+jQ5iMcD6AgI5kkowSUgwUKJAh83fc//S65T3/szzq+xs073q
	k/t1mim9vWMll1mkFj3++VdtcsF00qZf7fuWyW9eeIq9Cl0MEpiqANiIxAA0bcq4
	ed+r6lqYq8CROv+Zp9R75ZMcofPtoXY8/dU9iWt7NjX6WzGOYUrxEjyaz+qvXfdA
	NHrWu0o2eoQ4fQgZS+VHvP9aMgE08GiPMdiYOgN8u7wkiUC2tAEQ4aPdbWxVhWww
	LnvowawgHHsJjoRimXWwTz0IEaMyE7ABmlQ==
X-ME-Sender: <xms:5uJEaAZqhOY58QD_iev13uH4gpgEEfos_dl4b6nNRs_EwIXC4HVRjQ>
    <xme:5uJEaLakIFdSZ19y0BODGiwsx-RCuEKoIeLYFMeC7f5ynjLgXa9If_BK1jfVjmUSR
    G_cLbXZPebHf-chK1c>
X-ME-Received: <xmr:5uJEaK_9CRAR9JTD3wBQ49qQCS2v7c-SJwBGJfwbx0N7V6nmi70jFfwb1Om-59yYhLNvXRxqcB9rPXenrLXkwYt0DI7SYx9MpXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdejvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpefggfetleffuddtteetjedtkeejuddthfdvleeg
    keetheelfffhhfdtueehkeevudenucffohhmrghinhepfihikhhiphgvughirgdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhh
    rghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdq
    sggvrhhlihhnrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdroh
    hrghdprhgtphhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghl
    ihdrohhrghdprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprh
    gtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5uJEaKqpY7JbutGIsBVAE_pWODCHhWK5r6AJNlIZgJ9Tq9pTz3TweA>
    <xmx:5uJEaLq92Y-vNdiOtL-45HOML93QdyeW4JMciZLbM1JAROpO8s_aYg>
    <xmx:5uJEaISAiZT0FoUxkybh2FUOT-qfid1sKe_NehbxPzq-brRcE1dNNQ>
    <xmx:5uJEaLrhTyz5bFTMIkGuT2PePe6CI3RVykmyfaFgsZyi2E1-7N3GAg>
    <xmx:5-JEaDxHPRMGRbOHd68vbPTPd8cVlLS6y093PQ0y-zRfOp6-JGnuoWp_>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 21:09:56 -0400 (EDT)
Date: Sun, 8 Jun 2025 11:10:38 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
Message-ID: <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>   <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>   <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>   <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
  <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>   <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Sat, 7 Jun 2025, John Paul Adrian Glaubitz wrote:

> On Fri, 2025-06-06 at 20:20 +1000, Finn Thain wrote:
> > Whereas, the ability to use old binaries is proof that we care about 
> > rule #1 don't break userspace.
> 
> Who is "we"?

AFAICT, it's essentially everyone who contributes patches at the userspace 
interfaces.

> The official(!) ABI says that pointers are supposed to be aligned with 4 
> bytes, not 2 bytes. It's the current implementation that violates the 
> ABI, not what I want to achieve which is make Linux/m68k adhere to the 
> official specification.
> 

You've mistaken the flock for the shepherd. And the map for the terrain(!)

But once you've been around the block a few times, you'll come to 
understand that standards lag best practice. They don't lead.

And then maybe you'll stop moving in circles.

Also, you've misunderstood he relationship between Linux and Unix. There 
is a long and colorful history there. You should look into it. 
https://en.wikipedia.org/wiki/SVR4#SVR6_(cancelled)

> Furthermore, we're still talking about a hobbyist platform here which 
> hasn't been in production use for more than ten years. It doesn't really 
> matter whether we break the ABI or not.
> 

By the same argument, since Debian is comprised of volunteers and 
hobbyists, it can be ignored by corporate-sponsored organizations, such as 
the Rust Foundation, and by upstream maintainers employed by for-profit 
companies. Yet they don't ignore us. Why do you think that is?

> And it's not like there isn't strong case for making this change. As I 
> have tirelessly explained, the current port with 2 bytes alignment is 
> simply no longer feasible since an increasing number of packages either 
> require 4 bytes alignment or require Rust.
> 
> These include more and more fundamental packages such as coreutils, the 
> kernel or various Python packages such as python-cryptography. It's 
> simply not an option to continue on the current path as it has become a 
> dead-end.
> 

Every CPU architecture is a dead end. This observation is as old as 
Moore's Law.

> I don't see the point in maintaining something that becomes increasingly 
> useless because more and more packages are no longer buildable.

That's because you still haven't identified those packages in the Debian 
archive which actually need porting.
