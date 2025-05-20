Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9F268C4B
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734884; cv=none; b=g4l2qvzXn0X2UJ6xxn9R/cBCt4DV0CXGZNIHnIdh69ZAwENo6qVxqddgkwS9/fzO6UyaXP3tDTWyhAQ2Mtj57eL4IM9VD+ym57CybSqzBBonYKfFDvxy/Ki3G9qKyi40Y86aVKiL6lZlQGrTCG5/JreuAqxQGM93VuyGcUDVdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734884; c=relaxed/simple;
	bh=QiwksNN1AtdsAb7ebJHvtrRgrowlyqV0V6q+7yryd2k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZG+yDkGC7M1MWMNgKa3eAdMsVf7fjo2tm8jj+ekREWGFlPvh4dPvmAn8dPaJNqt1nOJXdbR7lHp+p8F36zsduCbnor9GR3baPz2JXyB/44BvwM8H0hOvv4+BcubF1Ja8mG2y6r5JEd3GgYTD9G1dmG3dwR+Y9Vk+XHDf4KdbY5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FPHNeiub; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FPHNeiub"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5269D1140147;
	Tue, 20 May 2025 05:54:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 20 May 2025 05:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747734881; x=1747821281; bh=ZMeeJZn/qTDwtMJ4XeX4vY1Xx8imtGjByPg
	9fr2/Spg=; b=FPHNeiubrob5mv+u6DFC9sYivJnJgEBmu9VtSNDybgQ3fpWJ3Dm
	phKp5lBz5RVgixA1G/1MMu4y99CP7w9T8SJQVG9YtZnfZrZx2Y8azZJ2q/Da+RqL
	igOnuz9u9tKwSs6UsqoKVQdlqPsDP5iURMisoapMJc5BK2/FXlg7jen3JVRE20px
	fHlcuJOvwaUgupAYexBjM/Owu8RzYoV767wvBi04XjwE6jset0vYHCAqVeaRisc5
	rkYYi3HzXKyBtptdxoi3Ecv8oRCP6Oabx8XFYGtXQv0mUOYep9/i/YUCAReWv2MR
	m06UXRekq36ABVo3Huo0GRWa6JA2w9kIRbQ==
X-ME-Sender: <xms:YFEsaAQ1s9Pw6tYwBZQuY4Whytzdy0EO_6slpOyiurnH6tRS9HMfWA>
    <xme:YFEsaNxGlcQ-3ehvjQonrqMnH8l9RIaH4XFuTfHHae_DNrq5FmxQThRXXXHWVbkuc
    -jjqKI2k_BfETp24lE>
X-ME-Received: <xmr:YFEsaN0raeOln5t19lrh_4WnMaefZRImcf1eU2gzL_IH9uY5i9ouAHt7kf_Jq2y1Icefn4LVRDjE_hrlsv8yk7qHoGb-6FSVGz4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdefleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddv
    necuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheike
    hkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffek
    feffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhn
    sggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruh
    gsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehffigv
    ihhmvghrsehrvgguhhgrthdrtghomhdprhgtphhtthhopegthhgvfihisegruhhrrgdqoh
    hnlhhinhgvrdgtohdruhhkpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhs
    rdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstgdqhhgvlhhpsehsohhurhgtvgif
    rghrvgdrohhrgh
X-ME-Proxy: <xmx:YFEsaECnz6usPCSGGqH_pbrTTWxllE5_V5Xq3akllH912XiJd4JU6w>
    <xmx:YFEsaJh68aJ2HajL3ZVt36FF_RkjO7v9nSdI1lTwKWCHsduzclicIw>
    <xmx:YFEsaApf_KkBPi3XIJFUffVlXyarwIGyaOnb7Pk4Qpn8lHGLBJ_WtQ>
    <xmx:YFEsaMgErdmyr8m4BHbSspGJveyIuwN9fR3ptRROhkt_Yu9fqql_Wg>
    <xmx:YVEsaEP70tgKRCHMU9DN2w7EPtddw45G8EWNbzPECy04mDPV3c9Khhqm>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 05:54:38 -0400 (EDT)
Date: Tue, 20 May 2025 19:55:12 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Florian Weimer <fweimer@redhat.com>, 
    James Le Cuirot <chewi@aura-online.co.uk>, 
    debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <48411baea4164252cba5635b09325c8acf29f3bc.camel@physik.fu-berlin.de>
Message-ID: <23cce228-e58c-9c5d-74c7-49b0c77c35b7@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>    <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>    <8734d1kofn.fsf@oldenburg.str.redhat.com>   <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
   <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>  <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org> <48411baea4164252cba5635b09325c8acf29f3bc.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:

> > As for gccgo, has that ever worked on m68k?
> 
> Yes.
> 

Why is an ABI change needed to get it to work again?

> > Other language runtimes work fine on the m68k ABI. Why is Rust 
> > special?
> 
> You mean other languages such as JavaScript, Go, Java, Python and 
> WebKit?
> 
> No, they don't work fine on m68k.
> 

Python works -- you patched it yourself! -- it doesn't need a special ABI. 
As for the Java runtime etc. I've never tried to install them on m68k but 
I know they were ported to a variety of ABIs with a variety of alignment 
rules, that do not guarantee natural alignment of integer types.
