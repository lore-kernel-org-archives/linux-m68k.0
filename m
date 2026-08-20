Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB83976BE
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Aug 2026 21:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787263089; cv=none; b=ftGSuJvlavUC2wAkiFkJP6sTgo3egeMO/hPgqvsNnid4uMiAsngYF2LpeuriiXBzw18TQy59ioSZAfoYxRPt4ScNaU6PFnXV1nCg3LMylkY74eKonU0y4mYsu21/XuRI21GfMcJX8hsW/J/6pZq6NAwzwgf12RvDnP28H18CDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787263089; c=relaxed/simple;
	bh=wjgDRi93s/BYIB/JQgnqnmKhLQLiMDgwWe+wRLy7XIw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fqwwWEigwQux4ssaXhXBxksloqqz/9rqQfWjCPxAJoPNH5oOwK5wVCCBoXkn54UjETWEbD6fMLaSCeCLlR4DzvjkTjAw8s2iZuTqRGCw1rAmdKoHABFTgaRSvbOz8BeabC/Um8N2nkdzyGVrlJKpnfjK1jLMyuleJXnV2qLNuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQ8gKd25; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQ8gKd25"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56E5442451;
	Thu, 20 Aug 2026 21:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A60F1F000E9;
	Thu, 20 Aug 2026 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787263087;
	bh=xsdu8OEH5vFpXe5X/EheYO8tsCazxP/Ph4lKczvdaKs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XQ8gKd25XR2bGdouA2cdTSTeyPzPYXJyWMjHn0oSkkrR+sc45IvFlFsJOtsDg76rw
	 3aYggpoRvEKbG2FmbMZWdh2qPnXf/FezLlgYPlbx+9pAcnwgw89buqZMMwazcwPlbZ
	 ZOh95Fbctzivd9dz0hgST50S3AHOJXoYsKYHiNmgtkiQHLWZl8YjjCaWeLiF7err/U
	 vA5eiOizHhWc3Zovg5jP83rb0IQ2uStwTEqQXTrNosT/BLk0H15Ea4G7xK/ffqaPqD
	 kazICPtCQyQifzNwBWmp0128KE8qzkqISr4j2SQwlx088S6ss+qWh2np0LHgjKNfEz
	 gdVU9kggzk2ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9396F3924472;
	Thu, 20 Aug 2026 21:57:18 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260819092105.1232550-1-geert@linux-m68k.org>
References: <20260819092105.1232550-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260819092105.1232550-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.3-tag1
X-PR-Tracked-Commit-Id: 2f8e3cad53b5c36ab0ed5d3195bfc55c59ea61a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 73cc4da3857bb2970b3e349ed9608ca37861a84e
Message-Id: <178726303709.508102.10732999498421880201.pr-tracker-bot@kernel.org>
Date: Thu, 20 Aug 2026 21:57:17 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 19 Aug 2026 11:21:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.3-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/73cc4da3857bb2970b3e349ed9608ca37861a84e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
