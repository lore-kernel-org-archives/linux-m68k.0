Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E74A02
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606345; cv=none; b=FJq38iSaki9VthnTYgU5hjSdXmZJLSsKMJ931BQgScETm4rAeGMJlyeDZYFAJzaRltO8SolzatPpkdAflLZGf/IvNXe+rF+VJLnVLHTlIoI84ySJWa+5vLHhtFStp2bN2q86Nc233iDoRoXfsAA8948wC3TWIE7txa7HfHsqvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606345; c=relaxed/simple;
	bh=CBoamI0oqppADekFiAMxYKs9lYTSQRSDifmGv2etg8o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Iihg/cdRTsNB9YrZP5mNXKX6HP6tAgPKg/jBy1InKxIJpCPPv8L+ws0vnbnlpzKAWb5m23NdVivSbF045DvnYJyFLFh70kT3a/O7VQhNpMwaIkGzigyAs2ONZFR1kQbDk5aVB/jYlSfAF2tC+zaqBOC9wERfs115lvxCh0I7BDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mTfKU9RJ; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mTfKU9RJ"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 7901613803DF;
	Tue, 10 Jun 2025 21:45:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 10 Jun 2025 21:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749606342; x=1749692742; bh=h8bHrkUMGBuATdAcGNbbQUwpUyDu/KpJjj3
	5h7EC82A=; b=mTfKU9RJE/hG73hQ8UIQy9Y4eOUSzgVmgTxXKWX/07rJ+b0nWPr
	PbYHT838LbjU/f2CtcdRjHE5qHQpfpfnv0jQfmNErl0DoKFwllSbhnrsOzKegDjN
	Hm3Xez39e9ss/Op9ywWSbrvtkeMsEZbgKVU4EFBHC6T0zMypvdCuigccCYMHGcqK
	l6bpzPULfqTu/TQ8LsVllnUpRkAANLn9dh3XlyJPYXC3u2f13xw/mdJSTVWnNJro
	3jvIgHb1H6kyh+EfIewnj6PVzSeHvJxKL1jG+d4qi2Tm4w+5v4vKVlVL3gA2wWir
	KMjoW4YzmqmBGtanMGu4qgl+hU1Rf0mrY9w==
X-ME-Sender: <xms:xd9IaIYSLSm2IJPgHPQDbUdXpwBxPq_3vmBuT01XiS4NtT3skOOFNg>
    <xme:xd9IaDZjU5YjK9RpKPOpuMsq-vKhiD5n-elffaJlHM04yrcjtt5zdW0mQRwkYwTkB
    cdpNGswzDhNiVdw3lw>
X-ME-Received: <xmr:xd9IaC8azC1UOEO5tHHT0UyPIPonG7wcNyBqGms_sDcerEJTKfUvJEw-Z7_C_JaOeynPvxjR7HYeAY9kgpW2a2jRUxrg2yxCanA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrd
    hhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtohepphhorhhtqdhmieek
    khesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsth
    hsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xd9IaCrMpAlYIa74lLPrrq1oPBR-THUsMgtccIOAN_yQFO3f8qpnng>
    <xmx:xt9IaDpulAkYhU8oQtIWF8y526foV-2GqeUqoTqkm3q_y_xvJ6f1EQ>
    <xmx:xt9IaASnmdnVIlcay-n1mQoa417ao1Xx-XvjUbYJZZOeFfW3Q7fCXw>
    <xmx:xt9IaDpGx5TD2hvGU2qEzkRVOlDxR3r3svr7xbwGME02Gs2LPrafzw>
    <xmx:xt9IaLw1M6_khZqcqTRpdkPuyvgcIiC9xwJM3CrKIWEvxW_g8B27Od7y>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 21:45:39 -0400 (EDT)
Date: Wed, 11 Jun 2025 11:46:26 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
Message-ID: <56fdda7e-f073-ef2f-bf9c-1477bc2a5a39@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>    <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>    <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>    <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
    <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>    <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>   <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>   <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 10 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> There is a clear difference between architectures that are actively used 
> in production as compared to architectures that are used for hobbyists 
> projects only.
> 

Regarding the Linux/m68k effort, that claim is unsupported (and 
unsupportable, AFAICS).

If you're just talking about Debian/m68k, it's really up to you how you 
will use it to add value.

> We couldn't push such changes on x86_64, for example, because there is 
> huge worldwide userbase meaning that introducing such an ABI-breaking 
> change would come at a huge cost. On m68k, on the other hand, the user 
> base is so small and insignificant

> that the costs for introducing the change are negligible and the profits 
> for making the change strongly outweigh the disadvantages.
> 

I find cost/benefit analyses to be useful. But how will you quantify this?

Moreover, you reduced Debian/m68k to insignificance when you characterized 
all of its users as insignificant. As its maintainer, that's your 
prerogative, I suppose.
