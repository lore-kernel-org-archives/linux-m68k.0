Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3868928C5B1
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767911970; cv=none; b=ohqbMF4d1A2BFcY39CA5MSrio1y1VGqNqTZBgQmES8UXUOqwV7XWRRnK9HGi8ZGNnnm8E+1U+QPULS0ETbSJqwTKvuXMJbmTQ9bHcRq6gLqHMdTDA93CCkhwkvFTG/Pqnp86CZ33TYVPtoUR3ZARlBlGEUZGJRcKRai7IhQH8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767911970; c=relaxed/simple;
	bh=fS+hq085CGFWpOjXZn3fKOM0n/7L+WTh2YOB9zIZmpI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PIimk9HW526rzeDD3x9iipH6MR0oMnGDjjtDmh+V/HkfOgOIWRp7LTd6Gco80IiaC+BsS6hZeW0NDCQh1Qf/GkbLKqgzZJmNS3tMgWZR2Hn6EflF99K67vdRumxqk2Gb+vVddkiwLW80d+MW8jRJveXbyp842vw6l5kWBbt1+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s8s3uuzK; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s8s3uuzK"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 2720FEC017B;
	Thu,  8 Jan 2026 17:39:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 08 Jan 2026 17:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767911967; x=1767998367; bh=IbxmlG0jhRZ5/37rSmE66jt5cWfntnAIFsL
	rQI1rNUg=; b=s8s3uuzKopJjXY3vS1ZeIa1hDVwhBtQH1P4O6kUx04cusBIyARR
	rNATA9gYBlJ9u5lVtKldBZCD6iPnYAvnT4EHybvlQ+P88MatxcT+yBYZ0geTMaXw
	i3SCQ/yDO4wOq57qAfhvoZMJ/KriAWYSucrnuFeUveJVGu3Mdit5zvM2yzoD5hiE
	37ONF8RqVwn3nHDR7h2waRZrq0ZXizkG3Y9iTrQC39QcS5MYR5bNcK81SJ2uKnw9
	Aa6cN3XmwyWWwh628dYi98LH2Q1UTjLpFiEvbeOM/sbGr12Qom+k/hRDLK2QY9pN
	6GgMj8KxMJ+lT+IUSYDt0riEu/YntMmUHmg==
X-ME-Sender: <xms:HjJgaQtXErA1AetTDB6jjPeHg38MV7ry_FyeaXAOKVwmXh1X4km7Zw>
    <xme:HjJgaU7p-OtxkTVkGzHDN-FFkNQCuYarJqhFC5CyEwP5LPKMNK8iqfo8BhB6pmqvo
    bbKbE0Gl-79yENMym_jInizuscH-ykn-vdtcWlOApBqFbaMym6ycQ>
X-ME-Received: <xmr:HjJgaZJy_Qa4A8N7DX5uP6RVPJrZji5ynaBIX-nGx_fZ2wGE7tKXa60--UBGDN8DYOSo9at7JqOw2LdSpYbG-j2EFLOlG07Z4LE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdejudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehsthgvfhgrnhdrrhgvihhnrghuvghrsegtoh
    hrvggsohhothdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmh
    eikehkrdhorhhg
X-ME-Proxy: <xmx:HjJgac53O9Js3banp4ZZBe_8tv6_dWuRBOV7kwv0MP01uQ7OkqoNwA>
    <xmx:HjJgaUySPnGyWL7l4lHgjgnf_XU4Eb7BHHq85FAwZm7XCm4Y9ak0tg>
    <xmx:HjJgaYYTtj-N-8_UN9UPQgFyoyY9I-3qnAEb0sAI10aFkgEqf2cbFA>
    <xmx:HjJgaeS9a1fJTJBcmrrHirN6D_0nbE34ce490u8ZQg4h9ndqcxzTLw>
    <xmx:HzJgaZMSlOSnO1I9tv6OImm81_ZtXkJtx0FFg8hs_XcAL36k0LPg_XdW>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 17:39:25 -0500 (EST)
Date: Fri, 9 Jan 2026 09:39:27 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Stefan Reinauer <stefan.reinauer@coreboot.org>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64
 implementation
In-Reply-To: <CABq5eXHitcC-zWkYNVi0zCvqpo-y1BBNUDU=6HtZWES7VBY26g@mail.gmail.com>
Message-ID: <7b9db499-6dda-551f-a1a7-97740503cca3@linux-m68k.org>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org> <20260108060533.3891380-5-stefan.reinauer@coreboot.org> <3252e3e6-5eb4-3cba-9113-09e3febcc953@linux-m68k.org> <CABq5eXHitcC-zWkYNVi0zCvqpo-y1BBNUDU=6HtZWES7VBY26g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 8 Jan 2026, Stefan Reinauer wrote:

> I have to admit, my primary target is Amiga, not Mac. I'm using QEMU's 
> Mac Quadra 800 as a development platform because it's readily available 
> and easy to test with.
> 

As a rule, driver changes will receive a NAK unless they have been tested 
on the relevant hardware.

> The get_thread_area() vDSO is the clear win - eliminating a syscall on 
> every TLS access. 

For Amiga, sure. But then, I know very little about Amiga. For Mac, it 
would be much better to leave the existing implementation as-is, until you 
can show an actual benefit -- if there is any benefit I fully expect it 
will be way too small to measure, because the VIA is so slow.

Another reason to drop the Mac change is that the VDSO patch series is 
already complicated enough.

How much of it is AI generated?.
