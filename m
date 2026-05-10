Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA881732
	for <linux-m68k@lists.linux-m68k.org>; Sun, 10 May 2026 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778384870; cv=none; b=VxK+82lNmjXfD2DlOIyY936LMpAJCfkYJGBCrMiK5BMO4dFHS5GylILisOZXTU9E6mSqfbVslctuhs4yns5usxk6LfwUafaIS56neNvhX7KMlc0DKBofcwWjgKu1+loHmuM3+VPI56GCZE89yAjKab3rVnL+GjZL7107wB0N8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778384870; c=relaxed/simple;
	bh=S7obI9D+iTeil7FNPuT7cagodI3X6OM7WMYHWR/+u9Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W+AHsXLZn8h3T20s80fpBwcvlg9zAbL/QGKRRsXn+Zhgw6SfZJBD6oeBzQfDgIc8n2zAJOawPwOgDYc4yOi5RIEG11mo4WBIx2PsFRam5RRQoVsAQn2CnLtoSbumxncS7FsKwauIvC5gGlxHQ+t91qfGExtsgmqHBwcDSlkcv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VHGpf5qO; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VHGpf5qO"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id DA385EC00A0;
	Sat,  9 May 2026 23:47:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 09 May 2026 23:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778384866; x=1778471266; bh=XiZlh3DlK6DeCRWIibDXKALhcUuwSW8g70o
	iT2nC7H0=; b=VHGpf5qOLOzZI542gBuxNzbK/35Pp6+YGcsN4ckNuBKbASvFSVd
	sUd270WqV1QMRv+t+m15LJ0D5L3EkiYRDGDFYISO8omymhkaaabH+zPA8bSwo/y/
	TllS2NLqllOLSxTHZGajGAikxhLtIWFaBumLJH+Bx1NmZgrONuuy4XjA7Rmk43S2
	jV1upZArHdSoQLtrezygyQiQYM6cQgE4e+r6K5/nD/7Z7pMplZfeQxUq3MGEukg8
	y7/X8vHWGV9sP6ANpgPAVCS09BoROfKpM+GvZZgZwFNeAP44chO20pKmfxN7bbj3
	QXc42G0EldIw7Q03UYtq3DuVq1lZqKiPKQA==
X-ME-Sender: <xms:4f__aVqTU9p-vkxN1FXYyxDugAXKS5RA4OzESkYD2YKQ0-QhIlF4UA>
    <xme:4f__aQ8J3tLvy4tgbfs8o13bP44rgJTZSPGWcKoSZVmNJPMabgoyuxcWNA1KDtCUd
    NNVwSJlnIXOnmUM5UFjvjgCUHcXhKAkN2m2OBQWl8oadfnlaWd6ER1T>
X-ME-Received: <xmr:4f__aZck9wYWByH8kh6Mm4oOQCL-B3BA97SZCjqmLcz_Qd5-HVaxZpTduJg6PV0rqJsHJkrN5gqpnG44typUVRYKEDTe_aJG7TU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudehtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhrtg
    hpthhtohepshgthhifrggssehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehg
    vggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhmhhithiimh
    hitgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishht
    shdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4f__aSJdfj6K71qOW9IvPPvO18voVBzHtH2a6KpT13LFELHw2_Z53g>
    <xmx:4f__aRiq2oiU54bu_w4zTxiz3iWta5RWdu_8KnLwfhD4pSc7W-Pm6g>
    <xmx:4f__aYQA2lYfWxw-l-UCC471-MGCDNSotV1uKI3VifVQbBWNzmMkxQ>
    <xmx:4f__aTWsPLQSfwH98dRgk1k5uSNLee_qtbbvHMEC-LBDYU9jA9ehwQ>
    <xmx:4v__aSZFONhg-Eaocj45zQAJFnDa50cSHFDZfHpN2gW3kwCe2OBtJj5G>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 May 2026 23:47:44 -0400 (EDT)
Date: Sun, 10 May 2026 13:47:47 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Daniel Palmer <daniel@0x0f.com>, Andreas Schwab <schwab@linux-m68k.org>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Handle put_user() faults more carefully
In-Reply-To: <CAFr9PX=V-Hw2yCw8x=++n8KA5Vbd=ZeFpFwJ6j_hJmRgHcpaeA@mail.gmail.com>
Message-ID: <c5bf4a4c-6756-26b5-36c5-062d66b10033@linux-m68k.org>
References: <1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org> <fb2ca693-1f99-2c5a-7ff0-9bcf22f89de0@linux-m68k.org> <CAFr9PX=V-Hw2yCw8x=++n8KA5Vbd=ZeFpFwJ6j_hJmRgHcpaeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Sat, 9 May 2026, Daniel Palmer wrote:

> On Mon, 4 May 2026 at 18:07, Finn Thain <fthain@linux-m68k.org> wrote:
> > >
> > > So far this has only been tested on Motorola 68030 and 68040 systems 
> > > and still needs testing on the other MMU-enabled processors.
> 
> Would testing on an 060 amiga be helpful?

Testing on 68060 hardware could be helpful (not emulators though). If the 
NOP failed to solve the problem on some CPU device or other then we could 
look for a more broadly applicable solution. I suppose there may be a 
faster solution too. Perhaps an architecture expert could comment.

> I just need to run the stress-ng --sysbadaddr -1 thing before and after 
> and collect the logs?
> 

That would work. I've been using an old static build of stress-ng 0.12.12 
but I imagine that newer versions would be just as effective. Note that 
the stressor runs for one day by default. You can use ^C or set a 
different duration with -t N.
