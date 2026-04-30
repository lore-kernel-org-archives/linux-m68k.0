Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3643C1979
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549053; cv=none; b=THQmw51Jh0ITJ29cwORpeUzdKgDazO0FG1e4nnhdTICyAUW/XMocFo1FTgBFL/MdCEr1y/1HwLCkzR7OFPsRMdd9Oa/IGB/8sfNWF1rP7dHJyhwMNS/0rTMwrMlMFKx1FgtCtuUw2+0ZJ6yQLRYgCGEjjTqgQNKE3kLbMlL57+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549053; c=relaxed/simple;
	bh=vpQ9hNJ2UJkF6LBl0YcWOW/bbwRZxuD9KSs+MuXrNLw=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t+sZ1KXzVRN6ZGuHeVGuSgGnL0shAw/CdApQFLl8mqvcKZJTnxsy+jvR3Z+29WpLdvFcoPPLHIkeBkiBijoByAo699IaRZlRg5jB+jES3oLusQqNGyzPu8M1kfaDSCNEDH7fwzo3IBd8ZuRRuszfiVroiEFaz3r0oW/e7wP22/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvfHMPww; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvfHMPww"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7AEB43518
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 11:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23F8C2BCB4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777549049;
	bh=vpQ9hNJ2UJkF6LBl0YcWOW/bbwRZxuD9KSs+MuXrNLw=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=qvfHMPwwHf95Q0P/gQvx6tb3M6dQpEDgopq5ePMtl0/zZz0QjCzFs4Pvusr5ahQxe
	 jHLpLpkbkbYbDiui8MN60QqZAqqKipgyJGDLINwmlAVKjn7LZjkbo/8UURC+bKtwIx
	 GpRvL+vSx4Zjgu18loWa8h6nqp/L0DCV1eWSBZjdYb6jf+t+6nwqRyAn/XsPNJP3jn
	 MBntbbRX8lUumv1XRAhgGa/Nn2CtKasK4YbTxd/yMycW2P+gBXbRbPgPoREr9gN236
	 K8TevTePAQ91pJjbm5VoogDWLbBnKlfwkwc5WBsqXaqHzvEfP3V7QrdEufY8I+FlnD
	 44A48WzeKmegQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id A700DF40080;
	Thu, 30 Apr 2026 07:37:28 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 07:37:28 -0400
X-ME-Sender: <xms:-D7zaYE4mr8NX2p-xCs6sBsCcfEh7VUZY196vVpbmXPOlr6RZHnf6Q>
    <xme:-D7zacLI6PPukUaVghFp1hjTKSVCSBfHlHKgEYqUDsC8UnrdiWX8viXRGk0yQTwcm
    RfiUSK7ptiE2AxiCbWQmANL6S6dIMsOK3KHKdCeicz2CP2T7ka4DtM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekjedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthejredtre
    dttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhn
    vghlrdhorhhgqeenucggtffrrghtthgvrhhnpeeiueevffehieetgeefkeetkeekvedute
    ejffetudffgeefieeufeejjeejieevudenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrg
    hlihhthidquddvkeehudejtddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgv
    lhdrohhrghesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:-D7zaezBV9BpGna8TZhsEc_UnkS1uT7gtdP3jJzGVudZ8iH5B-MiOQ>
    <xmx:-D7zaYPiASNZQoJQvSJGct2E5HnSI5-etQfL7SPXb3ZQHKu37LnsiQ>
    <xmx:-D7zaX6h2e1ZZsSPYAzsEVMtnKb9xdGyRkab7wn-ElkayBCXvIvixA>
    <xmx:-D7zaRPigI4iXcDaemEr9ahscbcjUDPFXsfT2Z--OR127Sz2_CF0Kg>
    <xmx:-D7zadkGFjci9yO_Of4Ws3s38wHi15bzNxfYxDvujYi-xfUgtUHJebxF>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8783B700065; Thu, 30 Apr 2026 07:37:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ayu6HKOn_iMR
Date: Thu, 30 Apr 2026 13:37:08 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Greg Ungerer" <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Message-Id: <209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com>
In-Reply-To: <476d1913-b9dd-4462-956a-a2f2fe8c9a24@linux-m68k.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
 <18b7cda0-98b5-46fc-8a6b-926138853b6a@app.fastmail.com>
 <476d1913-b9dd-4462-956a-a2f2fe8c9a24@linux-m68k.org>
Subject: Re: m68k: coldfire: create internal register access defines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 30, 2026, at 13:22, Greg Ungerer wrote:
> On 30/4/26 17:39, Arnd Bergmann wrote:
>
>> There are still open questions about how to continue from here
>> to change the existing readl() and ioread32be() style helpers
>> to have normal endianess and type characteristics without
>> breaking things, but this is a good step in that direction.
>
> I have been playing with one idea. I have been working through the affected
> drivers and changing them to use raw primitives only for their IO access
> on ColdFire (so only the __raw_readx/__raw_writex macros). My thinking is
> that these can then be pushed via driver subsystem maintainers if and when
> they are ready. When all are affected drivers are fixed then we can correct
> the definitions in arch/m68k/include/asm/io_no.h. At a later time if we choose
> we can then make changes to effected drivers again to use the now corrected
> readx/writex family.
>
> At least this way we can keep everything working and avoid a single patch that
> makes changes to io_no.h and drivers across multiple subsystems in one go.
> What do you think?

I think that should work for most of them, but perhaps not for the
spi-fsl-dspi with its extra abstraction through regmap-mmio.

I would probably still do an atomic change for that one, adding
the explict regmap endianess flag at the same time as redefining
the readl() function. As long as it's only one or two drivers that
need this, the change should still be simple enough to merge with
the respective subsystem maintainer Ack.

> So far I have modified the fec and smc91x ethernet drivers in this way.
> That was strait forward, though I may get a little resistance in the fec
> driver since I abstracted the IO access from readl/writel to local internal
> functions to keep it clean and avoid redefining readl/wrtel. But the change
> is simple in concept. I am working through the handful of other drivers
> that we identified.

Ok.

     Arnd
