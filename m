Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064BDBA42
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 01:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749865552; cv=none; b=ssQmYlcs6a+vKE3P98QG5FpJ+sQbBlL23w6V5lgUJLgjvqf0KHD0OCGcBNUdeSsbXM9Cx1hkyKLiH087zM/HDDZR01eXA7eyE8yI1E6it2GDHDvJYKqawPRlGNYSKbshrG2WXh/Q5JbIzO5BHGusyJShMkouj+0ZRKHWRQmzMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749865552; c=relaxed/simple;
	bh=XLC04I2P/JWXJAOSXMIhbWvLOPdzVoOsRUANKuzG3NU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rMnDl16tV9oc96wHUwcZ1kjXXcCbmuBGll0UEn4d9PZgVxnA/WDvyrcu2oIvvAZVcQSefz3UpYmsRo0h2kGKaTr2cxfRKeDNlJpbl9iRO1z2GQRyD7UDpklnQbkRlbtiZ+PHcMIhoIE61dAIUQfAhCKNV4SMUukQbcobB8EVUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ecp9zrbs; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ecp9zrbs"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id F3F7613803B8;
	Fri, 13 Jun 2025 21:45:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 13 Jun 2025 21:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749865548; x=1749951948; bh=wvBi0BPzvRmGlG5SEJUJKDFGWAEQRYyWGp/
	gwOQyPhw=; b=Ecp9zrbstlBOZT9QbGkENR3n0mYOdjutxUcIuyuzCMr+NfQl58g
	u03003HShoPC0LJezYn+MP9WJQ9D58un/UVcBhW+IAhOi0h9SOpS6qe3/zLlSHg6
	mI4n3hiDgvK2iZbHFS8DGs16ItAor/GqmA9zM6hx+vysxyHhvoA5bfgGEDVYf/zJ
	MpwWT49RPXJnebqG7pdR+Nkq1g+Eq2y9FK7GP/pxIHmqwkSOWmyHMPwTCDzrDILM
	TLd73iV6+cIRw/fI5sTSYBvX/WhBX/iycWL4aH/i2j6Q8xuyPiSTOMXMEsrOsdVR
	upsHnGl1WZfQ37jaWxeSWH9237JIya8taoQ==
X-ME-Sender: <xms:TNRMaEsRzNl28mUgdsOUilAiT-yPA4SIW_AzIo63dpR214sFcO0scA>
    <xme:TNRMaBfbhla_EH3q-DVSRc_-f-fiLr4QWUIW0iAmBjHRohTR5u5WieQHNfg98MhEa
    8_jdb0LQbbuzN4imbQ>
X-ME-Received: <xmr:TNRMaPxK1uKfn8g3U0xo-6q7hmsADvtltZpzG9ThoLqY1Fbltz-WQPrFytMl9emCdGgTLxZSV7jmu2kIsJJHO3Xfh2wLQ88iTZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigse
    hkrgiiihhkrdguvgdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdq
    sggvrhhlihhnrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdroh
    hrghdprhgtphhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghl
    ihdrohhrghdprhgtphhtthhopehpohhrthdqmheikehksehnvghtsghsugdrohhrghdprh
    gtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TNRMaHPBzwnW-ho4KA7tUvRPBDv5tQ1iz_SQ55hMLlKSUiBelLDjJg>
    <xmx:TNRMaE90iiE-xOCoaI1s3GmPOgBdlsS1MMI0LV_ptghiDBjl7gpwgA>
    <xmx:TNRMaPUbLeiS5-GKECAUe5UKkkmlYDbVpv1sxwKdsochT6suILGNhg>
    <xmx:TNRMaNeWzBDMmIZgMX5fuVrLgr3TIuTauXBtQ24JDxCHOafjpMQQUw>
    <xmx:TNRMaCM4tonI49rdah4i-zpWf8FgCvMSAWbRwQiSW_yXLx2laA0WFB-b>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 21:45:46 -0400 (EDT)
Date: Sat, 14 Jun 2025 11:46:35 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: ALeX Kazik <alex@kazik.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <CAFFuhJor0woLg7kK1OZTt0HG3=DT8f=VL6M_bVzJeyF2vD8y9Q@mail.gmail.com>
Message-ID: <fd94038f-cf6f-b936-220d-aaff68ce00d4@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de> <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de> <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de> <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de> <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com> <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de> <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de> <CAFFuhJor0woLg7kK1OZTt0HG3=DT8f=VL6M_bVzJeyF2vD8y9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Jun 2025, ALeX Kazik wrote:

> And I think that the people who keep this running should be able to 
> decide the future. But that is only my opinion.

You're quite right, and that's how the process has always worked. The 
discussion is mostly spam, given that the question was always going to be 
decided by those capable of writing viable patches.
