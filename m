Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94763189F56;
	Mon, 27 Jan 2025 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737998000; cv=none; b=TjRq15zqeR6GC0bGRfEepo2x0YpDv0KlGnR6OBByeeZWqVpAZKbR9BJ3KO7PfIPzQ6c9s/S5VVKjJtC9L8cRVMcKrS42Uz9xzWbNViR5t49Dy0wf2bNVkFjxXxagzH/PKtGJ/7EqkcrTQXeVHlzJI5Ta5leClteJglh/2V7EUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737998000; c=relaxed/simple;
	bh=UhJJVU3OBJOK4tlOr9I5zmuJypzxSHVZv/qcLr2yC6s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hvMcNDz6FL1au2JTz6hlf8955JWRO8LlgDxgPvY/p01UNf04V62GnzX9GELSw0hDudCOwzIijdM7jvqGZkIw5xGIjdxfmEOIdywz7EufOX60FFcxDMbTH55/ns+r/qxLVX3KeyikRqBFpOPErA6ypxsqF2S4Ex4o+J3nLyG7uhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faPxJxTA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faPxJxTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0BEC4CEE3;
	Mon, 27 Jan 2025 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737998000;
	bh=UhJJVU3OBJOK4tlOr9I5zmuJypzxSHVZv/qcLr2yC6s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=faPxJxTA1oYNBf125W8r/4aPh6EoJOdJxTcELaG2RBK9ieMOQGsNhZyzfwc/wNjeG
	 XzrBMHf4F14lzaKKK2h2hFbnsD7DVi7t5ud8hhEkzXRBpV2qSqyx177Vh9I+Lbu0zH
	 VeQkVPslqVZEZywQoCr6HYNievmNPfdvPRiM9APK0YrO4S5b53BS8qzXUXhi2CqJcx
	 dLlUi7vOkGrqS6lRHoGB7mGFVNNXcqINdEy/bSpNTz5TXFbbu5jQ6whBykczxgMatW
	 NGxvBCF6ntUH94P/zVvuLne6gzFdocZbXrMsbig6kkdNt5sN2qdsC+q1OatXKkMG78
	 RGM6iUphmnaQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CFD380AA63;
	Mon, 27 Jan 2025 17:13:47 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <61cd8e02-debb-46d5-a941-c979a4ad65c7@linux-m68k.org>
References: <61cd8e02-debb-46d5-a941-c979a4ad65c7@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <61cd8e02-debb-46d5-a941-c979a4ad65c7@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.14
X-PR-Tracked-Commit-Id: a0a8306c823986c43ea58be13e8b366999a93cb2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3cbb9ce2b9e3e5799f31c53aadebaddc6aad66cb
Message-Id: <173799802574.3165486.839196739599896437.pr-tracker-bot@kernel.org>
Date: Mon, 27 Jan 2025 17:13:45 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 27 Jan 2025 13:13:58 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3cbb9ce2b9e3e5799f31c53aadebaddc6aad66cb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
