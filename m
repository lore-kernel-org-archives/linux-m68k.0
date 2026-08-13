Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3262B486634
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Aug 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639378; cv=none; b=tv66TiVOtvuhuOd6tQMHzC3djCcx/mmfv9qyng+GvuMRIDiUBRZkQ6ozInxnOYvKIn6EWhydvL4T7Eb4ayyKVxaFEU5kIloMCAzVgRP/PSgoj3uM/ubcXaH5dNMHw/R0sotbBAywXUUNXfbbKwUiJ2UuGvJ6yG9oEsf+lSA96V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639378; c=relaxed/simple;
	bh=iBnpSvrhJENFw001BFU5tCGCESgthcMRf9tnJsCYDZY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Oh80xNamqYCxMau+jX3+Xgzt94jE3valVv5jRntHWkdFXT+dhnM8DUIVaWZuOJWocbomkj8gqkuQc8ZE6OPG3+TsEpRbZ1ePVAuEdaOqcFltOEGTmSt/2A43ZGvEAX193tAwm3G+uB0oyOG7W4lhoSAbuRi6qrIrBrOv0iaeb6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G57T4BuE; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G57T4BuE"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE5743C3B;
	Thu, 13 Aug 2026 16:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CAE1F00A3D;
	Thu, 13 Aug 2026 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786639364;
	bh=Tm4f7g8wzJ2T4GQ/aoPnj6TVtQ3YO++vWjsoGsuCwxQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=G57T4BuEqa4S+Zyi5jRzSqPAltNBsXMecrxtrhs2AkNS7eTH/xcDnHqBQeOCcMhuT
	 GcvBwebTKvcqQsFEyqtU3JKaP76GFnQ8kwtZDWSiEIXWbAqYRgt86WCUYX+iCIleyZ
	 9WtK3l1yfZrzZs/cCi1kTfll5JPw30DBG6jVFSV/UzPZ/Qlujp189eZusGp1sKDshp
	 XgL5mE3U9IUX82gCaN7Tx+mDYNBvScUDWROAVLIkVJ9dWH1RVSWZRRcY9/vrn6oDcz
	 yVktQgUuoNZ0HAkiFP7hP1RRCeEgYoP2OinXAN/H8n1/glNjP2WD+aQkFdj2xnYWh6
	 CZ8T9TGu5Rwgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CBF380CEE2;
	Thu, 13 Aug 2026 16:42:00 +0000 (UTC)
Subject: Re: [GIT PULL] m68k fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260813080134.1041412-1-geert@linux-m68k.org>
References: <20260813080134.1041412-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260813080134.1041412-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.2-tag2
X-PR-Tracked-Commit-Id: 1fd495ef09eef96169a379a749c24b5e69974bb8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 64dc3ba55effbf8afcc0099162dfb4138009ad48
Message-Id: <178663931933.2953617.7192997447191803627.pr-tracker-bot@kernel.org>
Date: Thu, 13 Aug 2026 16:41:59 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, Gao Xiang <xiang@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 13 Aug 2026 10:01:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v7.2-tag2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/64dc3ba55effbf8afcc0099162dfb4138009ad48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
