Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B53E3C77
	for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352777; cv=none; b=OXF+tMcUUXCkDZEhX2eACkov/bGCtKNvUOSiAm8NlZ8ump+SJruTlt8/aK6yad+/Fjwyu3tQXrsnCrpCjYryNf5PlYbvr7UkZKWKdCcMwupnE2epq5HbdL0qZA9yxowRAOo+VhkNvo/1KYZ/axJyJjyUBx7R7AWOMuj0jw05Zeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352777; c=relaxed/simple;
	bh=LGLxUXqvxFBnDZE/5VyDuUy2Y2iI6m2JKyegBgDiKdc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XEEpduGhMcCJ6Gn+GBYVAb08lv6xQ0hbuVnEmbBiuSwcILcyRkeAUrPEh7UmEksXH5x4AGsIUItW5kn3dU35ANjGaFSig163inbpV5WZgpLMeZEn551TB5mNGSeX4dwQrAuExlVxoD50f6QNuT+XNHrDoHrkA2APk7h3NTuRZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4FVTBss; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4FVTBss"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 439A960126;
	Thu, 16 Apr 2026 15:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB87C2BCAF;
	Thu, 16 Apr 2026 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776352775;
	bh=LGLxUXqvxFBnDZE/5VyDuUy2Y2iI6m2JKyegBgDiKdc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D4FVTBss7XtuCW6Bmlnhi4ENGhJrV6CHYkPrSP+OoG6AFa2h6jOfeaRr2sfWC/430
	 DHdMoglYh6+I3ANeOOOa1qmTj297f6a4bRM8+ITS8xUtDRZyadNp96fkrqVObOTMKr
	 aEddxY0CWTnCmlR2cH4fKpwbGKXjQV2m2GaoaU8r3cdKweMAYYJTcdScuE/xEhMYT1
	 cdFZBeTgFhjG70U29UhP0IwrG5Plpjtg6PWzpm9V91xaBpkNhHLUaMHMaLjd/q3wwt
	 W0BmiArjpU9k/CWANLV7Za9VzeZSGzFp6r10xtBPW5hXET6U6LoD7ktb612x+o6lWy
	 mAREbpBzfiKgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FE6380AA63;
	Thu, 16 Apr 2026 15:19:04 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260416075627.3110360-1-geert@linux-m68k.org>
References: <20260416075627.3110360-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260416075627.3110360-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.1-tag1
X-PR-Tracked-Commit-Id: 56f295853f38d3202c20fd0d98939e7a4c56c3fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 090748e62f57a80286b2fcc32fe2be069f891200
Message-Id: <177635274325.3274006.355516199189737526.pr-tracker-bot@kernel.org>
Date: Thu, 16 Apr 2026 15:19:03 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 16 Apr 2026 09:56:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.1-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/090748e62f57a80286b2fcc32fe2be069f891200

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
