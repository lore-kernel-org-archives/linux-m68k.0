Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E23259494
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jan 2025 00:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736211442; cv=none; b=N7Ysl5IWh+eX37EmIlpoCGpvhDTeMl+71AllO6URNJWqJ/vjHwKS/KRHpwSqqHRwkZWTbHGqeroEHlOoWBmK9yM9p13RSVVXN89XJl7K5bQznw0TWVnfWfOjV9cyF8lSLcjqs94fIINes7cqeKwC/oWkW3nntA4Y5tXuEktlt1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736211442; c=relaxed/simple;
	bh=sfTVI+Ui512rVDGMHeS20w7Uq/n//QrDbZDeJg5kUXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b9rpG1CLvGVIfnioBG3Z4ixIklxOD9pIf8lDev6d/Urlvdf/1PkXF0PWCJ6zeEak/X+wytAIlGOk/BayvVS4vUh/ubGY4iQhsh/JpmT2yCg42Dhk8mx7e0Pe2zyVR+lSY7uT8K2OclpdGoEju+wLuv9k+fpOG5KNmgiZTOWQwQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l3jd+4tm; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l3jd+4tm"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9204D25400B3;
	Mon,  6 Jan 2025 19:57:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 06 Jan 2025 19:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736211439; x=1736297839; bh=h+Joyxirl3nzTM8Pq1X9Tm7GxZ20kmn32zK
	5qDRsY9Q=; b=l3jd+4tmwN1NyXYQf0SLhdSSXlETi6Km/Xyw1kgRhGT5cHefp9M
	0hWHYghi1RacKdlthnQql+WnKySS8iXAtySBM5zhKl0GIpqRJAOWrcR0GuYgNdbg
	Z9AqF74TBNVKV1/HpWCEXosXOaFBxVYg9KquTZYm3icV+mPOb1OdAJdL+OFPbYEh
	GUhScHWc49WDCmQS+Zsz37uxWbLBolS6rDixr6DhoOC/OsnCIDVfttFqQaD9yBNQ
	6L1clk0y90b9S+lK0RA9GxHNlXkkAYYsx0aPOmpJI5VSlv/iEavV6I+gPI8KCZF6
	bqQgXWbfLKBejN0/CUSvRWBunNFz4mshWeA==
X-ME-Sender: <xms:7Xt8Z0rkIDTIUVkvja0YbfzSqZ_ndBz2N3lh1P-51HzjlHZCHaL7Pw>
    <xme:7Xt8Z6rLSadbrhNjETXVR7XWrDCbSq_FqMnnAmYFaWR8gicUTuNmHB7AQ6VAD09eI
    cJd-LDium8Lbig7kXo>
X-ME-Received: <xmr:7Xt8Z5PLfqvgbFVgPBIXJ6A8fomRhFeqo5XQqJpXyBZkAEAB4JRF2Y6LBtK7sJ_VfsTiz1oRmmf1M_kKr5iTfuQggZts0dVwcsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeguddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjjhhurhgrnh
    esghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhr
    tghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7Xt8Z74rSlof0xIvR5TlmXUR305AwW5ln37ITmzPGy3McumRpVqUrw>
    <xmx:7Xt8Zz4YTWi6K7aWZkPqcajNkhEqqrLceK0flGnwqyv1iuXJOkKgBg>
    <xmx:7Xt8Z7iiqUq-cEoWLPD3dTSjFrVzOX88QekToUSJYvIDxCT8d87BDA>
    <xmx:7Xt8Z94pqTaB_uSn0XQpSSlW-a0BU2sGVDSBCFpUHLX0po-JVJZTZw>
    <xmx:73t8Z23W1mA0QsroND5-xXLtfeJ3gKkO0x4o7raEKcHcK9ahY2rxbfjS>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 19:57:15 -0500 (EST)
Date: Tue, 7 Jan 2025 11:57:25 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Josh Juran <jjuran@gmail.com>
cc: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Bootloaders, was Re: [RFC PATCH 0/3] m68k goes DT
In-Reply-To: <B5B5D58B-D111-431F-9701-44FCBB67D11E@gmail.com>
Message-ID: <b33b072e-f44a-9450-cbe9-52300ab971a3@linux-m68k.org>
References: <20250105071433.3943289-1-daniel@0x0f.com> <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org> <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com> <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org>
 <B5B5D58B-D111-431F-9701-44FCBB67D11E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 6 Jan 2025, Josh Juran wrote:

> 
> I'm not in a position to do testing on hardware or development relating 
> to Linux bootup, but as before, I can maintain and build Mac OS 
> programs.
> 

I've entered the Penguin-19 bugs that I know of into the mac68k bug 
tracker on sourceforge. I didn't add feature requests, like support for 
the Mac LC II 12 MB RAM configuration, or support for zstd-format 
compressed vmlinux. (Nevermind netbsd support, or device tree support...)

Some of those bugs and missing features apply to EMILE as well. IMHO, what 
EMILE really needs is a MacOS GUI like Penguin. So my advice to 
prospective mac bootloader developers is, add a GUI to EMILE rather than 
try to maintain both packages.

That's easier said than done -- Penguin is a hard act to follow. But, in 
theory, thanks to Retro68, it could be done without resorting to 
proprietary tooling. Both the Linux executables and the MacOS application 
could be built with a modern GCC.

Consider that, without a modern GCC, it will be difficult to re-use the 
available code e.g. for kernel image decompression. Hence, it will be more 
difficult to fix the long standing Penguin bug relating to gzip 
decompression (which does not affect EMILE).
