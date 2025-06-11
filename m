Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB886334
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 01:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605462; cv=none; b=EhLTKVph/LxziZSNlinxEL5rZlEqddpno79LN+cu8//YOoFiChdq8qs+tAPC19bQw8vbnj6FPbKabltnyZMTnV9NKtQOMaQfyxMt68MHJ4432rIb/Y2Q8P9GALerft/OUDf8RCVGZ4AgFz/SnwSaKO6LUCydA73wZ5//bBrlP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605462; c=relaxed/simple;
	bh=HLpnGkOeeo8oMxFJwo7KvCk5BaZs6ZoVUxib0BQjppQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lnE2U2J7yTye7CC1yTMd2Jqd4VMn1wf0+B5fsv6zsAYXn0cecuO8unVxUi9Oka3CX0o5L9Neg7RZTKWgRazPzY73PO5DVib3OvGhoY/5AGgeBy5gmcg4euJEX2PcD+Asvm+W5lFzlQCV7ESJM/hdslOvQk0ri0XgO7ZhJlt7ot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jAZKY+A9; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jAZKY+A9"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C96E91140147;
	Tue, 10 Jun 2025 21:30:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 10 Jun 2025 21:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749605457; x=1749691857; bh=qksQenINIZUaKpOyq/P4chDe0AeKjMcKPkW
	IobqCluY=; b=jAZKY+A9eynnLG4ePlXFPh1xu6u7fDQrYIXkitcFdpYCjsqSFTA
	oZBaBlXrfZb6a4eu8BtSt6l0QrUBHiB6Ew8OBaWOPX7hwUZ0uIHby1fm8MsYZ/8A
	1pTkUmMO1FB+ToB+ArvqwtaCNm60yFYrd8quj5HaBgeJEzYOpyK2K75L4+9eVrPd
	AWghknt5Cd5elV36cox1TleyuJOLBUBTRymELgSirp0Q6f9RYVFOg1U69vQiWiX2
	O8RBuDtP/JNx3J7FKQvr6R6mkSDL5UTZ3h963Qt93bRfY9PGVLzT3dUTdxbqpJHl
	p7Ye3AL3BSgBho4QV828kb95//+/dDF+RvQ==
X-ME-Sender: <xms:UNxIaLD4DoDzcgDNwmTM8XDboyR3ba2zwVztALa6E5MqBm6pmNiabg>
    <xme:UNxIaBgfBCSHCJSkdZr_F06VS0LxkLhFtT45qHQI-cB3P2UJvKdrW_sfeSlBGyNMz
    Kwh8r3kYZ5LpRlQcW4>
X-ME-Received: <xmr:UNxIaGklMXsOka3dK6HQaKnGrf1o11vZVmzhy8-DI9nQsZh0-rU_wk7_1krsJUZIPpZxCkmFsfep8wYKTbNbywySNY7QRo4nqMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepshgthhif
    rggssehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehthhhorhhpvghjsehmvg
    drtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgh
    dprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprhgtphhtthho
    peguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UNxIaNyvOGvFYkJ2z2YlyCIQ-pkQMNfkFp-Sc6AaEYrRVBm6ZOkAcw>
    <xmx:UNxIaARNNrg7IUKdVW1kejT9-JRoBH9Snjxgx3XulsNUu4us9X-3mA>
    <xmx:UNxIaAb_5jBOIFdDDpqenktW8oyWhLO8TlR0Ig2q6bbq0PoZcSOpkg>
    <xmx:UNxIaBSLnxv35nQO42-Id8R8-G727jpP5mYgafOlN33qp5T1doRKjQ>
    <xmx:UdxIaMCarrLTSZJcDAI41fKFKME90_mnbiucbB4BjQ11LwBGocbpxtO_>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 21:30:53 -0400 (EDT)
Date: Wed, 11 Jun 2025 11:31:40 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Andreas Schwab <schwab@linux-m68k.org>, Jason Thorpe <thorpej@me.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <55cd663c9c6e0470b3d9d3425d898beaef823738.camel@physik.fu-berlin.de>
Message-ID: <394a2e28-28f3-9971-3f4c-ade5b71f16e3@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>  <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>  <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <87sekbq3f8.fsf@linux-m68k.org>  <2126C1A0-7737-4228-9B28-B160C672C8AD@me.com> <87ldq38byn.fsf@igel.home> <55cd663c9c6e0470b3d9d3425d898beaef823738.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 10 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> However, that doesn't help with the current situation which is that the 
> number of packages that fail to build from source on m68k on Linux is 
> increasing and it's becoming more difficult to maintain the port.
> 

Porting to m68k, with it's quirks, is more difficult for you than it was 
for your many predecessors because the Debian archive contains many more 
packages and many more lines of code than it did historically.

That's obviously the root cause of your problem, and it's also the reason 
why the Debian archive is less and less relevant, being that 680x0 systems 
still have the same number of transistors that they always did.

Now, Coldfire is a different story. But you continue to ignore it despite 
the fact your pet Debian/m68k port probably would not exist without 
Coldfire users/developers.

If there is insufficient manpower at the Debian project to patch the 
pointer abuse in Python, how could you possibly have produced the TLS 
implementation, which Codesourcery provided for its Coldfire customers, 
and which you ship?
