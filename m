Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E67F15A4
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Apr 2024 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714274911; cv=none; b=HfmjpX9isA7k7PXu1twvSDVmvjNXNkGvQrUcT/d6bxi9tcu3l+AkikG4kf+7+RPP04nMI4DHp4aY7zjyZ4/3fZnYuiuT4uM4jOQB8WHZpyGIenpJUUp+U7SviinMi+tz/1VRpD29yhwvYBrWDymtxvAbGqy4Z7s1pBLUYX/vno8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714274911; c=relaxed/simple;
	bh=A1njEgkfd6RJIYizsbp9/K6kCLxmsXxFiwy2zw9RZDw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cypccgpdeRBrJ0b0a4EZkO26uPCqAAySUNYvcm6TzKU/KT0z6wd9h/bLRJ7qOSlJw5mXxLWrWRtsNmN5DYHP3Xf104Jsy50rvEwctvqNJXRqeujyOzbsECt7Zo/oevyAiOzQXyu4wFGWnYxi/1JtlkCU3HEtJ/L07oWiK/Tt+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UKQkYXmw; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UKQkYXmw"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id C482E1800139;
	Sat, 27 Apr 2024 23:28:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 27 Apr 2024 23:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714274907; x=1714361307; bh=H9RMGoWDbH/ZA5ZvTu1kJWSVkyE3
	p+oKCddrGExpWHQ=; b=UKQkYXmwX+6iFNslumOzVc7wd8eczXh2rZUSgouZ0N4e
	P6l+YceEPtoiWOwtkfGcQvNbjbQQcSYBDUZcRJ6AlOiicbXzOXlI32sdopaPuzV+
	rheHSWuAb5tEB+6F/YOGB8ZMq/jr66dYvIL6pibg+HXoAR7RT7SAvWswtZXc4D9O
	1fFlb99dxiyqVw8vGa6A8e4Q06ibjZn39DyuK9U0xL4Ooy0CxeIcOVWYJJwlOYtv
	Nh9kC8Sd1369o06AdU7YqMr2m53SDceWUIWr5CT2yuXyHwQizBr+Mm9B0tTtC/33
	SsuSe3dEjHRQBi6hgNJddUSLtyfEpQP2MyQMQJF19A==
X-ME-Sender: <xms:WsItZhAS1AknO5KpqKbYV1LyqhkDsy56EorBhD1hpLpHUoPnDin92g>
    <xme:WsItZvgsPIYC4_h_Ja0mvKBYuWw6DCPWHcFHI-x7H2cPYW91HwfZZXAWCy8vQurIY
    RK4LoHQlmW_Tl9acjM>
X-ME-Received: <xmr:WsItZslNBrQTWlSmp_WICf06Hk5R_oJHV7GOyXXTGFImhjRXIIK7FXV97mL1atTLI3ETNu_yVbB2KBFVSQAQNk0AQ73zWNTK8bI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtvddgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:WsItZrwgwZhH8noUM9c3VI2jthazxWlkLwxXEw683q2VrHSYGveueg>
    <xmx:WsItZmScN__rCJ-vltjFOC5gG5zMai9pnK1fFxNDR1kY4PAZxyA9Fg>
    <xmx:WsItZuYKRgblOkyN0XigAqasnK-N3yPywEF8io2nL6r-hIJLJGWjMA>
    <xmx:WsItZnTZQozeN9HfGEkQp8QCju9D29DpoZqfYBD7-GIjSb9jPaHfBw>
    <xmx:W8ItZsOiYmgjHVr9KRsESvwGWbV5zHQr3ftZcWvUH0W3JAo5ZoctGut1>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 23:28:25 -0400 (EDT)
Date: Sun, 28 Apr 2024 13:28:33 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v3 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <f88ad8f7-4fd9-45b2-a52c-cee3217083bf@gmail.com>
Message-ID: <95677826-e3cb-9c1d-7d03-253a88aff3eb@linux-m68k.org>
References: <20240427084815.1449-1-schmitzmic@gmail.com> <20240427084815.1449-2-schmitzmic@gmail.com> <fdbe029b-1df0-3e8d-fced-64cc719397fa@linux-m68k.org> <f88ad8f7-4fd9-45b2-a52c-cee3217083bf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Apr 2024, Michael Schmitz wrote:

> In my tests, the fault seen there had been caused by the movesl in the 
> section above, hence the fixup at 20b.
> 

Well, that was my point. A fault at MOVE.W should get fixed up at 20b, not 
50b. So the patch is wrong, isn't it?

> >
> > Should we put a NOP here to avoid having the unknown next instruction 
> > (label 9) in the exception table? We can't actually fix up a fault 
> > there unless by chance it was the MOVES that caused it.
> 
> ... As to the unknown instructions following the final exception label: 
> These functions, though they contain inline assembly code are not 
> further inlined, and the instructions following the inline assembly are 
> simple boilerplate register restore stack saves that ought not to fault 
> (an invalid stack pointer would have faulted on function entry, if at 
> all).
> 

But that's just luck. IMHO, the asm is a foot-gun even if it has not gone 
off yet.

> On balance, I am confident the code is correct as-is. You (and in 
> particular, Geert) may argue though that the NOP approach follows the 
> principle of least surprises, and can be considered safe to apply 
> without further testing on 68060 and Coldfire.
> 

If you're saying that your patch addresses a different bug, fair enough.

All I'm saying is that, since you're adding the NOP anyway, you could make 
better use of it.

Anyway, like you, I am keen to hear from others regarding the API issue.
