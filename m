Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BB1F941
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749864817; cv=none; b=N4xCUOK66R6SOJpFH0b7zNtIFpt1qPHpQTgsog3SWoVcDBoRP6P4sTnv0vKvOCEbuLnH9XsRXkZTm1Ve8el9mc7ks4I5/G5FeG1gRq2gRC+opnozV5pj+/pye0OQ5KRP19O/bM9QrDAlik6Rgiaod8Bf0oAx2RT17JnYqWDk1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749864817; c=relaxed/simple;
	bh=BEHsH0+nghKooDEPH9jmyNNJr1Usn5OYCqIWPBIWRJM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BH5tF9DqMgcQr5kTzP1fYF2OPB34oJ+q5uXsW+5AHNIQD2XWbhCd1AIiUb8JPZNx526R7QmwnOBNygVX73bMEybntksMByjuAHYxhSvD7Mb5d7nL4dqJR7eulRFR0RwZ/vGLpEE7f/xdMB2udm+H1AfQrWIN4pqPSTy9t9yeITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lEW56rLA; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lEW56rLA"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 77063114017B;
	Fri, 13 Jun 2025 21:33:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 13 Jun 2025 21:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749864814; x=1749951214; bh=pWSHj4rEJaP8FQTJD7nweL7xchPLQaHw7CG
	jA1hK21Q=; b=lEW56rLAQi5P6gqxGxBmM248nKMJZ2cLeOkXyUvX5FIGdNUsW5q
	yYyP1c4clB5ecoXhWxOkwHbcRKVdyKtd/qO2rtAZRo+yfRs2XphDJNOe4oEZDp/a
	HsZCHgKMkEjvYj+YiJZKYfjT4y14K3iZ6e03/XXCowqA+k2XDenCTFTwwgP10gh8
	J+rJW8gQgvmuzmSH6UaQyX1WzkMhVfTJR5S8CAyg2etnruyvnGi6mb6NTzCUZVms
	EMfFzIIdcd/oqKui44iJeShoI3bYgh3PnuNNfcgq8SvHZ2kOFDxwJup61ynSKTxj
	vnbB8oa3YlHot85/yhYREFBKvB3F+fRyfGw==
X-ME-Sender: <xms:btFMaAL3d7Bab1dnCQwHHl89chW3bVlndEya9roEPUeGj-KqsNSJvw>
    <xme:btFMaAIUzqRfZIM_OddbiUSo9LZE34mebOE3URG39NWvVggplV3on17z7c2YcdV8B
    HQOMf_z_4k0vC5n3EE>
X-ME-Received: <xmr:btFMaAup8HaBtDr8gMx-fA81IXOfaK2v9tbpOPGko3iOG-jphf2q7xoI6TosRkLU8Q-ua0oZ7SvOOlG9FKm5QaHWIWRfM1kPN2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghusg
    hithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrd
    hhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtohepphhorhhtqdhmieek
    khesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsth
    hsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:btFMaNZHX4F2E38xUK8LOWAQl2a7IZsArG_p_j16Lu6QbC6kCjCYMw>
    <xmx:btFMaHaep7n3-9EB8Kd0d9z_dS0pxJrt4oFiIJL8bTzI4riG3NuFBQ>
    <xmx:btFMaJAYa47HdNNbTnaODfI32cRSLKDwYxJ__3eSDFavb3zbO7yIzQ>
    <xmx:btFMaNZmCNPhwV4qxCGy78cEfGYIQTuUH4bBSDY4vkpDY4vZiiZe6g>
    <xmx:btFMaAh1BTtK4skhzjOkuHkuuRuq7vY2QMOKHayGFKpsie138b5PIIxA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 21:33:32 -0400 (EDT)
Date: Sat, 14 Jun 2025 11:34:19 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
    port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <3e499af848b28c640334f329010d3d45c0b12c95.camel@physik.fu-berlin.de>
Message-ID: <6cdafde3-029f-d3fb-ab0f-eab5d71c7594@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>  
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>  
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>  
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>  
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>  
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>  
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>  
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>  
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>  
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>  
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>  
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com> 
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <3e499af848b28c640334f329010d3d45c0b12c95.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 13 Jun 2025, John Paul Adrian Glaubitz wrote:

> 
> I really don't understand why anyone can make such a suggestion and 
> think "Yeah, that's completely reasonable to do. Let's completely change 
> half of the Debian distribution ..."

But you should completely change half of the Debian distribution (package 
archive and package manager) when doing so serves all users of small 
systems.

That's quite sensible because all systems will become small systems, if 
history is any guide at all.
