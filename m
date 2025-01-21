Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A51ABEAC
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737437399; cv=none; b=Nlf+S0YJKV94SmgY/mt4Qb9KTiAjYQ1/4Y7nw3UucUKaxoh7u4va5nR76fSBzMNynJFQw36wBzXMEgtSt2TkuLh3rODmAaBJ1+8p28r3vtTCtWvdXkkEocft4AzDG8/3/59EUkXGLCWZePgvWE4vxBwOeHTH+nHJC8RgW4X/GnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737437399; c=relaxed/simple;
	bh=uwtCKnGlkrbtbuxMSpvWnVSc5bzsFKdvqCLwYb5rY1w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J30ZRl/Sm8uBeTYU6i+853QmL+lDQvajLWuzxqK7G6rdk8+60wGtORdkniF2U3CmtKenoTPMbxF5qoUrT88qIGvK8yXTxzByd+kZdS6pb/Lp9+UbVOqMM+8b9QYgdybmfAkGz5i1BaS9kkqCRKildlsGTI15DVHXwjtKwZoSrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHHD87w2; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHHD87w2"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 026D65C10A6;
	Tue, 21 Jan 2025 05:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC75C4CEDF;
	Tue, 21 Jan 2025 05:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737437396;
	bh=uwtCKnGlkrbtbuxMSpvWnVSc5bzsFKdvqCLwYb5rY1w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JHHD87w29fEDBidyQPEjps9J3lH7k4BYHugxx43/JCrVC2qqvHACapof1WBTkrTHQ
	 UR5XlUsb/oGx5BIC27MXCs44zugUzW9pShf3koQOujROVuGNCki20sACAv6zU8UpI0
	 d5hkfCSRmxc0evzzT8vXwP8AdWU09SbrP+UFCP/EhVhjLNmYOWuPbFTK3Vwqf7zBKH
	 yP4xWP4IVbiI8ObILomAbrKGB3Jw7sMc5egDGbZf5DQvvddh24ZcN5QR162sexxBPv
	 QlJNAmzWSnERhAOy0DhTMe71oIlj9ka6huXBSHheaPfN0RNuin4gG8etp918SGnDrX
	 C+nGFhxzaMK6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 721BB380AA62;
	Tue, 21 Jan 2025 05:30:21 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250120142007.3210730-1-geert@linux-m68k.org>
References: <20250120142007.3210730-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250120142007.3210730-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.14-tag1
X-PR-Tracked-Commit-Id: bb2e0fb1e6aa9f737d6e0cbcf6494c51180e6d6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e7244cc382524ac5354dbf7b7cb351e926e8118f
Message-Id: <173743741998.3745731.9511976233475025835.pr-tracker-bot@kernel.org>
Date: Tue, 21 Jan 2025 05:30:19 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Jan 2025 15:20:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.14-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e7244cc382524ac5354dbf7b7cb351e926e8118f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
