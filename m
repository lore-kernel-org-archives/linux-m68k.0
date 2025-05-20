Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC1B21CC52
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738979; cv=none; b=VOmGKP+LXQ/8lg2M+29I0cU3tcBf/5XbfpJf5DgvktrSoyZFyOIbancNCeUjAJHgJKEXRjOSuwpdFoRvpAzRuf2uk1KEjpYDpsOI5OosbJU6FHd9kc2FoEsgIQJwCqiOyeJ/xA0fIySgFchvlhg2Ryn1XlYsW+ipN7tsiik10eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738979; c=relaxed/simple;
	bh=J6IXbUboXf/349knwhtjcCFsUjbUxYOzF5KPqPq6x0E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G+HacZhfCBLs9qV9MnpL1HBNHPJEmNQz60WrOEc0K5lx8z+ARYaNaAfukUXXSXRe23XdS+2z1MGuVnfUxJryMFdQ/r+Y9C3Kmj5pF4Nj4Sl/OGs0EfrMMRs0gYnx4DCoSrN71bO7/emKSlDl7BB4P1/SbMkeqQVqXDpcQHraISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e3iEwCrM; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e3iEwCrM"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C52411140090;
	Tue, 20 May 2025 07:02:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 20 May 2025 07:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747738975; x=1747825375; bh=S2Z84Qp4jILEuoRMsyHmGm0SvoHHDtXbgPE
	5egBLoMc=; b=e3iEwCrMb6GPIKQsu9s69mrbbNIxDzbmtL83tFISrsj7uNxTk9g
	3KUlJObyakOymp+Evl+aIK7MFjVnx1iouNyCyPbvR4+AdvnFpZivyMrkQU1dZOpN
	qIiRjYL3YeQ3HD1aVRXOgU+nWZP7F/wXaDd8SYyaUzH7HsuOHwCnLC2Ez32MbYcI
	U5sot70jWWWfMHeugcJ15heo1e3ZTi8TYepsrSa11BLYQcykKFVtvexvTAqM16ri
	iinSwPWLY9uyqtYMFfoD2aHN7ZXhxhwtkYkMvIChKxOiSEtDWfU8F41HAhj850mn
	PyU9DCkCKWjksowU8fpr361OUJge6/fmybA==
X-ME-Sender: <xms:XmEsaGparBQcul4DI6e62h3zTGcWDKlSRyQiTAe4GvuzrgRLnFvscA>
    <xme:XmEsaErXSzTsoRWpCMIKluPvqgVMz27-vjIOt5UNJT2Ejmyyt7NQs2UKnocycL1XI
    j_wpeQbCRdU6E8XNME>
X-ME-Received: <xmr:XmEsaLN-TwM28VQmp-2qZljK9dzVQkehoyt2yge66xgg_i1u9YtvqaAiIM_Tq6uD9ewpqfi1GDa2IP8_xTpCBqNnD8Gwhh7ji_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledukedu
    uefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinhes
    lhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhl
    ihhnrdguvgdprhgtphhtthhopehffigvihhmvghrsehrvgguhhgrthdrtghomhdprhgtph
    htthhopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghpthhtohep
    uggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihgstgdqhhgvlhhpsehsohhurhgtvgifrghrvgdrohhrgh
X-ME-Proxy: <xmx:XmEsaF4wlSCFzD51M1CApOdUem2YDcID2xqAyHpVsamsaqvW7jGwzA>
    <xmx:XmEsaF7Q5T9hPoDVldx3nhHXuSh3mMhmGOyc2P4hk2eOkELLTJp-Ig>
    <xmx:XmEsaFjInMmTLT5vFvIOrW_rMm8u2dlsJGE7T72ID06Rj9lNS36mrg>
    <xmx:XmEsaP7ufSd_gLnbXeeDdnTvzmUx24xcHgoFwHBem9YPlx3iTj4bbQ>
    <xmx:X2EsaIG8b_lNSca99aZV2sE4z5aqNM3197wzbiDcUYUXaOQ41j3_KyEb>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 07:02:51 -0400 (EDT)
Date: Tue, 20 May 2025 21:03:24 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Florian Weimer <fweimer@redhat.com>, 
    James Le Cuirot <chewi@aura-online.co.uk>, 
    debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <0f7345713d232c46f241e3b0a9303f76adebbde1.camel@physik.fu-berlin.de>
Message-ID: <64b646df-509b-579a-34d4-aa947774aaf7@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>     <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>     <8734d1kofn.fsf@oldenburg.str.redhat.com>    <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
    <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>   <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>   <7722ac8e-4df4-2c91-1b88-c0ef59c57e89@linux-m68k.org>  <48411baea4164252cba5635b09325c8acf29f3bc.camel@physik.fu-berlin.de> 
 <23cce228-e58c-9c5d-74c7-49b0c77c35b7@linux-m68k.org> <0f7345713d232c46f241e3b0a9303f76adebbde1.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:

> On Tue, 2025-05-20 at 19:55 +1000, Finn Thain wrote:
> > On Tue, 20 May 2025, John Paul Adrian Glaubitz wrote:
> > 
> > > > As for gccgo, has that ever worked on m68k?
> > > 
> > > Yes.
> > > 
> > 
> > Why is an ABI change needed to get it to work again?
> 
> Because software changes over time. Qt used to work with 2 bytes alignment
> as well when it had less features.
> 
> > > > Other language runtimes work fine on the m68k ABI. Why is Rust 
> > > > special?
> > > 
> > > You mean other languages such as JavaScript, Go, Java, Python and 
> > > WebKit?
> > > 
> > > No, they don't work fine on m68k.
> > > 
> > 
> > Python works -- you patched it yourself! -- it doesn't need a special ABI.
> 
> Yes, I had to PATCH it. That's the point, Finn.
> 

Yes, and then you declined to send your patch upstream, and a Debian 
developer picked up my patch instead.

When I worked on this, I discovered that your patch was inadequate, that 
the problem was not the m68k ABI, and that you threw away a good 
opportunity to improve the upstream project.

I'm not talking about improving the m68k experience, I'm talking about 
improving correctness, re-usability, portability and readability of the 
source code upstream.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1087600
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1105110

> > As for the Java runtime etc. I've never tried to install them on m68k but 
> > I know they were ported to a variety of ABIs with a variety of alignment 
> > rules, that do not guarantee natural alignment of integer types.
> 
> I see. Since you haven't tested it, it means the bug doesn't exist.

No it means I never had a need for those languages on m68k. Does a bug 
exist if no-one executes it? How many actual users are there for the 
Debian/m68k JVM, besides Debian porters?

> 
> Gotcha.
> 

I assumed the bug may exist, but when I asked about it, you evaded the 
question.
