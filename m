Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFB1D529
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709769109; cv=none; b=sYt5MlYPr0QpIk+J4f84KrS/Tz+fDmtKL9KhDSNRlOpeJ0HAfiKMMZOpKtj9UTS1Wf4bRlbml33kJSmNQu1K5E0bAifWaN0jB24nqs3d8rPbhyafRbHtQcAs8HSTQlCOcrHUyu898VX4SK1KjnSAZVgkGxIhESWEiYWKHoSlJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709769109; c=relaxed/simple;
	bh=ykdsNxCEGUj8UipnOD3IiVCKLB73OURZIwcJ23o8H/o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XWp/lserORzV7/eibaJDPFAlqDnmMr3t/Na9kzrfBLuKnczR9CTSAXMUsg5bV/7HEunza2WVQgF+EbMFgZe/cm0zELXmdw0tDYmb7G07qPbfOgqc/P++jutUyJJ/c2o+RN/g30ymPbnM+3EPXYjLa14gF0ht8X+fN706uHIbWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jWbPoUAz; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jWbPoUAz"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 39721180008B;
	Wed,  6 Mar 2024 18:51:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Mar 2024 18:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709769104; x=1709855504; bh=nFOKxiD4VU5AT1d/s35ek3APIa7y
	UrIrq4q4ZGTvB7M=; b=jWbPoUAzPGRo9hEAV0O8hogWgrxLVsypjhbS9//+0p+h
	M0dyTZWoj5xGDzF2ifxpfd/Eh6XTCsxcDxs79RceVIw7/bahTEgI/jk/oU86NMtx
	Igm1co4idMvDaLG6XwPSUGU1EYZZUQl99fOW3B4ZEt5o/HFbyTy5BMVk6fWL0TYn
	Ftk375pgTLNzh2KKhLeTaTpsG67MYfgNLw2Hfoe4oUQXPgrO41gVztVX9e9elK9d
	61yn11SiZL5S3m1n5qY8wxncpHrQJkgotlDt9BPl5IHbPOuMT3OfKheJU84l2wre
	VNf63Ik+ItcUZK8sHDWgru0hMI/8ZVfAT82k7JLw0Q==
X-ME-Sender: <xms:kAHpZWuO7hubsIvlNEmAzRCG5DuSL6L4BTKCQ2puHiTGgx_b3ZV7ig>
    <xme:kAHpZbfhIJX836gy_uLtw_FXyArkv5YBn3awFQIoVjKAs3n5hUBuONJQ6Lt7zvI0c
    2TjKU4wtWaoVizqmek>
X-ME-Received: <xmr:kAHpZRzd3se2UQOFzFUm57-_nU6R2TZOC44H_Zh4kGpegsdkO_czTKGqzI641QEs5cRfpVBSR3SGd-g07L2a7vs8mipEMPw9KpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledriedvgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:kAHpZRO5PrehxzPnDz_2ZSSQGbzgqkoCdLy_-rA26-yO7JGVLPakNw>
    <xmx:kAHpZW-jw7MQ7fys9VEnLJSEsHP_tl45VC69qoauvMFcN0cB4Bdi5w>
    <xmx:kAHpZZXsXLwgGZH2zTMhRoVWrEyLS9V_STC8ZBkLFE8BCJP4zdkgjw>
    <xmx:kAHpZdZvHKFhDuzCVu2F6RAPNj3UU2EcwZkVeUDScpz2WIfp1vKDv7_oC44>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Mar 2024 18:51:43 -0500 (EST)
Date: Thu, 7 Mar 2024 10:52:46 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
Message-ID: <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 6 Mar 2024, Michael Schmitz wrote:

> 
> There does not appear to be any interrupt nesting here. 
> 

It's not in the backtrace but that doesn't mean much. It would be 
impossible for a lock checker to place all of it's state on the stack.
If interrupt nesting messed up its state, you won't know it by looking at 
the stack after the fact.
