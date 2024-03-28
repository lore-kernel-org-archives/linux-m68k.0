Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40A25761
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Mar 2024 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711594023; cv=none; b=D2xdMvRyYEJrDMAH4aXcjGNsevi1dDf2KFNbyfEmFjpKUB4R+7mJhG9uhx2BaZg9vUQCrQ+ohCSCyMoleRhmg/mDegD3e3TltSg+RHTGsMYMJeCuurc0fUp+7bw0hjYhH6u1rUhXEn5FWsE9Gv0tgssT87UxdolXY5qFjMyePXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711594023; c=relaxed/simple;
	bh=GTnAw9ZOQbhSnF0KhzCQaKaiqw8OoB4zBump9wnU8+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bp7tIE5vwUcMbFtW372eV9iTHaWvyDsa4hQM/GrvKfEgxWeWNgRSSzg5BQUoojb7/jyfmlhRaeQttZii++AjbTbj7wo9E72rh2iex+G3XoQnHFdSUL6vKNGzZdtgbtt8UQvI0AXM/GUqEtQ5dCIkaU0JwUDECohjQgEESYcm12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gnJehMZt; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gnJehMZt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 761D513800AF;
	Wed, 27 Mar 2024 22:46:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 27 Mar 2024 22:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711594019; x=1711680419; bh=8eE1IbIClFs+Gy5+5nrQno98AXYA
	CPzBKBry3qdhNHA=; b=gnJehMZtnXm9IRkhM3xMMYrCdDtJl5NwqB6MLRNTw46P
	9ROht96vKk23SzTn7T0WW5k0iYGjAozEIXjVdCS6ybHroM/m3fnjvELds639WUez
	pexwPt6Sl179xlKl2jPfWbXkRlDrah+KBBBkeBDvQXnOnF9TAg0nSm9USUUvj0uD
	oFp043IIepRF+NV5Ndax4Q+X0r1Sve/3rv4BO5isd2M7pLzz9hfnyqdCGwEiEbXp
	7UKQxeLIvWJXXpmeddr5KiPnUAE5vV9CpnpAdpIh6slC0mr81Hl7aYjzMvPKHXMl
	8xbrzHDcpjUeAiqBt483c/PydxalamJRWDE+acbVMw==
X-ME-Sender: <xms:ItoEZko9uxEo_6WWNCCUbrtJPfcCcg0kKa-SNcMfeTvg_3z5i0i9Rg>
    <xme:ItoEZqqw97m8Kdj75FnU0lB0SEkWiNM9trIUpQXo5q7J0_dTy2ou3eo88vVz1ydc_
    gVjFrU1ntEfH5L-2r4>
X-ME-Received: <xmr:ItoEZpNMR_cdgQpxhhXJOvcppw43I-WmTN4ntbCqNON9FqS-SCXAiHXORE-FCX3eFevCbvHkoCL1L5TDM57TNEqtpRNj1xpGlvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddukedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:ItoEZr4Yj65U1uPe9I06ULt4B0hq5-Tv5cYAT6_1Kvl8bkM9I9jonA>
    <xmx:ItoEZj4BlLLuCwwLXVB7ZR0gsip-A5Cl8gebY7kH36HXxvJTKjW2iA>
    <xmx:ItoEZrjXMGyhPQ5a8JFyGfPSKMxGI7rEuiRMVWvTHW2oh6WfryTfPg>
    <xmx:ItoEZt662NLHfDyNVonQnK12bSmKH0iK4ufwd_piwqOo9ux4DDRy5w>
    <xmx:I9oEZll8h6Njuram2HD8zKCx3f5WhR5hwEhRlU5kCNLwUMN-C_bImQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Mar 2024 22:46:55 -0400 (EDT)
Date: Thu, 28 Mar 2024 13:48:23 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: Spinlock debug, was Re: [PATCH RFC] m68k: skip kernel premption
 if interrupts were disabled
In-Reply-To: <7aee9fd9-1c0e-4874-bb86-e512a7c0caa6@gmail.com>
Message-ID: <d19e3768-7edb-93ac-3993-af12259b7705@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com> <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org> <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com> <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org> <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com>
 <e926619a-3b6b-8045-8fe1-59bff5e420db@linux-m68k.org> <7aee9fd9-1c0e-4874-bb86-e512a7c0caa6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 28 Mar 2024, Michael Schmitz wrote:

> On 28/03/24 12:29, Finn Thain wrote:
> > On Wed, 27 Mar 2024, Michael Schmitz wrote:
> >
> >> Now none of this has got us any closer to a solution for the spinlock 
> >> recursion bug...
> >>
> > It appears that the spinlock recursion check really works: I am able 
> > to reproduce the following failure every time I paste too much text 
> > into the qemu console.
> >
> > This looks like a straight-forward driver bug, whereby the "irq flood" 
> > printk() results in pmz_console_write() attempting to lock the 
> > spinlock already locked by pmz_interrupt(). The spinlock at 0x62e140 
> > is the one in struct uart_port.
> 
> That's a legitimate recursion warning then. pmz_console_write() should 
> not retake the lock already held when called from interrupt context.
> 
> I agree the recursion checks did work correctly in this case.
> 
> Spinlock recursion in scheduler_tick() doesn't look possible from 
> reentering scheduler_tick() through code in its call path, so the 
> mechanism there would be different.
> 
> We did rule out the VIA timer interrupt (or MFP timer A interrupt) 
> getting reentered, right?
> 

I never added an assertion to prove that because I don't have a way to 
reproduce the "spinlock recursion" BUG reported by Guenter.
