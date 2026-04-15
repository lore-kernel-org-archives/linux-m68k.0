Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE53923182D;
	Wed, 15 Apr 2026 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212168; cv=none; b=uPYEp7Q5P2wDAdwfLRqhro8qnYDDi7htK9nTXscQYOIebEjsMduEIjVLiMn/gHbkeO1wJaRjv77zvDlRfsQLjgJKKfW/E5F26evlI0WtK74xMsLN68d7nr9GxMg4ZMbgbcA1G5qKE8YCJxm9VglA59W45pwZ+wlLM3VeuG6z9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212168; c=relaxed/simple;
	bh=KiwtBmWn/IVaVlH7Z7pRwhTJMu59EdF+j/bLBYuHTrI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eWr1TG/RYjcE+XCM2hsBLRA6mrocY3HXtA29/vJaAERr62PcxkA5eD6npXcyLLs6tBThG21ZphBUAFjUO6cZwNCenF+5LK73ii46B5FGyP+/EXPDWTCYTcrDK5aRff1N+i/eE8beTAeL9139J0ls+JjYbs+oqZ7jco34cqmdH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtWF+YNv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtWF+YNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93174C2BCB3;
	Wed, 15 Apr 2026 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776212168;
	bh=KiwtBmWn/IVaVlH7Z7pRwhTJMu59EdF+j/bLBYuHTrI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LtWF+YNvnOhHXxSfoVo9n3Vo2QI6lHFFFM1b6NAuSmR8uThqbnAkOcJ6rRFHEDMUx
	 ug5Z3OXo9DlsQ3kvPt9OrH1zflk6BY/upWwiEBkghdMmKeAVHW0bAl3fNtI2HcLDqD
	 u4ltjCWb6a/ybh27k8B7vnEEfrjdK3FH9ITVCI6Zwes2jVnyRzXbVgWgF/eKZRs5lo
	 0CUGpjtDB3kvW40bB9VuA365ep0T22RNxhg7mv/S9PK3k6KkT9T+G5cdM2ghW1LiOq
	 d6p0NAm8QCMeUQcmEqnetxPGKqBttPDOrbpnj7xuuBRfd1N1GmLHh5GMrbRTesUeYQ
	 f6Z3INWqix+mA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DF73809A29;
	Wed, 15 Apr 2026 00:15:40 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <d98c3944-5739-4eb6-ab89-8eae46343634@linux-m68k.org>
References: <d98c3944-5739-4eb6-ab89-8eae46343634@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d98c3944-5739-4eb6-ab89-8eae46343634@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.1
X-PR-Tracked-Commit-Id: 2c6805145e1605cef39459f78979f7edee251b41
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6b162a63f9b6d14473d9433ba8035c6351f35b2
Message-Id: <177621213841.1531497.7019775881148821919.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 00:15:38 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 15 Apr 2026 09:38:28 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6b162a63f9b6d14473d9433ba8035c6351f35b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
