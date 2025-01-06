Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD1DDBC
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 03:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134105; cv=none; b=S4oenP7amRFqlJJl6obwAktwOxzkHSqWRQEOquBYu5ZwBQnAI4tB0o44LTD/U+Roof0Dc2tj+31vQ0RnDqaW0l4ArrJpAkaG0ibygD9KcpC19DMdxXd5iAhPpk0uBUt1BHABpvBhWA64LXUELTDGXYsUxXtJGz6Rtys5tVPwtdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134105; c=relaxed/simple;
	bh=ww3IAILL0tk4+Nocrnh7OVhCmTOO5r6DnUB8HSEPpFg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fDjpP0lZN3QIxGApp7I5xuEC1qDpbMWeJwbnoYcZzm2c8Ojpjac6IVjSzQtFAEhnVpOmxyWFHZ/XRlnm5NjHp15L/odG4ONpLp80p06h276ow2xTyPCG/iCSYnScRO4BckOrtBWoXjvXbI5KBvTiLDJ4lh0EqUhL3F9cDFkrtUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WBJSqyzx; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WBJSqyzx"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 09CA7114019D;
	Sun,  5 Jan 2025 22:28:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 05 Jan 2025 22:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736134102; x=1736220502; bh=0ONZk3NLMpKrNQ38Eje8NP2TvgGBAVuCU2/
	LtiTifu0=; b=WBJSqyzxOC0gTxBkK79hO8dH/QkRIJSSQBxNSQRNvXB1iDfKlpG
	3jtGz2QS0oeQf0etGStR2Guw+gVbaDlF2hu7IRUyNgK47SpR1GyCAWoQrumMS/Ix
	Ye+ASRgdLU+f7SwaLqZCZbBxwVrFgpD1nED9mCbhoXPE00Z4UjHOzaUbbD/u15Oq
	4CIXg2QAWPseMokb1OIH52iKLM5sN9U6iMO7r3/QvpuJr6SpEdy5tOs+A3X3fB+w
	zwxw8/+41TC+cs0Jk+nmJAH0C7iIkD8yMt1YBaSdcB+XWDl6K+XwMWqp/bfcTnLy
	+Rj6UOSPMcuuZI76ftz117fup3LH6RBCfRQ==
X-ME-Sender: <xms:1E17Z7X0Tk-rbuLFZsV4RyMF4U_KMtcV34Y4gf0bxMDg4IOOJLeoPA>
    <xme:1E17ZznrSon2YG03T1suIdbDaf9BQOIpkY7TAsKuS-YTXEONzTUNKaaqlxGtCY461
    LoujIQvqv0pwn8R1dY>
X-ME-Received: <xmr:1E17Z3a1JwLTNznnhTY4MxAZ6BfBGFHb2Spzp9ZJNGzxxWrqjWbWzYTYIUz3TFMlLR1scJrm4h5uCp4-Xj0nJHg5FHzrYOv9aK0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnihgvlh
    estdigtdhfrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmie
    ekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:1E17Z2Wzm3n2tUy-X7GI4J5iMmrpeQELEBmZEfA1CkCiICE4aKRzdg>
    <xmx:1E17Z1nk190ksCGhSlhwsWndFYdT-PBE-sG0ee6eNlMtD0h5yqJe4A>
    <xmx:1E17ZzfMBp27IPOCzNBBKREFdC75RC1NvRr0Ahch_i4z-s7Gxb29Vw>
    <xmx:1E17Z_Hur15x2R7xpi3bPdiWwmqH7v7zYsMSt0cf9pkc_ouxB4A5kQ>
    <xmx:1U17Z7jhUQnzhDyGEhsp_X6vKwAv9E-BYjISV9dgB2c-0f1cdYj79DMz>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jan 2025 22:28:19 -0500 (EST)
Date: Mon, 6 Jan 2025 14:28:26 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Daniel Palmer <daniel@0x0f.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] m68k goes DT
In-Reply-To: <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com>
Message-ID: <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org>
References: <20250105071433.3943289-1-daniel@0x0f.com> <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org> <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 5 Jan 2025, Daniel Palmer wrote:

> 
> I have u-boot working on DragonBall (68000), my MVME147, QEMU Virt etc.
> So the u-boot could be made to work for almost anything as long as
> there is a serial port and a timer driver.
> On virt I take the bootinfo QEMU creates, turn that into a devicetree
> in u-boot and then pass the bootinfo and FDT into the kernel. :)
> 

I suppose the benefit of integrating FDT into bootinfo is that you can 
have a new bootloader that's backwards compatible with existing binaries.

I think the embedded FDT option brings a similar result for old 
bootloaders, but can't support a multi-platform vmlinux.

So I see some benefit to keeping bootinfo support and device tree support 
independent. A minimal kernel build is going to omit bootinfo support. In 
the long run, I'm not sure you'd want the FDT stored in a bootinfo record.

> 
> I think adding FDT support to some old crusty bootloader for the Amiga
> or something might be a lot of hassle.
> Like I'm not sure if I'd even be able to setup a system that could
> build it if it needs some old Amiga C compiler.
> That's why I think embedded FDTs might be needed in some places and
> leaving the bootinfo part as-is.
> 

Right. Bootloaders for old platforms are difficult code bases to 
contribute to. You need a lot of old hardware to test with, and a variety 
of operating system releases.

In the case of Penguin, you also need to know MacOS internals. In the case 
of EMILE, you need to deal with the early execution environment, which is 
not well documented AFAIK.

But these bootloaders have bugs, like any other program, and someone has 
to maintain them...

> 
> If you can write some code that loads the u-boot binary into memory
> and jumps to it, getting u-boot working on the mac shouldn't be too
> difficult.
> I might even have serial, ethernet, scsi drivers you can use. I'd
> rather port u-boot than fix up a bootloader unless the bootloader has
> some special hardware setup magic that can't be reproduced.
> 

Those hardware quirks are a given, I think, being that Penguin and EMILE 
need to support dozens of different Mac models. Porting u-boot is not a 
very attractive option.

> 
> The platform drivers should be easy to make work. I need to look at
> macfb.c but if it's anything like the DragonBall one it'll have 
> hardcoded addresses and stuff in there that need to be cleaned up but 
> it's not impossible.
> And if we do this the headers with the MMIO addresses can go away and
> a lot of junk can be removed from arch/m68k.
> 

At that point, bootinfo support can also be omitted. Maybe it's doable for 
a platform like MVME (?)

It seems that a multi-platform vmlinux binary would have to handle the 
case where some plaforms will use bootinfo and others will use the device 
tree.

I wonder whether there are implications for kexec support...

> 
> mmm so have a different head.S for a generic FDT machine and just pass 
> the FDT via a register like I'm doing on nommu. I don't mind either way 
> so if a maintainer decides which they'd be willing to merge I'll get 
> that going..
> 

Yes, I think we've touched on several questions for senior maintainers to 
ponder.
