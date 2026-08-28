Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31D3A1A3B;
	Fri, 28 Aug 2026 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939426; cv=none; b=Q8pj6Rsk2I48nFpXesh9MbcqzRDUM4ulJqaN7Nn5o5Ii23LNIGk6TdwzgOXCtR4/1JDYcBSA+IIh3C74kNC1MUi9f0Rr2vQw3WDqepY5tHItzFfv96+NCteQf0vCqsOiML6Wroajd39QJvhHxim2AGkAqXnUM0rX912anzjdE7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939426; c=relaxed/simple;
	bh=q1lhaE/q6EZd4OAccKYeNOUubhxzfaZI5Mn8qdGIvSI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QbGHEnhGpg1NAkxAxkM6uEnC3F8A5XTgwYzGcQSRairUxdRGRwKtOU0VyfjNpxwxCP7Q9AFBiYu81J91GANx9UaPEXr+ILXLerR4q66QdOmqvwnwng6CYJkQcbCaWvq7M2KLUevK0+E2RaCK9zQCZKq5z8vVnjk4rq7EOpJ/JWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imlwTqn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imlwTqn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE021F000E9;
	Fri, 28 Aug 2026 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939424;
	bh=SFLquFZrCWOSNX2eUbVDN7SVZfOzNKtHfdJmrLna+rk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=imlwTqn3DdGSZIbqqifB1R40O+Zi3dnSvmQDXiIKbCtbBJssNtLzMcil4j6nCE4fi
	 C8xJ0rMhSlp1XcwRd6ktMcoUH0kNe27VU2LnFxIEQLNlduZx8gm+8GawUU5zgvDecd
	 gojPwMip0q3FgS0sZiD6+VKYAFGajnaFcSLBOQOwuHbspKSq1icG6l6j4NDmsPe/Pi
	 BmnpD5T3DcsPO0DrqsqKsP6eY4qvoQB0qlEKg8q3Aw6TxvL4uQPfZjhiRB/CbMn2Ge
	 AF3ysApX1AiSKPd0pkZHYd0k60tMU1mBEN8bCD9ynkZpG6OXFEQIOJUtQ7LvzKulRn
	 5c8pFOMSZTZkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A82380AA67;
	Fri, 28 Aug 2026 17:49:30 +0000 (UTC)
Subject: Re: [git pull] m68knommu more fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <951cbeb4-a058-41b9-a061-b0abaad3cb82@linux-m68k.org>
References: <951cbeb4-a058-41b9-a061-b0abaad3cb82@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <951cbeb4-a058-41b9-a061-b0abaad3cb82@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.3
X-PR-Tracked-Commit-Id: de0dab22cbf6943d0f12f3b1e2eb1bbdd807f039
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 874b43b9f3c704f24f0bdcc347b2e596ad3228ec
Message-Id: <178793936951.2708560.17326582540312256462.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 17:49:29 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 10:25:35 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/874b43b9f3c704f24f0bdcc347b2e596ad3228ec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
