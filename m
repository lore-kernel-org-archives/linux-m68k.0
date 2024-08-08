Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE33186289
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Aug 2024 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723100213; cv=none; b=ZClM/z8gcWbVZqHvAPmvEr//buLcvnMPDtsv0aVxVifAsn+g05v6GXu1pg+/Mn9v3uZweFJo62CLuB0YWfjBvMPoSwy3rHOmP8+MBo5FKTfQtxy9pXqzIaBK8KjQ1gW8Eee0N27qFfahhihu+shtG97EzY9V8YDYbKN/y9vbwVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723100213; c=relaxed/simple;
	bh=TBOUydefTc7/1q+sGWLWs5GazLiAfc0EDpwUWe5w2b4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b+eZFMRGw4kC7qWIDf8LzQFYvhsUY1TpwyqOGUjhvM0ldjP8s9sijMnWaPWzg5iKBWauDCzQp9KeCE1WeCxXCy8TwCsL+96z0ZSZCgvUIv9aY+o622dxcZ3ZENW/jCgTUfo2QJicV9aQV/gtg0y4p38KOqpSmfPOfVHwRJAVgHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EqtmtO2A; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EqtmtO2A"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id EA6371151B82;
	Thu,  8 Aug 2024 02:56:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 08 Aug 2024 02:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723100210; x=1723186610; bh=AJlcxjSc/XscpqviHn/IgfWcdbYq
	kqdfgda8u8pZ2Jc=; b=EqtmtO2ASzE+XbTSf5bw4UGwKoW5Hnrkrm7B5LsvyhWt
	MIJF7LxVzEYzjNi+F/pSlZKF8ySociIzABdh5GhVwAWYE5gnDac32OOFM5I9+xkw
	bFuC9oG0TG3A3zIU7eFgViHNq4eDTRm0eTZMErA7h7cf7Uda0vd9uCKvUIOII+ET
	UUVttjZVRzoPAtuiubOhJXG+8VJIH8pKt/1xTdUZ0ebAi5Bzd0B2WVpRSdzD0+OH
	TBedhFDC0bxkYphHYyHBQurL8mgcGj/2dC1dZ2Sf84kPi+YRC5QhcSWGoi1Ru+Xl
	RB1STzyDsyhPsxJzXUFZftht4v7IZLMwyHMLqBeVFQ==
X-ME-Sender: <xms:Mmy0Zip9DvlFAtl_M5L-yB29Nbpofhhxe-6J26MPKkTq3KQJ2cO9rg>
    <xme:Mmy0ZgojTSaysxZZc5AmbSfHPcgez1sTMCIlV47Heas3gghp_15r8YFI6nTmJbvJy
    s2vC58KApVmitIhnrg>
X-ME-Received: <xmr:Mmy0ZnM_64ws7g9SNKeyYfmXoByCsr6jUs3vKMy-zevHm06AfxkA-g9Xpbdh3NQKaNB_VDacyR39_DSJ-MN4YqxyskIze6xGdd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledugdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefg
    vddtkeekvdekhefftdekvedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhn
    sehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohephedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehstghhmhhithiimhhitgesghhmrghilhdrtghomhdprhgtphhtthhopehlih
    hnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggv
    rhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkh
    eslhhishhtshdrlhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Mmy0Zh7CEtj5tYV45DLpDHlqZGDKLxNeaCp4Dd4T_WXfdAKJn1dddQ>
    <xmx:Mmy0Zh5fTw4zNG8XFn_XDBX8EIpRAsFJdJnMx-6AX3cv_m22IWiXXA>
    <xmx:Mmy0ZhgQz5tgeEw1aT8NTGOCJPqrhW2fiVo4dWMdeD8GF7F_NOepUQ>
    <xmx:Mmy0Zr77XHgTG1eHlKz5Kf63clHDNVGS1k2XzCYPDtcLjA4gXRKTHQ>
    <xmx:Mmy0Zk0Ev_0rHws7vDAud4ieuAMnB2kWkg-ygfbg1o7xjdr95oep57cR>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Aug 2024 02:56:47 -0400 (EDT)
Date: Thu, 8 Aug 2024 16:56:51 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, 
    geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
Message-ID: <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com> <20240429030945.22451-2-schmitzmic@gmail.com> <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org> <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com> <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 8 Aug 2024, Greg Ungerer wrote:

> On 8/8/24 11:57, Finn Thain wrote:
> > 
> > >
> > > I'm afraid I've lost track of where we're at with this patch series. 
> > > Does it need more work, or more bug reports such as the one below?
> > 
> > Apparently the series is waiting for some testing on a Coldfire system 
> > with MMU.
> 
> Ok, I am in a state that I can do that now (I managed to fix my M5475EVB 
> board). 

Thanks, Greg.

> If I test the v4 versions of this patch set that should do the job?
> 

There are 3 patches that need some more testing, one from me and two from 
Michael:

[PATCH] m68k: Handle put_user() faults more carefully
[PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more carefully
[PATCH v4 2/2] m68k: improve __constant_copy_to_user_asm() fault handling

They were posted in two threads:

https://lore.kernel.org/linux-m68k/1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org/T/
https://lore.kernel.org/linux-m68k/CAMuHMdVrOnOQwCxk42YCjEkbfL-YDSvpf_xTaouv9hUs2bO+qg@mail.gmail.com/T/

On 680x0, one of the bugs was brought to light with 'stress-ng 
--sysbadaddr -1'. The others required special test programs.

I've no idea whether Coldfire silicon is susceptable at all, and if it is, 
whether the same reproducers would work. But that's neither here nor there 
from a regression testing standpoint.
