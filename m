Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884401B964
	for <linux-m68k@vger.kernel.org>; Fri,  9 Aug 2024 03:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723173769; cv=none; b=O03qUL9Yo9HOpltI1i8BBmT/14OK/nhkDy2XVxMCxsOanRSRyRr6xXpG8YyjPxRvqNyRtsxgyaU2TWqPJLRL4u7deZXnOsvPAR+ONqGAhDw9dFfV/npukICDbt4QdTMNBZWOz3lZkSG9kB4WVvRYJnXlpUrI81ONbqJ8WGhje6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723173769; c=relaxed/simple;
	bh=PIlp+gO/0xeo3UfVlOH6pLk5tD6SEItrGUK1GsPk+1A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q/0AC6zt0+uHbU6yJIE0Yg4donCMZbejq42xYWXCo1ebegWcaIqQqXu0KpBZ1p2L+Dds7t44k3BuB6A/Nj/kQyJ/BO4bNPElE2FyQ/Sf4pfiK9V1QkanPMLYdp6dOAdH88qW8k84s5g4S2WNr1VmvgvoKhKoWp2iwkzXNSbW00Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HWY5Z6JQ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HWY5Z6JQ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 950FD11507EC;
	Thu,  8 Aug 2024 23:22:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 08 Aug 2024 23:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723173765; x=1723260165; bh=UkRtac9zi6wgCYnNU1mYwUjlKnvL
	BRssoY7YSxObasY=; b=HWY5Z6JQxaPVxL+hZGb0kNps2YKWH54xokhlgMuszRQl
	GpaOB7qsCZpIAONqW/Pt/E3t3Ncc6/jS3UJyUst3vMCwNEfzSJGfknM3KVACXwU+
	euOgoW5bWuHLjT2St2dYYliCqOByXyXS2IBVx817iPH0bUlhhnOZwdU6bvD1xMet
	NotZv26zArFbMEF7fpSvlsmWipdFAiGIkmnJDo1trtxxunY8uNvX4cinJC6gOAXi
	uX7X/4wDT5NtKLZj/HAcJ/G7Z/PskAXDlzpRF+9/vz1TAr0kOhjMBToJ8d/yXqhf
	BUjwd2dtk8aLQViQqUxFPT9tvCFxcTbRlHvBc22w+w==
X-ME-Sender: <xms:hYu1Zh45a0UzasYUnjBIQqXt93JG_QSxPSAI56To6pWCKmzuIEELRA>
    <xme:hYu1Zu5hltemD2cwOEGxqt5TVtSOJKPQXU7EfgxvIL8f64uKW9bz-SZNwS0VnlL_Y
    5pEsmIryoGMRfodZII>
X-ME-Received: <xmr:hYu1Zofey4n2IekL1cBn2tT6xUZtuslX5r-YSXkA3KZHhvLseMJckeBqQ_6TLpqRkMDD3jKUu3FiKIhB3jPl9OMtFdT_LldRSGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleefgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeefffff
    tdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghr
    tghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvrhhgsehlih
    hnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhmhhithiimhhitgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorh
    hg
X-ME-Proxy: <xmx:hYu1ZqJ1ElHtZVRUonneFTm147l3w5iNg5P0GnqccV6nt2jn1dHBCw>
    <xmx:hYu1ZlJmJ0R3hE8bocL_0mpSuPBaDmGa9dtALukFcq1LEPU4l0yujQ>
    <xmx:hYu1ZjzZMls9sbBOhvyKhL1HFkwm0wBIas5Hz1Fb9RvJGaumGwg7xA>
    <xmx:hYu1ZhL4v0H6i9uYwDa0txutLKE1E6wvzuGYqh3d3Dy6r7WW-kmlJA>
    <xmx:hYu1ZiG3XRJknJB6SV56DDy9D3B1DG1Ue0ctiK6B80SiV344ej6xNfJM>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Aug 2024 23:22:42 -0400 (EDT)
Date: Fri, 9 Aug 2024 13:22:47 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, 
    geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org>
Message-ID: <5524f7ba-09a1-f70f-09ed-987ed149c424@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com> <20240429030945.22451-2-schmitzmic@gmail.com> <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org> <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com> <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org> <727be0d7-a3ed-d3eb-2a13-c6ac316cd25d@linux-m68k.org> <00ccfc03-9032-435b-8082-905e225c7a0f@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 9 Aug 2024, Greg Ungerer wrote:

> 
> Ok, thanks for the links. I have applied and tested those, no obvious
> regressions.
> So for all of these patches:
> 
> Tested-by: Greg Ungerer <gerg@linux-m68k.org>
> 

Thanks for testing!
