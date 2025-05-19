Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D251DE887
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691941; cv=none; b=JKi18DgQNIn531Qb1y2ssTkw4TddHF0ngMlMo2XsyvjxbtET6rqbQpIMh8+2XqAE4mihZIxcZVtZq7Q6LhHBOT4grBh4KPzh3RJ/YwQmK/JCqEv6xXOOvmsY2GCrozmYjuI6krsx2uJh13u47BvDUug22Pz77PaDXgO4sLxVw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691941; c=relaxed/simple;
	bh=FhtM/gXOJ4UBed9frQvnA3RQBs+RbEfYY1XT+XIk7Rg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WzBgiZY1DaPGYz7e8LZ6yf5rYQOjHr4w7RjCccOurtf6Ev46TpMvxkeIq24V9TTRxSmXJdmXdd7DaIa9PTQfJLFSu+QNlX4GYu5berlPeuqcZ0YQBUiu6gS0BwuntEszeuUuNFM9IizlJROqiaO52A5o/rPRBTSIrJlYgeY0M88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RqC7mtK+; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RqC7mtK+"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3C78E25400D0;
	Mon, 19 May 2025 17:58:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 19 May 2025 17:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747691937; x=1747778337; bh=QVhGYB+D0PyHalP18BeTfA19uweTSLllGLd
	S3rqQ/DM=; b=RqC7mtK+OgyKY9hPFb5iZPcU4jlZn/XUKkYNysthTPAbR3avyEr
	u/CGtoJD/sD4iuBfwo3sSJa9fu3+RGTLF886pghtOS/m8YXIrwVmQfQwcScIC0/F
	fQYmGM/AibsIn/Vsd0drUO4bf3KY2w3N0/MxTvWieXgQbTZIYOZdYioiek/NI8W3
	r3GyY5lugSqIWV4k6WLy3WgEK4c1VJJzxDf4xc/BgER/47hpjeBLI5N4N9cVi+Th
	NHgQUOltLRdOGREDvWo9fMDbpC2abgZd734TdghVRSQG49sZ2KRdWQimKQKcGqWv
	k05ISShBzsJplADrWg5brpI3VdUsSbD7tzA==
X-ME-Sender: <xms:oKkraAbMzmquSyVgOyL5Gh9Xc2yc6IKIxtiHKbA910vq6cd3E6KFIg>
    <xme:oKkraLZe2NZyeTz40n7gcU8TW42hG7fNjL43LQpD_oQo6HNhgyoSo2GToqlmufmxW
    _4EAU5TFQb2D-QTlXc>
X-ME-Received: <xmr:oKkraK8vYPrcZWGvBqMsKXhIx6vJlfxc890EnFB5wmUc96qqXWPgnqj-xrppP8ZdNzJZH24I_Lm4lKDwkeJ9jCnGmDTaXre3N9Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddv
    necuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheike
    hkrdhorhhgqeenucggtffrrghtthgvrhhnpefghfeihfegvdffueekffettedtjeduudel
    udekudeuhfefhfejiedvgefguddtveenucffohhmrghinhepuggvsghirghnrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgr
    ihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepiedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgs
    vghrlhhinhdruggvpdhrtghpthhtohepfhifvghimhgvrhesrhgvughhrghtrdgtohhmpd
    hrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukhdprhgtphht
    thhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpth
    htoheplhhinhhugidqmheikehksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhisggtqdhhvghlphesshhouhhrtggvfigrrhgvrdhorhhg
X-ME-Proxy: <xmx:oKkraKrzAgJw2VVyG7qL6jx6p0yA7GaitP5ULBoxsGhaIPpE9hhiqA>
    <xmx:oKkraLo_KMvEx7HBTSpU7OOoVclJTiCKix5f5cjyGz84m8fyPmrkwQ>
    <xmx:oKkraITawjUg5hmT1IUqE2b3QdFJd2QlxLhFW6uhtXIRVlUzbwCn1Q>
    <xmx:oKkraLozl1DoCeB32v0oitujIHLLBavw2jy75kXuWIt1gRVRBTtCKg>
    <xmx:oakraA2PICI8ZSdpuxAZjqv7QCU1fVueWTuupd8acYFvfOhs6eSjo-Sm>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 17:58:53 -0400 (EDT)
Date: Tue, 20 May 2025 07:59:26 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Florian Weimer <fweimer@redhat.com>, 
    James Le Cuirot <chewi@aura-online.co.uk>, 
    debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
Message-ID: <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>  <8734d1kofn.fsf@oldenburg.str.redhat.com>
 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Mon, 19 May 2025, John Paul Adrian Glaubitz wrote:

> 
> My argument is that Linux/m68k is a pure hobbyist project and anyone 
> involved can deal with the changes coming from the alignment change.
> 

If hobbyists can deal with ABI breakage, they can certainly deal with the 
longstanding lack of fancy toolchains and toolkits*.

But you're being presumtuous. Your hobby may be the porting of fancy 
toolchains. It's not mine!

There's no such thing as a "pure hobbyist" Linux port. This is a 
collaborative effort. Debian/m68k needs corporations just as RHEL needs 
volunteers.

* https://lists.debian.org/debian-68k/2024/10/msg00001.html
