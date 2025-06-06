Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91D3234
	for <linux-m68k@vger.kernel.org>; Fri,  6 Jun 2025 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205225; cv=none; b=DsXtVyfPp7ih36ZwulemHAIp2Q0cYxktp77EFUfcJr9CImYvt9BgklBmskPZ7ViiiCDW7H8US2gmLb95tM6RzcJsJNeYGilGQ649LRYSR3fwLflVCt5gtEWIZ1hLS9h47t0THquSX1nu3OStFlY2UXlQBmwSBeqylIAjl2rfmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205225; c=relaxed/simple;
	bh=eFxZImEjtKwYE6ejzIwkqbWH5LAbKc2YZ1PiuJMVn00=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bDYnRZWaca6qqbiC0yHzknhCP4zq/CxoEkbWb7b2vupJZsSQ2YLk918CiDHXObhQU0nIGDkHHo513YCEBrO780fdWD5RVsHOyvgJbXaJ/5ns43q7NjhNzTDfXeRAaBIdLVW31aRr8LHSRSiQYGTOMwTe5hZsfNz+zRc2FUZmDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RvwXEK6Y; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RvwXEK6Y"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E67951140171;
	Fri,  6 Jun 2025 06:20:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 06 Jun 2025 06:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749205220; x=1749291620; bh=9qenpxReV5u88xJ4FqeDIwJdKIUf6pZ3erv
	sUl/PiSk=; b=RvwXEK6YOs4Eh8011pHtNlE2khzMsUuAaThA4LscUR3qHC5x3zc
	iK6Yudxc7pyIov+E7yyT2E4OOzuG046gDUDngu7a/w+YUIsAqc59jvIkzTr7OQnW
	zeQRnVrS5vQk8SrEiL5REvpjfYlctcSNVtMCwG4xX33mCC/7VvYndY8dJ8qIZkBs
	dKt1QWouqLeodSSMA/9+wjkg5jgfgg4MSP55bLx7kQebA+4Vtpy3vbCJVLUBoABp
	02Q0G/28SKoCz3kYKq6RjFDX+TyJjDct1TIhwZBbitpzToP+X/iJbmpYnYz9YhXP
	sZO9kpryopQjMiWiFlPAoPgsctSuOPlcVUA==
X-ME-Sender: <xms:48BCaKeOXVDGCCB-QZGvKE9xDLT55ZjWgJBKnH-scVbbhYX_7NLBXA>
    <xme:48BCaEPj6eEbdErTQxZn0oUWbYx-M9hBkEjoWv7hQu0w7CF7xgzpDKPADh5TPv5Vf
    FNZf4IhfZVlKeq1lVI>
X-ME-Received: <xmr:48BCaLhN6OU-_0lsHuTsYOtoPpLnREbvvywvOSl_B0LbCgVaT6AWOO0HoZUoj2bvE6cCDU2aCLJ3F9nPD6-8eWOtu3jKV-n-SXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefg
    vddtkeekvdekhefftdekvedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhn
    sehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepiedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghr
    lhhinhdruggvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpd
    hrtghpthhtohepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdho
    rhhgpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghpth
    htohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:48BCaH_TPxSleHJjqtD2lgNj21_TPpf_0huqZwDUCcJR_SYlcVWzjA>
    <xmx:48BCaGvriE5Ih76Rj0-NhUD-ae7GIY9kPYQxWDYSac3NcbnnXiqxsg>
    <xmx:48BCaOH6WMVpZHvhJHdxrsLy8lddA9VfadXGO1MGs4xGwOM050H0Nw>
    <xmx:48BCaFOJUtBxiMeb4yW4NEEqESSqqJORq9i0cuPmQIC_0HRn-0WE_A>
    <xmx:5MBCaCnK8drJ3sOpt3jDhrEa83H6J-Yd98s8M8OOmrdGcr_ZQkoFXerr>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 06:20:17 -0400 (EDT)
Date: Fri, 6 Jun 2025 20:20:57 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
Message-ID: <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>  <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>  <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> 
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>  <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com> <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 5 Jun 2025, John Paul Adrian Glaubitz wrote:

> > (I wanted to test-compile all uapi headers to find differences, but 
> > ran into many headers not being self-contained, or causing conflicts).
> > 
> > Feel free to start arch/m68k32/ to work around this ;-)
> 
> Nope, we're just going to carry patches downstream and I'll just ignore 
> people that actively want to obstruct fixing a long-time problem on m68k 
> with the weak argument that it would break Linux binaries from 1993 
> running on a modern kernel.
> 
> This isn't a use case I care about.
> 

Whereas, the ability to use old binaries is proof that we care about rule 
#1 don't break userspace.

Having said that, I agree that there is scope for a better ABI. 
Users/developers will eventually want solutions to the Y2038 problem. ISTR 
they once wanted an address register dedicated to the thread storage area. 
And prior to that, some wanted binaries that could more easily run on both 
Coldfire and 680x0 hardware. And apparently there's baggage in the 
userspace interfaces that could be dropped.

NXP presently sells a soft-core Coldfire implementation which makes me 
wonder what those engineers can tell us about deficiencies in our ABI, in 
their experience.

> > BTW, looking into the history of __ADDR_BND_PKEY_PAD() (which is 
> > overkill on m68k, as __alignof__(void *) = 2, but might still be 
> > useful for anyone wanting to revive CRIS support ;-), I ran into 
> > Andreas' explanation why the minimal alignment is still 2 bytes: 
> > https://lore.kernel.org/all/87y3i442w1.fsf@linux-m68k.org/.
> 
> This post just proves that it's always a bad idea to keep historical 
> burden instead of fixing it.
> 
> Again, can you please bring up a convincing argument why it would be a 
> hard problem to break the ABI for Linux on 40-year-old hardware? And who 
> would be affected by it?
> 

I think Arnd already answered those questions: 
https://lore.kernel.org/all/383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com/

Moreover, "what's wrong with my idea" is the wrong question. The right 
question is, "what's wrong with my patches?"

> The ABI isn't set in stone and if need to break it to fix fundamental 
> problems, then be it.

Well, that's a value judgement you're free to make regarding your systems. 
It's easy to find fault in other peoples' systems but it's also pointless. 
It won't get us closer to a consensus that will hold for another 30 years.
