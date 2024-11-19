Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4E15574E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983055; cv=none; b=mDf6wm1miWyVWb1saFrMVFaEPgyGn53bXVllXaluecpJ1iYy3UQCJBR5PZRXziIronFdgJOt4gVYasVcd1xGMrxdGTUG6c4VlugBcVMsYZSS29xSzogD6yvrWKDuACsuggJyk8/2M9x+OrDUhXORy7WaZeSlZ7AgtxXN+DqDAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983055; c=relaxed/simple;
	bh=2LCm+Gv9jLMfZnu1AsE4d9eDlR1SWa6hzle0WXfv1jw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SAnvfH1FydOs0ze8fwHYwL0qMctu5R/TPVs/eDb4viZ40Pg6Ka+DH4niGf8l0q2khBM0wR8wEbmpIWBgWvPa+QTbmAAUW2/kY/2MJl8Eh5eGJmlxUpNDWXhkNG0q213FcjTVVh89IbOLYVTBBj/hTRN5rNCc7tbQHPtIgHAws7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMju4Mnd; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMju4Mnd"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0C07A42168;
	Tue, 19 Nov 2024 02:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D7DC4CECC;
	Tue, 19 Nov 2024 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731983053;
	bh=2LCm+Gv9jLMfZnu1AsE4d9eDlR1SWa6hzle0WXfv1jw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CMju4MndrdymIMMbDLwc5LSWtLfn9q+UKNqu5W/Jo5/75cEGtOUyRUyyhsEMNHAht
	 ENUD5pz16WU60dT9fv8C2zIk094cny4NISHYe5IEzf5F7e8o57Eqx6f1IhpeZT6Ff8
	 EYOw2x56PtHuTHgKyzsvFhNX1cSHH6dBHav1CQrIFyCesG07XtrAmB1gQTVYkbe5Mh
	 LYCO43czBcEJ0n/pDMml6R0TS/6rHVkdV7q64FkYf3GPY5xEIrc8PwMrFXPCjTWH8I
	 f67iMsyPRg97fQqtp3kwq8/zB7o3jGQwFQtaMcS6120OMEAg8XVg3VS3BUrnEwvdIk
	 Xs2nS4DN0QBkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE10F3809A80;
	Tue, 19 Nov 2024 02:24:25 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241118124720.3341025-1-geert@linux-m68k.org>
References: <20241118124720.3341025-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241118124720.3341025-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.13-tag1
X-PR-Tracked-Commit-Id: 647619b6bd27d2b7c3c6055f3f0d996e61884202
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9aa4c37f71b9a0a4f51692fbb874888c139805ce
Message-Id: <173198306422.73657.16490470946970522059.pr-tracker-bot@kernel.org>
Date: Tue, 19 Nov 2024 02:24:24 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 18 Nov 2024 13:47:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.13-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9aa4c37f71b9a0a4f51692fbb874888c139805ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
