Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50014198E86
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Sep 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585217; cv=none; b=WRASq0IyUGL7MRh9rEZ6A1b/uyVCT229dRHfAbQVXfJ1PVjRrNfn7KjvdW2I4FYackzK0z3SeJN5qpGayHqz1LqDddrln7nLmxhMZ6NL4/rfRF3iCotkdHoN/XzjQZUHqX+9vGEfunENylsRVWUw0XK6Ez8g1d3/BSXp8u8HRlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585217; c=relaxed/simple;
	bh=ZfgA4/JViSBsV8tmHW2to/KT72ZyzCULt7YAReA3E2I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pdIYS3S6xNfkLn3LlnvrSwCwcr2g8ozWAVqno/HxhD3AskA0VybCiQ2RSPfTG9bxqDwSdfy+Whg0Eg8tYV1YA6MGRNiIAPWr9d9vLSsYw5sIB3gf59BFxEN8oXqEz7gSGXQ1ef26dE1Nz/M+kQPuXPYpyvQE+L3ztEUQ4v9dQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRAsGDbn; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRAsGDbn"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6346FA41A8D;
	Tue, 17 Sep 2024 15:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9CEC4CEC7;
	Tue, 17 Sep 2024 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726585214;
	bh=ZfgA4/JViSBsV8tmHW2to/KT72ZyzCULt7YAReA3E2I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VRAsGDbn7kuTSErHGp7cLF6ciRRmALC3ywZRtwcLcBqfgCIuKhHH4pq999Z7HrBMM
	 enVX+MmlQDdBt6dlovswk+F0nw2MS4MU34vGtwxlHGrPdREzFXxTVTJHifrrlv70iJ
	 k+Z7PUzX1nnhHsJR6AYhE/LQqMaWXgbIS77pmKwc+smEvzZH/Gp4gaNJabgnQeZSU4
	 VRefB3xpo+kjIv5hzuQ/GGn5+lOle3XmqjRR/x6/TUHdVP10owEBWuZ9u1SCh6QtFj
	 n3UIBW1unEAwy+0+7GOZn1kzYYwZDWLe3QKWxZpRoBSnc3JpEF2e7e3dHKno4fh4cL
	 6ZG0Yet/wEE8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE8393809A80;
	Tue, 17 Sep 2024 15:00:17 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240916143207.995330-1-geert@linux-m68k.org>
References: <20240916143207.995330-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240916143207.995330-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.12-tag1
X-PR-Tracked-Commit-Id: b90fae5df91744e45e683c17bb1a38e466770df3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8202cc803f3d0a0a7f7e4c08ce575634a0220406
Message-Id: <172658521641.168423.13820957370081838369.pr-tracker-bot@kernel.org>
Date: Tue, 17 Sep 2024 15:00:16 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Sep 2024 16:32:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.12-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8202cc803f3d0a0a7f7e4c08ce575634a0220406

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
