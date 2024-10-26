Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA806A009
	for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729927918; cv=none; b=EBTG2G1fZo3uhGZGgg3hoAWdzUGLPgt4pY5PRB5kCydcfYbYITCa5zF1NPfLaxQGhRuF//dLCS1B1Sk8m0iStAa4jg2Ou8tqWPBH2SqKO/zFE1OY9wYlx5bgVOjhIH3VHZMSmB7mke/L4ibE7pEnGVw04kQS/vfL5dMTMtjV0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729927918; c=relaxed/simple;
	bh=QjJpNEDN8z90cBI3rA1UUVYzlD2gSYmIQAfIhifneLg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mKLMc8arUvE4Onz/vE07eXp5iCqq9doz7BBMndoq1pLbK307y64lGFPXEsQPDA5OKHNQICJqjFZnoLbDnO5hqmr4qTvGzmhzllQ+92IrxzDoHnVgH6SkVhQJui5rMd4iJGb5OLu7b9IkGovLKOST/Nkvnv/Fg/YmE+XVXj+8rH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W9EJqy4d; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W9EJqy4d"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 40008114009F;
	Sat, 26 Oct 2024 03:31:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 26 Oct 2024 03:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729927913; x=1730014313; bh=aaMtqztG11tMv48u7qCnyUqdW3nh
	/exmpI9zT38MnaQ=; b=W9EJqy4dAG/T49ttSq2CkVswI6EhoDG+K+ecBvbV/AU2
	lx122ZTW1cHDmwwLKEKt6hqaqkKhL3wkVXjMH8SNlZyA/g1GucFmuotQbr3o/klV
	FeQG9jVXfp7S1CcuJD68XeW+bRVj1Nmsd7alm10L0z36BcsQFFCcznh+ET7HMGax
	L/gqSuLgftcsZmXZlOL5JyTkK4234j0x3Vp6aT406p1eAIl4vhkPOwDc+aJpAf4o
	6BZUsylOHOlC1Mk4N1WgPrxw8pvp63B3G1tJBD3vijjcH3XODn3xGDM/e44zWmOU
	Dl/7QYAoMpAE0zuQv517zgEROwZUiEDnJEb3noJX3A==
X-ME-Sender: <xms:55ocZ2wNgQgTVZ1TCwx0sWUCmpeloi11gHLCCJ4NFLe63n2jMQqiUg>
    <xme:55ocZyTbh-DmB4x1ZD3LnP7RmwpVCbruMzOV51yLd5tWebuwxDtG1ltOhVWGfygat
    GiYQ1HpJ9hS7PRQPU4>
X-ME-Received: <xmr:55ocZ4X-St1vHV1_DW_nk1AGc08STt0fiJRvhQIzygtHVa4eGr-jDGO_ZIGr9vhiV6FYOcfqW_Czgb2vHY5FFyViecSlmt80wfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejfedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghi
    rghnrdhorhhgpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghord
    hukhdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehgvggv
    rhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfigrsgeslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgt
    phhtthhopehtghesmhhirhgsshgurdguvg
X-ME-Proxy: <xmx:55ocZ8hIGddUiTJKEfcunoZlRP4AAIoj7S_DBzIrWHbKnpygbDr46g>
    <xmx:55ocZ4BxyxGdrQ1n75rGhh6vsl_6UanYZ07TQVvdNmWqPWLyT-HrWw>
    <xmx:55ocZ9Lvfn7OXi-s0SN0j4uDeGqNXkGUcLLyvKJFs4e1rx-gbAeRhQ>
    <xmx:55ocZ_BZuIuCXTZ9EZ9WiTcY1KNZPvtaN-MCUPUeNgtutWSF274E1A>
    <xmx:6ZocZ02S-jH57ccqfW5DjhXRd0_1skIvwj0YwpoyrDmWKxA4zy8sDFh8>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Oct 2024 03:31:49 -0400 (EDT)
Date: Sat, 26 Oct 2024 18:31:42 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
    Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
Message-ID: <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:

> On Fri, 2024-10-25 at 20:06 +1100, Finn Thain wrote:
> > On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:
> > 
> > > the m68k port has reached the point where switching the default 
> > > alignment from 16-bit to 32-bit is inevitable as the number of 
> > > packages affected by alignment issues have become too large. It even 
> > > includes Python 3.13 these days.
> > > 
> > 
> > Are there any bug reports you could link to, in support of the "too 
> > large" claim?
> 
> The following packages require 32-bit alignment:
> 
> - mold
> - LLVM
> - gccgo
> - Qt5 (several packages affected)
> - Qt6 (several packages affected)
> - OpenJDK (all versions)
> - Python >= 3.13
> - Rust
> 

That seems to imply that someone requires that those packages are ported. 
But without a bug report from such a user, to say the package is broken or 
missing, one must question the real requirement.

> Those are the most important projects from the tip of my head, but they 
> are already the biggest blockers. There is no chance that the upstream 
> maintainers will adjust their packages for 16-bit alignment, so these 
> will be forever broken on m68k if we don't switch.
> 

I'm curious to see such a refusal in context, presumably as a result of 
patch review, in an upstream project bug tracker.

I'm not actually expecting to see good patches refused by core projects 
like Python. (Note that MicroPython is available for commercially active 
CPUs like the PIC16 family, which are 8-bit processors with 16-bit address 
bus.)

If upstream QT or Java developers decide that their software is "not for 
us", they may well have a point. Those packages are not installed on my 
m68k systems, FWIW.

OTOH, as I've said before, if upstream developers (like Arnd) are looking 
ahead to 128-bit platforms then they will be paying attention to alignment 
rules. They should be inclined to favour explicit struct definitions over 
implicit alignment, don't you think?

> I understand that this might be a painful transition, but I don't see 
> any other way to keep the m68k port alive in the foreseeable future 
> unless we fix this problem which keeps blocking the port.
> 
> You can see how the Debian m68k port has been falling behind because of 
> the alignment issues in these statistics: 
> https://buildd.debian.org/stats/graph-ports-big.png
> 

I could imagine a viable transition to a new ABI driven by widespread user 
demand or involvement. But not by distro stats or maintainer preference.

Absent the right conditions, perhaps it is best focus limited porter and 
developer effort on patching only those packages that are really required.
