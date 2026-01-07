Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DE338927
	for <linux-m68k@vger.kernel.org>; Wed,  7 Jan 2026 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767818726; cv=none; b=U9QJRpdA6tKwQOYNEay5ciKs6w0LgqyxIW6Em2oaMxCt5+8jJbltf9QgRYBe09sk1Kh0LbyaccFSPeOw03U6WyEi/GMIapSgDPyRAXouMxKF0AeXH+h6Vl82y73uTuasyUixjaxKcXHhdsQ9j+IFsEgadlqACsEnFWdeC/fJ9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767818726; c=relaxed/simple;
	bh=0/65yBvBrTXABOH0L9xcdPcm5FYmjwV0sHKdzivBh4g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=avMqqUGAgjPoYVkKchMYUKIc7o8lK02bcmH+ufBTbotzUCDi5jox5wfywxq4i2mCp4zmw12FzcPtIs9IbIHu6mR4/GNJEShSh7nGYIi2/coZyYTB4CZ/05vEQWLRwaQpM2mcO7wRUOioKXwO42K6dCCBhEe3q5+p2pbbM5Fc0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Epcxrz0J; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Epcxrz0J"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 7A5031D00090;
	Wed,  7 Jan 2026 15:45:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 07 Jan 2026 15:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767818722; x=1767905122; bh=4osfbxmnznircWIL7H36ccIkimonInlPJCO
	cMTKlsQg=; b=Epcxrz0JjkVaSICpzBv55d6yiIboK+rMr6mgORNkPhy+6+uFf9c
	vL41En/k8n3iFpjgWmbfzYw4A5m9KvZx5bN1kjs0TvnN5KflV3xd3Be9CooDVr8r
	1J+NmTNBXZWUaNBUNc5B6RkuE64NORdJwvXfJSZwaRyIhu8Rgur76Sw1kpH8crkn
	1usavSate+xnkRmfCjI63F0j1FFOqEsGnuyjzBvtS6eOO19Q5JDWgQpp4ZUkLurL
	Awwggsrr+9uLLBF3GNXSD5kJjz2VjYli4fvInL7RMDPpG8mjP+bWErrGB/WRSDbj
	Va9j+Fs/3i9/l2nrkBAgm/V8rewjVytfXMQ==
X-ME-Sender: <xms:4cVeaZV16xJSWSV3syN6K3L_ZCTFod9dWb4PY60r5F0l79a76bpxHg>
    <xme:4cVeaVns-BV3iJmfk9Fa-NiR10Bt7JxWrX0s-0YmF6kXE51AkHVS9XH0pASvkPihE
    vYQhIg3kW6df7Vr-QOat4zwKcUiA51CcUMN7tXrIMMIOXhTxNwitb4>
X-ME-Received: <xmr:4cVeaXnoI5K0mQJXTkqe4NlddHIOjkiWYel3hVkDfpY5JRf_VwYzWeVyKxPEQMxB5s86gIWHUYHcxTT6jE79d48X0dQOJHpqfbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdegtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpth
    htohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghhlrghu
    sghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtoheplhhinh
    hugidqmheikehksehkohhllhgrrdhnohdprhgtphhtthhopehpohhrthdqmheikehksehn
    vghtsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdrug
    gvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslh
    hinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:4cVeadaRZuwR5nln0AA-V7gLw6G3aDzHLFInziCISUTuuQkNZ5fSeQ>
    <xmx:4cVeaRQxGFvo3xv-47yZ_NsmnA6YIu9itPF4rv7ScY0gY9GvySYOjw>
    <xmx:4cVeafuSYSmFeoXT9Rr7k9PmWfbQ4Il7rHXqxCUJDFMvtP5RortNtQ>
    <xmx:4cVeabFGffNYsyTPxzSARqShhCwGIiC8rC35QHm4VCVsVSK5UIfejA>
    <xmx:4sVeaTsMOCIPjNeCTf3nW0PnIxR0Bze57I5Cr1F2PB9cuANP5tmTCUR->
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 15:45:18 -0500 (EST)
Date: Thu, 8 Jan 2026 07:45:18 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    =?utf-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, 
    "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
    "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
    "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, 
    =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
In-Reply-To: <baadfe05-0893-4182-8c7e-7ea816aee905@app.fastmail.com>
Message-ID: <3fb61e6e-2bf6-df00-5806-16e06e74f252@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no>
 <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
 <CAMuHMdWVwXq+PzW_K1Lkn3hCAZuL4ps2VPEng4tB4wuhT+oytA@mail.gmail.com>
 <baadfe05-0893-4182-8c7e-7ea816aee905@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 7 Jan 2026, Arnd Bergmann wrote:

> The more interesting bit then is what happens when you actually turn on 
> -malign-int for the kernel itself. There are many drivers that change 
> behavior, but mostly this is going to be a fix rather than a regression.

Sorry, Arnd, but wasting memory is a regression not a bug fix. And if you 
do that on systems that have no memory to spare, you're probably going to 
cause -ENOMEM failures.

If you want to fix issues with CONFIG_DETECT_HUNG_TASK_BLOCKER or 
CONFIG_JUMP_LABEL, it's much better to simply align atomic types, as my 
patches have already demonstrated.

Assumptions about atomics are prevalent. But I reject your pandering to 
developers who make bad assumptions about integers, or those who would 
prefer that all architectures were the same, as if all users were the 
same.
