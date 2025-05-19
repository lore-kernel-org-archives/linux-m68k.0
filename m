Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048A20B1FC
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 21:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691506; cv=none; b=DAcg6R4zbAg1zAu6SWjHvNn5lQAGdne5F8Zl1lBRczgCxhiA1lXxTCTDM3+8tguSJ3NR9AB/BYntfCv8DWcM6KjdJsCklGQm7RHgrzGePX17Y+dEyq7DoiO0wGNMY4QkOjsqz2tourc7p82o2D2qwTfKLfNRvUlWe5tHLRvpSjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691506; c=relaxed/simple;
	bh=n+SyoapsbO0cQe7DUVuJ/6jUb/CbaSYuKmC5MRMV0xo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q/eSRqqUb+qUXap1wTubfnXBsyM0u9FoKQ6OI35DBc0oWogpzs306/YPkjRq1Sh5B8ab596ki0IROIUu1QyxQwWuujuuSRKgNbNIYF2NTcl81IpLmZL6GQprJNyxHQczoau2H5g5wjTRitSF5yflZV2eBZ6+5iryGJLp9RD8b24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aura-online.co.uk; spf=pass smtp.mailfrom=aura-online.co.uk; dkim=pass (2048-bit key) header.d=aura-online.co.uk header.i=@aura-online.co.uk header.b=qFO/FarX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gMMLGm5t; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aura-online.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aura-online.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aura-online.co.uk header.i=@aura-online.co.uk header.b="qFO/FarX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gMMLGm5t"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CCEB4254012A;
	Mon, 19 May 2025 17:51:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 19 May 2025 17:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	aura-online.co.uk; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1747691502; x=1747777902; bh=0dFtzLSQbT
	Ip9wgMXR4i3gvv7IfzNtcM2Ns4OzD+SpA=; b=qFO/FarXje82fiFSJMTWtErjnu
	b0WWwgdcUbOzlPQZkmGtTEyglaPqP310+9tTAQI3OTaCwnpkOm+P95pVWTJBsBDB
	jVpRirflQTf5xjaUz14AJepNJ3r+EFs9nylmA0htQNqnscEs8+QoI+x62eT7PnnD
	EWnYxaKrvFs/ac+Qb1bOVXCFFoZxiiLRvjsqW/l8eCcdzvTQVkYqg+Zq4//xpIZA
	ULzKThfV7WWhGf3PoY0FMtg+8gBRUsY38+zaRjs0xUz82VsOaqC8ny1KsZQmK5np
	7hUFwvk/csMZYsl56mSUhkDbHWn2EP0WWMagNjpWOy2X9ixmKteV2zt29OYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747691502; x=
	1747777902; bh=0dFtzLSQbTIp9wgMXR4i3gvv7IfzNtcM2Ns4OzD+SpA=; b=g
	MMLGm5tDMgBLB8zEF5GKmoFBHcPaB3erLCWCs/vir/AahTIOiE6jh4k6b06bXioo
	B7N9tayL87AwWKA9VKrgSozX7wOhu0PdHJCph67NmNbAWPRS9YBU7+/5ioVyBd4K
	GThisxC6QxAhZDJwuFcDDsqW+gdnXdlwVNipmpKtiLr+nIPPZXBwVg6LA65GAKyJ
	Chzoyibje4XrucSk7hItEbHlzPkWUJKKkNSPRpheZvf/pw0J70AbWo6xouigVsPR
	Qq9gnfESE1zvRRRr+GLFr+L1P3yqcE8w+92mSBSZipzTRYzIdACfXQtgfDSg483+
	AYjAy1oAEuHwshFeoOZ4A==
X-ME-Sender: <xms:7qcraHkfltpiHsQ6tuTyOwFa9xL9DnDi65Zy58r4Kn1wF9M2cIc0lQ>
    <xme:7qcraK04tCvcYG1vozzpDrK2gJ130MQs6WM04OtaEsu56MHm-Y_QOASNJAlaXO62I
    A56pSi508iGEw>
X-ME-Received: <xmr:7qcraNrng8MEcZi7IrvfuwooX5lAMBLzNBH4nhHbs-R_CXKTuHN59ZRj1nRuOW2-EOqM7PiVWVQmoWNW-5LICrRND_kb9S7kE-g_7Fqf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddt
    reejnecuhfhrohhmpeflrghmvghsucfnvgcuvehuihhrohhtuceotghhvgifihesrghurh
    grqdhonhhlihhnvgdrtghordhukheqnecuggftrfgrthhtvghrnhepgeevveegvdeifefg
    hfffueevteekjedvffeludegieegkeevffekudetleffleetnecuffhomhgrihhnpeguvg
    gsihgrnhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhnsggprhgtph
    htthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiies
    phhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehffigvihhmvghrse
    hrvgguhhgrthdrtghomhdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdr
    uggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhisggtqdhhvghlphesshhouhhrtggvfigr
    rhgvrdhorhhg
X-ME-Proxy: <xmx:7qcraPn_Us8AYRSaCBL5irvPnj_sxbCTFqcp41Y8MhAL7nCDYNLX9A>
    <xmx:7qcraF13IPw6aB1OMGNEHIaoCsNwczVXIumbz1HzhHq2u6q39Flu2w>
    <xmx:7qcraOv8srWYv21ViWkpXPwTh5iyHtx0W-8W9bxKGXAC6u-2WIJdZg>
    <xmx:7qcraJVjspHDaiiTdm7qO40BDjW6PdV0qaqtsY3QrNiUg7QGjzNsIw>
    <xmx:7qcraG3aaX3L_gYgeJiumvtCQEjIxraMG6u7F3Z2Hy0NBoJYf7fTWQu4>
Feedback-ID: i51cd41ac:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 17:51:41 -0400 (EDT)
Message-ID: <ef0d6607b9767fb755456fe4cdd0a262657493c0.camel@aura-online.co.uk>
Subject: Re: Tuple and changes for m68k with -malign-int
From: James Le Cuirot <chewi@aura-online.co.uk>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Florian Weimer
	 <fweimer@redhat.com>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Date: Mon, 19 May 2025 22:51:39 +0100
In-Reply-To: <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
			<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
		 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
Autocrypt: addr=chewi@aura-online.co.uk; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-05-19 at 10:24 +0200, John Paul Adrian Glaubitz wrote:
> On Mon, 2025-05-19 at 10:14 +0200, Florian Weimer wrote:
> > * John Paul Adrian Glaubitz via Libc-help:
> >=20
> > > I was just looking at the necessary changes to switch m68k to 32-bit =
alignment
> > > and I'm not sure we need to do anything about glibc. I am documenting=
 my current
> > > findings here [1].
> >=20
> > > > [1] https://wiki.debian.org/M68k/Alignment
> >=20
> > Why doesn't this change need a new target triple?  This change alters
> > struct layout (it introduces new padding in some cases), so it's quite
> > incompatible with what we have today.
>=20
> My argument is that Linux/m68k is a pure hobbyist project and anyone invo=
lved
> can deal with the changes coming from the alignment change.
>=20
> Introducing a new triplet would mean having to accommodate for that in ot=
her
> projects which only know "m68k-(unknown-)linux-gnu.

For what it's worth, while Adrian and I are largely aligned (haha) on this
change, myself and others in Gentoo do intend to use a new tuple. The curre=
nt
plan is to do this at the same time as time64, which we believe also requir=
es
new tuples, despite Debian sticking the same ones there as well. We are awa=
re
that other projects will require adjusting, but we'll just deal with it.
