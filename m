Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B4233937;
	Sun, 26 Jul 2026 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096036; cv=none; b=R0csGmZWErDt/qUtVuPUoi5YrA39On2tA+1AlwbfpsXGwbP5jx2UhwzA38KHiHixEUiOmdkUdPhjFE+hJQUYgzFZNwBRQItov1ouOkreRZnplRZxsXY0sG8NHU3DuYKWSCuTRLUPj+p224myfaDDiWgs6syUHh+AaZzLrGBatzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096036; c=relaxed/simple;
	bh=cUtDjWagtfA4kodwWuYFmLcfKiLoZmz6HyOcBVzmylw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OHGYK6DJbVHMWerHo/8mKDHOCp14iC1rnY47yq7/pz4Eie0GW5gLi3BkekVxUIl706bxuX9V00ciRq2LeZnTyXGCcqfJa3m/pDgxUrNlBkyhoYBpOYFP7fnj30ucaQn4EwUe4F8OZ4GGflCe6297vFgoZn9NKtZRxHdR1XjTvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDFwmzn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDFwmzn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC431F000E9;
	Sun, 26 Jul 2026 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096035;
	bh=/2g1RuyoTx4PC3HhChr0dvP3/BKt/exQmuj3EL4kAo0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iDFwmzn7r5wd0cIHup0zsTD74UMvbwlAJJS6H8gyF8nYRHd1IaRCoZbQEgHnGiGrO
	 LNOdDMCO0SzxPeQDanvN8E1O89nO5ibJKB2nk1x7eS5YsPM+DLK5uNpEPgvCXTuN32
	 vi2Ig5dd772NcAu+Oah5/hmN/zOR899+eYaoUk4z8CVkApq+c9ELzhkXJb+LT/Kp2h
	 wzpHL/fL5JeMys5EiTyXLAdwYssAZH8FsQxO63Az8DdoFYRMFGsi/5WzOHIolSJi5T
	 xrVSAHTKQcAJgcsDUX+UW1IBzV8KsRhb0EFgIgRvkfh/iuFux/VtC4XtE8j3U2seTM
	 xZnvQuifsVBFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AF838119F4;
	Sun, 26 Jul 2026 20:00:02 +0000 (UTC)
Subject: Re: [git pull] m68knommu more fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <376ae320-2b14-49bf-a296-a0cc01b93b78@linux-m68k.org>
References: <376ae320-2b14-49bf-a296-a0cc01b93b78@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <376ae320-2b14-49bf-a296-a0cc01b93b78@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-fixes-on-top-off-7.2-rc4
X-PR-Tracked-Commit-Id: 41e116ad01d8a704883187743b52d57e11bc3ef0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86d1022b2c4fd33e069305df1b1394b13096d8a7
Message-Id: <178509600203.3839324.1194258282144421476.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jul 2026 20:00:02 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 26 Jul 2026 23:35:21 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-fixes-on-top-off-7.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86d1022b2c4fd33e069305df1b1394b13096d8a7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
