Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE04B1A2550
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Jul 2024 19:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721157934; cv=none; b=P0HNGRr6zXzaTF49dXnBmhOfjpQjo0OIJJpDV3J7yvAvEW7IYHvFCHqWjttvfRmtj9ZxO31qyZKryLYh+Q19ORcG+rQIdRmUqpsB/obBfsLYPR2IvORKT1wq5lg9PZ1vX8NJKNqRzw/rMdNHADHSm80F13y0iZOQZoRmZ1alPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721157934; c=relaxed/simple;
	bh=HE6FQoFccnHOIWK7JGwW/JoUI1msYJ99vMuY4XTH+F0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=U36fPKCPrP0w7i31do9DRXKrkfL1pGRnVolGhgIYVFJgmA/OQNq2i66ZdQEk7bpYOrwz0xJZSc2j+8M5niCRdumFG7+nmu2YTBTpvJ+duQzieG0NgHPu6rYuPrbGZ/ZoESNS2vvPTgqFhHSLan7wqrQuE85JwLoC1FqRkF6nxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXdYfZRq; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXdYfZRq"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D4AB60A0A;
	Tue, 16 Jul 2024 19:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D49BDC116B1;
	Tue, 16 Jul 2024 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721157931;
	bh=HE6FQoFccnHOIWK7JGwW/JoUI1msYJ99vMuY4XTH+F0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nXdYfZRq+wBCL488TT1qceoLMPEvwc2V7Pqs0ZPGh/zqUiADMQmEQGtMPu0a4EH0N
	 7ZzBpytJWIr+9Q/4mEvsuZddap2YqUu0soHm1iaCE9VWEQpKoV21IGp/DtXNTQAKAM
	 cDb0G7DPeRgBpZIwm57G6K9RP5wOqz/e5e2DgAJHl2MDBLiz76AyPUwUYFODnjXUjP
	 cG3YuaP96qZ9BWEgDS7PLLk4QD3cvM/HgGdVo05SV1isFPwyvkC3X8GRf8bEMYSp+w
	 8hiVTKjcnhaJfMr8eyMR0KRnsM9keYm5zQYsr5Tke6qghP2v+83g2sRcu2ulcLJFEf
	 yTNE5YkfAWN2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9CFAC43445;
	Tue, 16 Jul 2024 19:25:31 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240715102110.1764643-1-geert@linux-m68k.org>
References: <20240715102110.1764643-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240715102110.1764643-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.11-tag1
X-PR-Tracked-Commit-Id: 21b9e722ad28c19c2bc83f18f540b3dbd89bf762
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99298eb615debd41c1fccff05b163d0a29091904
Message-Id: <172115793181.10577.11465814603273272068.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2024 19:25:31 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jul 2024 12:21:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.11-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99298eb615debd41c1fccff05b163d0a29091904

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
