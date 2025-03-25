Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CCF26980F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742939717; cv=none; b=chkDclZngAkPuhL7yVgQm94obI3iTS3gxATyEA8aF2R0Ouqb5UylwjbXvemmst54+c6N6xqtw/SUSIZW1YVzv8rOJnIHDOKYp+VUjKz0pkC/qbPu2kEmBnfoARi3k9oRnQVYY6BDkeh9uWzer5+/arXkkyx3gaw39uzD5Wjc+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742939717; c=relaxed/simple;
	bh=ucAwk/Fq2VsHUSaiUxbUoBT/EF+eEmHmzad20dzmIDE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Q041d73xia4U7KdpxudjGUbB6nLHXr5bUk9Z0ijKfXsnrUugpUA0s9YK3ZoDnJwkDzM7z24Knpc+HrHLwK1/Yh7rs26XhxLyAN/biuJwrkp2eDT5yecq+07VCykRvEEE8SijZX9Fk8tCKEBtwSNdS60j5eUK80ic5/Oa77srNx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufRxG0Ew; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufRxG0Ew"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD0E161126;
	Tue, 25 Mar 2025 21:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A1AC4CEE4;
	Tue, 25 Mar 2025 21:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742939714;
	bh=ucAwk/Fq2VsHUSaiUxbUoBT/EF+eEmHmzad20dzmIDE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ufRxG0EwKJSW+jeN06UvRsXy8btaoNVZP1zFVoPLk/3mc02EYcNyhGfuj/wAWftdk
	 3cTBEQXGPK/pmgAGmNWJzOAFP3PsTCeYk+Q/AMd7HVkxx5w3LhyJc2Pyytu7vLhmXS
	 ChQrwEDNmnm6jvc334oQiAY3lrk2jBXv9kJrVvjrbT9R1DOYGp6cZ96cJLFwyhT2V0
	 eXU6zzjDalbn5BcSzlswx5E8AC3WD9QfJ1BOhPVHuzS6hT2UJlsECCBXZQ4i/c2SFg
	 EsaS30xRVXp8kubg1v/Hm/eES67nJwBxJ85RmEdaPiFLNc+gCxjxGDhMnhl+rNiihE
	 hRgu/CSrb8UyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBC84380DBFC;
	Tue, 25 Mar 2025 21:55:51 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250324185145.269783-1-geert@linux-m68k.org>
References: <20250324185145.269783-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250324185145.269783-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.15-tag1
X-PR-Tracked-Commit-Id: c94cf023dce30d5f28323a9f28ee2912f248a68f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27bd3ce4038baad9976d287ce883df1674f3220e
Message-Id: <174293975056.745772.12402969436242983881.pr-tracker-bot@kernel.org>
Date: Tue, 25 Mar 2025 21:55:50 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Mar 2025 19:51:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.15-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27bd3ce4038baad9976d287ce883df1674f3220e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
