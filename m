Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4802F7F1B;
	Wed, 17 Jun 2026 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781723674; cv=none; b=Umt+/AOGOYF4Ec/USEmi/zl6nn0uBVKX3mQNvWOlOlcG4JdatiQWaP3hHByB1rfNlexf6ScAMmGCg5RZqdkCI+9YwJEsC2+MXo9p7GPBAt2s6YcOic1xRqaCq4FN8ht97mpHw3XhDl1Ig3erLWmtpO6O3xVCIVYw6Mrlz7tZ4kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781723674; c=relaxed/simple;
	bh=1mh3UbY3LlY82BZdqoTSXD6B9TgNMuqlDQwqUrzrkLQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UeZZoGYoWX7wFJW+5nUXyWsWCZk/3s1SPg0V32VeDAAmii7K2sRqmQmEsRjNNx8BRFJcbWHf/UThhzPzKq0TwZ12T9pjPI8vBQ68O2o7r6a9FwbtjWHaHETvm+AR/in/M3BCXUATtGUu7Go3HPb54YTlmHfgmsy4AhF+iZTY6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHnLhL1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHnLhL1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FE71F00A3D;
	Wed, 17 Jun 2026 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781723673;
	bh=rz2IDDC1R/vL5BGR3W6zzOZQlH1kx/xbGH4YBHukcjY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cHnLhL1vBpotR3QkuPk6sM47w9jPFLgU1Oy7VWUV/bXNaA1wceSo+KozzxaTh2Fg5
	 ojVHENrlR16/c6vfL75n9hwmnIZKwYEO2aHeDeYHIcxgeLjjE+KBmIH5ErvbsYFw+/
	 8R/S08TaLvBkn0aETFbTuPZayiDkM7Rh/jfMCwUy3svut3DEf2xVsQ6uPOQye3MJHm
	 FsOf7FXlSXs3qIxVLNIU6dHJfWBrOQcDOtMGspFQ0YMy9PQ5LR7VsNSp8fCvuTr412
	 bXFniXQlLNfGeU4Aa0CGS75uzUXqS4uZFh64sVYCPQ25VvgU8gW/FN+3gdpK4maglJ
	 mGG7y2osqv62w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C433931008;
	Wed, 17 Jun 2026 19:14:28 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <cfb153b4-b076-43fb-8458-f56aa12d18c6@linux-m68k.org>
References: <cfb153b4-b076-43fb-8458-f56aa12d18c6@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <cfb153b4-b076-43fb-8458-f56aa12d18c6@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.2
X-PR-Tracked-Commit-Id: 4b51af3ef96a6b6d9c231537fc57856a1062cd8e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 407ce27e7417646b5476d71166657ca7eac189ec
Message-Id: <178172366677.1775335.8456681093878626380.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 19:14:26 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 16 Jun 2026 23:34:10 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/407ce27e7417646b5476d71166657ca7eac189ec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
