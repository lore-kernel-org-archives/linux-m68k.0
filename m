Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720F43D4F7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Jun 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624944; cv=none; b=YWzKvLKLSF5sjvPvgkYs2v4KqBcD+kC41q1Ghxc5pXSBGr3zqsPfVJY8u6/9C6w3afo4rfFnzTbhiZklzjV9++6NDYUGumWcYkEUDPGSW61ubAFp7Khp0LG+/PStojK1ffkLJoUKQQloYnKA3IC1p1kGYReDdq1vS1BVZr4jB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624944; c=relaxed/simple;
	bh=NQKEtwuJplslo1S0a1EuGFXO5pQxOKxvj/9PhHq1Gw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNDSPQeLOAfRM96DVAZOMI1JLMJ7Nj5ZlVorfes8KubBenbNauKtyPesu4e3+vxCrCdR796iEoWo4vB7YPjATaverr/+TuLyVT937ZTIX5chVK2Ad7HbaGFmeX3njuFZVozPlvKF5nZHebWTrpc6xp32c/p9BWWDD5P2XpglLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1Zgu4IM; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1Zgu4IM"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7B15600AB;
	Tue, 16 Jun 2026 15:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13EC1F00A3A;
	Tue, 16 Jun 2026 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624942;
	bh=LwBPJI0zIYaGqkx1gEaeFo2rsRmh3p4qrOGbWDxyeO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K1Zgu4IMExh7jVVg+2IFXKcFfxCtgqqknPSgNk95pMqsypDLzD2QVFu6TptWzkDGZ
	 1YRTc4b7aRDRfRCJLepsIdRKV5PlqaJRGKGzjOzgErOK+HC6N+5vicmrEDClCyYvrG
	 YEm5iik1EYQiaWU5qzafp8VM/hJ1QPW6iusrwEaaSZWtD/CtGIzbai0Z2JCQJPH2nz
	 4I/CEpzHPrk0WGCzwnkZeJSrepcJ3biv4V1RH6JUebicDQcaPZifoORh3ZbSOpE+do
	 CDP1qjdZij4tJYT85PBnJMjWGjmTmywO1no7Rx4VzWJeyaIo6tBSEENR2qURrq5B8B
	 wOgf3aKc7W4kg==
Date: Tue, 16 Jun 2026 08:49:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Carsten Strotmann <cas@strotmann.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Message-ID: <20260616084901.3319d82e@kernel.org>
In-Reply-To: <A3590144-073C-46D6-8425-90EE0C4D48E8@strotmann.de>
References: <20260615222935.947233-1-kuba@kernel.org>
	<c3789160609a10e232ba3e27c4b13adbb170956c.camel@physik.fu-berlin.de>
	<20260615175535.5bc56cfc@kernel.org>
	<A3590144-073C-46D6-8425-90EE0C4D48E8@strotmann.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jun 2026 09:13:46 +0200 Carsten Strotmann wrote:
> I'm a user of AppleTalk and other "Retro"-Features in the Linux Kernel.
> 
> On 16 Jun 2026, at 2:55, Jakub Kicinski wrote:
> 
> > We can complain about the AI slop til the cows comes home.
> > I don't like it, you don't like it. What difference does it make?
> >
> > If y'all have real solutions please share. Complaining about
> > "commercial interests" and "nuk[ing] everything in a panic reaction"
> > is not helpful.  
> 
> the solution, as Adrian pointed out, is to leave these features in
> the Linux kernel but have them disabled by default.

I think y'all need to internalize that "just leave it in" means work.
_Someone_ has to handle the reports and patches. And since nobody is
doing that the code is going to GitHub, where it can continue to "just
be left" or whatever, without racking up CVEs for the Linux kernel
and leading to maintainer burn out :/

> Maybe put a warning message in the kernel config tools that people
> should only enable these if they know what they are doing.
> 
> These "retro"-features should not pose any security risk of they are
> not compiled into a kernel.

Nobody is stopping you from using this code! It's perfectly suitable 
to be an out of tree module. Maybe it'd be harder if someone wanted to
remove a CPU architecture you want to use, but protocols are perfectly
fine as loadable modules. You can continue to use the code from:
 https://github.com/linux-netdev/mod-orphan

Presumably you could get Debian to package that and you wouldn't even
know the sources no longer live in the kernel tree.
