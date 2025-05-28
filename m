Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26201EF38C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 28 May 2025 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748405915; cv=none; b=UH0GXgzTj943WsjAXZ5CyBubTbTOOEWQI78wHpro6r1crb9s3zJNMAyzSwXREc5Rp/aip3jUYLrtZRNZo2kj6Mr136r+CcZM9aG6oOioYE66kE+tCCNLHnKi3f4PhgEls1MMvRU3U3AGwKVnrQDTh/ZKScXIpq+zUuXKfoL8eGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748405915; c=relaxed/simple;
	bh=OlhZwRqfB27F+RuaZoFnoqGRcbXFTH4GIwttovaaM5k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NnCVeuDlAfB2YT0LnzSkogipYhlXNrftLhGkTb23pdWIINM7UlnxwMvpYn14e7O15z7jiH4dUiB1VqSZxmCGMIiDisUjG2swwtr/wSjo5xBRnKRCw5A7ZphwIxT8EjDktC2w2GojQS4ZP9eE6XmzjGiUJgRycM7ORLl1GizGIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er4jTpce; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er4jTpce"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A657861137;
	Wed, 28 May 2025 04:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598EEC4CEE7;
	Wed, 28 May 2025 04:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748405912;
	bh=OlhZwRqfB27F+RuaZoFnoqGRcbXFTH4GIwttovaaM5k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=er4jTpce9N6huFZt9EXHojbp9/EMPzaSWZUBCVwJSMCDM0FWm7bv0qwzlsn3PIYRA
	 mo5fFkKSk8DITYsuTSS+1SPoDeyCqQHUew8tdCgZFB6y7rFVjrRA+zLVcwvyObilIz
	 QXs/Skhv04VoesSlaYrVCAj1FIlHQULIf7gqHmfQ8+2VKt6CdZEsCEvIMVvO9HZrld
	 8Z+sYaas8RYtEOP7E48I/K9VsyJhFXWwXypJk9rkrmBG870alwwr0g7zbigYA7oG5a
	 1p9FudpVP/1iK/fiCPWBMEzEK4lmh2h4egUbNGrDy9pKiPIkTx+7c8zvnJGMHAMzPH
	 StSWOtQKPC78A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE933822D1A;
	Wed, 28 May 2025 04:19:07 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526124624.2778122-1-geert@linux-m68k.org>
References: <20250526124624.2778122-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526124624.2778122-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.16-tag1
X-PR-Tracked-Commit-Id: f440518f379d22c95329e9e0e0fb6caaafa0f8b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c35328632ed89efeb616603e7fa151ac730fafe4
Message-Id: <174840594640.1893196.1828711394452628754.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 04:19:06 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 14:46:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.16-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c35328632ed89efeb616603e7fa151ac730fafe4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
