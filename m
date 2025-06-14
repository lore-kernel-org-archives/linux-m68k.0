Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962142E11A1
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 01:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749863166; cv=none; b=SGoNB39GqCdV4CTbOBXcPaGzPWVpsvKg3fUbhnYp3RVcDrtWHaQjodOybgIhtq699fYTn9NgSUvdkVypqzS7K4tOg/Qxc00qhkjGaTl2p76cBiPcGc2axX7BKLnzZ7G3rKseSGnX6To/XGasyCSzhbmh9NB9RTq4Ad2EXHDKDws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749863166; c=relaxed/simple;
	bh=2Qb7blaPa53qmkcOtmsnq+J7p0rrshbDLUE1Ar1iF6Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZDHhyBrk+K8wiUwDlXDurN/aa0Yes3PglHaSSPostMx97RDy+nybkUtJQH9saioTmJQMSOlc2hKHgUPRyFLidvEn/i2x60KzWVMUXVz3joi7dtvV/TrBPsQilCORkmqH79TbBiFlNA2eYu8V/iSbP2k5ab3I55g9ABrwvqTS2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LtMI816C; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LtMI816C"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A042F1140170;
	Fri, 13 Jun 2025 21:06:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 13 Jun 2025 21:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749863163; x=1749949563; bh=4LXjy8CEJxrp/3yz+x9wWxwNYBstXGo1hPq
	b4kf0ubQ=; b=LtMI816CQ03naFCJ8tQpy11+0Xf5BBGPwA6qTkvpS2epfbNj9cw
	OXwPSOhwfdxbvtEGjIoBvcGdW6M/g4/S1PnEzsPwOzCkiguFFG3fderfe995Z8ja
	teUfSC7sKc3q1uYDlKL4TsyGepvIgFu9kDohezKbTuNYN69io+p/Xr0Kb2xJK6Tj
	ZZfnWTWgZVax1R2cEjApJyw8Kkx2AZxkMdGzL1bNVw9r99fhb+Nyj//RVucbVGa6
	0juivGfT5kesyOYreBwihCB+8ofz5ME+GBI+SqfLzsmawciYj40gbI3jF6CZ9vHp
	FuPzxDWBdfmW5hW9fMj/y2jp72QO9Cjqruw==
X-ME-Sender: <xms:-spMaOL_aibrd_11mXzXWJskBRBe9dKusQj2VTSVbR42-ccy8p0tNA>
    <xme:-spMaGIbwqVJoiHFefUkiiWMJ6F_oqJ2PI3RcO16KtxbVsySV55pfAbPaeyv5WZx3
    CFCPy5ywZWeDmdJa6Y>
X-ME-Received: <xmr:-spMaOsM-Clsny_76I8P9412PGjQDmLnTJbRIPLT5tLDWGZ4flrSBH0J4Iuas-44xVhv98oeZl_dVyg3M3cFjR7p_jFWiiUYNkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehsthgvfhgrnhdrkhdrrhgvihhnrghuvghrsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhoohdrtghomhdprhgt
    phhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehjvg
    grnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdprhgtphhtthho
    pehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnh
    dqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    mheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-spMaDYOwLE-lKU-qHFsE6ocPYEodNE1duVGdN2E8KOHDC_uyUyvvA>
    <xmx:-spMaFZVlmW76bnuqAuk9VW5vqFSmCHoNn_baRPo_QPz6Q53NkZfwQ>
    <xmx:-spMaPA13BF73vMx61ZU6m1ZiFxJ7Yw-6BYoLNMtWI9-yrghgGnYpw>
    <xmx:-spMaLYoFr8wQ0qsyWNztIzJd3JTjv263Ehjrtp9xIrrEgMqVrsimQ>
    <xmx:-8pMaJvrC2P-5km4MNeOsq64MqayAjPPwFgKhOM7PFD8tSEkwNp_Xbym>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 21:06:00 -0400 (EDT)
Date: Sat, 14 Jun 2025 11:06:44 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Stefan Reinauer <stefan.k.reinauer@gmail.com>, 
    Stan Johnson <userm57@yahoo.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <fa06e8f58287f413babb5cc0af2a380efe46cf76.camel@physik.fu-berlin.de>
Message-ID: <4db7696c-a9bd-02be-4be5-0f4993e1e4dc@linux-m68k.org>
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
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>  
 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com> 
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de> 
 <1625e816-3f04-e700-308e-990f86c9a647@linux-m68k.org>
 <fa06e8f58287f413babb5cc0af2a380efe46cf76.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Jun 2025, John Paul Adrian Glaubitz wrote:

> On Thu, 2025-06-12 at 18:19 +1000, Finn Thain wrote:
> > On Thu, 12 Jun 2025, John Paul Adrian Glaubitz wrote:
> > 
> > > On Wed, 2025-06-11 at 20:16 -0700, Stefan Reinauer wrote:
> > > > 
> > > > Fixing pthreads would probably go a long way. That's where we lost 
> > > > about half of our performance.
> > > 
> > > This may be accurate, but I'm again not sure how this is related to 
> > > the discussion we're having.
> > > 
> > 
> > It's related because such changes could impact all of the C libraries 
> > and compiler toolchains that you wish to port. So it's an example of a 
> > burden created by package archive growth. 
> > https://lists.debian.org/debian-68k/2025/06/msg00048.html
> 
> m68k with 4 bytes alignment works fine on NetBSD.
> 

Please read the messages you reply to. The topic was a regression.

> > It's also related because such an enhancement may involve an ABI break. 
> > That's why I mentioned threading a week ago. 
> > https://lists.debian.org/debian-68k/2025/06/msg00018.html
> 
> Which I don't care about because the current ABI is broken.
> 

You should care! If you are going to get a new ABI, either you are going 
to do that work yourself or you'll have to collaborate with others who 
want certain characteristics from a new ABI.

And here again, it appears that you never read the message you're replying 
to. (And here I am, making the spam problem worse by replying to it...)
