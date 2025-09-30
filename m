Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08237153BE9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Sep 2025 02:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200869; cv=none; b=fBCHufHACBz+H9loySHrjtOCbbT4KezanMcRAJRmGn+GFLsRTv8+8928M46OZZF0FQbrw7E3QVcaEZIGFbPzT3lbreaFeDkfywwNwMO5j5m4MdPOPemOA4G2rwQp8OabBOIvU4VGzenWyZZvu+jsKp6VwvZpGj+9fJZ3g+Kat18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200869; c=relaxed/simple;
	bh=je3gIsAsl9yWB2e7Ll3nCfkjmu8FWFLvgLuURNmUVzU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KJsu0AzdW/YYbQoScvNcE18UymjMGUC57hQOivQKlusPwrA1ivJwralzKXFyatqWHFLt96Ng4/VEYIOCO0G9B/kd/+ygeW3JD5XFpBG4niGfVnUnSEnAU7PRsqgCLDqeDXtmvN1JI6fp6xYJ8CljTfpI2Pooiwq3XgzxJWggs9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOG3b+o8; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOG3b+o8"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB4816020A;
	Tue, 30 Sep 2025 02:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3C1C4CEF4;
	Tue, 30 Sep 2025 02:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200866;
	bh=je3gIsAsl9yWB2e7Ll3nCfkjmu8FWFLvgLuURNmUVzU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KOG3b+o8oREVCaX33RNp7PegVdjypRS3e4B4AArfLRXcy6kjpa/Kzubvs5rPUSZ/q
	 oRlTtAidDOmA7SD/hxnjKu8P417VOpDBwyHmtc+r5M4ElcrrUTZ/PVpegF2OudYwJJ
	 bl3Bd0fMGO09NB0zxeBymu9O6FujBDYqHF343sjwWNEZJW8wy/g3u7kMKsApyDbLEz
	 bE1hLZwsSmE+f4+DC38duVER/4AB8KxCpq3WjlcQyLHZa7khBFI4ixgFt82bmXqtXJ
	 2N0Vw2AH1lUysfwr1rm1QFCJ3qcsuucSHyVPxA9JAAaT0vs96qZw4t5j6nQ8sCSHNB
	 e9UV/ClnBgEow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FEB39D0C1A;
	Tue, 30 Sep 2025 02:54:21 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250929091005.2829122-1-geert@linux-m68k.org>
References: <20250929091005.2829122-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250929091005.2829122-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.18-tag1
X-PR-Tracked-Commit-Id: 695f2c0c25f3c844f9dd177d20c1e8afc55df1ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1004b2f19d7e9add9d707f64d9fcbc50f67921b
Message-Id: <175920085973.1805104.16407289749945630957.pr-tracker-bot@kernel.org>
Date: Tue, 30 Sep 2025 02:54:19 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 29 Sep 2025 11:10:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.18-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1004b2f19d7e9add9d707f64d9fcbc50f67921b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
