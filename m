Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8C1917F6
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104193; cv=none; b=HIBIykQ/miSfqLueKWxFNdG4uFHMfQgkRjcxFtzxietxN/wted7Zbt14ffJgJsZ11IZ2SGdILsTDQCxPPut8H54cW/yA5GVvMDkHr228iEvaYxiADJYJs3ANsnv1rnrXvGxTW3tA/WOEagjSgWRe0aAw3IvEGJIyp4+FcjUqMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104193; c=relaxed/simple;
	bh=lxYG40Saj/5+2jIys/h743ewoeYKE9YezlqRW+9rYlc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kHuOtFMY5nbK+kEUVKYa9C3TOK7bacc0p7uQs5O5rLf1jKIbvjEb7UGCYWHjEkBi97kdDh51D7wDeWFe7oAHtWzWo08ZPEPnagr5e4a1AR+K4Sh1Z++MNM65DAKA1TceHx59CTxzG2C4BsboXOvg5lPup9elTb40WSZVPhLjic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z+5d6TVr; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z+5d6TVr"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5322425400E9;
	Mon, 28 Oct 2024 04:29:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 28 Oct 2024 04:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730104188; x=1730190588; bh=+ulgcShPSjTsrKm7m6UxU+MpRroo
	NVdFL5kGRwT6wGI=; b=Z+5d6TVrkZDKcQwmCHVgHNyo9kR8ljx1HDx0ISoaiR1N
	lkzAS+nMeM5Y203ZYJYbr39kgbbLP0LZVe059pQ/PAS3ocjQ6X/wkXa2LNhIDW/I
	tF2WmdvBJY0aNoXVyS5E90j79nN7PCrSvT+LTLYtUJArWydYT1N0YVv7p0WwuSK5
	EzXfBFMifsqdwLOl8/VZgcw4zgQGBICUIYvUsnVn4X8FHwKt8fkB6HE5srMlzYbz
	b7JJ7eC6W7tsipe40MFrWWpvNAWwXf32ehR1zXNqT6gFZkJ3xdsKoRu1i31f1GTL
	BAGPemQNyxMSCT1uhMaFjsUjFaRCx1+X7F7Xm79q1Q==
X-ME-Sender: <xms:e0sfZyMU3wJ9htK8iJMp3tsEF2eVeHaQzWJYGQCtmuR17_MXBdKQzQ>
    <xme:e0sfZw8hTdeSWLA-ZYcqW3RuEM93UUt1_-jV6an6Ldq4GB1KGXAdRzhKdM76fEyse
    6oiyeOA1a43RDuGx_c>
X-ME-Received: <xmr:e0sfZ5Tlvmpw6Gsg4_72-NELzV8u47i6JOaRCnHGZzsO8Ix1IrfSkRkUd_QKUHy244xybSCf_VEn0wzZPwgGl38fr4AqyS3hKrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejjedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledu
    keduuefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
    nheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggv
    rhhlihhnrdguvgdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghi
    rghnrdhorhhgpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghord
    hukhdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehgvggv
    rhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfigrsgeslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgt
    phhtthhopehtghesmhhirhgsshgurdguvg
X-ME-Proxy: <xmx:e0sfZysk3ja06JZbexfTPo87s2G-jz6wrmOEW_NLnQVduLFUi36kZw>
    <xmx:e0sfZ6fM-84kE1cn7c-RH5JMqbsK_vRMnjXIBMrRF3cDpCbcCbSiuQ>
    <xmx:e0sfZ23J7lddZ7tCt41TkjBoyuyyMVj_EATxRfGJkDV2G2fQdAwVIw>
    <xmx:e0sfZ-9CvaL355NfCdYfp5JVtqFW6rBFuDPRPHKjn111yoSOUK9zgQ>
    <xmx:fEsfZxxbAlea0MUxyRNRDrzG_B6AO-MG1FFe6hHQ2KqjB-zrR5W4jMte>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 04:29:44 -0400 (EDT)
Date: Mon, 28 Oct 2024 19:29:41 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
    Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <762f5be0aec0c50b2589ebbd60c6d104f9871526.camel@physik.fu-berlin.de>
Message-ID: <0c23bc71-d0ff-eec8-1251-29b8517e2229@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>   <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <762f5be0aec0c50b2589ebbd60c6d104f9871526.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:

> > 
> > That seems to imply that someone requires that those packages are 
> > ported. But without a bug report from such a user, to say the package 
> > is broken or missing, one must question the real requirement.
> 
> People have tried this in the past and it was an endless effort. It's 
> not that it hasn't been tried. And there is zero chance that any of 
> these projects accept such patches to support unusual alignment.
> 

Then don't leave it to chance.

> It's not that I'm not speaking from experience having maintained the 
> m68k port in Debian the past 10 years. The Gentoo folks will tell you 
> the same.
> 
> > > Those are the most important projects from the tip of my head, but 
> > > they are already the biggest blockers. There is no chance that the 
> > > upstream maintainers will adjust their packages for 16-bit 
> > > alignment, so these will be forever broken on m68k if we don't 
> > > switch.
> > > 
> > 
> > I'm curious to see such a refusal in context, presumably as a result 
> > of patch review, in an upstream project bug tracker.
> > 
> > I'm not actually expecting to see good patches refused by core 
> > projects like Python. (Note that MicroPython is available for 
> > commercially active CPUs like the PIC16 family, which are 8-bit 
> > processors with 16-bit address bus.)
> 
> Why does my word not count here? It's not that this problem is new.
> 

Your opinion does not count here because the question was about upstream 
patch refusals. I'm genuinely interested to see the patch reviews. After 
all, many alignment patches have already been merged.

Without being able to see the actual response from upstream developers, I 
can only assume that they have either misunderstood the issue or they have 
simply decided their users would not be served by an m68k port. Do you 
agree that upstream developers generally know their users requirements 
better than distros do?

> You can also ask Andreas who maintained openSUSE on m68k for a while and 
> had to carry lots of local patches.
> 
> > If upstream QT or Java developers decide that their software is "not 
> > for us", they may well have a point. Those packages are not installed 
> > on my m68k systems, FWIW.
> 
> This is isn't just about runtime dependencies but also build 
> dependencies which is why I linked the statistics page in Debian. A lot 
> of packages in Debian/m68k can currently not be built because they have 
> a transitive dependency on Rust, OpenJDK, Qt, GNOME and so on.
> 

That's one reason why source distros are a better fit for small systems 
than binary distros are. You can't fix this basic problem with an ABI 
change.

> > OTOH, as I've said before, if upstream developers (like Arnd) are 
> > looking ahead to 128-bit platforms then they will be paying attention 
> > to alignment rules. They should be inclined to favour explicit struct 
> > definitions over implicit alignment, don't you think?
> 
> Debian just transitioned all of their 32-bit architectures to time64_t 
> except for i386. Do you know why they did that even though 128-bit CPUs 
> are practically around the corner?
> 

Perhaps they have explained their actions? Do you have an opinion?

> > > I understand that this might be a painful transition, but I don't 
> > > see any other way to keep the m68k port alive in the foreseeable 
> > > future unless we fix this problem which keeps blocking the port.
> > > 
> > > You can see how the Debian m68k port has been falling behind because 
> > > of the alignment issues in these statistics: 
> > > https://buildd.debian.org/stats/graph-ports-big.png
> > > 
> > 
> > I could imagine a viable transition to a new ABI driven by widespread 
> > user demand or involvement. But not by distro stats or maintainer 
> > preference.
> 
> Well, I'm doing the work, so I get to make the decisions here, no?
> 

Sure. Please refer to my previous email about the m68k ABI du jour and 
fragmentation.

> > Absent the right conditions, perhaps it is best focus limited porter 
> > and developer effort on patching only those packages that are really 
> > required.
> 
> Thanks, but I tried that and it doesn't work. I don't want to continue 
> spending hours on trying to figure out how to fix alignment problems and 
> then maybe send an email here and there to just never get an answer.
> 
> You're somehow implying that I'm requesting this change because I'm just 
> lazy.
> 

You're somehow twisting my words into a slur. You know that I value your 
alignment patches because I've said so before. Thanks again for your 
efforts.
