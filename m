Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517AF2AE84
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 22:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538351; cv=none; b=SUo9z2Qb5QMKrUTEohNnaCM5yRsQSZYqJqmQ+2BmxbIcJdEXEHig+voPGquFsqrK35E6bCQ4i9PCUAzi7CTrzkhOkOi3KSJECqMHaxabtEqTPLYHpPLONt2YDkwbbnVRHsyLm+gnSW9UQmuNBhgF84lfUxhASUoU67dHSPJpRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538351; c=relaxed/simple;
	bh=GA5vQJAxGhmelR0mzTRbbGrfktw2VcEqSZf6T4EyZWc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NujjSdEF6jmtttdHGhXPfYOwNKLIgeQNujTfUqi5xte4C0yB2LAgjiTUz+O3Mg1A3T4QAh3b6hLwbmUvIxQxPKPLteIc7Gjxhhf1H//3793bpNhtQoSXKN9U0PpB2ZWWCqmCpyIABWzXdU5QwodCZTjbR91btnKDUDTdC6L2rk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iK1frRvO; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iK1frRvO"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE2EA1140131;
	Wed, 13 Nov 2024 17:52:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 13 Nov 2024 17:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731538346; x=1731624746; bh=UJg/vknmQYd0w59VbBPu+zI4dUoOd5ErJyf
	tJ1i1vhc=; b=iK1frRvOXuWNKZ9XZUBMtn9nVQSCuxt09DvmR91TBidHmXmpRi7
	jTIaL1fsaLiKNPryf0ksjaIIbZXiovmOZEMvzm6aNqVgYKQXbv8CVsHd+BkhuUqE
	4KnIFhBWePkQCotzH6CXg2L3XzMucu712hmk0VQBXOeLxDftaD9jtMHDsoejPZZQ
	qym4ZgCt+/PHtOAEftetMXzF9cFUKEE1D1+6J4cL+sH2gE6vOMNajhTomywNefbP
	PibA2HRuMj4ifrmu/99I2nY/2amGY1/0ZMxuwVggGgmpcm/dkUWA/n5WC9QxhQzC
	RVTyHbg4heXyX2ShtZw2hLbDJtyuL1x8ZRw==
X-ME-Sender: <xms:qi01Z1sQ4XN4PjajsPM8BVsCiEinJpoWxSbUrPykvDA3YWd9aBCaHQ>
    <xme:qi01Z-fUX9EoEsHYcOZiteDEIz08H6GKzfTZDtUMrAhDJxFL7MogGmfO1795kfs-I
    nwJIbME_1_RR14tAVI>
X-ME-Received: <xmr:qi01Z4yIac2uZ0j7MpS1gftgypU1M5oro1x8tMJXatq4GGriyOCmmtncOyN8TEgGbtUE0ymRsrRoe8Z0SP_xUBUwWCWAyGF4n2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddugddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepgffhiefhgedvffeukeffteettdejudduledukedu
    uefhfefhjeeivdeggfdutdevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinhes
    lhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhl
    ihhnrdguvgdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtshdruggvsghirghn
    rdhorhhgpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukh
    dprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehgvggvrhht
    sehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfigrsgeslhhinhhugi
    dqmheikehkrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphht
    thhopehtghesmhhirhgsshgurdguvg
X-ME-Proxy: <xmx:qi01Z8NXkNQixBvJ7l5fdndWjCNDvupOd44Prdgs1JC_SmANuRKCtA>
    <xmx:qi01Z19UVm4-C8a8aML2KzZUexCtkH0IYOSkdcjlKAEqgVWeKht1hw>
    <xmx:qi01Z8XiCTXWY6uo_PTTbvPn6Io5fnRXDhgf30wvfnxR5GbBkUnf7g>
    <xmx:qi01Z2cdLM2hyjN6SJHNoYy0l-Uau-vQCPRkg_XkcZbnjLJSxo7pQA>
    <xmx:qi01ZxSs-5HCvuRbcjyY2tGenp34YsfUBV_zDv6mDLFgXnvjr5-8gXaP>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Nov 2024 17:52:24 -0500 (EST)
Date: Thu, 14 Nov 2024 09:52:46 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
    Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <fe38ec560bae0f0a824f86aa9b9db8855498377e.camel@physik.fu-berlin.de>
Message-ID: <f5a9727e-aea0-5c83-50ac-1407ae966a3f@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>    <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>   <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>   <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
  <762f5be0aec0c50b2589ebbd60c6d104f9871526.camel@physik.fu-berlin.de>  <0c23bc71-d0ff-eec8-1251-29b8517e2229@linux-m68k.org> <fe38ec560bae0f0a824f86aa9b9db8855498377e.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 13 Nov 2024, John Paul Adrian Glaubitz wrote:

> > Then don't leave it to chance.
> 
> What is supposed to mean? Are you implying that I never tried to address 
> this?
> 

Obviously, it means I'm not interested in your estimation of the chances 
of rejection. But you're still trying to twist my words into a slur. How 
tiresome.

Again, I'd like to see an actual example of upstream developers rejecting 
patches that improve portability of data structures to m68k (and to 16-bit 
systems).

> Did you have a try at fixing any of these?
> 

Would you like me to stop fixing bugs that users actually report, in order 
to fix bugs that only distros complain about?

> > > A lot of packages in Debian/m68k can currently not be built because 
> > > they have a transitive dependency on Rust, OpenJDK, Qt, GNOME and so 
> > > on.
> > > 
> > 
> > That's one reason why source distros are a better fit for small 
> > systems than binary distros are. You can't fix this basic problem with 
> > an ABI change.
> 
> Gentoo has the same problem with Linux m68k and they want to perform the 
> switch as well. So it's not just my personal opinion here.
> 

Again, the real problem faced by Debian/m68k and Gentoo/m68k is a shortage 
of manpower. This is not a new problem.

An ABI change will not fix this problem though I do conceed that a 
different ABI could improve the distro's package archive statistics, for 
all that's worth.

> > > 
> > > Well, I'm doing the work, so I get to make the decisions here, no?
> > > 
> > 
> > Sure. Please refer to my previous email about the m68k ABI du jour and 
> > fragmentation.
> 
> What fragmentation? The vast majority of people interested in this 
> architecture want to progress and not keep the status quo forever. And 
> the switch is simply inevitable which is why Chewi has pitched a 
> proposal on this list as well.
> 

No, you're not really interested in progress. There's nothing particularly 
novel about running bloated packages in fast emulators.

And yet, I do agree that actual progress would require a new ABI, and 
you've even heard me say so before though you appear to have forgotten. 
https://lists.debian.org/debian-68k/2023/08/msg00023.html

> > > > Absent the right conditions, perhaps it is best focus limited 
> > > > porter and developer effort on patching only those packages that 
> > > > are really required.
> > > 
> > > Thanks, but I tried that and it doesn't work. I don't want to 
> > > continue spending hours on trying to figure out how to fix alignment 
> > > problems and then maybe send an email here and there to just never 
> > > get an answer.
> > > 
> > > You're somehow implying that I'm requesting this change because I'm 
> > > just lazy.
> > > 
> > 
> > You're somehow twisting my words into a slur. You know that I value 
> > your alignment patches because I've said so before. Thanks again for 
> > your efforts.
> 
> Look, the problem is that this is a) an endless effort and b) in some 
> cases simply not feasible. Codebases like LLVM are completely built 
> around a natural alignment of at least four bytes and it's simply 
> impossible to work around that.
> 

If LLVM developers say that their software is inappropriate for an ABI 
that does not have 4-byte minimal alignment (citation needed) then I'd 
accept their judgement on that.

And when I want to run LLVM and its reverse deps on my m68k systems, I'll 
run them under NetBSD/mac68k.

> There are so many other things I would like to work on and I simply 
> consider it a waste of time and resources to work on the same problem 
> over and over again just because we cannot agree on finally fixing the 
> underlying issue.
> 

Then don't work on it.

My Gentoo/x86 laptop installation is now twenty one years old, is 
up-to-date, and has never had LLVM installed on it. Nor do I miss it.

nippy portage # wc -l /var/log/emerge.log 
409801 /var/log/emerge.log
nippy portage # head /var/log/emerge.log
1063261888: Started emerge on: Sep 11, 2003 06:31:27
1063261888:  *** emerge  >=sys-apps/portage-2.0.25
1063261888:  >>> emerge (1 of 1) sys-apps/portage-2.0.49-r4 to /
1063261888:  === (1 of 1) Cleaning (/usr/portage/sys-apps/portage/portage-2.0.49-r4.ebuild)
1063261888:  === (1 of 1) Compiling/Merging (/usr/portage/sys-apps/portage/portage-2.0.49-r4.ebuild)
1063261911:  === (1 of 1) Post-Build Cleaning (/usr/portage/sys-apps/portage/portage-2.0.49-r4.ebuild)
1063261911:  ::: completed emerge (1 of 1) sys-apps/portage-2.0.49-r4 to /
1063261911:  *** Finished. Cleaning up...
1063261911:  *** exiting successfully.
1063261911:  *** terminating.

> As of now, Debian/m68k will miss the transition to Python 3.13 because 
> the new version requires 4-byte alignment and absolutely no one is 
> willing to help me fix this issue.
> 

I'm keen to see where the python requirements were changed. I wasn't able 
to find that document on python.org.

If you don't want to port python 3.13 to m68k that's okay with me. And if 
you're unwilling to port any packages to any quirky architectures, that's 
okay with me too.

But if you still claim that upstream developers require certain alignment 
rules, then you still have to provide evidence for that. Despite all of my 
requests for that evidence, none has been offered.
