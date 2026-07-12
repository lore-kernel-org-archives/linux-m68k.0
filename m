Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36C3B2D0A;
	Sun, 12 Jul 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883611; cv=none; b=iP0VqFqYtsRQxy6GRHt7pum1nKazuJw1AkNmiaKh9BP5Y6TdJF2Lelk8zNhTfPJlJCVuotmnIblsqK5FF6L0r21u+7EhVblvXjeCizXbTer/djf/o/2X9zApRqO6Ji5H90d/BgAyquOpzj93eNtJq8zcaVV6C5lIVItQjNE6z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883611; c=relaxed/simple;
	bh=lLtpl0T/WCJdJl5ctfEoReRB3MLF68xWPEo9a8k4hwY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QWRIXsZyzT9LNj/24jyvqYtfdj6QGwHTLhKi54kgvjNWqGTaNIr1U6OmNRA/gsz5NEsakskWQHdOxGM3FWPW2H8JJt51JbpdsAHl4TNEo9uDPveySrFVmiHKfxEbWh+YBEibEojfi5p72j7QYpItGmUVpi35wRQf/7uZl1LaP3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Og7UjT63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Og7UjT63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563781F000E9;
	Sun, 12 Jul 2026 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783883610;
	bh=pZUlYgbwh2NApt95Ae/j8pS3OyOvXrDF/qqm0TH+A7U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Og7UjT637btdDeD9UhOGti0XqS+GUe9vkffDwq/5v26GyduK5Dvq9WGG5sQzIyPEs
	 rJqduxwScYVgrk2LssehbzBDtkaKi67DNBOFT37OEeasTN3DXn85as0MroypegMFPS
	 TAOiguvWfBzR5nGy4NBg9X9yW30NXxGipclfMua+kuCVTJdwT6s/MW0Br2+A8gWfCS
	 vvtZVvmmhJk0lU68Bg4gMg2yhnH+RpKcmvqUTEX4JaTNBAacnA2seBD7Rb2yXWB95g
	 9FKZBzBzMatHgrTJgeIa5+ogkWyWSJAbulZsUG0YImsB1qH2vf38LbyQdHARlmjgat
	 ko8lYKsxgNy/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9386F383BF4F;
	Sun, 12 Jul 2026 19:13:07 +0000 (UTC)
Subject: Re: [git pull] m68knommu fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <608d7d1f-8e13-45fc-9546-2b2bd69707e7@linux-m68k.org>
References: <608d7d1f-8e13-45fc-9546-2b2bd69707e7@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <608d7d1f-8e13-45fc-9546-2b2bd69707e7@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-fixes-on-top-off-7.2-rc2
X-PR-Tracked-Commit-Id: f47b6b313df9a17010a72b3f389f0a5e9e49db3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4bf75d4e8d278f101254cc7e7f147d4158c0a01
Message-Id: <178388358622.1462520.10251225500481955770.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jul 2026 19:13:06 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Jul 2026 22:46:24 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-fixes-on-top-off-7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4bf75d4e8d278f101254cc7e7f147d4158c0a01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
