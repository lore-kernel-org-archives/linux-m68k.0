Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593F1DF982
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Aug 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756255212; cv=none; b=SjZ7VNFxq0RwwGu7/VeLcVK/NC6mORmHiF2gE7NQLMtDnqgnOK2CA4+k6rkjLU5BxxH/rMGTOfdD2DNXCHkpcgMgfFPcOsyMERdoUoeOuWKia2bZNU0iT5oXkr+V4J+SsEFJA84fEAkqNNHnZsIM3MMZ+fk/Q33oMsf6vwB+VoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756255212; c=relaxed/simple;
	bh=dGZ2wYBerLgYG3xUDdHol7gEDoSc9y7MhwIAQo1Wsso=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aEx07OCT6B04gQlAD7DY4Oy72CFffmYVpYB0+dHhl4OkKYKjaHWtIYnkbtTVrFvuAvARFW+lX7ugNG2akDj1Uz37pG7ERlrSId9ZSFtpU+87FixFvZ3CzbuqOqTs262Mr3Gii5hOsgvXc5+Mozyod8rQAcYgYHCkTWDjNTB7Wr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U05FXyj1; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U05FXyj1"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08E954510A;
	Wed, 27 Aug 2025 00:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D702BC4CEF4;
	Wed, 27 Aug 2025 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756255209;
	bh=dGZ2wYBerLgYG3xUDdHol7gEDoSc9y7MhwIAQo1Wsso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U05FXyj1G44ix+RrHQyyIvoknDIAbVNruoay9H4OoEpNMZhrR7v8TWKsMS/Jx2gn/
	 zP20CKe2jJjJsDzbghxi9II6SvtejsKVUpdvMO53M1Ejtf0oD9pcU4ao82wr1S8FmV
	 5IfCCKuwS8jJfdooEAaJtbXzM6IlanvuNNn5j84VwnGTE11lGDgXPLPEMBVoEW7Sm4
	 IHF0Q9AnF3TxIb26uKFaWWOqJWX6o7ZADz4fjYwsYFa42MT+oiezq/nqzqzvt1lFyZ
	 kj11a/FDDV/aUgMTWywqZGGHQtayq2kj7HexGFvKUMOXtWaAbbiT09sK6Gob8KTrs3
	 3botVLJ9sm6Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD04383BF70;
	Wed, 27 Aug 2025 00:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: fixed: let fixed_phy_add always use
 addr 0
 and remove return value
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175625521749.151180.6244131462600024014.git-patchwork-notify@kernel.org>
Date: Wed, 27 Aug 2025 00:40:17 +0000
References: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
In-Reply-To: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: gerg@linux-m68k.org, geert@linux-m68k.org, hauke@hauke-m.de,
 zajec5@gmail.com, tsbogend@alpha.franken.de, andrew@lunn.ch,
 andrew+netdev@lunn.ch, linux@armlinux.org.uk, pabeni@redhat.com,
 edumazet@google.com, kuba@kernel.org, davem@davemloft.net,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 22 Aug 2025 22:36:11 +0200 you wrote:
> We have only two users of fixed_phy_add(), both use address 0 and
> ignore the return value. So simplify fixed_phy_add() accordingly.
> 
> Whilst at it, constify the fixed_phy_status configs.
> 
> Note:
> fixed_phy_add() is a legacy function which shouldn't be used in new
> code, as it's use may be problematic:
> - No check whether a fixed phy exists already at the given address
> - If fixed_phy_register() is called afterwards by any other driver,
>   then it will also use phy_addr 0, because fixed_phy_add() ignores
>   the ida which manages address assignment
> Drivers using a fixed phy created by fixed_phy_add() in platform code,
> should dynamically create a fixed phy with fixed_phy_register()
> instead.
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: fixed: let fixed_phy_add always use addr 0 and remove return value
    https://git.kernel.org/netdev/net-next/c/39e94fdce45f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


