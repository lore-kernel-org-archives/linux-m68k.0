Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0CD35EDBD
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Jun 2026 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781647220; cv=none; b=pgGvgQiMbrUUochGGCDPDIRXcIsYidJImamHleAZi3g8iYNlROuZtcuUPymote/3fjeO2FXpGBKovN7xcxzkXJdKglL2/OQPt10ln6jsGLo3+f3hFmg1ZZ0d0teJw56kUR/TM6cW2zGkQEMZ8urCBe92/QvPGmpi1LXDgyP1tFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781647220; c=relaxed/simple;
	bh=7a+p+OyXk5sFsbk1C1Cq816Ny9n0Mkp9sVLu/7ongXE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rHGI26B0Nhfrh8rL16lu9j4vsW0ODa+bsEbI9+3njQCl5cQK1fHK30V0JnLyb4/e1M09gcms592i6WHVe4nGJQmdimhpgztZfB8/msQ29tT7jAUeUmP1L0lW/f3SPezwvBMS9NU0Ii/54lLunQ1kFvualvGmo53UQlBkAUziy1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1H0XPZ/; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1H0XPZ/"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38D61600AA;
	Tue, 16 Jun 2026 22:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11601F000E9;
	Tue, 16 Jun 2026 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781647217;
	bh=ga1OeZSzR83I+bdZkALtFqlm11Tz5ZprDN2LnllVuuo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=m1H0XPZ/YZbBgyH3tnrJ6j1r2M6+6elhCGuK0pN6k5a+sJSKsxxgIBnYMzgNBg+aw
	 8al1mUPkhgyi2bTVabXIYMFi/z5l4yV3wd6csAqc8I2mwclV8BxOmBPlGOcMtIo/ZG
	 wEg/r+6LoZPDh2ODMtYPbSPzrG48yfugOVhBI97AdZ7c8txuTlA276H8jaEnUntKSY
	 KgWy5tWRv1vQI8NErJqgroIv1pfhFiKdw2BZck/RCdw7Phs4t5+P6SaatWwO4rYFIQ
	 HTGCnonB9DyI7WfMUOqJG00HcUeqNVm1R+0aEbhZQHFrTqOfaICHHS4LarNk2bCyyi
	 Nrq80K5Jm6ssA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938A13930C2B;
	Tue, 16 Jun 2026 22:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178164721213.1257010.7015290603652926955.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 22:00:12 +0000
References: <20260615222935.947233-1-kuba@kernel.org>
In-Reply-To: <20260615222935.947233-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 15 Jun 2026 15:29:33 -0700 you wrote:
> This tiny series moves appletalk out of tree, to:
> 
>   https://github.com/linux-netdev/mod-orphan
> 
> Core maintainainers are unable to keep up with the rate of security
> bug reports and fixes. Nobody seems to care about appletalk enough
> to review the patches.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] appletalk: stop storing per-interface state in struct net_device
    https://git.kernel.org/netdev/net-next/c/023f9b0f2f4f
  - [net-next,2/2] appletalk: move the protocol out of tree
    https://git.kernel.org/netdev/net-next/c/8a398a0c189e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


