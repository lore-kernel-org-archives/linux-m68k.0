Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E022D4DE
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747804709; cv=none; b=CfbZnhRjHzg45mzSMcJ2G7EJFGQp4Eni/g4v7f6wEumUkpdDPrffyijL5jPpM8Tdd4yE5kOu1oQdobeFZMRuuNAx/FEvGblk3IQz3l+4AELF1arkJF2/Rykwoia4qWksK/sazOV0rXXai7dZB5KhQ4AwSJ7zKpO85QimXLQY/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747804709; c=relaxed/simple;
	bh=50zX5F7uN3QRIVsBfSBAYD5feFzKV2+Jz3RzRsBVljk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g25O4o43N1BYdAo9w9/o3aZSUZNsfnZcB/XJrhcaKzc1Zn5iCzBY9wFsu/TCSt682LumK0YoKqmnAGaj/t6MG7+ZcdA2H+/xaL7QB7kc3TxbMqZZVtbdM6js84cUHSoCHqMXP5+R2OeGzeXMzjsGLnRvJ3raQQV1nNSZ5M8JPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G9vArzSz; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G9vArzSz"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C1A71138042F;
	Wed, 21 May 2025 01:18:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 21 May 2025 01:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747804703; x=1747891103; bh=++LtchhifWzmDC4Q4vwcIaOtXLv27J6ipPT
	fd1UR1Ls=; b=G9vArzSzbRHwiFdqswGSTlUFjH7JFRpBR07Eh2GF8xxDCoJWYIA
	8/gkq2Q5kxy+VkC69DaAOPH7bqIlL9bcseUxEW25labHSK/oa3Kf+WEPJNfa7Rvd
	gNNkMgjXq7Kd6FNa4eS6kom/WTMCdWjW2XYeBhWhTiTpPKrwsMToR0Ik+mk+pcIt
	Eg+qJW3aGUiJzXFwr6JW3LAJvhqp7bcQGYfNZ48t+BCSUyGWmP6qP90uvigx98kr
	hPg1CIYZGBL7zbZ/GhYJomfM7I2AXxswmns1pgS9FgNWGTOJRp7Q6mcM+gmah2+E
	PfmBjT3jKPM+ybcs59TUVD9hMY/Vz2UNI8g==
X-ME-Sender: <xms:H2ItaPIjKnwITDtjWAywzJBgrfhBUkh9rswVFUdawawERkDFFTdcog>
    <xme:H2ItaDLWSgHsuXbWENhfXxQqiWi6ps_TvU9W5zvtZFpbgz9X8u1QqviiK7l5mYge1
    FfI0QutlckJKm_oQYA>
X-ME-Received: <xmr:H2ItaHt3xpK01HV276H2dx_ze5EvZpyp7scq6vbT1jbmbgghXlUOc8xlUX2ChMflX2QNC1izw6eZcMwqFcs0kNb9s4giMDKh640>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvddvucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhf
    gggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinh
    eslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpefghfeihfegvdff
    ueekffettedtjeduudeludekudeuhfefhfejiedvgefguddtveenucffohhmrghinhepug
    gvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpth
    htohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhohhhnsehklhhoshdr
    tghomhdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrd
    horhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhisggtqdhhvghlphesshhouhhrtggvfigrrhgvrdhorhhg
X-ME-Proxy: <xmx:H2ItaIbNIOK3jFgMRFBEE6bz7OY8SgT0ZSYSnHMFSnd9m3I3axc9iw>
    <xmx:H2ItaGaqaag4bcvze91AwymZiF8OBbt3BQCj9q_UiHXVXWmX8eCl6w>
    <xmx:H2ItaMDNA6-C7GAEwwCLRMMkixENU8Z3fZPsaNERUU3yL9VB4KBlDQ>
    <xmx:H2ItaEasFo95fBSLNVYI79nSlOab8SJsut_pLcP-mIQoTXzmBBkNrg>
    <xmx:H2ItaDqopcHzqBHFWJMS-blC3qUN_CN7vh1zOb8IGo1x9pFxxuULL3OA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 01:18:20 -0400 (EDT)
Date: Wed, 21 May 2025 15:18:54 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Klos <john@klos.com>
cc: debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
Message-ID: <f1128cf9-cd26-9182-f9f2-89c9a0b3d4bf@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>  <8734d1kofn.fsf@oldenburg.str.redhat.com>  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>  <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com> <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org> <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 21 May 2025, John Klos wrote:

> > As I pointed out years ago, you need to stop wasting effort on 
> > packages that aren't relevant anymore, due to bloat.
> 
> There's no real point being made here. Which packages aren't relevant 
> any more, due to bloat? Who decides?
> 

Users do. I've said so several times.
https://lists.debian.org/debian-68k/2023/08/msg00023.html
https://lists.debian.org/debian-68k/2024/10/msg00024.html
https://lists.debian.org/debian-68k/2024/11/msg00019.html

> > And here's another thing you need to understand: there is no future 
> > for a port that has no porter willing to identify relevant packages 
> > and send patches upstream.
> 
> This is a non sequitur. Reporting upstream is nice, but a port can exist 
> without stuff getting reported upstream.
> 
> While Adrian is obviously emotionally committed to improving Linux on 
> m68k, the points he makes have reasoning, thought and explanations 
> behind them. None of the arguments from you, Finn, make much sense. 
> You're talking about irrelevant things and bringing nonsense examples in 
> to the discussion. Your examples lack technical merit.
> 

Perhaps you can show me the technical shortcomings of the patch I sent to 
the python project?

> The issue really boils down to this:
> 
> Should Linux maintain a 32 bit platform that has alignment issues 
> because programmers make bad assumptions?
> 
> Your argument is that ABI breakage is death, and that projects and the 
> world are better when we tell people to fix their broken code.
> 

No, that's not what I said.

> I agree that ABI breakage is a huge hurdle. At the same time, the ABI 
> will change to fix 32 bit time. Is there any good reason to NOT switch 
> to 32 bit alignment at the same time the time changes are made? I can't 
> think of any reason.
> 
> So can we all agree that there's no reason to not change alignment when 
> the time changes are done?
> 

We've been over that before too:
https://lists.debian.org/debian-68k/2023/08/msg00023.html

> Next, I also agree that programmers should not make padding assumptions. 
> However, the real world shows us that there are way too many gatekeepers 
> who scoff at the idea of supporting anything that's not Arm, amd64, or 
> perhaps RISC-V. They don't care if their bad assumptions about floating 
> point affect embedded platforms. They don't care if they've assumed that 
> nothing of interest ever runs on big endian systems. Heck - they 
> sometimes don't even care if things no longer compile or run properly on 
> 32 bit x86!
> 
> Dealing with them is tedious. Sometimes a private email to the right 
> person in a project leads to a proper fix, and we don't even have to 
> publicly talk about the fact that the failure was on m68k, VAX, Alpha, 
> or whatever.
> 
> I've done enough of this to know that it's far, far better a spend of my 
> time to make things work by default where possible, and if not, to 
> maintain local patches with an email sent off to good people so the 
> gatekeepers can be avoided.
> 
> If you think that the work of getting projects to care about edge cases 
> isn't hard, then good for you - perhaps you should volunteer to do it. 

I did that already:
https://lists.debian.org/debian-68k/2024/10/msg00042.html

> But at the same time I've seen you say you don't need and arent 
> interested in these fancy new languages and packages, so I can't see you 
> volunteering to do it.
> 
> So if you're not going to volunteer yourself, then it's not really your 
> place to suggest to others that they should be doing it instead of 
> taking the easier route, which is to make more things work by default.
> 
> > But, if it's not already dead, you will kill Debian/m68k if you break 
> > the ABI contract.
> 
> It's frustrating that you'd write this.
> 
> Are there so few fans of m68k that this will kill Debian/m68k?

Once the ABI fragments, there is no "Linux/m68k" any longer. There are 
isolated groups of users/developers with limited ability to collaborate 
effectively.

> If so, then the 64 bit time change will kill Debian/m68k, and there's 
> nothing anyone can do about it. So are you saying that the death of 
> Debian/m68k is inevitable, and that we should all just give up? Anyone 
> who still wants to run a modern OS on m68k hardware can still run 
> NetBSD, after all. Right?
> 
> Or maybe this WON'T kill Debian/m68k. And if it won't, then making two 
> ABI changes at the same time is no different than making one. Right? So 
> why not make the default alignment for m68k fit what programmers, who we 
> all agree really shouldn't be assuming, assume for 32 bit so more things 
> Just Work?
> 
> I see absolutely no compelling reason given by you or anyone else about 
> why this shouldn't be done aside from ABI change, and if if the ABI is 
> about to change for time, then that reason becomes moot, doesn't it?
> 
> Or do you or anyone else have a reason why it's not moot?
> 

As I've said, I'm okay with a Gentoo/m68k profile for ABI experimentation 
as long as the default profile tracks the upstream toolchain: 
https://lists.debian.org/debian-68k/2024/10/msg00045.html

> > Nevermind removing that characteristic which provides it with a unique 
> > advantage, being a smaller memory and cache footprint.
> 
> This is ridiculous handwaving.
> 
> If the memory footprint of software goes up enough to matter because of 
> 32 bit instead of 16 bit alignment, then perhaps someone should tell 
> people running the NetBSD/sun2 port. The very latest NetBSD runs on 
> m68010 systems with actual 16 bit data busses in 4 megabytes of memory 
> with 32 bit alignment. Think about all the memory they could save!
> 
> Ok. That was a bit snarky, but do you really expect anyone to take this 
> seriously?
> 

Well, your handwaving is no more convincing than mine. Measurements are 
welcome, though it's hard to know which hardware designs to measure.

> Likewise, do you really think that the overhead of unaligned access is 
> outweighed by the fact that more stuff fits in the cache? Seriously?
> 

Yes, some of my 68030 systems have 16-bit data busses.

As for the ones with 32-bit busses, I'd expect that two cache accesses are 
generally faster than a long-word-aligned RAM access, though you may be 
right about those algorithms that miss the cache.

BTW, my Apple Workgroup Server 95 has 512 KB of L2 cache. If I can get 
Linux to run on it, I think it might provide some interesting 
measurements.

> > Try to see the big picture. All ports will suffer the same fate as 
> > this one: fewer users, commercial irrelevance, reluctant contributors 
> > and bloated packages.
> 
> What does any of this have to do with fixing alignment on m68k?
> 
> > The relevance of m68k is now the way in which we respond to those 
> > challenges. If the best that any port can hope for is ABI breakage, 
> > we've failed.
> 
> Are you here advocating for the termination of Debian/m68k? Or are you 
> saying that alignment shouldn't be updated, and time shouldn't be 
> updated? I really don't understand what you're suggesting.
> 
> > One does not age gracefully by pretending to be young. m68k does not 
> > contribute anything by becoming the same as every other 32-bit 
> > big-endian platform.
> 
> This is nonsense. 

It is the main reason why porting to m68k leads to better code.

> The natural alignment for m68020, m68030, m68040, m68060 is 32 bit. That 
> Linux didn't follow the SVR4 spec for ELF was an error.
> 
> I really want to know:
> 
> Who gets to make the call about whether or not the change is made?
> 

Those with the time and skills to write the patches and the ability to 
push them upstream to all the affected projects. Same as always.
