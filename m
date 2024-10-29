Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F9376
	for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2024 03:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173169; cv=none; b=q+r3xhfbwN+F9F/eC50VZHA1udediVX0o0VVBEFejmLbCxUGlXw6HqcgLrGSv5+2IB8ccWmJLtPXu8qqbma1u0pumAcsqERSJR7jLP5Cp9XOet0Kxoed7GKSwWR0AAQiVLYah4GhpHvVgCIRLLEtW3FQswKHJo8k9c0mnVaeA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173169; c=relaxed/simple;
	bh=PxJnXsS30yREuyGY9NUhseQgALD1UV5RbWU/yv2AXcQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MGZT042MA1CgIXZJTFSu2SKjgA6wDD1nfNk3yx5hFtT8kz2yjfccM/SY5aWNSJsMa28ZL/2KtnnR/oDtPP6t2Jw4+v3QODe19JKcDpjbnk2PFNTxtRociid9U0emCg416VxHpTZ5CIWEW2APKdQXN9cbkxTmL2pOs+V1dWSBSe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U4T+daZG; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U4T+daZG"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 2B9B7138009A;
	Mon, 28 Oct 2024 23:39:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 28 Oct 2024 23:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730173165; x=1730259565; bh=KsWrKEpLT2eZgoUW+W/VDSORqnl54/cjCW6
	QvyD+KKY=; b=U4T+daZGtDuh3nu38kfNCGlR/IGx2ftiryzzytqp7ZSTzfehQAU
	UzllC6UYLVOQTDnW1Sw7KaOFpMH/7mtvdxFlOwt0B+n6olBXchr1G3xYW5Bovu0z
	aVHeavmCSvdipy6XaW1irAlqundvu0NyNizp0pyEE/RCbjR1Mo/L5eAFFbslSFGJ
	K/XZogfzyRgIUUNcOgOvBF3kDBRZa3bc1pOyNnhRgVmJvTX+6dJVkLW8K5d9/RSZ
	lV/Wt2+AzeaF9yjw+XWJHyYZmMJb00XoFT13rJzYnTxq7cGAPZ9BkLIqUjP1Qp9O
	2jdGRMg7RJijj4Rx6sWbrM+46kMukFg0Yiw==
X-ME-Sender: <xms:6lggZ8Ch4G2x3d9ADV7v2Sj_C21QZ8PcynYhG6ExZCkR11yevBfn0g>
    <xme:6lggZ-h67X7lAPnjhmJaREAcn45_6QIUTKqXLMbi8Dxj7fUcosQut99p8D74lCsXE
    DAnI9tYjVadn9i0RaU>
X-ME-Received: <xmr:6lggZ_kcytyo10ezYBrsSEN7EgpSteBt59XcfZkmAyf_EK903NEC8e-jrvn9Ht7Rod6uw-Ma5ShE66lOJOS8CtIpWSnHrKAn2G0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdektddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgthhhmih
    htiihmihgtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdgu
    vgdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrd
    guvgdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghnrdhorh
    hgpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukhdprhgt
    phhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehgvggvrhhtsehlih
    hnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfigrsgeslhhinhhugidqmhei
    kehkrdhorhhg
X-ME-Proxy: <xmx:6lggZyx4hYBkrui0kUtoU8Xtt7TCWnR2zCtoJ6eIZyenHnxk_vyAKA>
    <xmx:6lggZxR3n8_0dRAvQQ-8v46vTlGfm52_xkgqTLgu7xyjDYGrogbYGA>
    <xmx:6lggZ9ZHOEuOROAIVLY-tvqetWWMO5FN3ZNAdu36A6GE4UGUnxqH1g>
    <xmx:6lggZ6RrZtfX_RZ38-Y_lEFg7efWEfWLPcTa7LwJmCJwISY067modA>
    <xmx:7VggZ-_72L1NpTNElXU05FgHTf7XTc2bGOZzjKcG4wPrkfXMNOmSMNl3>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 23:39:19 -0400 (EDT)
Date: Tue, 29 Oct 2024 14:39:15 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Arnd Bergmann <arnd@arndb.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
Message-ID: <de1adc92-f1e9-81fd-9406-7148e8213e4c@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Tue, 29 Oct 2024, Michael Schmitz wrote:

> On 25/10/24 22:55, Arnd Bergmann wrote:
> 
> > I also expect that a lot of users (of m68k kernels) are never going to 
> > get the benefits as they are already stuck on older userspace because 
> > of added bloat in new software releases. I assume you have better 
> > understanding than me of what m68k hardware is commonly used these 
> > days, and how constrained that is in practice.
> 
> I second that - currently bisecting to find out what makes my extremely 
> RAM constrained m68k system fail to boot or run anything past 6.9-rc4 
> (sysvinit, not systemd).
> 

As cloud instances multiply, that small quantity of lost RAM gets 
multiplied. So it appears that small systems aren't so strange, even after 
they become unprofitable...

> Much as I appreciate Adrian's efforts to keep up with user space 
> development, I won't be in a position to help with an ABI change.
> 

Bloated m68k packages will continue to work -- given emulators that run 
faster with every hardware upgrade. But how would such a distro add value?

I don't mind if Gentoo ships a separate profile for (downstream) ABI 
experimentation, leaving the default m68k profile on the standard ABI.

And if Debian wants to switch ABI entirely, I won't object further, I've 
said enough about the associated risks.

So I'll just reiterate that I'd rather see more collaboration instead -

1) among all small systems ports, to try to alleviate Debian's package 
   dependency problem

2) among all developers working on non-commercial architectures, to 
   improve the GCC Rust frontend

3) among all 680x0 developers interested in the NetBSD ABI

4) among all users of EOL'd hardware, so that value may continue to be 
   extracted from it (thanks to the efforts of Debian and Gentoo devs, 
   among others).
