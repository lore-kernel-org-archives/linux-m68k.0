Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4EA1CF295
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847229; cv=none; b=br6VZ3DgCEbf/Vax6w4XJVnLWR4qJGgKST1A/tgAiblLg1LJmpcNM8t1YKtRNNwBBETZQL8UweJUWGfW9m7BaaQz0ouWFyrHCbkmetbrN0dc7/H4QvxyjcoavML0D8Mizb2LW35JYa4yfd7F5ETpB2RhOnP2KeDa1eFLyhzIm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847229; c=relaxed/simple;
	bh=virxTsszEMN0BGO2QnuuCmGMrb1Gt7EijjcN6vXQIs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n0YHlNNqcAIC0D5eEUbwvrydwjbOqWVnEWorRfpC3c8qUx3KhRW4xtJtrXR6zdYI38L0UzvQxAyawKS8holWuTldW+qNtdKAwAOn4F0XrCFMQTB/d+oiJX77Fj+sC+ZEREhJ4eI2kQ/rELKoZfXVd1A3FVS8cfPOG4Y0eqd3nug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dC00sn4B; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dC00sn4B"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id A0F941140127;
	Fri, 25 Oct 2024 05:07:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 25 Oct 2024 05:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729847224; x=1729933624; bh=3EA7ROOsbVkfdwA/Rz1bglHz/4fT
	ymXe7bk7OhtBcZ8=; b=dC00sn4BJ+bkw0MchSpZsgULZanCYiV0Eb9LTggWM0Yp
	vnMkLIbzRiD9ayIVh1zWaauvIM6S7OSnSANvW4I5Erex934l4D6ntxwG+RdyFFeH
	UIy+it9yomV8G4VMyQFim7NC0sJPmaSakl2+6X+2NorseUnoosuUfVbLVxe2XzfL
	qYIX26mC0+ou9HPun3n2uQO0razPOalT4kj2uVL7tm5D3OlA085uY81Dm2pa1YyC
	oPGhaeBxRpXnzfZMcA3NxFmL0rlsEyc7emKopxCmBFXJmY5kkGzJ5y6R6zmXVZVV
	JEh5MVXhLgy+e/MnwDQ0GgFQo7er5+lIFXShyTyvEw==
X-ME-Sender: <xms:t18bZzel4au_9AeXO6Vu6nqU89PBK7gw6pSYV3yiLV1YbT056RYWTQ>
    <xme:t18bZ5PeLDK0Jx3oGmNXkjUnU0sAHPTOA08HJhTgn8ggy_tL6RQ12Wfh8FOgOENP8
    Rt2wwM2ngP1r9WosLI>
X-ME-Received: <xmr:t18bZ8gu902w7tpxjS6FSBJIRtq4Ahu8PvbOh_SZ_K2RurbY7ecM7lYzZTvFoOfAsiWKI0g-q_4-emfpEVcgmWxqw-5qTFpPtfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsih
    htiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehlihhnuhig
    qdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvggsihgrnh
    dqieekkheslhhishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheptghhvgifihes
    rghurhgrqdhonhhlihhnvgdrtghordhukhdprhgtphhtthhopehsrghmsehgvghnthhooh
    drohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopehstghhfigrsgeslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprg
    hrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehtghesmhhirhgsshgurdguvg
X-ME-Proxy: <xmx:t18bZ08Hihta4gw--GCUDwG6Nc5ST-w2mYRUEgMW7DL_HYlSYIL0dw>
    <xmx:t18bZ_vabTcAX_8Rqtj6tpdFgsEnPtPHwwcmOk9IgCPxkw1VIkNQ1A>
    <xmx:t18bZzFbzlabkAbkRVs5fG5ttKpHGaeG4UpbpTRMNGJQ-hzohRSZOQ>
    <xmx:t18bZ2NrlF1aM1JrWOdOR4pYmxU9h1NUDF8H6Aeogo0xoam1GBHqdA>
    <xmx:uF8bZ1BZbySBlQ0qZv70NQPA_yLHbxnOVQwVU8ku7SjEi6xET9nZPq0a>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Oct 2024 05:07:02 -0400 (EDT)
Date: Fri, 25 Oct 2024 20:06:53 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
    Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
Message-ID: <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:

> the m68k port has reached the point where switching the default 
> alignment from 16-bit to 32-bit is inevitable as the number of packages 
> affected by alignment issues have become too large. It even includes 
> Python 3.13 these days.
> 

Are there any bug reports you could link to, in support of the "too large" 
claim?
