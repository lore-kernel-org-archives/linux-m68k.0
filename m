Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA882343B6
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 23:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747871390; cv=none; b=VyB1ggLCNOdQQN6Oht+rImlkp2AJeJX0g6cfpfYW3XllOqSv3X18fo4lYZv/gGTVXt6fwaRNjEkjz9SDuRqZsbqGhBmyavJqz3HGfdgdvBVoN7x94yLFro9IyyvxAWNyAqFiIsJ52TQ379aaw4Xz2igpN04s+1aUCJAe4uzXPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747871390; c=relaxed/simple;
	bh=FjHr4D5oYx3CofEWKbErZfvjkugiD9tYoHpTh672Grs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cz12kmGqvmYlkbXgadpfNR+92nQ22zjTKiR7YrwvzyGOV12yJI4IHK4ravEd0zl6fAKhhqXHE4CIlM5y4U5LnWi7AsfT10GsYqGvELIF4gxX2xf2TX1nm6LG2dJT+tAX4rowpfuTArL7No+W+DmZPBOQttlkwMDqGzKoe/0iPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I3HsPiet; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I3HsPiet"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 69F281140506;
	Wed, 21 May 2025 19:49:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 19:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747871385; x=1747957785; bh=B99AkTitHaTyoOTUUyhuKKABRyKwmCTf6vv
	UmDrbKcU=; b=I3HsPiet+TyrnwM+lVj4yGxY+vKvE55b9oO00v7ta1uEDWtdmmU
	LRUdIHIVYOjl85qb/hHdXm1evtrlvWJZZ8NFfNdI3gJfcRaESgmqWvFGigzyOY37
	6jGupd8pOA8Jil5G3+iJK1A1mw9qdSAhddwUvlr0nLkn0rnE4Md3lst3UcERzC9o
	vHQVzDEvirkI3QLTYHfR1MgnCrwQUcexyMx2oQZe9mf4YqPL2zKiwME0bg16knvU
	O4O23fLrk45xe2kX/YBtyLIrJG9NLRtSmv9DMHvSYz9orhB3xxEnZSymDNko16vp
	BdAOpxklzba9vvmFGYImF97WEIouyhHmAeA==
X-ME-Sender: <xms:mGYuaJvDczTi2sm5KfiQ-1ba5etytJPm1uj_RKyld4UMoi3APunxxw>
    <xme:mGYuaCen4VtmCpLIm3DZC7fiIKa99BwGLWsjXs9GGTB_OJZUvfhnbWOMYw9gO1uk2
    5YYNX6vDBhWQecG5xE>
X-ME-Received: <xmr:mGYuaMyNlbyJSiH8I3snBtB22pNQiMm4RaJ4LhPUmVjgnuZfNwuG523RynAwR-WIxrUdQYhEvid6vo8F7q7Op5hnjIb06r2XUZk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeggeehucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhf
    gggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinh
    eslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefg
    ueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehjohhhnheskhhlohhsrdgtohhmpdhrtghpthhtohepuggvsghirghnqdei
    kehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmie
    ekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstgdqhhgvlhhp
    sehsohhurhgtvgifrghrvgdrohhrgh
X-ME-Proxy: <xmx:mGYuaAMUBo6ekRZJQOV_lt4gv3Evhau3EvsPKZXsypEZlNrFb59qSg>
    <xmx:mGYuaJ_7mDeYSG5jpwc5VMmEJN2TuwFy4TaNQvJ0ZXW97-xX-mxc5Q>
    <xmx:mGYuaAWZrnepHYIdZ0cbJR46eTxtH2IbyTiTerWEJpmR8qeNnM83aQ>
    <xmx:mGYuaKc2C6xZCR_xTm79eDZL715yZIzEn-IptkvfIdXExsRahYPnZA>
    <xmx:mWYuaO_eh2U6sY3DCqKsntw0kOWIJfTY3RTQqfFXSAi3hweJbJYOs6Ns>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 19:49:43 -0400 (EDT)
Date: Thu, 22 May 2025 09:50:15 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Klos <john@klos.com>
cc: debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <a3c6f16d-95fc-c2e8-cd7c-b6941858b560@daisy.zia.io>
Message-ID: <b50ba8dd-6fbc-3557-2ea2-8af9634cb482@linux-m68k.org>
References: <a3c6f16d-95fc-c2e8-cd7c-b6941858b560@daisy.zia.io>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 21 May 2025, John Klos wrote:

> >> Your argument is that ABI breakage is death, and that projects and 
> >> the world are better when we tell people to fix their broken code.
> >
> > No, that's not what I said.
> 
> You literally wrote, "But, if it's not already dead, you will kill 
> Debian/m68k if you break the ABI contract."
> 

IMO, if a GNU/Linux distro abandons the upstream ABI, it will die.

IMO, if the upstream maintainers scrap the ABI so that porters can more 
easily port irrelevant packages, then the project loses credibility 
and ABI fragmentation will follow.

IMO, if the ABI is allowed to fragment, collaboration ceases, and the 
project dies.

IMO, if there's no unqiue characteristic to differentiate one port from 
another, one of them will die.

> >
> > Once the ABI fragments, there is no "Linux/m68k" any longer. There are 
> > isolated groups of users/developers with limited ability to 
> > collaborate effectively.
> 
> So what do you suppose will happen when the time changes are made?
> 

It depends on what kind of changes take place. I have not looked into 
this. I need to do some research.
