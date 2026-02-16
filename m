Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1861778F3E;
	Mon, 16 Feb 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771213683; cv=none; b=OqkvbsaP8gp7tMIQ1pLbvuoa74RTisEzeQETgrAjPnYjcQv4j+4oywfLCkiNtArNPMNqo5nEy8tpVLfCI09LdMlqMAkr3+WDBWhoeHdGl9HuqvGmK+TTmfrT/nttLRohifUZxFr5gr7najXUatPx1VqioO7eguUwe/2hVd3F4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771213683; c=relaxed/simple;
	bh=C4O7p5S/07i4eWAnU41waWpr41B+LoeN+ejNswrBOfw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PpCNbADnz3EQTkAiB9cmGmAoKvt4UqEnlXbq8NtQ20FKKFrDj1qOFeKababZrNEvatKpbi5+Wb9MR1Mx4hVBocCDb1Nj+wif6ZkRSiHybQG5vMb1g8VR25eci7665v2NyyFbfN4O2ahYmboLwAaF5hVCGJN9qWpYICcjymuF9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFTA+cL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFTA+cL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B2AC116C6;
	Mon, 16 Feb 2026 03:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771213682;
	bh=C4O7p5S/07i4eWAnU41waWpr41B+LoeN+ejNswrBOfw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jFTA+cL4Ai86rEQaCay6STqMnj1e8qXxWZ9TPuuQI/2BpUWuq6wwvOSTknT6y7Y9P
	 RMsNNXWuBpa43xosVLBXuz8GgH158vfnT8s7ZbEr8l15+gj2aQUbx54zja0x0cZEwA
	 pRRC1ycsIK3cEn2v8AuyuyXLgTV20qjuo4IQ0fVjb2M7q1ne93EQLyNf/IbngRL1jy
	 L5lI0i1gJdAUh9BKJDOyghEoGKTwQCQYjwq5TUVEP5i9Zm6dWkZfrX3QqADiCb6yDH
	 e19aI4y/QJp4BC+1EViPVYOHjW6vGv3TB5vc4UTlEnP0mr5kSEAJ4Lq7cYHxtEbNMx
	 /UhK4Kw2rSTew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 855EA3930922;
	Mon, 16 Feb 2026 03:47:56 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <37cdaebf-2365-4994-b270-272d1f7d84af@linux-m68k.org>
References: <37cdaebf-2365-4994-b270-272d1f7d84af@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <37cdaebf-2365-4994-b270-272d1f7d84af@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.0
X-PR-Tracked-Commit-Id: a16ac6ca46d62bcbcbd7b01be0ef03fb39530d7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
Message-Id: <177121367514.3274262.7885736992572813782.pr-tracker-bot@kernel.org>
Date: Mon, 16 Feb 2026 03:47:55 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Feb 2026 09:52:28 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f2acd3148e0ef42bdacbd477f90e8533f96b2ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
