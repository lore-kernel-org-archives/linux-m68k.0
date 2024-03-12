Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE913AA49
	for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710267613; cv=none; b=UYZlqslZ1ib2vP7zMjDXTD2wzWph0wtQEiEfs3y+YkaTuNgVHujhDxrgeoizfs+eXUXTES9GE4dhUZsOKD68lqFpTjpjN7WvJIG65bbLUeG21WMAR75VNFmHOUkXptxpxdTvqsxUSorAVBI/2TFtmRSFZCKAitOOV+1Fc7fhXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710267613; c=relaxed/simple;
	bh=JLY/sOTrP1oowVnW3Jehl0yzoG3MEdas0xLWO23d8Yc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=N0Qpa9w3gAW5nEm2W/0fZC+KiB1vUf7apJ309Cekg/TIk4xZtDo+AcBAyanxJgrTc861bXkZd4UJdXbkwAThQsxXW4Z8wewXoctvZeZuPT7zX1p0EybkUsacoyKsPX4CmXM6PLxhir2yj7P9IaDR72SALpc1GPng2GxCuh2ouPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ6SqkP4; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ6SqkP4"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0715CE18E4;
	Tue, 12 Mar 2024 18:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1A75C43390;
	Tue, 12 Mar 2024 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710267608;
	bh=JLY/sOTrP1oowVnW3Jehl0yzoG3MEdas0xLWO23d8Yc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GJ6SqkP4isf/fNZyPBKIznj9rtlT+ckeRrjx8u15bo9LJzpaRxHr/gmFtWQzCYPTj
	 x5SLZo3eFFa9q0wtvQtujyEk+WaduAPCwipcVxuWYDPg5yxJHCreqPk7EK2qm1HIED
	 HJesaqoVcKxvtwXpHNPdATBXeRUriHW6u4s2A7S+2wYDkZkANnfVu1LHf/D7O/IvCs
	 ZQ91AKNn3+Kj49i4Tgu/o7Ru2RPRkUH2G7s1w3+XUT6rRTP5E3NB6SBhjYQ5jCFIuA
	 EmFPAliFUvYByEAME1IZQFK4h5bWV6xAXcOlXX2rKklfbg8VHgaomWXaj2tt2+Pc9s
	 G0TDuJtitDNow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8BD1D84BAF;
	Tue, 12 Mar 2024 18:20:07 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240311125843.1295782-1-geert@linux-m68k.org>
References: <20240311125843.1295782-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240311125843.1295782-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.9-tag1
X-PR-Tracked-Commit-Id: e8a7824856def1c8608401b0d7d05566d6e81c95
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 508f34f2381eb84b2335abb970b940aefef50a19
Message-Id: <171026760788.25732.17362999737574094426.pr-tracker-bot@kernel.org>
Date: Tue, 12 Mar 2024 18:20:07 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 11 Mar 2024 13:58:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.9-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/508f34f2381eb84b2335abb970b940aefef50a19

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
