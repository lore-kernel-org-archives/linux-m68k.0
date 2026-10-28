Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793230807;
	b=1vyvIL/102QqUNarxkub6pMhtNft6sGLYL2Tv3i/dmiviKAJK6JcFoXF85dqlBaW+UIS
	 PHn2QbEUuJsj5KLJdB6XEc4Om25m/stNPrZWEoou+Q/tTkQ/FHy2Sbj5emBAg1LIUGQBC
	 YkdHDj7qBLnbuahKzWgfR21ulvBW0JcPjqeP6k2+K0TOB+u9WDOYmX/X04G/e31jbZDkm
	 Gqn8NK6tMbX8hWLwC5T9aHYNhsxXkQDJxgvkpe4cHWALil0TJ373//nbNUCGlWz45yvZB
	 mcpm/Xb/JXmqNBlht37+ls1oyBE/z1EsldJcyZyPAIewThuvNBKGnjQqoudvabEVwsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230807;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=uY2kI5z3bPHYkCHhQ2AdcAWS/ONiyP3o5qHkCj3UvpI=;
	b=IfyBKPfE9KXAiUcjs3yt2tELgBAfGF8acVxZWiN8RRKIx2a7AEG1xZoknJeECgp/rcV0
	 UTx3tmPZnP2iNiynA3fnKmQ0m8iQi+NMHJsGSGlCR+eQIzwcsds6KKE6ils4pTnQJxlOu
	 BIQygAJielXRRNEE0c/pHafaLtPPGOrxUNfWECo7IXo395v3WKb1gZIs/hk+AMD0qlhvp
	 wZCAhsiWeE/WT0J2+DiebTS9nE4J8xrC9Mx54GGGPxrCdVci4QBWHpZzn/7zC8to2+g/X
	 ttmldftSuh4XifhlKwy3+fMs9L/TH15LcxODocpnPM8CsXTj/AKqSrvKR09KufnhwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7v49fpM;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E559F606A31C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Oct 2026 23:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E559F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7v49fpM
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C53E42E23;
	Wed, 28 Oct 2026 23:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E07C1F01825;
	Wed, 28 Oct 2026 23:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793230806;
	bh=uY2kI5z3bPHYkCHhQ2AdcAWS/ONiyP3o5qHkCj3UvpI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g7v49fpMS2sx+JeJFdKwaqHkrbC8e32qKKp7iZLRu6EsboT9X/yErghx1jEY8wlex
	 QBUUj5uJ2wlsDEEeG0RAPkO1XJM6Ky3QtEyFX+3ykiFgHd4CAw4mLWDgFBxXpA0YSj
	 BC8KtajXrJy/uVgyQ6BFs3GPD3u94FePuT8t3kBt4jd1SmTRaHQiqFGYmYnF5cu6/1
	 qShZUUO2B7cKV+c/c6ApcpciwdTX7OdTeBDfC3TTXY5+ibT+q2hOm/xL+lBVOLJ13E
	 tO8PTTL7JO+CMU3yBuqUvdIPDs+7ntJZdAsxpQMzfzIbg4mj4Tc+sDAk8IHsrYrBI2
	 sdLp3PQ6mY8Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444683AAFC4C;
	Wed, 28 Oct 2026 23:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: i825xx: 82596: use MMIO accessors for the MVME16x
 PORT/CA registers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179323080507.1480461.14843841868832449618.git-patchwork-notify@kernel.org>
Date: Wed, 28 Oct 2026 23:40:05 +0000
References: <20261025024514.802862-1-daniel@0x0f.com>
In-Reply-To: <20261025024514.802862-1-daniel@0x0f.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, denis@h3q.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 25 Oct 2026 11:45:14 +0900 you wrote:
> On the MVME16x the two port registers need to be written in order to latch
> the correct 32bit value.
> 
> The way the code is currently written means that modern GCC can decide to
> optimize the writes and break that latching.
> 
> Convert the MVME16x specific register accesses to use the proper io
> accessors to restore the latching and make the driver functional again.
> 
> [...]

Here is the summary with links:
  - net: i825xx: 82596: use MMIO accessors for the MVME16x PORT/CA registers
    https://git.kernel.org/netdev/net/c/7cceaba6ffbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


