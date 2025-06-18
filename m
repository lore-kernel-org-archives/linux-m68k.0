Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB58E20FAB6
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285011; cv=none; b=Nn+8JlKo0iP0oJ2g3xsugC/rp0b/N18zQYGV8O1ECzEKp+FxTM6hloG2Wi2gXwesZlF+JZYo4d0RAad2TEqqkvJIK2U0t7dORIs5y1M/tI82R4P3dXkih1nBNUL+meNazDp4AiOftHR/z0FoC9VjOPEW1q7+r3TnuFz2cIWB+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285011; c=relaxed/simple;
	bh=XoGo16974xu1fk/lHH3MBrwiv+6jAQZ8Gyq7SHh/Ykw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lxtVysSzNk19VOBD9d13rA312jSSMb0Cs8CjuWZ1ihxX461e+SFovvWizU66alMMjKX6BVeLBszWz7eFvtceC+4LefiWxb3bS8a9mI8z1fiwbTeCbT8KCUIeDeAstHS+5QEJYVqJIPic6C7aGaZD/Q67JSDRIQIHlt1oT465kqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jijmjaUk; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jijmjaUk"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 8D85B138045A;
	Wed, 18 Jun 2025 18:16:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 18 Jun 2025 18:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750285007; x=1750371407; bh=Xib0sUpmIsUmD93FI3kK15EfHwxzE0U0Bvi
	ZgzDPvgE=; b=jijmjaUkHbj6K2dBUvalngYheSzR8c8SueRvWGB31IG7ZKjV52/
	X2XQ5+y54xgaSbSFhV+gatCCf2ttIBIq6iK+0GbJmkOwlcmrmX2BgQWuYLbxHikF
	ihVhtWSpPIAxFDdfBv9RE+kVFnxQethZU/aTuQaiAVy5o9xfkDoqVL3uveFnVGb9
	gd8gwfdGLcRVGateTcV1bzAB9Eg1Iapli7m1HxYzmJbreFy0WVUIxlxr2WJCGTXu
	fBlCQFgj4gMhvyfH3kthuO5sIdTv9tPHQ7jusv7tBx0YjBhvZtxz6d/5f6CAkzRC
	x9622phj6KfrB5zVr2Fk7SfNUybwJ7QcwGQ==
X-ME-Sender: <xms:zzpTaM3UiE_cxdoA1F0Qm8HVPyJWmvbivTncyn0g-JmsoVJctNmC1w>
    <xme:zzpTaHHlZAeAaY_ZyWqMjO3Gs5gzGQTmvhrWtF5Rt89nknzcV68eCFF80hDdZ7ZMJ
    DFKb-1t3FTkqPLYE3U>
X-ME-Received: <xmr:zzpTaE6PpUXlTRcXt9sv31o1HcJvRXUP-BV5mrtBwmhGi9MBR-S3XTgHrioHitpGFVtdiaCPBShKzj33RYU7Jm_4suLc_fIYJ5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehglhgruhgsih
    htiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehpohhrthdq
    mheikehksehnvghtsghsugdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslh
    hishhtshdruggvsghirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zzpTaF2ECWv5BNQHTt04ddhGcRDZSsjD3mON6GBiS9jl81Vc4HbLiA>
    <xmx:zzpTaPGt-AdmowLOWjxv0koqnD5OzkAdMSkhSICuWRYKqdSkCpD4EA>
    <xmx:zzpTaO8xO6o2Kmcz0rInWgjgWEyYfUD5NQQiZlP6BdLKRImT48t6XA>
    <xmx:zzpTaEmOAmeEQQF0eUqwgbpt4Sl7zEautOl8P3F1HxTOTvW8c60UXA>
    <xmx:zzpTaJMdtobElDJxLqxg77It6AYeLmLa_z-kvuhq-e_mvqiclw6TZMEx>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 18:16:45 -0400 (EDT)
Date: Thu, 19 Jun 2025 08:17:39 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
    linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
Message-ID: <5f196647-fb65-e2db-c985-249c11780149@linux-m68k.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>    
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>    
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>    
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>    
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>    
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>    
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>    
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>    
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>    
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>    
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>    
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>    
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>    
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>    
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>    
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>   
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>   
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>  
 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>  
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org> 
 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de> 
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 18 Jun 2025, John Paul Adrian Glaubitz wrote:

> On Wed, 2025-06-18 at 13:50 +1000, Finn Thain wrote:
> > > How is messing with a hobbyist project "harmful" in any way? That makes 
> > > no sense.
> > > 
> > 
> > If your port was a pure hobbyist project, you would never have brought 
> > your complaint to the upstream mailing lists, where developers have to 
> > work with ALL interested parties and make the necessary compromises.
> 
> Can you list ALL interested parties, please?
> 
> I only know about Gentoo and Debian and both want to make the switch.
> 

That's what code review is for. I'd be happy to show you how your patches 
will have an adverse affect on others, once you post them all. (And I mean 
ALL patches -- including the ones you expect Debian to carry.)

> > But, as usual, you're trying to have it both ways. You pretend that 
> > wiping wiping your slate clean and starting over doesn't impact anyone 
> > else. But then you complain when the upstream projects don't care to 
> > invest effort into your scheme.
> 
> Again, can you list the other downstream projects that would be affected 
> and that oppose this change? Please come with actual evidence instead of 
> just remaining vague.
> 

Again, please post patches instead of "remaining vague". Also, FYI, the 
development process doesn't demand lists. Just one regression would be 
sufficient.

> > The way to find a compromise is to build the thing you need, and then, 
> > if any of it is found to be useful upstream, send patches! That's how 
> > this process has always worked, has it not?
> 
> I have never denied that. The problem here is that I started a 
> discussion to resolve a longstanding problem with the m68k port and you 
> immediately started shooting at it instead of trying to work something 
> out together.
> 

Cool story. But the record shows that you went on the offensive, 
threatening to break the ABI, and I merely responded.

> > Moreover, to the extent that those patches get merged, we will have 
> > the beginnings of a second ABI with a second tuple. To the extend that 
> > those patches get rejected, you will have a fork on your hands.
> 
> I won't have a problem with maintaining the fork. As I have repeatedly 
> said, the Gentoo people are working on the same change, so it's more 
> like the upstream developers that would exclude themselves.
> 

And yet, two days prior, you wrote, "I'm not forking any packages". The 
emptiness of that commitment is abundantly clear now.

> > So, some upstream developers will have to support both ABIs (for them, 
> > you've just created work). Other developers will have to choose 
> > between either one (for them, you've just make collaboration more 
> > difficult).
> 
> You're again being vague. You talk about Linux/m68k as if there were 
> dozens of downstream distributions and projects when there is in fact 
> just Debian and Gentoo which both, as I have said countless times now, 
> want to make the switch.
> 
> So, I have no idea what these other mystical downstream projects should 
> be.
> 

Where did I mention "projects"? You need to read the messages you reply 
to.

> > This is a lose/lose proposition. And if you think I'm wrong about 
> > that, please just send patches and demonstrate why.
> 
> I have received multiple messages now, off- and on-list, from users that 
> are supporting my efforts as they see the value in making software more 
> useful to users instead of just insisting on adhering to a broken ABI 
> that no one really cares about anymore in the year 2025.
> 

Again, 1990's silicon doesn't care for your 2025 package archive.
