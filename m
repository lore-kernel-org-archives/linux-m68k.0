Received: from anath.zia.io (anath.zia.io [192.80.49.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAF17A2E8
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.80.49.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747849005; cv=none; b=DLLhWYVRUCNCzISQt5GTtblPBNPe5rWrpiWDSYm0jNIcGSWu8nBw9VGk0891LhDOPUNhBEVJLCs8QD45AvKABvtxYy8mH4V+wtYu9vecwCXOOou2P53bVBfrJC1tD5yonETzlPZ8sz63fb1ajF4QHZ+ocLfh+NqONOaHpRehiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747849005; c=relaxed/simple;
	bh=m8tajTYt5jDIHHia063lfAgMMVxN1hETh4G3EugtsLM=;
	h=Date:From:cc:Subject:Message-ID:MIME-Version:Content-Type; b=LVOZt7Q0sf2bzQF2OP001ZGCHZUjaEPOLbgrQFApEH6ygSF5VDE3kptBernfkuIyld3kW1phstIJgpGSAzickUhXZIawZDneYWfzY5e4Rdh1Jc19Bn+IiDJZWfVrUWDpYLRhkU/Lo7lFA0O4UFQuEtQOIbRo0DbVFJVVWVjIfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com; spf=pass smtp.mailfrom=klos.com; arc=none smtp.client-ip=192.80.49.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klos.com
Received: from daisy.zia.io (daisy.zia.io [IPv6:2001:1890:1bb7:b400:0:da:15:4])
	by anath.zia.io (8.18.1/8.16.1) with ESMTPS id 54LHaXhe008238
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 17:36:40 GMT
Received: from daisy.zia.io (localhost [127.0.0.1])
	by daisy.zia.io (8.18.1/8.18.1) with ESMTPS id 54LHaRui026349
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 17:36:28 GMT
Received: from localhost (john@localhost)
	by daisy.zia.io (8.18.1/8.18.1/Submit) with ESMTP id 54LHaRGv026673;
	Wed, 21 May 2025 17:36:27 GMT
Date: Wed, 21 May 2025 17:36:27 +0000 (UTC)
From: John Klos <john@klos.com>
cc: debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>,
        Libc-help <libc-help@sourceware.org>
Subject: Re: Tuple and changes for m68k with -malign-int
Message-ID: <a3c6f16d-95fc-c2e8-cd7c-b6941858b560@daisy.zia.io>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (anath.zia.io [IPv6:2604:7c00:23:5:ff71:c3ae:58d8:ecb8]); Wed, 21 May 2025 17:36:40 +0000 (UTC)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (daisy.zia.io [0.0.0.0]); Wed, 21 May 2025 17:36:28 +0000 (UTC)

>> There's no real point being made here. Which packages aren't relevant
>> any more, due to bloat? Who decides?
>
> Users do. I've said so several times.
> https://lists.debian.org/debian-68k/2023/08/msg00023.html
> https://lists.debian.org/debian-68k/2024/10/msg00024.html
> https://lists.debian.org/debian-68k/2024/11/msg00019.html

None of those links are relevant to a discussion about software bloat 
and/or who decides if a package is suitable for m68k.


>> You're talking about irrelevant things and bringing nonsense examples in
>> to the discussion. Your examples lack technical merit.
>
> Perhaps you can show me the technical shortcomings of the patch I sent to
> the python project?

"your examples" refers to the "irrelevant things and bringing nonsense 
examples". Your replies that ignore what I'm clearly writing lead me to 
believe you're not engaging in good faith. It was literally in the 
previous sentence.


>> Your argument is that ABI breakage is death, and that projects and the
>> world are better when we tell people to fix their broken code.
>
> No, that's not what I said.

You literally wrote, "But, if it's not already dead, you will kill 
Debian/m68k if you break the ABI contract."


>> So can we all agree that there's no reason to not change alignment when
>> the time changes are done?
>
> We've been over that before too:
> https://lists.debian.org/debian-68k/2023/08/msg00023.html

The discussion at that link offers no reasoning for not doing the 
alignment change.


>> If you think that the work of getting projects to care about edge cases
>> isn't hard, then good for you - perhaps you should volunteer to do it.
>
> I did that already:
> https://lists.debian.org/debian-68k/2024/10/msg00042.html

You half heartedly offered to help with projects that don't accept 
upstream patches. Does this mean you also volunteer to contact them in the 
first place? Have you contacted anyone directly yourself, aside from 
sending an improved patch for python? For instance, have you contacted 
anyone regarding any of the issues with the packages in Adrian's list?


>> Are there so few fans of m68k that this will kill Debian/m68k?
>
> Once the ABI fragments, there is no "Linux/m68k" any longer. There are
> isolated groups of users/developers with limited ability to collaborate
> effectively.

So what do you suppose will happen when the time changes are made?


>> Or do you or anyone else have a reason why it's not moot?
>
> As I've said, I'm okay with a Gentoo/m68k profile for ABI experimentation
> as long as the default profile tracks the upstream toolchain:
> https://lists.debian.org/debian-68k/2024/10/msg00045.html

Does this mean you want / expect the default profile to keep 32 bit time?


> Well, your handwaving is no more convincing than mine. Measurements are
> welcome, though it's hard to know which hardware designs to measure.

Nobody would ever argue that unaligned access comes with no or little cost 
in overhead. They might argue that some modern processors pipeline enough 
that the cost can be folded in to execution, but that's about it. It's a 
well known fact of programming.

Calling my examples handwavy is childish, unless you want to argue that 
the cost of unaligned access is in dispute. Do you want to do that? Do you 
REALLY need measurements of something so well known? Or are you trying to 
deflect?

My example of a low memory / memory constrained system that does very well 
with 32 bit alignment is NetBSD/sun2. I don't have data, but I don't think 
I need data when the very lack of someone saying, "hey - we really need to 
save memory, but we're going to ignore this One Neat Trick in order to 
save more of it" is sufficient.


>> Likewise, do you really think that the overhead of unaligned access is
>> outweighed by the fact that more stuff fits in the cache? Seriously?
>
> Yes, some of my 68030 systems have 16-bit data busses.

Those are two wholly different things.

The point you might be trying to make is that a cache miss on a system 
with a 16 bit bus is more impactful than on a 32 bit bus system. Point 
taken, but that's a rather small edge case (plus you've offered no 
measurements to show the increase in cache misses that comes from 32 bit 
alignment).


> As for the ones with 32-bit busses, I'd expect that two cache accesses are
> generally faster than a long-word-aligned RAM access, though you may be
> right about those algorithms that miss the cache.

Sure, but we're talking about one access, whether cache or memory, versus 
two, cache or memory. The instance where one access to memory happens 
instead of two to cache is very likely insignificant.


> BTW, my Apple Workgroup Server 95 has 512 KB of L2 cache. If I can get
> Linux to run on it, I think it might provide some interesting
> measurements.

Sure, but again, this has little to do with this discussion.


>>> One does not age gracefully by pretending to be young. m68k does not
>>> contribute anything by becoming the same as every other 32-bit
>>> big-endian platform.
>>
>> This is nonsense.
>
> It is the main reason why porting to m68k leads to better code.

I agree with that, but not fixing alignment so that m68k can remain the 
canary in the coal mine isn't a good reason.


Look - there is an incredibly compelling reason to NOT do this change. I 
agree with that wholeheartedly. The reason this thread bothers me so much 
is because instead of discussing the one good reason, discussing possible 
solutions and mitigations of impact, a lot of this discussion has been 
derailed in to irrelevant and sometimes outright intentional diversions.

I really, really would like to see the discussion follow something like:

1) Are we doing this?

Separately, and without constantly going back to (1):

2) If we are going to do this, what will it look like? How will we do it?
    How will we make things easy for users? How will we deal with
    compatibility with old binaries? Will we use a new tuple? How is
    compatibility with binaries using 32 bit time handled, and is what's
    being done there applicable to this change?

John
