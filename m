Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC817BD3
	for <linux-m68k@vger.kernel.org>; Thu, 19 Jun 2025 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311074; cv=none; b=ahm1A6aF0ZrwnAIY+OZY1SHAsThgU41/WIYmlVm+8nIBWL2KboZDEXz7JMU6IUMIEwouWjwS/9+vm370uKj+y+GYEm28rRsB8MIYPcAwVjJMeMHsYsizBSoV+G2R2OWeE04JlphIUasphLQgXs+MD+Ffu//7vZANUPRilO3Y+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311074; c=relaxed/simple;
	bh=brBkX254+HtFTbIDmXArbVz9BZB1IXWYqwtLIA0mk9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bF0oZt4oqUlcw+6jvbos1K71cLu4yV8pk2GuF7TbGi4cB2u5pMuYquXYGfSXorjdiIxF+ZQOEUzALl+OPXuY8StGn3bguz0t8ljIXFlI1xDLcyZ6zMmixy8d2uyFJQZ3EUuHVEy0s0RSki7sQEMqwdURhAHfUoeWa7ARjjtphcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NGwlZ2fv; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NGwlZ2fv"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 201912540061;
	Thu, 19 Jun 2025 01:31:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 19 Jun 2025 01:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750311069; x=1750397469; bh=yxDfoETC+JWjepeeILNMDxvSyAHhiAMHTIh
	PHAZraZ0=; b=NGwlZ2fvpwQE7tUWkhlPAawWi5O/b79K1NCecVOh3bT1svaeY5T
	QkcalfmOmed54WcYtJUit82q2gnveQUG5lshdcw1nKqfhgLn6yM7sUdSTgMpw1a4
	Bwmn187jVagUdyrCOhAsCQd5gWfWw/ZBYjT+5Ly43eYlRHbu1eo+jSp5qhK1aZCW
	Eo0adjNvHb25VZ2PnsZvc11jXy0T9Ly7/u9D3p0Ob3FbouUcbd63cxYkuaP5UDK0
	Ejh17ZJPdrQA8tUGYQsEjmlNyfu+FV65mS/kpc+gnmKnSjwsUTv+PU8xrTcywRYY
	p4dRmv2968/jFZvdIqtcetVa5bmN702t3OQ==
X-ME-Sender: <xms:naBTaBtNWjws79neM9ynxka8e7GMiZt1qf11lXw8HCKsod_hocj2zw>
    <xme:naBTaKcyk5qPaoYDaduneL6ty0vWb8JZ1kiN8NNL6M1YnPvp20EcoMlphYJFB-H9-
    7el1hrV4xrg3QufXI8>
X-ME-Received: <xmr:naBTaEzzgovvmGk9oE7XP5wEBs0IeKv-XgTMoxoa7G7nP_3i-F5XsZj5FuOFNcgP3gRyjNsm_y44mqKdS8mqCfUZJhf4YQM92j0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghi
    nhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrh
    hnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeuleen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrg
    hinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehgvghrgheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghp
    thhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepphhorh
    htqdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehk
    sehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:naBTaINLS4T8eQyjy3fZ3ohJHr5bERL54gKKLJ0nXnWJwV8DZ6ZEPg>
    <xmx:naBTaB-d7mx44E4mDIM2KNQeVEi7dWtU3jXtrpyGNC-tEtfAxTPb7A>
    <xmx:naBTaIVcPf7eGKHP3G8BjwkRxZD7ZeiKPlKvoT_b95UT8mf3vALqdQ>
    <xmx:naBTaCd0eXTHAcj-QDviwnkXSopWJnM71OsHyIwsp3s39d3Rht8qLw>
    <xmx:naBTaEfD_shZCOU3icE84Pv2HU_68K9IyLyMD_Ly0pXFAwTTHU2pzwZj>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 01:31:06 -0400 (EDT)
Date: Thu, 19 Jun 2025 15:31:58 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Greg Ungerer <gerg@kernel.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <a140ad5e-35c5-4d14-beb4-d55a58fe0181@kernel.org>
Message-ID: <931c08f8-1d1c-a317-5380-aa41b26bfed4@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de> <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org> <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org> <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de> <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org> <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com> <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de> <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com> <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
 <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org> <fc9dd771-b010-e593-d8e4-2cdad57722ed@linux-m68k.org> <a140ad5e-35c5-4d14-beb4-d55a58fe0181@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 19 Jun 2025, Greg Ungerer wrote:

> On 19/6/25 08:29, Finn Thain wrote:
> 
> > On Wed, 18 Jun 2025, Greg Ungerer wrote:
> > 
> >>> It's not really necessary to enforce this on Coldfire. However, 
> >>> since buildroot builds completely from source, it wouldn't even be a 
> >>> problem to change the alignment there as well.
> >>
> >> Yes, that is totally right in my experience. Certainly in my ColdFire 
> >> work it is pretty much always a build-everything approach via 
> >> buildroot or similar. I wouldn't think an ABI change would actually 
> >> worry too many ColdFire uses, they don't use distributions like 
> >> debian on them. (I would love to hear from anyone who does!).
> >>
> > 
> > That may work for end-users with a vendor BSP. But upstream developers 
> > need to be able to swap components. In general, when debugging I often 
> > have to run old binaries to find out whether I'm dealing with a deeper 
> > regression or not. Also, there is the bisection problem. It's not just 
> > a couple of distros who get to pay for an ABI break. It's the entire 
> > ecosystem.
> 
> I am sure there is value in that for some. Like I said though that has 
> not been my experience with ColdFire. And by that I mean as the upstream 
> maintainer of ColdFire Linux support for +20 years. I pretty mush 
> _always_ build kernel + libs + user for testing even small kernel 
> changes.

OK, so you're not building binutils, newlib, gcc, gdb etc. with each 
revision. Do you use a board support package (BSP) from the vendor?

> My standard small system build takes less than 1 minute for everything. 
> Again, I am just relating my experience with this - admittedly probably 
> not typical of actual end users.
> 
> FWIW even when I was working on shipping ColdFire based products my 
> firmware was always a complete update, no separate kernel and user space 
> updates. Typical of small embedded systems. I can't actually remember 
> many times I have run with a previously compiled user space.
> 

Given that on-chip RAM is scarce on Coldfire devices, it seems entirely 
plausible that an alignment change could result in ENOMEM after a rebuild 
-- unless the toolchain offered a choice of ABI.

So this becomes a burden for those who maintain tooling that deals with 
ABIs, as well as for the vendor which has to support its BSP -- unless the 
vendor also happens to desire a choice of alignment (that's why I raised 
that question on 6/6).
