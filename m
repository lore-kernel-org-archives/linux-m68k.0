Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B645413C3F6
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605504; cv=none; b=Dr1kSPtbCKfTtvNiAONxG1OnYW5U0IgL6sqWWDFy5X6Jm4XnNdpzqx2O/Fw+c/KY/9GLnsdFO+Z+qN0AVEYE+aIxGYGukxTWGPRrBq/mJ4CZbJiC8iW1Aaeg8kmJrdo5IzriWnJr5jqm9tt4LOuZhJhwHXeC2Ep7Es813l31/zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605504; c=relaxed/simple;
	bh=PNcackg7lLoc2eeM/lbSVnwf7QW1IhQ6KWcZoZU88ik=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s+ibndZA1ajawkjFwJJiXA1r7LydU/NhoaDpJXMLE9c1LvokBf3XoZzye3Sczggm5e6Brg6RPz1ro290M9n97moaHfECeHwbYPov4MgUjrf+JSPRxLIaZDtzFIvANimR/FURgbNeIu0fkurFwiBXXtRk/aEUqWgZnsy38aLQLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HTfgrTV7; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HTfgrTV7"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C9D9711400CA;
	Tue, 10 Jun 2025 21:31:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 10 Jun 2025 21:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749605501; x=1749691901; bh=dDDk++tTRoBxV6mU30HtZKfveyVYGql7gOa
	F55v6olg=; b=HTfgrTV73V6hiCq7GdFk+qCqrbms+lvvCTAio7V1EWkWzLZHGzu
	j8tfnQOIE5f/MPgEzcTGU2okb/MlhtLkJNyJxX6aX3wD2aNmJBNyP8yJ3KGmsnTH
	r1jRrzH+NIqB70nvzBCVWwlg132snvKhwCHqsToOKWH4EERrabZlpAL25lUkbZxV
	fq+q1OvzymFrkunDNRdFWYX5AW54e+LbcyCzf6STHKiDXn9ztsUSXnpm/1VsO122
	YD9qCCwHzTipvMdhH0OEUMWAkE6IRb64EmTKymZeJxA7rxXfrQhwbHnSTJUyjfvm
	ki0I6AwFgJYLzMUji+HDZMm8LjFwslikX7Q==
X-ME-Sender: <xms:fdxIaAPw_GwcLpTT5uxFxFpAXdkBrhWqk6XhDN76nbkaUMJiSGfLNw>
    <xme:fdxIaG__DswnLAOyNHWYuM52fBJ0L7Xf0RW8gOI67bQnWgpkEMMUHfTyEJgnNW46q
    I6c6kHXezyJqJqH-0c>
X-ME-Received: <xmr:fdxIaHTUlA-avUExKLrFlM8puxqTc44xOPrfdfk0ItUduK6oETq4kdCJZ2ukWkbRiKfud0ymLhwSFPOTOfMISdmawYDmKyYFzTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrgh
    dprhgtphhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdr
    ohhrghdprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtph
    htthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fdxIaIsZEhGbxCLnWL1mdqnXz5eMRy1iy-H9KQlMu-gzGgJWnOS9Zw>
    <xmx:fdxIaIeGD9r8ubzWxzwnYxw-E0-azP0zPS0vGDlCIaE3fgRBE1-4Lg>
    <xmx:fdxIaM0t1GKlspgZ8Rery6XCPzsR-v2kceI-I8-wM4anUHxzSwbgGg>
    <xmx:fdxIaM8_FyeQndEQ0KloVu1X-jhu3OUmEdIeFXmprAl6i0iOpUDy3g>
    <xmx:fdxIaNVIdKsV9E-gOcBl1UToCj7Iv5ANCvQR3rjRJAoZPvlUufZAJB6n>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 21:31:39 -0400 (EDT)
Date: Wed, 11 Jun 2025 11:32:26 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <f4523e2c034056458fcff558ce3e27eb4699b710.camel@physik.fu-berlin.de>
Message-ID: <7d8a63b2-e6f8-1595-c346-98d4780bcfb1@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>    <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>    <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>    <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
    <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>    <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>   <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>   <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <f4523e2c034056458fcff558ce3e27eb4699b710.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 10 Jun 2025, John Paul Adrian Glaubitz wrote:

> On Sun, 2025-06-08 at 11:10 +1000, Finn Thain wrote:
> > > I don't see the point in maintaining something that becomes 
> > > increasingly useless because more and more packages are no longer 
> > > buildable.
> > 
> > That's because you still haven't identified those packages in the 
> > Debian archive which actually need porting.
> 
> Finn, you seriously have to be kidding me. I have created a wiki page 
> with all the packages in question and I have posted a link to that page 
> multiple times.
> 
> See: https://wiki.debian.org/M68k/Alignment
> 
> Are you deliberately ignoring that?
> 

I wasn't ignoring anything.
