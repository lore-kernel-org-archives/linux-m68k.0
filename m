Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF0E13FEE
	for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Apr 2026 04:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777090021; cv=none; b=VcvQCeNDMzr8jDXFPJ8d1q/vJgeAysucVp3nDkERmg/9R+Ah+W24/0AmU45lz87axsFF81wBfFpB86Ol2YTnpFMyBwduUZNNxd7xqZiA9n80vXHT/6e4rzjEHJ3pRDLO3JFtP6ECSg13KT0Mx9YIfpb9CSyubFZGn6mBCy8Wrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777090021; c=relaxed/simple;
	bh=4/5EMmCwj2u98XLfBEk71GDg6eiV0nhb5trYJOrc6aI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KZYssGa/WSf1lZwUOZeJhTINsnwQnCsB3LZSKNc9eQn0d7TnbEop43UY2eIjzZYgZ2kJSCocyxU6NEjA2T/QcRiPm2jyIZtN+t50J3xQpKCfAM+SmWmlz1Ho7J/wMxfXwex7HcHcI2IzA1RBt/2HeSNw0OqebAEsgUpStAyaEWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SWZpETH7; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SWZpETH7"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4AEF47A006B;
	Sat, 25 Apr 2026 00:06:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 25 Apr 2026 00:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777090018; x=1777176418; bh=zIB4pj1Boj92lNqYzPoS2wcag3UdCbneSh/
	Islg9uXU=; b=SWZpETH7K2yvdrrKQoJCmMXP4THMKxlm+kPWVeox+32pOXCI+i3
	fCvw+XO0Ma1XeglIFuJd5KmkQJxUjPPi0oNmpiDFTSClXYX2sgq37tXec9rXpDLJ
	XVmqvBBBEd5lTpcf/3T22mx74ZlxMv0GGLW/nS9/d6ZLXPiI1zSOX0IqwnsLbWW9
	0xZOg7p7v0xSA6229cevzHZ30TKDXaSCn0lEupOsNbp5ljuIDpjvKJ2CWqkKYbVe
	AerCRJ4EzOEhPe7krIqdmFaOj+cyapkRC76mcecaafLTw+zpT70J28raFmCpPEm3
	Rqx2eZov39i9iQrsCDPiuI8EQJv+q1Fsb8Q==
X-ME-Sender: <xms:4T3safOQ_Pq6dtb0jYV5MWjsWVC28dU0aeJxGd-nc7vpsAG83jmAoA>
    <xme:4T3saRuNkgp6kzg9k2kfg_ETNqpcYlrmP0S5MRl3MV2TVY6oOMxpt3fjeZyenTU7a
    0ETc5hxp4gAzbiOG_yRhqcH3GXl-aUIbn13R4XlHNUh_hnaouAJ1A>
X-ME-Received: <xmr:4T3saRXScRR5iCHfi1mBE7BbA8yGv6R3nmnQPpwVMFnVzDTuLWNUAmvZX-yLhGX-xQftj2fORAJbclTBGOXm0MxrNXH5Y6kFlAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejudeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueel
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepfedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:4T3saRvSIuMlbl4Ec4IqB1olOrqVX5WQ4YLG8oMlHIMZ7R94rGuGSg>
    <xmx:4T3saVXBTocHmqOdXNsTrIvhttn8VzC9WCDyWwyzgYvHrkAHZRD0EA>
    <xmx:4T3saclvxbETjm5WKLSj3hE7Z0XAC5e03eACg0R4-przdnxz3bbtWg>
    <xmx:4T3saWY8tdxYiC7D7RnzxfSpdhKYP0-uMa9sMSkhASulWLH8PuGjwA>
    <xmx:4j3sadDbVmTdpVxDo57BB102-BjfxwBFV9pbwwoxkbG3X3oEANGVaPwo>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Apr 2026 00:06:56 -0400 (EDT)
Date: Sat, 25 Apr 2026 14:07:10 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Johan Hovold <johan@kernel.org>
cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nubus: switch to dynamic root device
In-Reply-To: <20260424104011.2616970-1-johan@kernel.org>
Message-ID: <92e2b920-041a-78a4-e4b6-c5a7c579ade7@linux-m68k.org>
References: <20260424104011.2616970-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 24 Apr 2026, Johan Hovold wrote:

> Driver core expects devices to be dynamically allocated and will, for
> example, complain loudly if a device that lacks a release function is
> ever freed.
> 

Yes, in drivers/base/core.c, there is a warning in device_release().

WARN(1, KERN_ERR "Device '%s' does not have a release() 
	function, it is broken and must be fixed. See 
	Documentation/core-api/kobject.rst.\n",

But there's no way for the refcount for the nubus parent device to reach 
zero that I can see. Did I miss something?

> Use root_device_register() to allocate and register the root device
> instead of open coding using a static device.
> 

Well, dynamic allocation makes sense for busses that might be instantiated 
more than once. But I don't know of any hardware like that. The nubus 
parent device is a singleton.

I suppose I could see some benefit to converting CONFIG_NUBUS into a 
tristate. Maybe the module link in root_device_register() would become 
applicable if someone wanted to do that conversion.
