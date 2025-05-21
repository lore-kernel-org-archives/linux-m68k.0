Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0023422FAD3
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812456; cv=none; b=nhvFRB+4VkLOf9AC1OleDc9ToudDGc4xwyTuLjf9rRQhHHEomKoiz1cWQYlvkYZzHs7rwX3iqVMUR9/dK4LHt3Se0ITt8hPjRTOtZ1VnutAzfQYSsBJvdEwQFnNCbY7N0EkZFEx0WnNV4HRAAERAc+IkUTSHJrNzCko0GCFgheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812456; c=relaxed/simple;
	bh=Q1fifgalGZ8XXisUGV8yRISkOnM1jWHHb1I1iOdtMtM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mbE6s5hm7uWVNzs4AvOmty7SbrlPLJ4d82fRvS/61WlgmxKH3XqsC/DycFL3YXPYLCdAITjkXikDVvI0CEYwwGNlESqq1Z0IWlYLxYqXkatszHaoEj0c2reTy4xhEYdVUiMnS98wNpT1OIMxeykxJpM4VOwia3rWykTpmVchjL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e/WwLetH; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e/WwLetH"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E47671380411;
	Wed, 21 May 2025 03:27:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 03:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747812452; x=1747898852; bh=2IG/Wx9VDdBywODLu62mv4LAl6juxCzN7kZ
	isZWbo1w=; b=e/WwLetHmPHI1aIJKnodX9aOABASMYoaiEhiN3sEfsg0FJRVtkK
	7HxAsNTfd6f24ZDolUDOu4ckppFEEpbWBRWiDvAI/zpor70mtrsk6hnPhoQFmze7
	eGXVpvpd6ZhKYCNHT3qTJro/pxz8xSsTIsejLrvrlwjA0eungFV/LvDUN+H+Wy6A
	5RBGEXi3Hy+FGT8E6mRE5SJeavObrHKxebDQRgyGS+VZLibXR3kh09IO1CTGI0hU
	yITCuF9jbGtiU307mm3XLdqpFC0wAy0J+2mRppi6Zq1uOOXKzbVZfexAIz3sdECf
	SxdNKM3m6nkvUsUOiDOh3ACkRck4RMOm07g==
X-ME-Sender: <xms:ZIAtaL7igrVD9MmnC_e5nB50GYU52LqrWxNFlJfLMikhUqslLnkblw>
    <xme:ZIAtaA5bj_PlH7mYqGqrQrgEL6-h46bDv0PEO8rs-E3XlakqP-fFZYm1iMADAru1B
    5rmwhpA5wLasKAgM-c>
X-ME-Received: <xmr:ZIAtaCexIIynaZlyLhLkMMDQ48UR6SfNzjg7WUjpyYbqlC6w6s1fNOCqznJ7CsiI3GHqOqrGtWPGOcgBtPx0FwfvMu1ApC_0WLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvgeekucdltddurdegfedvrddttd
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
X-ME-Proxy: <xmx:ZIAtaMLj628clNlZ4ECMylF8Ze7Hnk4-kb42slT7-vkzJJnEL-YsWQ>
    <xmx:ZIAtaPIJLAVruaaKnF7zqh_dsEKKJt-B84W4iW-_b-nQacbMFmNTvg>
    <xmx:ZIAtaFxErkxClVYgvpW5X0O_K3pqTFDriazM3DPJSofzTf31gduhbw>
    <xmx:ZIAtaLJUC3fbqVzU9uzijlRYckbcC0iKYNCxBByE_kyBh8_jsnZ5Hw>
    <xmx:ZIAtaBY6OOGRqHcGC6SI3camNPApPkC65ot8H8OTuMU1vT_szQfcqjth>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 03:27:30 -0400 (EDT)
Date: Wed, 21 May 2025 17:28:05 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Klos <john@klos.com>
cc: debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
Message-ID: <973c317c-0182-2526-2e7f-0431f90d375f@linux-m68k.org>
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

> 
> But at the same time I've seen you say you don't need and arent 
> interested in these fancy new languages and packages, so I can't see you 
> volunteering to do it.
> 
> So if you're not going to volunteer yourself, then it's not really your 
> place to suggest to others that they should be doing it instead of 
> taking the easier route, which is to make more things work by default.
> 

I won't volunteer if the plan is to break the ABI so you can convert your 
Quadra from C to Rust because you're afraid of NULL pointers. Same goes 
for running bytecode in an Openjdk VM running in a QEMU VM.

I am actively disinterested in that kind of trade-off because the ABI 
churn would impact both users and upstream developers, many of whom will 
receive zero benefit.

Of course, the ABI we have isn't perfect and I'm not against people 
designing a better one, that will be stable for another 30 years. Though 
that is an ambitious undertaking for an under-resourced project.

For example, I doubt that we would ever have gained a TLS implementation 
if had been left up to volunteers. There just aren't enough of us.
