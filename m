Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224C2356BE
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Dec 2025 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764724941; cv=none; b=JOzhDFN0Kevsafs/NGfrH2cfd0ZmhGSmWqTPemqzfsDtn9vPZZTxlxw2LNG79ABDCuHb6PWjHeEpaQn+YEOTmNvfUzIoN/3I8fpZgPQeuTDEIvF6sw2j3Hobf5V/ax/k3CWSyD07/krJk+/llLE07Q7Kkx4Cijs4A8eW+zmalaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764724941; c=relaxed/simple;
	bh=vpkhWdxGCNmMAipqTdQnOOZSfRWV+lJx1+1Rsb4Mgwk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TrbzVfGtAKs6V7hHpLn2MmauHUsziMa+OflvNSPjNCtjdZvjWsmvGJbm2BrQawUixgtsc35iUvDzwtUQUdiw9q+tZA7Ec0GGeeZxh0p0XWVgpSveVThZfGiosgMaFGQWt8edEdsHLQwOvu7lnGXN5wHDU4TAP+8l0BGz52DkKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaGc7MkU; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaGc7MkU"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E4226019A;
	Wed,  3 Dec 2025 01:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AEFC4CEF1;
	Wed,  3 Dec 2025 01:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764724938;
	bh=vpkhWdxGCNmMAipqTdQnOOZSfRWV+lJx1+1Rsb4Mgwk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TaGc7MkUfcWCnemZ5f8TOD5plKumsN6ScQywjoHWD5DbuBjjRIq5VF+9Y+Zz3mGB2
	 fyvIRuP9MaF9R7J2PAtMQwDwwy0yCqeSt1QQ+YMoVSYmYB+LheWTSoQreQrU+Lyh/C
	 CPlkyJCzHHzqTZQulpY4z838TOAfNCeuUw0VU3qiCCmiAAcGpwn+qoQyWwwUwjsBJx
	 Y8uwwonMIyj8oQUEX7EqSi25kYjCW7tBky/eMZzUmIikKwEyHeheqKzA9BQsBV/I+i
	 urbsNLtUtK2Uv6ftt7XIkhb9LXn5oaHZeLed0vFYRAiC9VGGN4KjilcEkbJ13bEbRC
	 lhBjtFSa/9LFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78BBE3A72A63;
	Wed,  3 Dec 2025 01:19:18 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251201095108.3450261-1-geert@linux-m68k.org>
References: <20251201095108.3450261-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251201095108.3450261-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.19-tag1
X-PR-Tracked-Commit-Id: aaf4e92341b081bac1230f22619b0a298e285dab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a21d1b33f47b7fb330f8e7af69192493e3125d1
Message-Id: <176472475714.3463594.6573963317006497746.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 01:19:17 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  1 Dec 2025 10:51:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.19-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a21d1b33f47b7fb330f8e7af69192493e3125d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
