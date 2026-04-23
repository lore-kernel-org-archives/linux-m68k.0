Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34344392C46
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Apr 2026 22:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776981763; cv=none; b=qEVzCGBWNT4Mompm5k9J262I8qrhFs7P254e0alqBDHOwoGiygyLxLG4Y0dpIff2HK3bGvtPLiSbIxw1R5utPKA1iQIM4YYGCAmQ0qZP4AQoTlCT2SCwLdpMLtFUWu4H9U/cgV+ZzA+KY+0KKU8HhX0hAzqdUWwZ5fCErruFrww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776981763; c=relaxed/simple;
	bh=iesPwsztrmjzqui51g0i4ZUJjHRh01BEx/nK4WBofiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jg45VowAloQJNwjwocYMuRyHBN1LqnUZXLMTjeNlwNp4TAuEK4eRDUw4cZXkl3dSrdyKRDWae0RjJdJo0FZDTzJAHsaQmuhccDfkW4nl0LkGZkmLoePrZjSLAe9slt63k1LkoxLPuy+7f/VEHDJ429q9mOuRsXdg+Z6oPbIujrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nICZytuC; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nICZytuC"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C76E4433CD;
	Thu, 23 Apr 2026 22:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E931FC2BCAF;
	Thu, 23 Apr 2026 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776981761;
	bh=iesPwsztrmjzqui51g0i4ZUJjHRh01BEx/nK4WBofiE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nICZytuCKFQx1NjUGnK00MlvMZ6BTkRxWuArGYeg7uSAoyotoI5/n4t5tcrHYpN5E
	 X8GHApH6zuetYq6cytvOKH8mh3lUPOlm/zyXh+nsvfKowVoc09bNmUIZqmFh+xc2ig
	 AEpr9ftRmvzoQJrUt0gbv2fzKbvdFTgQhbn8WZ8Jqvtx6hcmc2R0cVyo1j1SJEwJvD
	 0rtpedsKqqsFQTse7FsMeb8gzXK7EsoKsGiZ3ZfOZMaV1/vQ7qh3iWXfSsN+aJIDGJ
	 dP2a1MaJ6DXgdShAvpMDtlLnm46sNF+D4bgElxfEICpjqQJo8qmNhBhI2AebrByk8R
	 cgtgFUn1MgGyQ==
Date: Thu, 23 Apr 2026 15:02:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Daniel Palmer <daniel@0x0f.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Paolo Abeni	 <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Michael Fritscher	 <michael@fritscher.net>,
 Byron Stanoszek <gandalf@winds.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-m68k
 <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH net v2 10/15] drivers: net: cirrus: mac89x0: Remove this
 driver
Message-ID: <20260423150240.07c350a2@kernel.org>
In-Reply-To: <aee0393e2a2bd5a5d0bf8aee758122633e54aa06.camel@physik.fu-berlin.de>
References: <20260422-v7-0-0-net-next-driver-removal-v1-v2-0-08a5b59784d5@lunn.ch>
	<20260422-v7-0-0-net-next-driver-removal-v1-v2-10-08a5b59784d5@lunn.ch>
	<CAMuHMdV-vF6sTvAi8kKzxGwZ9YUSBO1Qta5PDCRbA0zr-LEp_w@mail.gmail.com>
	<c0c80113af470b265650405fa24deefe2d82ea24.camel@physik.fu-berlin.de>
	<CAFr9PXnECog56b+Jq9TBohhQ4oBB3hGV1pHj6OstOSLqkOpcTQ@mail.gmail.com>
	<aee0393e2a2bd5a5d0bf8aee758122633e54aa06.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Apr 2026 11:28:11 +0200 John Paul Adrian Glaubitz wrote:
> > > Retrocomputing still is not well regarded by some maintainers, it seems :-(.  
> > 
> > I've found bugs in drivers by plugging those things into exotic
> > hardware like my Amiga 4000 and Ultra5 [0].
> > So, it's not totally pointless. And having a shader capable Amiga[1]
> > is pretty cool.  
> 
> Not only that. Those exotic architectures also help iron out generic kernel
> bugs and give new maintainers an possibility to get their feet wet.
> 
> > Sad to see fun stuff getting pushed out by basically spam bots. :(  
> 
> It's not so much pushed out by spam bots but by the commercialization of the
> Linux kernel. Many developers think that the sole purpose of the Linux kernel
> is to run on modern commodity hardware.

Please send that MAINTAINERS patch to designate yourselves
as maintainers (like Daniel already did for another driver).
This is the ideal outcome.

We want to be welcoming in the community. But being a part
of the community means participating in _work_.
