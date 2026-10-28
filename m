Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149876;
	b=ndPhlEH4XT8fveYuNvZ2XeejpsiIgZCeP012N8cFB10PesKjEEz5PKhBTRdJcXiql3Qu
	 KjJK8LuIF1A2rPo2rrYNB/LowR0qLI0R3oqjo0YRHMYGVmbj7UeTqa8XdFrM7q3LACY2+
	 dzf+QDNm/IMTCaH7y5Gsr5uYMx3cKTu7cQF8aBTQ6OcdRaUVgLN+lVakdXLPuH00jZkNd
	 HiVCtO2qt1qfLIczdTroa0T0WxOjV4mH6FDqBiS+J56kG+hX80YZD2B3yiJaGjYzcBdIl
	 FNyqhl/uC4MFhcmtdj+XNGDkQorIwXz0R75dlb+aUC9SRyhQUrZE+rtsM16AdRXo1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149876;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=5IKzo7/A3y32NJ/pEQ2qTEmMPBx7g7kojNzOmBVbPU4=;
	b=M2E7too60Dx03NhzxCtLmnNGBYogWPblE6Api2e0kvGfoRBqs1L6VT86DNv7l/VCuWr1
	 cVAYdoJDNv72Ezhi3oWwVsmRNmNKGXQm2vBa2Mv08LbgGqQj70+zOw1s79N2vWyWB9cLW
	 z0+mHiQntYD964M5Sdyptlb35461aLWJUGtjAEt+6f7tPwgLcyubl5oDnbHlw3f/XPOBk
	 3CXMfAZpNN+mdOm7tpKggCSPsNkPtPZCq/asVewGbXhFeot2P4erv+9UbgGl8F9YXaYFn
	 BzGs+bSgrqskCmnj3KJHaJ24gPh2XK1qs60EA/9cfO4PPtatz5uW9EvyIweDf0Gf37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACqfTs1J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70522606A324;
	Wed, 28 Oct 2026 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACqfTs1J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6291F031E0;
	Wed, 28 Oct 2026 01:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793149876;
	bh=5IKzo7/A3y32NJ/pEQ2qTEmMPBx7g7kojNzOmBVbPU4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ACqfTs1JxeKG0X0Dt430UvQsdookJbPduRQpt1lKudFHcH4ELjFC+5FQ3OuLWuqNO
	 nLSz7OiS7f732yXyr9VKfaH7RfBiy7trz7pNyqRVtR7qkveSXWllMn55bEWf7wKA7o
	 U1wWVPOXWj860JMb87G7uVkvu1kc6Xb46R3mylEA/oe8uiKaGp4ZA1LiZhzjtQdcvd
	 YaE/0QcwiBI3kNlYqMy2er2taAHnyTMD2QpxM3OwuBVIZr6leaLEDqs7HTzwPTAkCl
	 VXmopFHxz2AJvzNy9M4cUE945WBbnOPvev3GkbaId30TgAfN8uf9CiuqahWTJvM7tO
	 3BA6wTIOoU4pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444593AA9413;
	Wed, 28 Oct 2026 01:11:16 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <0a0661a9-2fc5-45d6-9b89-8f77019789a3@linux-m68k.org>
References: <0a0661a9-2fc5-45d6-9b89-8f77019789a3@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <0a0661a9-2fc5-45d6-9b89-8f77019789a3@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.4
X-PR-Tracked-Commit-Id: cffad6e71539bc00d5a76c0c1057dc067d42715c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 857c32a3b82c4f4abb7addee394c4dbfc79ac6db
Message-Id: <179314987480.422389.9946903569789396991.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 01:11:14 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 26 Oct 2026 23:22:52 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/857c32a3b82c4f4abb7addee394c4dbfc79ac6db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
