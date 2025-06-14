Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711023DE
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 01:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749863585; cv=none; b=nklKaUYHjt7lnV3udNI5Y4OhuyXuYfac3L2+36wH0vZbjDDZOUB8pw8CNEV7hW4OwLrdgOfz2AMFlM722AvvNOlf0CvtbGcLqMKGZLYWArvA1CjMr0xSuAWuHDPU8CxnceTPAfBn1prPDihlzrtJnvqMBY4WhvljuHOoMHh1JZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749863585; c=relaxed/simple;
	bh=e9dE76bE5SsEx7TsCioIF4ct5jgETrKpIs1Erd+KJrE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SehUW2I7rzuUmFre4jjf86s/dlsZhbZn84fhf2gdrAgu2Nu8CBpU0zJUv9WQaSdnNgw8CFNZN3jn0tNlkUnXbQyVZudtV4jSrMvRPHFD33ff/Z3SqBSWxQfugW7nGKyE5jMKY8UISiixvY6XRcT8KU1fxuQM6smoid3UtOcY4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cYhIJAaH; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cYhIJAaH"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C16BC1140106;
	Fri, 13 Jun 2025 21:13:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 21:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749863582; x=1749949982; bh=46pymWHT4Qj0iEGYhrUJBc5s2sDQns5FjPE
	G2S+wuK0=; b=cYhIJAaHuvFsdOg5BrGItd6Vc6DCNWMI/XujcNhdT9j29N+MicX
	PoxEGcQ/B44oZ0xkghNi4SUTc0f57HJNT2038WNl9pMOF31EiItgv7s0PpczSMa0
	Tn3W3UeuCWAfRohXXSfWNmWw/EJ92ZROU10rmbKpzka9CrgiEuWJapHtFHA6tmde
	kZ6Qf+oOujE07JfqsrtuAroYj+ZhUPNtlWGRkAZKXkkOukfrFw4gWHd4e15cgd7p
	rZi4xlwdPuJEw7EAaiS1zfxs0A9L8bvQTjaGeXEaXPZiyVeTxhsJNbDST1z87Qsr
	hkPCKCyhq9oofOS3p6vcp/3RvTe0sLSl3Mg==
X-ME-Sender: <xms:ncxMaAV3gVi-NKCgYvEnCT86PRjR1-WzvlxEA3g5J2C5TSjW8-azUQ>
    <xme:ncxMaElHoFZTLbQkYTohYDspiVELe3drN470aKvnmfIq_pcH2MGYo637KaGql5Xt9
    BUPifKQ75UBA-JYpTM>
X-ME-Received: <xmr:ncxMaEZI9t7_aAby7KKigEMBptMnk7W-f0dRB16AxO9A8bzXG_Ub2IElcm8kyus-NinurjzO3_BMCQu8CQ0wGIEFGavxv-8Xfqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepohgrkhes
    hhgvlhhsihhnkhhinhgvthdrfhhipdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhooh
    drtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgh
    dprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtphhtthho
    peguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ncxMaPUVN80e4kYNA1eNbNCCkwtt3ss7aSr3ZEcjaShWIbC01ixVNw>
    <xmx:ncxMaKk7Ts6dN0FL1BFOs11fPQdJDJbJuZtLsURCvKe_cEdbT_H1DQ>
    <xmx:ncxMaEfZmy_iVAVbOqLvm-lxE3wOIAoLSJGMMcyTzJNWkdSM6olqMw>
    <xmx:ncxMaMHeopyRiBGs_QFS7dCHXmaoQ0kSCu2RfXHsOLh17TxmcMGScw>
    <xmx:nsxMaGYqB3oM31TVze9Z0kGRLkjzX3EeKg20oyFARUkGp7qrrCQVzQj6>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 21:12:59 -0400 (EDT)
Date: Sat, 14 Jun 2025 11:13:46 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Eero Tamminen <oak@helsinkinet.fi>, Stan Johnson <userm57@yahoo.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Message-ID: <a3fa0a05-d766-72a5-78d1-6a4df6fe8b43@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> 
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> 
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de> 
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de> 
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com> 
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de> 
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> 
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de> 
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> 
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de> 
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> 
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de> 
 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi> 
 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de> 
 <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
 <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> Performance was never the main argument. The main argument was 
> unbreaking the port. You are moving goal posts which is an indicator 
> that you're not interested in leading a fair and unbiased discussion.
> 

Linux/m68k is not broken, Gentoo/m68k is not broken and buildroot is not 
broken. They don't require that I build LLVM. They don't require that I 
build _multiple_ implementations of Rust and Go. They don't require that I 
build Qt in order to build cmake. So I suggest you fix your package 
archive and package manager.
