Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0C32C923
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Feb 2026 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700127; cv=none; b=g3x6xSnctpvm0owl1bWRKon/01J16InwBMpFtpZnsDMeN+1YhADaNjCFgCtw+OLxzaHBN28H9AWy8o+vWFPpf+0MH5imQaiJFQZDoxpY2E4/dQgppXtTKypvKeyrly6STnZcdBhdX9JEh+PE3TNxAeavAl7Pr+RmB9n0P1aqKX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700127; c=relaxed/simple;
	bh=a5szpgUFyACWV3kw9uRVMzKfUpU0i/IBCBlXm+wh2Qo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=URl4dNTmVVDOXZV4XgrtGqy7xFhF+96TdPh7CqjPgPUys52jnx+U+PTZwIhDDWzAo/l9HLK65TTom3ht5+F3t/OepFz+rbfsMwsaPUJ8JVbamxP4Ay+3wwUuVmI/7rGgcfOHnKUCVE/ax6vrzROyIq+HYk+iNqm87qZVdjv5WhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=titbV04f; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="titbV04f"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88CF360137;
	Tue, 10 Feb 2026 05:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F19EC116C6;
	Tue, 10 Feb 2026 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700125;
	bh=a5szpgUFyACWV3kw9uRVMzKfUpU0i/IBCBlXm+wh2Qo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=titbV04f6+IlSibkkyKNNsAkVDfon7NN1vi2lVFmt3jUhvZ1muSOdyLxJtA/tpg2R
	 ANIF2XOrk8sYa2bLBrVM/8+Oab5ufV/WAUTpTJyMlyCQyjap8vGJuhvf6/Skv72rZH
	 QEEEu9n7+FpQc5H17CrtsEyiqw/eaTb6XesZFg346cxZAvBPhoZl/hZaNsKPA/B37z
	 JhQJ4Lqh0xU0GkyDuTKN0ixq7ZXhOd7ijSn6Zo8VNk+3e2Us2rEyay0u76cIfBDreq
	 H739KCt4oOdyZz4gUtAAJAvrWaXOvecoanQEdTCAOLGCnbhPHgH41HSIu4sO98o08i
	 KrNZoLlOPXkMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AFFA380AA5E;
	Tue, 10 Feb 2026 05:08:42 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260209090450.4079574-1-geert@linux-m68k.org>
References: <20260209090450.4079574-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260209090450.4079574-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.0-tag1
X-PR-Tracked-Commit-Id: cb39cf99d88e8f2c68a41fb3bb01c4f40a8fcc30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b33c3b84045e880d8a7596f260860038c71cf393
Message-Id: <177070012068.3352335.15111261788287950724.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:40 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  9 Feb 2026 10:04:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.0-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b33c3b84045e880d8a7596f260860038c71cf393

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
