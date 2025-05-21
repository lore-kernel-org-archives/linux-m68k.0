Received: from anath.zia.io (anath.zia.io [192.80.49.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1A622B8C3
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 02:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.80.49.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747794399; cv=none; b=BK4hTG89GOGt0P2LvTFSsI0MOE2Jip66qVuFcKy2/Bm/3PvUdesh8L3eBB5+zOXbcr5ABmdMlbSB5NDKsXlgtAPuJf+jO0oMrtfQobx/D7SpmA/OQUyQfaNlAfwFj7XNR4ClmYUhof4NDF8yJZgczB3tAkg/Gfr0acNxC+mjiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747794399; c=relaxed/simple;
	bh=rVGggVL9SS506lWrg9nUV7nx6w5m8YCnPKrYsAsyKW8=;
	h=Date:From:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r8uSVAuMNUoTukOaGH+YTOsihC+TFw81PebaV51xlY4JFjRAYStnMYleoxjhMgpBhjGu3135wfON63cuV45Z6DFka98/WYJHJlRDTszmyXKSXQT4j4vIogIN6NNnmVmuK0SCE0lsWszxwFR2mYnTyRqytBfNQhhB3dtRdea0/gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com; spf=pass smtp.mailfrom=klos.com; arc=none smtp.client-ip=192.80.49.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klos.com
Received: from daisy.zia.io (daisy.zia.io [IPv6:2001:1890:1bb7:b400:0:da:15:4])
	by anath.zia.io (8.18.1/8.16.1) with ESMTPS id 54L1xAAu026156
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 01:59:17 GMT
Received: from daisy.zia.io (localhost [127.0.0.1])
	by daisy.zia.io (8.18.1/8.18.1) with ESMTPS id 54L1x4k8028546
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 01:59:05 GMT
Received: from localhost (john@localhost)
	by daisy.zia.io (8.18.1/8.18.1/Submit) with ESMTP id 54L1x4DH005709;
	Wed, 21 May 2025 01:59:04 GMT
Date: Wed, 21 May 2025 01:59:04 +0000 (UTC)
From: John Klos <john@klos.com>
cc: debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>,
        Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
Message-ID: <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>  <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>  <8734d1kofn.fsf@oldenburg.str.redhat.com>  <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
  <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>  <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>  <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com> <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (anath.zia.io [IPv6:2604:7c00:23:5:ff71:c3ae:58d8:ecb8]); Wed, 21 May 2025 01:59:18 +0000 (UTC)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (daisy.zia.io [0.0.0.0]); Wed, 21 May 2025 01:59:05 +0000 (UTC)

Hello,

> As I pointed out years ago, you need to stop wasting effort on packages
> that aren't relevant anymore, due to bloat.

There's no real point being made here. Which packages aren't relevant any 
more, due to bloat? Who decides?

> And here's another thing you need to understand: there is no future for a
> port that has no porter willing to identify relevant packages and send
> patches upstream.

This is a non sequitur. Reporting upstream is nice, but a port can exist 
without stuff getting reported upstream.

While Adrian is obviously emotionally committed to improving Linux on 
m68k, the points he makes have reasoning, thought and explanations behind 
them. None of the arguments from you, Finn, make much sense. You're 
talking about irrelevant things and bringing nonsense examples in to the 
discussion. Your examples lack technical merit.

The issue really boils down to this:

Should Linux maintain a 32 bit platform that has alignment issues because 
programmers make bad assumptions?

Your argument is that ABI breakage is death, and that projects and the 
world are better when we tell people to fix their broken code.

I agree that ABI breakage is a huge hurdle. At the same time, the ABI will 
change to fix 32 bit time. Is there any good reason to NOT switch to 32 
bit alignment at the same time the time changes are made? I can't think of 
any reason.

So can we all agree that there's no reason to not change alignment when 
the time changes are done?

Next, I also agree that programmers should not make padding assumptions. 
However, the real world shows us that there are way too many gatekeepers 
who scoff at the idea of supporting anything that's not Arm, amd64, or 
perhaps RISC-V. They don't care if their bad assumptions about floating 
point affect embedded platforms. They don't care if they've assumed that 
nothing of interest ever runs on big endian systems. Heck - they sometimes 
don't even care if things no longer compile or run properly on 32 bit x86!

Dealing with them is tedious. Sometimes a private email to the right 
person in a project leads to a proper fix, and we don't even have to 
publicly talk about the fact that the failure was on m68k, VAX, Alpha, or 
whatever.

I've done enough of this to know that it's far, far better a spend of my 
time to make things work by default where possible, and if not, to 
maintain local patches with an email sent off to good people so the 
gatekeepers can be avoided.

If you think that the work of getting projects to care about edge cases 
isn't hard, then good for you - perhaps you should volunteer to do it. But 
at the same time I've seen you say you don't need and arent interested in 
these fancy new languages and packages, so I can't see you volunteering to 
do it.

So if you're not going to volunteer yourself, then it's not really your 
place to suggest to others that they should be doing it instead of taking 
the easier route, which is to make more things work by default.

> But, if it's not already dead, you will kill Debian/m68k if you break the
> ABI contract.

It's frustrating that you'd write this.

Are there so few fans of m68k that this will kill Debian/m68k? If so, then 
the 64 bit time change will kill Debian/m68k, and there's nothing anyone 
can do about it. So are you saying that the death of Debian/m68k is 
inevitable, and that we should all just give up? Anyone who still wants to 
run a modern OS on m68k hardware can still run NetBSD, after all. Right?

Or maybe this WON'T kill Debian/m68k. And if it won't, then making two ABI 
changes at the same time is no different than making one. Right? So why 
not make the default alignment for m68k fit what programmers, who we all 
agree really shouldn't be assuming, assume for 32 bit so more things Just 
Work?

I see absolutely no compelling reason given by you or anyone else about 
why this shouldn't be done aside from ABI change, and if if the ABI is 
about to change for time, then that reason becomes moot, doesn't it?

Or do you or anyone else have a reason why it's not moot?

> Nevermind removing that characteristic which provides it with a unique
> advantage, being a smaller memory and cache footprint.

This is ridiculous handwaving.

If the memory footprint of software goes up enough to matter because of 32 
bit instead of 16 bit alignment, then perhaps someone should tell people 
running the NetBSD/sun2 port. The very latest NetBSD runs on m68010 
systems with actual 16 bit data busses in 4 megabytes of memory with 32 
bit alignment. Think about all the memory they could save!

Ok. That was a bit snarky, but do you really expect anyone to take this 
seriously?

Likewise, do you really think that the overhead of unaligned access is 
outweighed by the fact that more stuff fits in the cache? Seriously?

> Try to see the big picture. All ports will suffer the same fate as this
> one: fewer users, commercial irrelevance, reluctant contributors and
> bloated packages.

What does any of this have to do with fixing alignment on m68k?

> The relevance of m68k is now the way in which we respond to those
> challenges. If the best that any port can hope for is ABI breakage, we've
> failed.

Are you here advocating for the termination of Debian/m68k? Or are you 
saying that alignment shouldn't be updated, and time shouldn't be updated? 
I really don't understand what you're suggesting.

> One does not age gracefully by pretending to be young. m68k does not
> contribute anything by becoming the same as every other 32-bit big-endian
> platform.

This is nonsense. The natural alignment for m68020, m68030, m68040, m68060 
is 32 bit. That Linux didn't follow the SVR4 spec for ELF was an error.

I really want to know:

Who gets to make the call about whether or not the change is made?

John Klos
