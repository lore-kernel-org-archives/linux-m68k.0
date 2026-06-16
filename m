Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C9DF59
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Jun 2026 00:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570046; cv=none; b=OW6DIBuroIG9414r5ySI9eyH953smKx88rooczjDHQ0y3xQ0cPf97GwLms7Uvc/7WcywZjXDajDtCEgLrozezdUzNOfdg8qXJfILjwbKOXZfPuZLlTVK7NzZMH6l2ZboXXkg/8R1FKAbq6KcPE4XRifMMoocEP5ichlTtwoChCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570046; c=relaxed/simple;
	bh=BsWg7ndiHatCpqIz8BS9UpVMudfK2SuCikE94HLTF/M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AtyJyaPngzp8mD7vhCLJ94sF9+5cXJPfWEjRoHLYAzaiPyrPC85sNRVaehPihY2Gd0ZGqtlrjI01fYmiFzeeIMK+T/DwYDjuSa708zMUQhQPr5Hn4bE83ygnhayZ9CInWA2uuOaJhmNB+s8COlv/GeLNM3N24VYR9QZpDROINMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bajH3y3D; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bajH3y3D"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32B1E6008A;
	Tue, 16 Jun 2026 00:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3021F000E9;
	Tue, 16 Jun 2026 00:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781570044;
	bh=RbZtBuZhsO7QDrEbqgtUBZbRiKvRvjexpqqCAZPHcRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bajH3y3DMRmS7qXZoydxdJtAk/f5FpYGCSW0lMob12kaH+/9P3TWEohFmUC0/mf6o
	 0Co8mKpCqkQizQFvUrK0faNksuR+XzQuWDdjncVQg0RGnpmrU/H6aLtLTxyxqbARoZ
	 CSaHstW3HvPwVINnglnpyjc9hYOPJRlxWWwIuZOMbZwgqh/gmt1ltfR1INWuzYkNOh
	 NDfI4hizO9ZMkMyxt57AxL4uiA9OIcIfiIev9gE5WYTuJU9QjHDUGREbYl0bAac07E
	 8qT9UP70qvBLU7ZfxMd5XYTkR+CnlkKZK63HSSxER04JwAkJ1X+zywVFiW8ZWns39D
	 hzoNOSnqhaLqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1985F3839A26;
	Tue, 16 Jun 2026 00:34:01 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260615094540.1977648-1-geert@linux-m68k.org>
References: <20260615094540.1977648-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260615094540.1977648-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.2-tag1
X-PR-Tracked-Commit-Id: dc5200f6b1ada318463dd141b041ec9f044b2bf5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44308fbe8feb0861053b9173e3fda2849944b355
Message-Id: <178157003984.358810.6163817806530450737.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 00:33:59 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jun 2026 11:45:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.2-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44308fbe8feb0861053b9173e3fda2849944b355

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
