Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130B822FE05
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818951; cv=none; b=D1HqR8/5fmYJ82r1PHwBEqDT9/nA7UxKzuuMtdOpDX5f3c0IY/0vZTx7OReqrI8Yr+AMXRbZ/mTSidASChygUlgIudXaIkP/BsNyzH4qNQkdIZJntWvfDuQtP7IkxuriNz4YmglRH81UTESXe7RPXDT2aVaWBdbe+pXDwOV+a3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818951; c=relaxed/simple;
	bh=bKZKa9XB7m5WSUJq8frxQBYyTVe3lgzhqWLW/NS1OKg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ViTGmW0iowSfVGhE7y8LYVaYNLiu9oWUpLPW0Jqth1zg/4GiitsFZnVYEvl0j7DreQesbUPEfklAw0Qh6uxqT18484dpJM6MIottbJy6rMCbP5nwroVlSoxVGA6+yTDAqwvdfeBS6Tdj6rkLk2vnF3Q/gUXguLXFgbEZXL4v4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aura-online.co.uk; spf=pass smtp.mailfrom=aura-online.co.uk; dkim=pass (2048-bit key) header.d=aura-online.co.uk header.i=@aura-online.co.uk header.b=l9nOm2fC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H6oKTXcQ; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aura-online.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aura-online.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aura-online.co.uk header.i=@aura-online.co.uk header.b="l9nOm2fC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H6oKTXcQ"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id C87671380455;
	Wed, 21 May 2025 05:15:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 21 May 2025 05:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	aura-online.co.uk; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1747818946; x=1747905346; bh=bKZKa9XB7m
	5WSUJq8frxQBYyTVe3lgzhqWLW/NS1OKg=; b=l9nOm2fCBGlSyQXZniDqv7bx71
	xnwayrgLqkuwiuquc6IFVJfj7gW38WTQ4n0SvADQY6C8cQ8rW4kB1jDq2Ydo00JT
	BozhWA19H8gpOPGT6YtHVYudrl7nI6EUHMrHywRE6SHBFUQ4sIQ5lj1XOLuBdyiX
	3pPco8koc6j2rEpoDKgrLS30cipOg6UCHVDOvKU2SvCUkK5UyqMFd7IaYscx6mMw
	gWPnrM+QaquvIvi9ik1RolBXbi4hzGoVT2e2ZXCezgFGNTvhqN42BRMBIVje8vbE
	c2iDiO1e7JURL80OJv4z3p7rn4J+eJgQ+XG//Pr56RToGAn42Ams2pfTUr6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747818946; x=
	1747905346; bh=bKZKa9XB7m5WSUJq8frxQBYyTVe3lgzhqWLW/NS1OKg=; b=H
	6oKTXcQfWDWAqEoemC84ahnZtiVZMVbC7Dau7F64dEp96AtavuKnpqTkoeKSzpk5
	NqVwaTWz+vCS3THxnkl70vsoaxMR4nSBo44peqptPatYihw93+Q9m1//0Qvt2OBm
	3GDk28mcvXUVJe69wrwgwRfA2aZDdzV+0RjFHoyhiiQAcCwGY7XoRC0MznRPXowa
	YNE5xHSapIz/rU3E8OyekPtZjudO6xJvwSdkaLeoWyB13Q5XYqcgv5GHa75aVLVM
	9GfC5fP3dnWfmgo3RmVkFRz5MP1EOd6h8IxSx5vZr0MYdLvqxag2lo3w3zNQZnrI
	XXmhwlAaB4CCpMop0MqBg==
X-ME-Sender: <xms:wpktaIG-Au9yswHUTxWm53CPL8-z5a2-Z9yxAd--2bQOiV2C4wKIfA>
    <xme:wpktaBUfNQCh1CTZD-u46PRH-jeOZeYC1_fXDTjmAji8jY4d0OxXZufgPNiUNEGKu
    3DOI5OGW1roFA>
X-ME-Received: <xmr:wpktaCJyR6UeFRjwlKoHYr4mlXMZzPxIRk-GXUTSvYe-vPXPiWwmMdL-Cus46wNS8VYIK0Xtu2PehqQhLpRwFznsUlrCRum_ZaZCdMGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieelucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvveffjghf
    tgfgfgggsehtqhertddtreejnecuhfhrohhmpeflrghmvghsucfnvgcuvehuihhrohhtuc
    eotghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukheqnecuggftrfgrthhtvghr
    nhepjeeifeevudeltdekiedvhfdtffeufeeiteefieehtdfgfeelfeegffefleevveetne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghhvgif
    ihesrghurhgrqdhonhhlihhnvgdrtghordhukhdpnhgspghrtghpthhtohephedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhu
    qdgsvghrlhhinhdruggvpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrd
    guvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstgdqhhgvlhhpsehsohhurhgtvgifrg
    hrvgdrohhrghdprhgtphhtthhopehffigvihhmvghrsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:wpktaKGQMYgPxnW2V4Y_RkyL5-a1WxZPrS6C7TGS3PdGoNNOT08gSg>
    <xmx:wpktaOX-urPRZy0ExqoznDcV84yeSbl54PMdc6WAcL2SYlfsmvWvSQ>
    <xmx:wpktaNPhopmIotr4ybD3uc4SCjGvk-kT-_rYTZXTbkAbcFJCDVcdCQ>
    <xmx:wpktaF1KX1xo40hdEB1YvVw8qEMxXZDYX-gC251mGEDXk4jiSesjFg>
    <xmx:wpktaPW3eGhTXnw_OOEJ6J8fwX_5OePfKDbmdnLel0onVmecI6gKKDCz>
Feedback-ID: i51cd41ac:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 05:15:45 -0400 (EDT)
Message-ID: <15f4dc658d4f3358ec2c10796c2fe34328eed18a.camel@aura-online.co.uk>
Subject: Re: Tuple and changes for m68k with -malign-int
From: James Le Cuirot <chewi@aura-online.co.uk>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>, Florian
 Weimer <fweimer@redhat.com>
Date: Wed, 21 May 2025 10:15:44 +0100
In-Reply-To: <ee846efaa0f328738bfc4ac48c9f4204e2cab89e.camel@physik.fu-berlin.de>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
					<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
				 <8734d1kofn.fsf@oldenburg.str.redhat.com>
			 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
		 <ef0d6607b9767fb755456fe4cdd0a262657493c0.camel@aura-online.co.uk>
	 <ee846efaa0f328738bfc4ac48c9f4204e2cab89e.camel@physik.fu-berlin.de>
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

On Tue, 2025-05-20 at 11:39 +0200, John Paul Adrian Glaubitz wrote:
> On Mon, 2025-05-19 at 22:51 +0100, James Le Cuirot wrote:
> > For what it's worth, while Adrian and I are largely aligned (haha) on t=
his
> > change, myself and others in Gentoo do intend to use a new tuple. The c=
urrent
> > plan is to do this at the same time as time64, which we believe also re=
quires
> > new tuples, despite Debian sticking the same ones there as well. We are=
 aware
> > that other projects will require adjusting, but we'll just deal with it=
.
>=20
> But what's the point for doing this? Are you worried that the three users=
 of the
> port are going to have to reinstall their systems? Does this really justi=
fy carrying
> patches for many other packages?

Obviously, time64 affects a lot more than just m68k, and if we're doing it =
for
that, then we might as well do it for -malign-int at the same time. I wasn'=
t
really involved in the decision, but I think it's because Gentoo is a rolli=
ng
source-based distro, so ideally we need a way for users to migrate their
existing systems.
