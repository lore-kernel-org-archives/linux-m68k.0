Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543276;
	b=hXcMqnS5JpsGkAzQX3+yCiLTeJ2jeNSzPlw43hks6tzsl92lhiLVilKSkzgGfUvXmZXe
	 MRtLVuvNnjDssAuWirzt9uZZVFq/CXePcmFHh+L9VIcF1lnPYJmX1L7xQtSf6rBuuSPl1
	 77DjNYpg4aDREMisCLlppTwqs4yh6Pjg4jyVbWE0k5sM8KzEIijpdqFVH0x8SN7YhPgLd
	 m8mXVeCPcOzcpkQv9FOLkGdS1xf2ciKnH+5cVaL5NWlg2v1a07yLQudKhgeFoFqRRzlg4
	 JTzcpt198h4PCbemehYYT0raCHoQnjH98xSU9YqY8DxtN2W/otbnYprO0QQDNY2tErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543276;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Subject:From:
	 In-Reply-To:References:X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:
	 X-PR-Tracked-Remote:X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:
	 X-PR-Merge-Refname:X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ciyslDAt+TZ7UGt4BogxbF/cRnwKu6zGiIwhiRrJtKk=;
	b=ui/pK2C/NzDEOjtZLqTHr7Yf5FlowKQ9gBVoR69nNw3+EklLm8V+nm+F/tp2avk1zT3R
	 RgL+e3upaT+v2sgQ0RJmV6TMxT7AUIs2y/qO6i2n4vFWP+OOkAI9tWGRkf0lDt2ojyJOc
	 WEVYQoY4KUoki0jw0ez0cIz6aU4+cgsEFCsTCnP9Eobotp7MlQfRr0M4M3y/sJz4ooW6E
	 Iab144J6PmYMVoC5KEdPDyME9Jb2W9ADe4ZHnFRIX+ercwnTcc/kfeQl6E7OZxw/eZLRf
	 2XG6lyvBUBqSTU4C8iZYsPS3h28AwPfx1cgHQJuiLGvHhUvsJiqOD3wEhCDEhTz9Blg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5obs7Ms;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0833606A320
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 00:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0833606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5obs7Ms
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0422E40623;
	Wed, 21 Oct 2026 00:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9621F000CF;
	Wed, 21 Oct 2026 00:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543274;
	bh=ciyslDAt+TZ7UGt4BogxbF/cRnwKu6zGiIwhiRrJtKk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=O5obs7Msntimqrx2GTYzrz5Bx7kvsIoH1kft2NSb5tZ+f0C2Ld5HLSbAct2xjm94J
	 bkX3gGZR7XHr9p+lhMYWlyXVxwOXCZLYtx1Vhw2VozcSDxs2pUtWUOa7+16zrhq6wA
	 BbnGM9VtGBdPIGUPUeubR0hL7Tas6DeyGYEeUAJM4plWgzBaTEuh3zbwpMjGedalSk
	 sC6pcQ7xC5DxVemnGNTwuP/CavFaN0tlmTEUhQycnWxI9EElV9FnT+jA93PeFhIDrk
	 gzcX0IPRNc9O4lYNtOjt+mrRTODosNs3J0WTJzRTHoxn3AZwbE0bMviA0t3sUTXIG+
	 r9rtV7Cr+S8rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D3F553809A0D;
	Wed, 21 Oct 2026 00:41:14 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019121317.669372-1-geert@linux-m68k.org>
References: <20261019121317.669372-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019121317.669372-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-for-v7.4-tag1
X-PR-Tracked-Commit-Id: af32c3cb72529b14bfb2685bbdaa2b1514496b58
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6be53e26e8f9f2d09a4030339d1c7f653fc07983
Message-Id: <179254327371.289274.5731917532722577593.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:41:13 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 14:13:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-for-v7.4-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6be53e26e8f9f2d09a4030339d1c7f653fc07983

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
