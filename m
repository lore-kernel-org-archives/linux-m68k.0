Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADE1E8348
	for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753846776; cv=none; b=cYZ9rvjewSeeNbuNrMZ1v/Rf4MCYbwmYU5rrVEkEyAaKhuQA33YuZU00PtQU36lcPTMzMn6DtWJc0feZWhPTATeLlGmdDv2EZZQpVWuPjdLWb63YP4J54IeAXy+0gIh+j26BrHGJhmiZHUgIHtIWDzrVF7KhRyA4BYeeDLU1rHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753846776; c=relaxed/simple;
	bh=mmDc4aeAv6aT3MVYtMthcM/SHrPAWv0icfnl5JSv9To=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UasrpzT0O2h4/ca8OkIbXSw6ZvfgbIBzPnf0vum+0YtGKTJbRmZVDW6pU4JbZ5vo8adyUMSZQIVye/wihaqzXqbuWWl1s9OZDeGE/ZDJXD1+TEwXGM4m8M6KLpVLDsrzfZYnD/FhKt5gLUNMrkJhm8tETz1ztEN+grBuFAW8cig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrfakAzW; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrfakAzW"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DDE2601DA;
	Wed, 30 Jul 2025 03:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AD8C4CEEB;
	Wed, 30 Jul 2025 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753846773;
	bh=mmDc4aeAv6aT3MVYtMthcM/SHrPAWv0icfnl5JSv9To=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lrfakAzWXSvWVciBv1H1rB0d0ciaz/qjSnd7IL2Bs7+T6QggyCRGXQHX7QsDoZkIx
	 wMkWYadZRiUPIFK7rWy51pkgU1JDj+wZo1wI6/7UMB1mSWX6vh6jiRzWQD8aK5W7J7
	 BeSp+Vne6IMFiwuYpmX6i6R0Ny2ExrDGpVx+vLm0cFiBV2OncXIbM9bUuH5YO9160B
	 xmHEpzzLAcHofKu4JU58AV3XS6QNjine3UFouHzGGs/9Cjk5QAroQYB88Ip8dkr6nW
	 34ky4aMP0T4rXg0AU4GlqSo4j3rXrxg9qb9DaJPVeZgaqrPUl1MSMTx3zRp461y5Q8
	 KVdFwDaah/K/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD2D383BF5F;
	Wed, 30 Jul 2025 03:39:50 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250728093437.223500-1-geert@linux-m68k.org>
References: <20250728093437.223500-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250728093437.223500-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.17-tag1
X-PR-Tracked-Commit-Id: c8995932db2bad6fa093ac64dbaf7a3e8870eafa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bb38c52719baa7f9cdbf200016ed481b4498290
Message-Id: <175384678931.1749338.18378664367679266457.pr-tracker-bot@kernel.org>
Date: Wed, 30 Jul 2025 03:39:49 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 28 Jul 2025 11:34:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.17-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bb38c52719baa7f9cdbf200016ed481b4498290

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
