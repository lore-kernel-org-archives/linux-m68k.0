Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57ED1DA23
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Dec 2025 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764898509; cv=none; b=eoLMUFQdHVHGzJjP0KIb9hd+nJ1usHd4AZFauoHkXXRUuRZJTyAGMaSIMYS2brbVznzdd3YAQnfoXp0hoFIiATVg2KRAo9zztfXW4v0Gt1GjaTznETABF+OYDHRBXCexif9bYLUc8JJuf1QKVHN3cvfR4LkcA45wSfCnvKnizYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764898509; c=relaxed/simple;
	bh=NkjZyJNs9wpAMrcbs4u78XLH89pbMyHFAAOxoGOBVC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVQuavDJSlzsaqPVYUuEmE41bjjlHWTB0Ik6D/71nqkdneX9lrv4h2RoHyGsr5D0p8Sn1c5o0ceZTRMDR0NxwQDTKX4pXGwKnUiCILfSkZ7Zj1EN2YlwJAMNd5pSXpalfu+A1ugz6HXl55MbQF4NgjnOWuhA9uMMvNlzlISIAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=HqPyZEBC; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="HqPyZEBC"
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 05FBD589B33
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Dec 2025 09:58:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C00F43292;
	Thu,  4 Dec 2025 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1764842277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j0JfA9qeZWT32I3zxoCJgKu5UVGNhTPQk772t2ZnUNU=;
	b=HqPyZEBCaEqU1FPt2tgP0xr8uAEEqIjeBw0Z+4e0HaDQNLEDshPQ52wukmcG02Pb84m/pV
	HzMIwb4KyLcjoxpoLE/wMW3EXJfLZMU+GM+nBv80L18pRK+GQy+xfK7PecOhraWmrSBu3+
	DV46x5XkQAF8aqQiqHWejsUkTk3DXvi2+/KpBaEXd3+XGYcXax2a1cF1WXHePMDIGn+H2S
	K3R/0FAToR8g+maMq7IdM6Qn2HoJMFpIerCDcTL0tbjLNG/hgjnxj6jiTqgeYBXvF7fHHT
	hl8sa4kuFxWPwiKb9m00czh6MHJq/4reUiBg1y9yNN7vB8HnjIumShsv88OTdA==
Date: Thu, 4 Dec 2025 10:57:55 +0100
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	kas@kernel.org, mingo@kernel.org, seanjc@google.com, bp@alien8.de,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: implement runtime consts
Message-ID: <aTFbI1RKsbEdR2Ph@yoseli-yocto.yoseli.org>
References: <20251127000505.2117956-1-daniel@thingy.jp>
 <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
 <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
 <CAFr9PXm_8Lyk5rPMWw+mAzu97RRfjLj8NLqz5K0Po4p9PM6FOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXm_8Lyk5rPMWw+mAzu97RRfjLj8NLqz5K0Po4p9PM6FOw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhephefggefgtdduheelkeeuleejjeeijeeihfetieevueeftdeigeeuueefudevjeefnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmehflehfheemfegrrgegmeeljeeljeemfeehvgeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemfhelfhehmeefrggrgeemleejleejmeefhegvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegurghnihgvlhesthhhihhnghihrdhjphdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepohgvqdhksghui
 hhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehkrghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvggrnhhjtgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggv
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

On Wed, Dec 03, 2025 at 05:06:52PM +0900, Daniel Palmer wrote:
> Hi Geert,
> 
> On Thu, 27 Nov 2025 at 19:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> >
> > Replacing the macros by static inline functions should fix that.
> 
> Thanks. I've done that now. Any comments on the rest of this?
> I have a few things like implementing jump labels, a vDSO to get
> around the sys_get_thread_area() bottleneck to come after this.

Hi Daniel,

It would be great to have vDSO at least for sys_get_thread_area() ! I
implemented something, but if you already have it, please, submit a RFC
I will test on coldfire !

Thanks,
JM

> Cheers,
> 
> Daniel
