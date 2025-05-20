Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694C1647
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733965; cv=none; b=G1bidlAqRS+j8wGzYEXddL/Vxo1n6UcVockuiJjb53qhMejHoX/4a7DUnFN4Na+jKFmGVNOH3uKx5bFtKkyUIsUSzpYPGoekvpXTznsUNbcwsBHWDkaIZ2ZCOmfa31jUAOO7y61cXCdtFpVe4JVEBahiX9BpIxJJvZdt1Jj8Bxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733965; c=relaxed/simple;
	bh=tJ/83imttqyUDlnrluvkFnoYK7Az59ZgNQeg17xZcYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OSYR0yMhy+rZv3Xk95aw+R45q7v9wNmPgWrJC7kZrDWam6PdZ7EDg4VisMkpOqPo2fWgc8DJj1SFYDbCXMHmkKV3W0X9u2+UvfmwNNb3vLFOTrOC18vFxtuLUJ3vMBsCJX+xzLtDRa6M7WuHZUehLpLEa4yvjl8w9gtJpNcY6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xe3xVNsP; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xe3xVNsP"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4AD4C1140111;
	Tue, 20 May 2025 05:39:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 20 May 2025 05:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747733961; x=1747820361; bh=As/01Jc+wYpRNbiK+b46VQnUcyjYyueqLQo
	GiD2VN6c=; b=Xe3xVNsP9/7AwqiXvzdu3drjTnk39ChOiFUveMiA5ky1Bqf83t9
	WrGubZcuxQyI2zExopwiwaNWbRtJkwD2oRkoGfRWWxTRZ6cDm6k7kAUWr/YgBlUd
	iomAb4wTrRiid9EHQ+7BzzHp8CERHwGDMSqVI46Cx9u+TD0CP01LhWjNErjdln3v
	JyvoQ9ig/6i324VBTel5nbpQvjSdplUczUeU8CraFfD1olceoowo7X774w7iZSvO
	4GadEbfkIsKZ8Q92lZQmLi/HW3lB3tGxoVKm72WBb6G1XGwkIkOiMneOdNNct7rD
	7cLENi6q3+okRrl5DTQjSPjbc5HA7Tag3FA==
X-ME-Sender: <xms:yE0saCTK33kgaURkHWW9cyYNqSqwKyhCctQXOTZur8vF0nPMGoS2ig>
    <xme:yE0saHyFC81i-nG_COpQ5VgOksABXrT9Fyq02Vur1dtYcfbEJDhCyu9H_SCNAybbq
    ooD7oIepHTftAzOAD8>
X-ME-Received: <xmr:yE0saP2VhTXCJy_m5SutEOpY4S-siwCiRsHk5ycK_nXCNPzU2DHPWNJAJNet_UZtDuDy6or6avByxqLLe6v6xQ7Vmj_IKhhJxCY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdefleduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:yE0saOCWwb5OI_LqPARkmFKh73PW5FuljY-Ob3dGqBIawlk_hMUBgg>
    <xmx:yE0saLhBvrjeCLJfBQq9_Y-nJM12HZ0cCjsBjjiHQTYOqCpkvYpE8w>
    <xmx:yE0saKrnkz7rzcQoGRrOKbuDIAfbtbyq3oQcttBu41iWd3ktpH_6PQ>
    <xmx:yE0saOjwcfYOz5xF2NDkQvyjdkuUi7G-gv5Hyp4es8IhVFIBxkPyFQ>
    <xmx:yU0saOPQmZrYxKGXqTS7i7dIVw2QzgoGH4d9Y7YTWklRV3pu09PDkUY8>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 05:39:17 -0400 (EDT)
Date: Tue, 20 May 2025 19:39:51 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Florian Weimer <fweimer@redhat.com>, 
    James Le Cuirot <chewi@aura-online.co.uk>, 
    debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
Message-ID: <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>   <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>   <8734d1kofn.fsf@oldenburg.str.redhat.com>  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org> <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:

> On Tue, 2025-05-20 at 07:59 +1000, Finn Thain wrote:
> > On Mon, 19 May 2025, John Paul Adrian Glaubitz wrote:
> > 
> > > 
> > > My argument is that Linux/m68k is a pure hobbyist project and anyone 
> > > involved can deal with the changes coming from the alignment change.
> > > 
> > 
> > If hobbyists can deal with ABI breakage, they can certainly deal with the 
> > longstanding lack of fancy toolchains and toolkits*.
> 
> Being able to build the build dependencies of cmake or parts of GCC such
> as gccgo is not something I would consider "fancy".

Qt is an optional dependency of cmake, subject to USE=gui on Gentoo, as it 
should be. If that dep is required by Debian, that's a distro problem, not 
an ABI problem.

As for gccgo, has that ever worked on m68k?

> Furthermore, more and more packages are being ported to Rust which means 
> m68k will either die a long death or have to switch to 4 bytes 
> alignment.
> 

Other language runtimes work fine on the m68k ABI. Why is Rust special?
