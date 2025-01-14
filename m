Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384913594D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jan 2025 00:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736815305; cv=none; b=CI9zVOlaYdnth9XxPwCbBfcyb/yNZU3Y7V3OVo42bnxjdrmRbjoLATsqLFxG6NBXBjzMYIwCrB2vLL31AwrQqXeZjMAbSYb/u9zm2CDvzYwaLmCoWf/UwOPXD//3TMomPTaxxwzRtZrtH09sZKp7SxMUOZ8Cyv38KJY17I+f+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736815305; c=relaxed/simple;
	bh=mh6UdizLULcZTP86znfURZkjsDvHUOZ+yO+j7JAC/Eo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bXgiwdSaF0m4L2uZn/SnqBGGq3p2WvK0lvxYqAI3IN3NhW983C1r2FBV8LIr3IQ1NjWZrLpV1cWUZWsi9lm2Dn19YGuXx1NbReEPhE0FDoiMiaScDO1Q2S0AU5iaY4XTmoO9gUx6u+66b3FwQiI+dT1mgMSKZJIUVuxQdXZ5eDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gTdiAsLr; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gTdiAsLr"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0C8A12540196;
	Mon, 13 Jan 2025 19:41:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 13 Jan 2025 19:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736815301; x=1736901701; bh=585LXSppkdzMqz7O7C9YiXg60hoCg67yb88
	6jWwsdpU=; b=gTdiAsLr1IpjFSySueBzNZLk4a+iehQZttwOiPbgDvCMAix+RbN
	hBwU26gRG6myz9J/IeGNfkO8nzfjEYDYqsS9c9u8PCNVXn4Pn0/BQjcTnFbcz+tX
	PiEVnG8UyHLbmILJeoEJ6rLKLrEOl6J0aylTpwes4SjMm6XqDLTePqFB3K4ByOtd
	pDyDYQ5SO90SGCESSo9Pfsr8zZFvlw3BZH31aC9Kh1S6rGDBG6SB6ADdcTVkE03R
	mlvaHXYLxFOWRIqhx+PFefWs9+JibUV6HdUZZ8DY9UwBiM1kPdM0mRe02x/cuzdQ
	bE+zVlvA3eCt638Ci6RvcdrEe7Qm7lYNQ/g==
X-ME-Sender: <xms:xLKFZ3oPKwDO2UbDaagVvt4tu9nzvSV8rZF3YdyxmcVChZBVKkxWlA>
    <xme:xLKFZxpPqxpeFYKPvWRbEKUQg7iszzstfYHIJBOJAOL6Y_MNgUGD3k4VtBlOepVoU
    FpAMehTcQVffW4tpJ0>
X-ME-Received: <xmr:xLKFZ0NiWrOb_kgEAAxFPHhDGVL2owT1km76kdvnjVijTqqvK9D2oD5P9foJ7AknBm0awcvXtjY57jCmyFGCjNs2O11XwVsxris>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehhedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtse
    hlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehflhgrrhesrghllhgrnhgurhhi
    rgdrtghomhdprhgtphhtthhopehgvghrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmieekkhes
    lhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xLKFZ650a4Y-Vy5jjqiPOsQUOmCEryxQRN3AEGg_jCftuLXzxv4xag>
    <xmx:xLKFZ27GQHcgT7TuJHIUzN9bBMTsg2b-LtDcsQIG7E4zmwwQoS6efw>
    <xmx:xLKFZyjtKcvXHzhrNJGC2s-cmxykx6rxvdSv9FsjVEmPmyRVqYz4Qw>
    <xmx:xLKFZ457ae_ZEQTwVfWOUp0JHgZn7EoO8MWZFQCqzVhZs633o0epaQ>
    <xmx:xbKFZ4QmBpm4S9mmJnq0dBHThxDeEBJre0ZlL4NVd2D983G8LHvSdQeZ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 19:41:37 -0500 (EST)
Date: Tue, 14 Jan 2025 11:42:00 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Brad Boyer <flar@allandria.com>, Greg Ungerer <gerg@kernel.org>, 
    Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] m68k goes DT
In-Reply-To: <CAMuHMdVSGQNpsy7wtPVDksq01jW3QVRBR=zwmvOYddb1wdfAYw@mail.gmail.com>
Message-ID: <9cdb0b92-2bd5-6e0e-9a37-571538d79735@linux-m68k.org>
References: <20250105071433.3943289-1-daniel@0x0f.com> <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org> <20250106113749.GA32654@allandria.com> <980f40b3-fd1c-74c7-c651-b85040bbd3fc@linux-m68k.org>
 <CAMuHMdVSGQNpsy7wtPVDksq01jW3QVRBR=zwmvOYddb1wdfAYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 9 Jan 2025, Geert Uytterhoeven wrote:

> On Mon, Jan 6, 2025,Finn Thain wrote:
> > On Mon, 6 Jan 2025, Brad Boyer wrote:
> > > There are a few drivers where we could eliminate complexity and 
> > > #ifdef trickery if it was all device tree based.
> >
> > Ideally, yes. But how would we get there from here?
> >
> > Should the kernel synthesize a device tree from the bootinfo data, so 
> > that an ideal no-ifdef pmac_zilog could work? (This seems like a 
> > maximum bloat solution.)
> 
> We can add a wrapper that starts from a basic Amiga/Atari/Mac/... FDT
> and extends/modifies that, based on the bootinfo.
> Modification can be done using libfdt, even from assembler.
> See e.g. arch/arm/boot/compressed/*fdt*.
> 
> > Or should the mac platform abandon bootinfo, and require a new 
> > bootloader for all kernel releases after device tree adoption? (This 
> > seems maximally difficult, since it requires simultaneously merging 
> > many patches to many subsystems, even if the bootloader changes could 
> > be done in advance...)
> 
> Drivers can easily support both DT and non-DT, assuming they use proper 
> platform devices.  That means no more MACH_IS_* and *HW_PRESENT() checks 
> in the drivers themselves, but proper platform data setup in 
> arch/m68k/<mach>/*.
> 

In the case of pmac_zilog, we still have to avoid pmac_call_feature() and 
the macio_dev stuff, so many ifdefs would remain.

If DT compatibility was needed in pmac_zilog in order to port Linux/m68k 
to new hardware (e.g. Mac Classic II) then I'd be in favour of such a 
driver patch. I don't have time to write it though.

> > I wonder whether any other architectures have attempted to retrofit 
> > device tree support (?)
> 
> ARM is the classical example.
> Until recently, there was code under drivers/staging/board/ to support
> mixed DT/non-DT systems, but I don't suggest going that way.
> Conversion of SH to DT is still WIP (except for J-Core, which is
> DT-only).
> 
> The largest initial step is usually irqchip, clocksource, and clock
> drivers and DT bindings.  Existing drivers "just" need DT bindings
> and DT support.
> 
> For e.g. Amiga, the clock driver would be rather simple.
> Clocksource is much more complicated, as the timers are provided by
> the CIAs, which are really multi-function-devices (MFD), providing
> timer, gpio,spi, and irqchip functionalities.
> 

That's a lot of work. The old drivers would end up being more portable 
when converted to DT, but is there a need for those drivers on new 
platforms?

MVME147 is different in that Daniel is proposing new drivers to support 
boards that are presently unsupported. (Not unlike the hypothetical Mac 
Classic II example I gave.)

Supporting new hardware is good, but any benefit from retro-fitting DT 
onto existing drivers is dubious, if those drivers will only end up being 
used on systems on which they are already being used...
