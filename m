Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F5C19066B
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105071; cv=none; b=r7Z5p6Q5X8TN0x72ss/EgO6FZ9aji+NLRQj2LKFuzwRBqy/KMXPJOi4SGg5emkb/B0BD+V73hLbETBpZoyNTv3/nPUzSL4YrPb5n94OeW8V9Qb8+t+FYJTfLrwKwXPs6KPP0hiS3KVThZmvqANTh72fr9aoKfvWct9O79gGmLjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105071; c=relaxed/simple;
	bh=LZ6ZTVxp+87sNXX2pfuj9/QnNkmGSUZ1aIrz7rYXunM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LALG08Of4EkAE2RWC3a2wKoM2gTAoqowM1Lg4e1C5t72JX5S6RpBpLWP7Z5xf4W0jgMU4akzUq4yz7HSbSRyAlDTrSrVLLlhiFor69Y5SUj/iA+hFII9hiE2DyIPGlluXTXMSxYAYrK3SK0xDVDSKZg2vCBsSe4DTADDoWQla+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MrN6Kuk6; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MrN6Kuk6"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id E659511400E7;
	Mon, 28 Oct 2024 04:44:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 28 Oct 2024 04:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730105067; x=1730191467; bh=NmZBfDRhqtCF8i5Z6tj8pt62XQ9V
	YO7kPWBimblxn14=; b=MrN6Kuk6xj38lHfe6O4ZDGZeya90zG28wwfYuybCtElO
	7Gq9o9NDY09RjslzgiLLW4UXOXyEElDZxEmiqCVthNgI9TPnf55L9RadCtCzdNwa
	TxZOoMJ9w6vwIakA6mqc51KXzQ+5ni4vnOWFIgRJ5jyvFVhBMnUgarR/rDiA+7xj
	jgvJomlEWrt7v3OSX/nMV3qd1UtwRJOAAf/BAcULoOZoQbHcYJiQzwWKny9Kdopi
	8WCAEpU1wHAfVGOregCbH3sZsqJO/6ngL8BgAVEoxnCIRNHCmhRMemmGeIw4ggr3
	bay6hDs/zPtKdIw2g+ONQNVE3LYZuvFR+1esscXHGw==
X-ME-Sender: <xms:604fZ89fNFwgLAPOg_vsUtSRql92p-q8m-IS5ly5rv75-LQcPJpeug>
    <xme:604fZ0vhKm2Nk0i56uVgcftXjR8_x31-5xf8vod45PnRLumdkBo1eihYS0Y9Nqc6I
    BhWDTgNd-YLNP-iCyA>
X-ME-Received: <xmr:604fZyCnL7RL4GhhoB3e_nh6FUjDO0gJIzg5W6xOlFpQBN0WKNQ8_9VsInO0LziG_RTsfMN3kXk-jy5Rs806ytWTCd0arjfdxhM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeen
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleefkeelgffgteekudekveffgfdvueehteff
    keeltdefjeetleeijeetheegleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepthhgsegu
    vggsihgrnhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpth
    htoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtth
    hopegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhkpdhrtghpthhtohepshgr
    mhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:604fZ8dU1J5c38ThdyhM7KQUa79vtyqW2dnRo2kyxo0VVP2y5d7UQQ>
    <xmx:604fZxOnSlpsVLgnOvoTNbNPZtCd4PTByiwViHJWvbdP2nxHcFgG3A>
    <xmx:604fZ2nRToTUTJ-BP70RDossbCOgS26Ry1mhAAryMhR5OHn_DIDjVA>
    <xmx:604fZzsRHbPkAbtYXkZzS3rpK1ylLK-PnRdxtvXBz6f451yvt6BLxQ>
    <xmx:604fZ6iXlhGdqLJWVYiBs3gLUz32A4kYRCXSVeakJGrboIfywwOuwkbB>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 04:44:24 -0400 (EDT)
Date: Mon, 28 Oct 2024 19:44:22 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Thorsten Glaser <tg@debian.org>, Arnd Bergmann <arnd@arndb.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <aba54d2b46a1e08f578e008d084463c7257aaba3.camel@physik.fu-berlin.de>
Message-ID: <d195e1a1-94d0-6aa7-2193-5f7212829b8e@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
  <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>  <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>  <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>  <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>  <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
  <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>  <b25dbb5f-6336-4f2d-9d1e-4d5da13a1636@app.fastmail.com>  <0c34ba23-5256-0140-59b1-6a5283f6b763@debian.org> <aba54d2b46a1e08f578e008d084463c7257aaba3.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1201555931-1730105062=:29"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1201555931-1730105062=:29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:

> > For Debian, we have superh and i386, out of these. It is entirely=20
> > possible that Qt et al. can work with this, but these all have natural=
=20
> > alignment for quantities =E2=89=A4 32 bits.
>=20
> I'm not aware of any serious issues with alignment on i386.
>=20
> i386 was the original target for 90% of the software in Debian, so if=20
> there are issues, developers have already addressed them.
>=20

And they did so without needing a new ABI...
---1463811774-1201555931-1730105062=:29--
